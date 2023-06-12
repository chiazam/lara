<?php

use Illuminate\Support\Facades\Route;
use \App\Models\Start;
use Goutte\Client;
use Illuminate\Http\Request;
use Symfony\Component\BrowserKit\HttpBrowser;
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

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('assets/{path}', function ($path) {
//     return response()->file(public_path("assets/$path"));
// });

Route::get('/', function () {
    return view('i', Start::startinfo());
});

Route::get('/scrapeBBC', function () {

    return Start::scrapeBBC();
});

Route::get('/NewsApi', function () {

    return Start::scrapeNewsApi();
});

Route::get('/GuardianApi', function () {

    return Start::scrapeGuardianApi();
});

Route::get('/getNews', function (Request $request) {
});
