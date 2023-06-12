<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Models\Start;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
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

Route::get('/scrapeAllApi', function () {

    return Start::scrapeAllApi();
});

Route::get('/getNews', function (Request $request) {
});
