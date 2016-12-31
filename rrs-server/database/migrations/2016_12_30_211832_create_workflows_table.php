<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkflowsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workflows', function (Blueprint $table) {
            $table->increments('id');
            $table->string('workflow_name', 20);
            $table->string('step_name', 20);
            $table->integer('need_assigned')->unsigned();
            $table->string('select_group', 30);
            $table->integer('assigner')->unsigned();
            $table->string('approval_type', 10);
            $table->integer('assigned_person')->unsigned();
            $table->integer('assigned_group')->unsigned();
            $table->string('task_type', 20);
            $table->string('task_description', 255);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('workflows');
    }
}
