<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news', function (Blueprint $table) {
            $table->id();
            $table->longText('title')->nullable();
            $table->longText('link')->nullable();
            $table->longText('imgsrc')->nullable();
            $table->longText('imgalt')->nullable();
            $table->longText('summary')->nullable();
            $table->longText('tagname')->nullable();
            $table->longText('taglink')->nullable();
            $table->longText('author')->nullable();
            $table->longText('source')->nullable();
            $table->longText('sourceid')->nullable();
            $table->longText('date')->nullable();
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
        Schema::dropIfExists('news');
    }
}
