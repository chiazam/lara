<?php

// namespace App\Repositories;

// namespace App\Http\Controllers\Auth;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Controller;
use App\Http\Controllers\AuthController;
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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

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

Route::get('/timelineApi', function (Request $request) {

    // return $request;

    $requisite = [];

    if ($request->has('userid') && $request->userid != null) {

        $requisite['userid'] = $request->userid;
    }

    $requisite['limit'] = (($request->has('limit') && $request->limit != null) ? ($request->limit) : (10));

    $requisite['offset'] = (($request->has('offset') && $request->offset != null) ? ($request->offset) : (0));

    $requisite['sources'] = (($request->has('sources') && $request->sources != null) ? ($request->sources) : (''));

    $requisite['categories'] = (($request->has('categories') && $request->categories != null) ? ($request->categories) : (''));

    $requisite['authors'] = (($request->has('authors') && $request->authors != null) ? ($request->authors) : (''));

    $requisite['word'] = (($request->has('word') && $request->word != null) ? ($request->word) : (''));

    // return $requisite;

    return Start::timelineApi(($requisite));
});

Route::post('/signup', [AuthController::class, 'signup']);

Route::post('/login', [AuthController::class, 'login']);

Route::post('/me', [AuthController::class, 'me'])->middleware('auth:sanctum');

Route::post('/logout', [AuthController::class, 'logout']);
