<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\artpack;
use App\Embroidery;
use App\Task;

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
        return $this->taskSubmit($id, 'embroidery');
        //return redirect()->action('TasksController@taskSubmit', $id, 'embroideries');
    }

    public function artpackSubmit(Request $request) {
				$req = new artpack;
        $req->artpack_num = $request->input('artpack_num');
        $req->rep_name = $request->input('rep_name');
        $req->turn_time = $request->input('turn_time');
        $req->account_name = $request->input('account_name');
        $req->account_num = $request->input('account_num');
        $req->customer_name = $request->input('customer_name');
        $req->reference_tapes = $request->input('reference_tapes');
        $req->package_type = $request->input('package_type');
        $req->style_preference = $request->input('style_preference');
        $req->course_location = $request->input('location_course');
        $req->csr_name = $request->input('csr_name');
        $req->manipulate_logo = $request->input('manipulate');
        $req->num_designs = $request->input('design_num');
        $req->description = $request->input('description_box');
        $req->threads = $request->input('threads');
        $req->save();
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
}