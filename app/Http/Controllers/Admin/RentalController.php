<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Rental; // Ensure you have a Rental model created
use App\Models\User; // Assuming you'll need this to get user details
use App\Models\Car; // Assuming you'll need this to get user details
use Illuminate\Http\Request;
use Inertia\Inertia;

class RentalController extends Controller
{
    // List all rentals
    public function index()
    {
        
        $rentals = Rental::with('user', 'car')->get(); 
    
       
        return Inertia::render('Admin/Rentals/Index', ['rentals'=> $rentals ] );
    }

    // Show the form to create a new rental
    public function create()
    {
        $users = User::where('role', 'customer')->get(); // Get users for dropdown
        // Assume you have a Car model for car selection
        $cars = Car::all(); // Get all cars for dropdown
      
        return Inertia::render('Admin/Rentals/Create', [
            'users' => $users,
            'cars' => $cars,
        ]);
    }

    // Store a newly created rental in the database
    public function store(Request $request)
    {
     

        $request->validate([
            'user_id' => 'required|exists:users,id',
            'car_id' => 'required|exists:cars,id',  // Validate that car_id is provided
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'total_cost' => 'required|numeric',
            'status' => 'required|in:ongoing,completed,canceled',
        ]);
    
        Rental::create([
            'user_id' => $request->user_id,
            'car_id' => $request->car_id,  // Make sure to include car_id here
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'total_cost' => $request->total_cost,
            'status' => $request->status,
        ]);
    
        

        return redirect()->route('rentals.index')->with('success', 'Rental created successfully!');
    }

    // Show the form for editing a specific rental
    // public function edit($id)
    // {
    //     $rental = Rental::findOrFail($id);
    //     $users = User::where('role', 'user')->get(); // Get users for dropdown
    //     $cars = Car::all(); // Get all cars for dropdown

    //     return Inertia::render('Admin/Rentals/Edit', [
    //         'rental' => $rental,
    //         'users' => $users,
    //         'cars' => $cars,
    //     ]);
    // }

    public function edit($id)
{
    // Fetch the rental that needs to be edited using the ID
    $rental = Rental::findOrFail($id);

    // Fetch the list of users to populate the User selection dropdown
    $users = User::all();

    // Fetch the list of cars to populate the Car selection dropdown
    $cars = Car::all();

    // Return the Inertia view with rental, users, and cars data
    return Inertia::render('Admin/Rentals/Edit', [
        'rental' => $rental,
        'users' => $users,
        'cars' => $cars,
    ]);
}


    // Update a rental's details
    public function update(Request $request, $id)
    {
        // Find the rental by ID
        $rental = Rental::findOrFail($id);

        // Validate incoming request data
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'car_id' => 'required|exists:cars,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',
            'total_cost' => 'required|numeric',
            'status' => 'required|in:ongoing,completed,canceled',
        ]);

        // Update rental data
        $rental->user_id = $request->user_id;
        $rental->car_id = $request->car_id;
        $rental->start_date = $request->start_date;
        $rental->end_date = $request->end_date;
        $rental->total_cost = $request->total_cost;
        $rental->status = $request->status;

        // Save the changes to the database
        $rental->save();

        // Redirect or respond back
        return redirect()->route('rentals.index')->with('success', 'Rental updated successfully!');
    }

    // Delete a rental
    public function destroy($id)
    {
        
        $rental = Rental::findOrFail($id);
        $rental->delete();

        return redirect()->route('rentals.index')->with('success', 'Rental deleted successfully!');
    }
}
