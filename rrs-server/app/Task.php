<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = [
        'order_id','table_name','workflow_id','stage','app_worker','assigned_group','submitted_by','status'
    ];
}
