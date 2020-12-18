<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\JobController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

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
    //user
    Route::get('/users', [UserController::class, 'index']);
    Route::get('/user/{id}/show', [UserController::class, 'show']);
    Route::put('/user/{id}/edit', [UserController::class, 'update']);
    Route::delete('/user/{id}/delete', [UserController::class, 'destroy']);

    //jobs
    Route::get('/jobs', [JobController::class, 'index']);
    Route::get('/job/{id}/show', [JobController::class, 'show']);
    Route::post('/job/add', [JobController::class, 'store']);
    Route::put('/job/{id}/edit', [JobController::class, 'update']);
    Route::get('/job/{id}/conclude', [JobController::class, 'conclude']);
    Route::delete('/job/{id}/delete', [JobController::class, 'destroy']);
}
);
