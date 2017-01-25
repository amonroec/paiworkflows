<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\WorkflowForm;

class WorkflowFormController extends Controller
{
    public function submitWorkflowForm(Request $request){
    	$req = new WorkflowForm;
    	$req->workflow_name = $request->input('workflow_name');
    	$req->form_name = $request->input('form_name');
        $req->stage_num = $request->input('stage_num');
        $id = WorkflowForm::insertGetId(
        [
          'workflow_name' => $req->workflow_name,
          'form_name' => $req->form_name,
          'stage_num' => $req->stage_num
        ]
      );
    	return $id;
    }

    public function getWorkflows(){
    	$req = WorkflowForm::all();
    	return $req;
    }
}
