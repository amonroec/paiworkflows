<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Task;

class TasksController extends Controller
{
    /*public function __construct(Task $task, Request $request){
    	$this->task = $task;
    	$this->request = $request;
    }*/
    public function index(){

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
}
