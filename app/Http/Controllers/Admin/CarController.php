<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CarController extends Controller
{
    public function index()
    {
        $cars = Car::all();
        return inertia('Admin/Cars/Index', ['cars' => $cars]);
    }

    public function create()
    {
        return inertia('Admin/Cars/Create');
    }

    public function store(Request $request)
    {
       
        $request->validate([
            'name' => 'required',
            'brand' => 'required',
            'model' => 'required',
            'year' => 'required|integer',
            'car_type' => 'required',
            'daily_rent_price' => 'required|numeric',
            'availability' => 'boolean',
            'image' => 'nullable|image',
        ]);

        $car = new Car($request->all());

        if ($request->hasFile('image')) {
            // Store the file in the 'public/images/cars' directory
            $filePath = $request->file('image')->store('images/cars', 'public');
        
          
            $imageUrl = Storage::url($filePath); 

            $car->image =  $imageUrl;
        }
     
        $car->save();

        return redirect()->route('cars.index')->with('success', 'Car created successfully.');
    }

    public function edit(Car $car)
    {
        return inertia('Admin/Cars/Edit', ['car' => $car]);
    }



    public function update(Request $request, $id)
    {
        //return  $request;
        // Validate the incoming request data
        $request->validate([
            'name' => 'required',
            'brand' => 'required',
            'model' => 'required',
            'year' => 'required|integer',
            'car_type' => 'required',
            'daily_rent_price' => 'required|numeric',
            'availability' => 'boolean',
            'image' => 'nullable|image', // Ensure image validation is included
        ]);
        
       
        // Find the car by ID
        $car = Car::findOrFail($id); // Use the ID from the route parameter
        
        // Update the car attributes with the validated data
        $car->name = $request->name;
        $car->brand = $request->brand;
        $car->model = $request->model;
        $car->year = $request->year;
        $car->car_type = $request->car_type;
        $car->daily_rent_price = $request->daily_rent_price;
        $car->availability = $request->availability;
    
        // Handle the image upload if a new image is provided
        if ($request->hasFile('image')) {
            // Store the new image in the 'public/images/cars' directory
            $path = $request->file('image')->store('images/cars', 'public');
            // Update the car's image path
            $car->image = Storage::url($path); // Get the URL to store in the database
        }
    
        // Save the updated car record
        $car->save();
    
        // Optionally redirect or return a response
        return redirect()->route('cars.index')->with('success', 'Car updated successfully!');
    }
    




    public function destroy(Car $car)
    {
        $car->delete();
        return redirect()->route('cars.index')->with('success', 'Car deleted successfully.');
    }
}
