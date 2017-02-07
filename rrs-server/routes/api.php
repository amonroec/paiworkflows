<?php

use Illuminate\Http\Request;
use app\Http\Controllers;
use Illuminate\Support\Facades\Input;
use app\Task;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

/*Route::post('/request-user/submit', function (Request $request) {
	return redirect()->action('RequestUsersController@insertRequest', $request->input());
});*/
Route::post('/requestuser/submit', function (Request $request) {
	return redirect()->action('RequestUsersController@insertRequest', $request->input());
});
Route::resource('/requestuser/submit', 'RequestUsersController@insertRequest');

Route::post('/getUserData', function (Request $request) {
	return redirect()->action('RequestUsersController@getUserData', $request->input());
});
Route::resource('/getUserData', 'RequestUsersController@getUserData');
/*
Route::get('/artpack/list', function (Request $request) {
	return redirect()->action()
});*/

Route::post('/request-form/artpack/submit', function (Request $request) {
	return redirect()->action('SubmitForm@taskSubmit', $request->input());
});
Route::resource('/request-form/artpack/submit', 'SubmitForm@artpackSubmit');

Route::post('/request-form/embroidery/submit', function (Request $request) {
	return redirect()->action('SubmitForm@embroiderySubmit', $request->input());
});
Route::resource('/request-form/embroidery/submit', 'SubmitForm@embroiderySubmit');

Route::post('/tasks/load', function (Request $request) {
	return redirect()->action('TasksController@loadTasks');
});

Route::resource('/tasks/load', 'TasksController@loadTasks');

Route::get('/task/updated', function (Request $request) {
	return redirect()->action('TasksController@taskUpdated');
	//Task::where('id', 81)->notify(new TaskUpdated);
});

Route::resource('/task/updated', 'TasksController@taskUpdated');

Route::get('/tasks/getAllTasks', function (Request $request) {
	return redirect()->action('TasksController@getAllTasks');
	//Task::where('id', 81)->notify(new TaskUpdated);
});

Route::resource('/tasks/getAllTasks', 'TasksController@getAllTasks');

Route::post('/tasks/singleTask', function (Request $request) {
	return redirect()->action('TasksController@setTask');
});

Route::resource('/tasks/singleTask', 'TasksController@setTask');

Route::post('/tasks/getSingleTask', function (Request $request) {
	return redirect()->action('TasksController@getForm');
});

Route::resource('/tasks/getSingleTask', 'TasksController@getForm');

Route::post('/tasks/getTask', function (Request $request) {
	return redirect()->action('TasksController@getTask');
});

Route::resource('/tasks/getTask', 'TasksController@getTask');

Route::post('/getPeople', function (Request $request) {
	return redirect()->action('RequestUsersController@pullUsers');
});

Route::resource('/getPeople', 'RequestUsersController@pullUsers');

Route::post('/getGroups', function (Request $request) {
	return redirect()->action('RequestUsersController@getGroups');
});

Route::resource('/getGroups', 'RequestUsersController@getGroups');

Route::post('/submitWorkflow', function (Request $request) {
	return redirect()->action('WorkflowController@submitWorkflow');
});

Route::resource('/submitWorkflow', 'WorkflowController@submitWorkflow');

Route::post('/submitWorkflowForm', function (Request $request) {
	return redirect()->action('WorkflowFormController@submitWorkflowForm');
});

Route::resource('/submitWorkflowForm', 'WorkflowFormController@submitWorkflowForm');

Route::post('/getWorkflows', function (Request $request) {
	return redirect()->action('WorkflowFormController@getWorkflows');
});

Route::resource('/getWorkflows', 'WorkflowFormController@getWorkflows');

Route::post('/getWholeWorkflow', function (Request $request) {
	return redirect()->action('WorkflowController@getWholeWorkflow');
});

Route::resource('/getWholeWorkflow', 'WorkflowController@getWholeWorkflow');

Route::post('/getArtpack', function (Request $request) {
	return redirect()->action('TasksController@getArtpack');
});

Route::resource('/getArtpack', 'TasksController@getArtpack');

Route::post('/getWorkers', function (Request $request) {
	return redirect()->action('RequestUsersController@getWorkers');
});

Route::resource('/getWorkers', 'RequestUsersController@getWorkers');

Route::post('/assignTask', function (Request $request) {
	return redirect()->action('TasksController@assignTask');
});

Route::resource('/assignTask', 'TasksController@assignTask');

Route::post('/submitApproval', function (Request $request) {
	return redirect()->action('TasksController@submitTaskStep');
});

Route::resource('/submitApproval', 'TasksController@submitTaskStep');

Route::post('/submitChat', function (Request $request) {
	return redirect()->action('ChatController@submitChat');
});

Route::resource('/submitChat', 'ChatController@submitChat');

Route::post('/getMessages', function (Request $request) {
	return redirect()->action('ChatController@getMessages');
});

Route::resource('/getMessages', 'ChatController@getMessages');

Route::post('/submitForApproval', function (Request $request) {
	return redirect()->action('TasksController@submitForApproval');
});

Route::resource('/submitForApproval', 'TasksController@submitForApproval');
/*
Route::get('/asi', function () {
	return Response::view('asi');
});

Route::resource('/asi', Response::view('asi'));
*/
Route::post('/asi/submit', function (Request $request) {
	redirect()->action('SubmitForm@artpackSubmit');
	return view('success');
});

Route::resource('/asi/submit', 'SubmitForm@artpackSubmit');

Route::post('/asi/submitForm', function (Request $request) {
	redirect()->action('SubmitForm@submitWorkflowId');
});

Route::resource('/asi/submitForm', 'SubmitForm@submitWorkflowId');

Route::post('/submitForm', function (Request $request) {
	return redirect()->action('SubmitForm@artPack', $request->input());
});

Route::resource('/submitForm', 'SubmitForm@artPack');

Route::post('/uploadFile', function (Request $request) {
	/*foreach ($request->image as $image) {
		$imagename = time() . $image->getClientOriginalName();
		$uploadFile = $image->move('./../storage/app/public/uploads', $imagename);
		if ($uploadFile) {
			$uploadedImage[] = $imagename;
			return response()->json(['success' => true, 'message' => 'images uploaded']);
		}
	}*/
	//Storage::disk('uploads')->put('testing', $request->file('file_upload'));
	redirect()->action('TasksController@updateUpload', $request);
	redirect('http://localhost:8080/tasks/page');
});

Route::resource('/uploadFile', 'TasksController@updateUpload');





