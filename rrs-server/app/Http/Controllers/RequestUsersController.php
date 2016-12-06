<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\RequestUser;
use Illuminate\Foundation\Http\FormRequest;
use App\Http\Controllers\Controller; 

class RequestUsersController extends Controller
{
    public function index(Request $request)
    {
        
    }

    public function insertRequest(Request $request) {
    	$req = new RequestUser;
        $req->first_name = $request->input('request_user.first_name');
        $req->last_name = $request->input('request_user.last_name');
        $req->phone_number = $request->input('request_user.phone_number');
        $req->phone_extension = $request->input('request_user.phone_extension');
        $req->division = $request->input('request_user.division');
        $req->email = $request->input('request_user.email');
        $req->save();
    }
}
