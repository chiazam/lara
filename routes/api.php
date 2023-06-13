<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Models\Start;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/scrapeBBC', function (Request $request) {

    return Start::scrapeBBC(($request->has("save")));
});

Route::get('/NewsApi', function (Request $request) {

    return Start::scrapeNewsApi(($request->has("save")));
});

Route::get('/GuardianApi', function (Request $request) {

    return Start::scrapeGuardianApi(($request->has("save")));
});

Route::get('/scrapeAllApi', function (Request $request) {

    return Start::scrapeAllApi(($request->has("save")));
});

// Route::get('/getNews', function (Request $request) {
// });

Route::post('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
