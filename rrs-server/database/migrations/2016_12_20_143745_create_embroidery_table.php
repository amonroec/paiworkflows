<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmbroideryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('embroideries', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->integer('po_num')->unsigned();
            $table->char('address', 50);
            $table->integer('customer_num')->unsigned();
            $table->date('due_date')->unsigned();
            $table->integer('tape_num_1')->unsigned();
            $table->char('tape_size_1', 50);
            $table->char('tape_pos_1', 20);
            $table->integer('tape_num_2')->unsigned();
            $table->char('tape_size_2', 50);
            $table->char('tape_pos_2', 20);
            $table->integer('tape_num_3')->unsigned();
            $table->char('tape_size_3', 50);
            $table->char('tape_pos_3', 20);
            $table->char('vector_file', 5);
            $table->char('art_file_available', 5);
            $table->char('cap_color', 20);
            $table->char('description', 255);
            $table->char('threads', 255);
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
        Schema::dropIfExists('embroideries');
    }
}
