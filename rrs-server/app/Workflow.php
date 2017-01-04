<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Workflow extends Model
{
    protected $fillable = [
        'workflow_name',
		'step_name',
		'select_group',
		'assigner',
		'approval_type',
		'assigned_person',
		'assigned_group',
		'task_type',
		'task_description'
    ];
}
