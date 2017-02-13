<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\artpack;
use App\Embroidery;
use App\Task;
use App\Workflow;
use App\Notifications\TaskUpdated;
use Illuminate\Notifications\Notifiable;
use LRedis;

class TasksController extends Controller
{

    use Notifiable;
    /*public function __construct(Task $task, Request $request){
        $this->task = $task;
        $this->request = $request;
    }*/

    public function index(){
            $task_order=0;
        $task_table=0;
    }

    public function taskSubmit($order_id, $order){
      $task = new Task;
        $task->order_id = $order_id;
        $task->table_name = $order;
        $task->save();
        return;
    }

    public function getAllTasks(Request $request){
        $tasks = Task::all();
        return $tasks;
    }

    public function tasksLoad(Request $request){
        //$tasks = Task::all();
        $tasks = Task::select()
                    ->where('app_worker', $request->postData['userId'])
                    ->orwhere('csr_assigned', $request->postData['userId'])
                    ->get();
        return $tasks;
    }

    public function getArtpack(Request $request){
        $task = artpack::select()
                    ->where('task_id', $request->input('task_id'))
                    ->get();
        return $task;
    }

    public function updateStage(Request $request){
        Task::increment('stage', 1)
            ->where('order_id', '=', $request->id)
            ->where('table_name', '=', 'artpacks');
        return $request;
    }

    /*function getSetTask(){
        return $task_array;
    }*/

    public function getTask(Request $request){
        $task = Task::select()
                    ->where('id', '=', $request->input('task_id'))
                    ->get();
        return $task;
    }

    public function getForm(Request $request){
        /*if($request->table_name == 'artpacks'){
            $task = artpack::select()
                                ->where('id', '=', $request->order_id)
                                ->get();
            return $task;
        }
        if($request->table_name == 'embroideries'){
            $task = Embroidery::select()
                                ->where('id', '=', $request->order_id)
                                ->get();
            return $request->array;
        //}*/
        $array = [];
        foreach($request->array as $out){
            $otherArray = [];
            $task = '';
            if($out['tableName'] == 'artpacks'){
                $task = artpack::select()
                            ->where('id', '=', $out['orderId'])
                            ->get();
                $table = ['artpacks', $out['stage'], $out['taskId']];
            }elseif($out['tableName'] == 'embroidery'){
                $task = Embroidery::select()
                                ->where('id', '=', $out['orderId'])
                                ->get();
                $table = 'embroidery';
            }
            array_push($otherArray, $task);
            array_push($otherArray, $table);
            array_push($array, $otherArray);
        }
        return $array;
    }

    public function declineTask(Request $request){
        $task = $request->input('task');
        $workflowArray = $this->getWorkflow($task['workflow_id']);
        $status = $task['status'];
        $count = 0;
        $redis = LRedis::connection();
        $redis->publish('message', $task['id']);
        foreach($workflowArray as $step){
            if($status == $step->task_type){

                return $this->goBackStep($task, $workflowArray[$count - 1]);
            }
            $count++;
        }
    }

    public function submitTaskStep(Request $request){
        $task = json_decode($request->input('task'));
        $workflowArray = $this->getWorkflow($task->workflow_id);
        $status = $task->status;
        $count = 0;
        foreach($workflowArray as $step){
            if($status == $step->task_type){
                switch ($status) {
                    case "upload":
                        return $this->checkNextStep($task, $workflowArray[$count + 1]);
                        break;
                    case "approve":
                        if($request->input('action') == 'decline-art') {
                            return $this->goBackStep($task, $workflowArray[$count - 1]);
                        } elseif($request->input('action') == 'approve-art') {
                            return $this->checkNextStep($task, $workflowArray[$count + 1]);
                        }
                        break;
                    case "green":
                        echo "Your favorite color is green!";
                        break;
                    default:
                        return "Your favorite color is neither red, blue, nor green!";
                }
            }
            $count++;
        }
    }

    private function checkNextStep($task, $workflow){
        $taskId = $task->id;
        switch ($workflow->task_type) {
            case "assign":
                $this->assignTask($task->id, $workflow->assigner);
                break;
            case "approve":
                if($workflow->approval_type == 'person_who_submit'){
                    $this->submitForNextStage($taskId, $task->submitted_by, 'approve');
                }elseif($workflow->approval_type == 'other_person'){
                    $this->submitForNextStage($taskId, $workflow->approval_person, 'approve');
                }else{
                    $this->submitForNextStage($taskId, $task->submitted_by, 'approve');
                }
                return redirect('http://localhost:8080/tasks/page');
                break;
            case "upload":
                Task::where('id', $task->id)
                    ->update(['status' => 'upload']);
                    return 'success';
                break;
            default:
                return;
                break;
        }
    }

    private function goBackStep($task, $workflow){
        $taskId = $task['id'];
        switch ($workflow['task_type']) {
            case "assign":
                $this->assignTask($task->id, $workflow->assigner);
                break;
            case "approve":
                if($workflow->approval_type == 'person_who_submit'){
                    $this->submitForNextStage($taskId, $task->submitted_by, 'approve');
                }elseif($workflow->approval_type == 'other_person'){
                    $this->submitForNextStage($taskId, $workflow->approval_person, 'approve');
                }else{
                    $this->submitForNextStage($taskId, $task->submitted_by, 'approve');
                }
                return redirect('http://localhost:8080/tasks/page');
                break;
            case "upload":
                Task::where('id', $taskId)
                    ->update(['status' => 'upload']);
                return $this->getNewTask($taskId);
                break;
            default:
                return;
                break;
        }

    }

    public function getNewTask($taskId){
        $task = Task::select()
                    ->where('id', $taskId)
                    ->get();
        return $task;
    }

    public function submitForNextStage($taskId, $person, $taskType){
        Task::where('id', $taskId)
            ->update(['app_worker' => $person, 'status' => $taskType]);
        /*Task::increment('stage', 1)
            ->where('id', $taskId);*/
        return 'success submitted to next step';
    }

    public function updateUpload(Request $request){
        $check = $this->checkUploads($request->input('task_id'));
        $count = count($check);
        if($check[0]->upload_url == ''){
            $array = [];
            $file = [$request->file('file_upload')->store('assets/uploads', 'uploads')];
            $merged = array_merge($array, $file);
            Task::where('id', $request->input('task_id'))
            ->update(['upload_url' => json_encode($merged)]);
            //$this->submitTaskStep($request);
        } else {
            $array = $check[0]->upload_url;
            $file = [$request->file('file_upload')->store('assets/uploads', 'uploads')];
            $merged = array_merge($array, $file);
            Task::where('id', $request->input('task_id'))
            ->update(['upload_url' => json_encode($merged)]);
            //$this->submitTaskStep($request);
        }
        return redirect('http://localhost:8080/home/' . $request->input('task_id'));
    }

    private function checkUploads($taskId) {
        $uploadUrl = Task::select('upload_url')
            ->where('id', '=', $taskId)
            ->get();
        return $uploadUrl;
    }

    public function assignTask(Request $request){
        $task = $request->input('task');
        Task::where('id', $task->id)
            ->update(['app_worker' => $request->input('app_worker')]);
        return $this->submitTaskStep($request);
    }

    public function getWorkflow($id){
      $workflow = Workflow::select()
                ->where('workflow_name', $id)
                ->orderBy('id', 'asc')
                ->get();
      return $workflow;
    }

    public function taskUpdated(){
        $this->notify(new TaskUpdated);
    }
}
