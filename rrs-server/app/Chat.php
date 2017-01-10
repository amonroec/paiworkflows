<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
	protected $fillable = [
		'task_id', 'messages',
	];

    protected $casts = [
        'task_id' => 'integer', 'messages' => 'array',
    ];
}
