<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\artpack;
use App\Embroidery;
use App\Task;

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
                    ->where('app_worker', '=', $request->userId)
                    ->get();
    	return $tasks;
    }

    public function getArtpack(Request $request){
        $task = artpack::select()
                    ->where('id', '=', $request->order_id)
                    ->get();
        return $task;
    }

    public function assignTask(Request $request){
        Task::where('order_id', $request->id)
            ->where('table_name', '=', 'artpacks')
            ->increment('stage', 1, ['app_worker' => $request->worker_id]);
        return $request;
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
}
