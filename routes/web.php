<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\Admin\CarController;
use App\Http\Controllers\Admin\RentalController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Frontend\PageController;
use App\Http\Controllers\Frontend\CarController as FrontendCarController;
use App\Http\Controllers\Frontend\RentalController as FrontendRentalController;

// Add your custom middleware here
use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\CustomerMiddleware;



Route::get('/', function () {
    return redirect()->route('home');
});

Route::get('/', function () {
    return redirect('/cars');
});


// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// })->name('welcome'); // Added a name for the welcome route

// Frontend routing
Route::get('/home', [PageController::class, 'index']);
Route::get('/cars', [FrontendCarController::class, 'index'])->name('cars.index');
Route::get('/cars/{car}', [FrontendCarController::class, 'show']);

Route::middleware(['auth'])->group(function () {
    Route::post('/cars/{car}/book', [FrontendCarController::class, 'book']);
});





Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


// Route::middleware(['auth'])->group(function () {
//     // Admin Routes
//     Route::resource('admin/cars', CarController::class);
//     Route::resource('admin/rentals', RentalController::class);
//     Route::resource('admin/customers', CustomerController::class);
// });

Route::middleware(['auth', AdminMiddleware::class])->group(function () {
    // Admin Routes
    Route::resource('admin/cars', CarController::class);
    Route::resource('admin/rentals', RentalController::class);
    Route::resource('admin/customers', CustomerController::class);
});

// Route::middleware(['auth', CustomerMiddleware::class])->group(function () {
//     // Customer Routes
//     Route::get('/rentals', [RentalController::class, 'index'])->name('rentals.index');
//     Route::post('/rentals', [RentalController::class, 'store'])->name('rentals.store');
//     Route::get('/rentals/{rental}', [RentalController::class, 'show'])->name('rentals.show');
//     Route::delete('/rentals/{rental}', [RentalController::class, 'destroy'])->name('rentals.destroy');

// });




// Route::middleware(['auth'])->group(function () {
//     Route::get('/rentals/create', [FrontendRentalController::class, 'create'])->name('rentals.create');
//     Route::post('/rentals', [FrontendRentalController::class, 'store'])->name('rentals.store');
//     Route::get('/rentals', [FrontendRentalController::class, 'index'])->name('rentals.index');
// });




require __DIR__.'/auth.php';

