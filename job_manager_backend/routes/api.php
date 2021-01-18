<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\JobController;
use App\Http\Controllers\UserController;



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

Route::post('/user/add', [AuthController::class, 'store']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/logout', [AuthController::class, 'logout']);

Route::middleware(['auth.api'])->group(function () {
    Route::get('/refresh', [AuthController::class, 'refresh']);
    Route::get('/me', [AuthController::class, 'me']);

    //user
    Route::get('/users', [UserController::class, 'index']);
    Route::get('/user/{user}/show', [UserController::class, 'show']);
    Route::put('/user/{user}/edit', [UserController::class, 'update']);
    Route::delete('/user/{user}/delete', [UserController::class, 'destroy']);

    //jobs
    Route::get('/jobs', [JobController::class, 'index']);
    Route::get('/job/{job}/show', [JobController::class, 'show']);
    Route::post('/job/add', [JobController::class, 'store']);
    Route::put('/job/{job}/edit', [JobController::class, 'update']);
    Route::get('/job/{job}/conclude', [JobController::class, 'conclude']);
    Route::delete('/job/{job}/delete', [JobController::class, 'destroy']);
}
);
