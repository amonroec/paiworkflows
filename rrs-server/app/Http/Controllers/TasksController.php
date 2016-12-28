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

    public function loadTasks(){
    	$tasks = Task::all();
    	return $tasks;
    }

    public function setTask(Request $request){
    	$task_order = $request->order_id;
    	$task_table = $request->table_name;
    }

    public function getTask(Request $request){
    		$task = Embroidery::select()
    							->where('id', '=', $request->order_id)
    							->get();
    	return $task;
    }
}
