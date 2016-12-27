<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = [
        'order_id','table_name','stage','app_worker'
    ];
}
