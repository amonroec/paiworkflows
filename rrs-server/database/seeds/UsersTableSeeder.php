<?php

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;


class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $user1 = [
          'name' => 'Austin Coleman',
          'email' => 'amc_080@hotmail.com',
          'password' => Hash::make('password'),
        ];
        $user2 = [
          'name' => 'Brian Biggins',
          'email' => 'bbiggins@paifashion.com',
          'password' => Hash::make('password'),
        ];
        $user3 = [
          'name' => 'Kyle Biggins',
          'email' => 'kbiggins@paifashion.com',
          'password' => Hash::make('password'),
        ];
        $user4 = [
          'name' => 'Tasha Eaton',
          'email' => 'teaton@paifashion.com',
          'password' => Hash::make('password'),
        ];

        User::create($user2);
        User::create($user3);
        User::create($user4);
    }
}
