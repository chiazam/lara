<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use \App\Models\Start;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('assets/{path}', function ($path) {
//     return response()->file(public_path("assets/$path"));
// });

Route::get('/', function () {
    return view('Index', Start::startinfo());
});
