<?php
namespace App\Http\Controllers;
session_start();

use Illuminate\Http\Request;
use App\RequestUser;
use App\User;
use App\Group;
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

    public function pullUsers() {
        $req = User::all();
        return $req;
    }

    public function getGroups() {
        $req = Group::all();
        return $req;
    }

    public function getWorkers(Request $request) {
        $req = User::select()
                ->where('access_level', '>=', $request->accessLevel)
                ->get();
        return $req;
    }

    public function getUserData(Request $request) {
        $name = $request->input('name');
        $email = $request->input('email');
        $req = User::select()
                ->where('email', $request->input('email'))
                ->get();
        $count = count($req);
        /*if($count == 0){
            $req = new User;
            $req->name = $request->input('name');
            $req->email = $request->input('email');
            $id = User::insertGetId(
              [
                'name' => ''.$name.'',
                'email' => ''.$email.''
              ]
            );
            return $this->getUserDataById($id);
        }else{*/
            return $req;
        //}
    }

    public function getUserDataById($id) {
        $req = User::select()
                ->where('id', $id)
                ->get();
        return $req;
    }
}
