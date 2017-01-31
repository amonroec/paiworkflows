<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\artpack;
use App\Embroidery;
use App\Task;
use App\Workflow;

class TasksController extends Controller
{
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

    public function loadTasks(Request $request){
    	//$tasks = Task::all();
        $tasks = Task::select()
                    ->where('app_worker', '=', $request->input('userId'))
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

    public function submitTaskStep(Request $request){
        $task = $request->input('task');
        $workflowArray = $this->getWorkflow($task['workflow_id']);
        $status = $task['status'];
        $count = 0;
        foreach($workflowArray as $step){
            if($status == $step->task_type){
                /*switch ($status) {
                    case "upload":
                        $this->checkNextStep($task->id, $workflowArray[$count + 1]);
                        break;
                    case "blue":
                        echo "Your favorite color is blue!";
                        break;
                    case "green":
                        echo "Your favorite color is green!";
                        break;
                    default:
                        echo "Your favorite color is neither red, blue, nor green!";
                }*/
                return $this->checkNextStep($task, $workflowArray[$count + 1]);
            }
            $count++;
        }
    }

    private function checkNextStep($task, $workflow){
        $taskId = $task['id'];
        switch ($workflow->task_type) {
            case "assign":
                $this->assignTask($task->id, $workflow->assigner);
                break;
            case "approve":
                if($workflow->approval_type == 'person_who_submit'){
                    return $this->submitForNextStage($taskId, $task['submitted_by'], 'approve');
                }elseif($workflow->approval_type == 'other_person'){
                    return $this->submitForNextStage($taskId, $workflow->approval_person, 'approve');
                }else{
                    return $this->submitForNextStage($taskId, $task['submitted_by'], 'approve');
                }
                break;
            default:
                return;
                break;
        }
    }

    public function submitForNextStage($taskId, $person, $taskType){
        Task::where('id', $taskId)
            ->update(['app_worker' => $person, 'status' => $taskType]);
        return 'success submitted to next step';
    }

    public function updateUpload(Request $request){
            $file = $request->file('file_upload')->store('assets/uploads', 'uploads');
            Task::where('id', $request->input('task_id'))
            ->update(['upload_url' => $file]);
            return $file;
    }

    public function assignTask(Request $request){
        Task::where('order_id', $request->id)
            ->where('table_name', '=', 'artpacks')
            ->increment('stage', 1, ['app_worker' => $request->worker_id]);
        return $request;
    }

    private function getWorkflow($id){
      $workflow = Workflow::select()
                ->where('workflow_name', $id)
                ->orderBy('id', 'asc')
                ->get();
      return $workflow;
    }
}
