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
    	$req->save();
    	return;
    }

    public function getWorkflows(){
    	$req = WorkflowForm::all();
    	return $req;
    }
}
