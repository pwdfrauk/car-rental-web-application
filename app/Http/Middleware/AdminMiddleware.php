<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
          // Check if the authenticated user has an admin role
          if (Auth::check() && Auth::user()->role === 'admin') {
            return $next($request);
        }

        // If the user is not an admin, redirect them to the home page or show a 403 error
        return redirect('/')->with('error', 'You do not have admin access.');
    }
}
