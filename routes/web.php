<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use \App\Models\Start;

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('assets/{path}', function ($path) {
//     return response()->file(public_path("assets/$path"));
// });

Route::get('/', function () {
    return view('i', Start::startinfo());
});
