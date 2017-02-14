<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Account;

class AccountsController extends Controller
{
<<<<<<< HEAD
   public function getUserData(Request $request) {
       $name = $request->input('name');
       $email = $request->input('email');
       $req = Account::select()
               >where('email_address', $request>input('email'))
               ->get();
       $count = count($req);
       return $req;
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
       }else{
           return $request;
       //}*/
   }

   public function getWorkers(Request $request) {
       $req = Account::all();
       return $req;
   }
=======
    public function getUserData(Request $request) {
<<<<<<< HEAD
        /*$name = $request->input('name');
=======
        $name = $request->input('name');
>>>>>>> origin/master
        $email = $request->input('email');
        $req = Account::select()
                ->where('email_address', $request->input('email'))
                ->get();
<<<<<<< HEAD
        $count = count($req);*/
=======
        $count = count($req);
        return $req;
>>>>>>> origin/master
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
<<<<<<< HEAD
        }else{*/
            return $request;
        //}
=======
        }else{
            return $request;
        //}*/
>>>>>>> origin/master
    }

    public function getWorkers(Request $request) {
        $req = Account::all();
        return $req;
    }
>>>>>>> origin/master
}
