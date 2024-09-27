<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomerMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Check if the authenticated user has a customer role
        if (Auth::check() && Auth::user()->role === 'customer') {
            return $next($request);
        }

        // If the user is not a customer, redirect them to the home page or show a 403 error
        return redirect('/')->with('error', 'You do not have customer access.');
        // or
        // abort(403, 'Unauthorized action.');
    }
}
