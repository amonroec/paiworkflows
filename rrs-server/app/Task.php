<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Task extends Model
{

	use Notifiable;

    protected $fillable = [
        'order_id','table_name','workflow_id','stage','app_worker','assigned_group','submitted_by','status'
    ];
}
