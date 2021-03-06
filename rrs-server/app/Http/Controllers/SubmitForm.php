<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\artpack;
use App\Embroidery;
use App\Task;
use App\Workflow;
use App\Http\Controllers;

class SubmitForm extends Controller
{
    public function embroiderySubmit(Request $request) {
    		$req = new Embroidery;
        $req->po_num = $request->input('po_num');
        $req->address = $request->input('address');
        $req->customer_num = $request->input('customer_num');
        $req->due_date = $request->input('due_date');
        $req->tape_num_1 = $request->input('tape_num_1');
        $req->tape_size_1 = $request->input('tape_size_1');
        $req->tape_pos_1 = $request->input('tape_pos_1');
        $req->tape_num_2 = $request->input('tape_num_2');
        $req->tape_pos_2 = $request->input('tape_pos_2');
        $req->tape_size_2 = $request->input('tape_size_2');
        $req->tape_num_3 = $request->input('tape_num_3');
        $req->tape_size_3 = $request->input('tape_size_3');
        $req->tape_pos_3 = $request->input('tape_pos_3');
        $req->vector_file = $request->input('vector_file');
        $req->art_file_available = $request->input('art_file_available');
        $req->cap_color = $request->input('cap_color');
        $req->description = $request->input('description');
        $req->threads = $request->input('threads');
        $id = Embroidery::insertGetId(
          [
            'po_num' => $req->po_num,
            'address' => $req->address,
            'customer_num' => $req->customer_num,
            'due_date' => $req->due_date,
            'tape_num_1' => $req->tape_num_1,
            'tape_size_1' => $req->tape_size_1,
            'tape_pos_1' => $req->tape_pos_1,
            'tape_num_2' => $req->tape_num_2,
            'tape_pos_2' => $req->tape_pos_2,
            'tape_size_2' => $req->tape_size_2,
            'tape_num_3' => $req->tape_num_3,
            'tape_size_3' => $req->tape_size_3,
            'tape_pos_3' => $req->tape_pos_3,
            'vector_file' => $req->vector_file,
            'art_file_available' => $req->art_file_available,
            'cap_color' => $req->cap_color,
            'description' => $req->description,
            'threads' => $req->threads
          ]
        );
        return $this->taskSubmit($id, 'embroideries');
        //return redirect()->action('TasksController@taskSubmit', $id, 'embroideries');
    }

    public function testSubmit(Request $request){
        $task = new Task;
        $task->workflow_id = $request->input('account_name');
        $task->save();
        return;
    }

    public function submitWorkflowId(Request $request){
        $workflowId = $request->input('workflow_id');
        return redirect()->route('asi', [$workflowId]);
    }

    public function artpackSubmit(Request $request) {
        $workflow_id = $request->input('workflow_id');
        $form_image_url = $request->input('form_image_src');
        $submit = 1;//$request->input('submitted_by');
        $csr = $request->input('csr_name');
        $turn_time = $request->input('turn_time');
        $task_id = $this->newTaskSubmit($workflow_id, $submit, 'artpack', $csr, $form_image_url, $turn_time);
		$req = new artpack;
        //$req->artpack_num = $request->input('artpack_num');
        $req->task_id = $task_id;
        $req->rep_name = $request->input('rep_name');
        $req->turn_time = $request->input('turn_time');
        $req->account_name = $request->input('account_name');
        $req->account_num = $request->input('account_num');
        $req->customer_name = $request->input('customer_name');
        $req->reference_tapes = $request->input('reference_tapes');
        $req->package_type = $request->input('package_type');
        $req->package_domestic = $request->input('domestic');
        $req->package_q30 = $request->input('q30');
        $req->package_c60 = $request->input('c60');
        $req->package_full_custom = $request->input('full_custom');
        $req->package_core_24 = $request->input('core_24');   
        $req->package_total = $request->input('package_total');    
        //$req->style_preference = $request->input('style_preference');
        $req->course_location = $request->input('location_course');
        $req->submitted_by = $request->input('submitted_by');
        $req->manipulate_logo = $request->input('manipulate');
        $req->num_designs = $request->input('design_num');
        $req->description = $request->input('description_box');
        $req->threads = $request->input('threads');
        $artpack_id = artpack::insertGetId(
          [
            'task_id' => $task_id,
            'rep_name' => $req->rep_name,
            'turn_time' => $req->turn_time,
            'account_name' => $req->account_name,
            'account_num' => $req->account_num,
            'customer_name' => $req->customer_name,
            'reference_tapes' => $req->reference_tapes,
            'package_type' => $req->package_type,
            'package_domestic' => $req->package_domestic,
            'package_q30' => $req->package_q30,
            'package_c60' => $req->package_c60,
            'package_full_custom' => $req->package_full_custom,
            'package_core_24' => $req->package_core_24,
            'package_total' => $req->package_total,
            'style_preference' => $req->style_preference,
            'course_location' => $req->course_location,
            'submitted_by' => $req->submitted_by,
            'manipulate_logo' => $req->manipulate_logo,
            'num_designs' => $req->num_designs,
            'description' => $req->description,
            'threads' => $req->threads
          ]
        );

        //Get the base-64 string from data
        $filteredData=substr($_POST['form_image_src'], strpos($_POST['form_image_src'], ",")+1);
 
        //Decode the string
        $unencodedData=base64_decode($filteredData);
        //file_put_contents('img.png', $unencodedData);

        $image = base64_decode($filteredData);
        $image_name= $task_id . 'task.png';
        $path = public_path() . "/assets/forms/" . $image_name;
         
        //Save the image
        file_put_contents($path, $unencodedData);

        $r = Task::where('id', $task_id)
            ->update(['form_num' => $artpack_id, 'form_image_url' => $image_name]);
        //$this->getNextTask($id, 'artpacks');
        if(!$r){

        }else{
            return redirect('http://localhost:8080/home');
        }
        
        //return redirect()->action('TasksController@taskSubmit', $id, 'artpacks');
        //return $this->taskSubmit($id)
    }

    public function taskSubmit($order_id, $order){
      print_r($order_id);
      $task = new Task;
        $task->order_id = $order_id;
        $task->table_name = $order;
        $task->save();
        return;
    }

    public function newTaskSubmit($id, $person, $table, $csr, $form_image, $turn_time){
      $workflow = $this->getWorkflow($id);
      if($workflow[1]->needs_assigned == 1){
        $column = 'app_worker';
        $value = $workflow[1]->assigner;
        $status = $workflow[1]->task_type;
      }else{
        if($workflow[1]->assigned_group != ""){
          $column = 'app_group';
          $value = $workflow[1]->assigned_group;
          $status = $workflow[2]->task_type;
        }
      }
        $timestamp = date("Y-m-d h:i:s");
      $req = new Task;
      $req->workflow_id = $id;
      $req->submitted_by = $person;

        //$file = $img->store('assets/forms', 'uploads');

      $task_id = Task::insertGetId(
        [
          'table_name' => $table,
          'workflow_id' => $req->workflow_id,
          'csr_assigned' => $csr,
          'submitted_by' => $req->submitted_by,
          $column => $value,
          'status' => $status,
          'turn_time' => $turn_time,
          'created_at' => $timestamp
        ]
      );
      
      return $task_id;
    }

    private function getWorkflow($id){
      $workflow = Workflow::select()
                ->where('workflow_name', $id)
                ->orderBy('id', 'asc')
                ->get();
      return $workflow;
    }

    public function artPack(Request $request){
        return $request->input();
    }
}
