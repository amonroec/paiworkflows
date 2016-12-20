<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArtpackFormTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('artpacks', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->integer('artpack_num')->unsigned();
            $table->char('rep_name', 50);
            $table->char('turn_time', 50);
            $table->char('account_name', 50);
            $table->integer('account_num')->unsigned();
            $table->char('customer_name', 50);
            $table->char('reference_tapes', 50);
            $table->char('package_type', 50);
            $table->char('style_preference', 50);
            $table->char('course_location', 50);
            $table->char('csr_name', 50);
            $table->char('manipulate_logo', 50);
            $table->integer('num_designs')->unsigned();
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
        Schema::dropIfExists('artpacks');
    }
}
