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

        $user5 = [
          'name' => 'Art User1',
          'email' => 'artUser1@paifashion.com',
          'password' => Hash::make('password'),
        ];

        $user6 = [
          'name' => 'Art User2',
          'email' => 'artUser2@paifashion.com',
          'password' => Hash::make('password'),
        ];

        $user7 = [
          'name' => 'Art User3',
          'email' => 'artUser3@paifashion.com',
          'password' => Hash::make('password'),
        ];

        $user8 = [
          'name' => 'Art User4',
          'email' => 'artUser4@paifashion.com',
          'password' => Hash::make('password'),
        ];

        User::create($user5);
        User::create($user6);
        User::create($user7);
        User::create($user8);
    }
}
