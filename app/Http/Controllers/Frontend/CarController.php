<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\Car;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Illuminate\Http\Request; 
use App\Models\Rental;

class CarController extends Controller
{
    public function index()
    {
        $cars = Car::all();

        return Inertia::render('Cars/Index', [
            'cars' => $cars,
        ]);
    }

    public function show(Car $car)
    {
        return Inertia::render('Cars/Show', [
            'car' => $car,
        ]);
    }


    public function book(Request $request, Car $car)
{
    // Validate the dates
    $request->validate([
        'start_date' => 'required|date|after:today',
        'end_date' => 'required|date|after:start_date',
    ]);

    // Calculate the number of days between start and end dates
    $startDate = \Carbon\Carbon::parse($request->start_date);
    $endDate = \Carbon\Carbon::parse($request->end_date);
    $daysDiff = $startDate->diffInDays($endDate) + 1; // +1 to include the start date

    // Calculate total cost based on daily rent price
    $dailyRentPrice = $car->daily_rent_price; // Assuming you have this field in your Car model
    $totalCost = $daysDiff * $dailyRentPrice;

   
    
    // Create a rental for the logged-in user
    $rental = Rental::create([
        'user_id' => auth()->id(),
        'car_id' => $car->id,
        'start_date' => $request->start_date,
        'end_date' => $request->end_date,
        'total_cost' => $totalCost, // Set the calculated total cost
        'status' => 'pending',
    ]);
    
    return response('Booking successful!');
}



}
