<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{

    protected $fillable = [
        'table_name','workflow_id','stage','app_worker','assigned_group','submitted_by','status','upload_url'
    ];

    protected $casts = [
        'upload_url' => 'array'
    ];

}
