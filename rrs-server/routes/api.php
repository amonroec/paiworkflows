<?php

use Illuminate\Http\Request;
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

Route::get('test', function() {
    return response([1,2,3,4], 200);
});

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

Route::post('/requestuser', function (Request $request) {
	return redirect()->action('RequestUsersController@insertRequest', $request->input());
});
