<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Workflow;

class WorkflowController extends Controller
{
    public function submitWorkflow(Request $request) {
    	foreach($request->workflow_array as $out){
	    	$req = new Workflow;
	    	$req->workflow_name = $request->workflow_name;
			$req->step_name = $out["step_name"];
			$req->needs_assigned = $out["needs_assigned"];
			$req->assigner = $out["assigner"];
			$req->approval_type = $out["approval_type"];
			$req->approval_person = $out["choose_person"];
			$req->task_type = $out["task_type"];
			$req->task_description = $out["task_description"];
			$req->save();
		}
		return print_r($request->workflow_name);
    }
}
