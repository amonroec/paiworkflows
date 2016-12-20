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
            $req->first_name = $request->input('first_name');
            $req->last_name = $request->input('last_name');
            $req->phone_number = $request->input('phone_number');
            $req->phone_extension = $request->input('phone_extension');
            $req->division = $request->input('division');
            $req->email = $request->input('email');
            $req->save();
    }
}
