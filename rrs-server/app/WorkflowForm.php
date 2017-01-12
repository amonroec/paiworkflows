<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkflowForm extends Model
{
    protected $fillable = [
        'workflow_name',
		'form_name',
    ];
}
