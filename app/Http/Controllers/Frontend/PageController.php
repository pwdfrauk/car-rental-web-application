<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class PageController extends Controller
{
    public function index()
    {
         return Inertia::render('Home', [
            'auth' => [
                'user' => auth()->user(), // Current authenticated user
                'status' => auth()->check(), // Check if user is authenticated
            ],
        ]);
    }

    public function about()
    {
        return inertia('About');
    }

    public function contact()
    {
        return inertia('Contact');
    }
}
