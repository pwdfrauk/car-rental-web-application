<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class CustomerController extends Controller
{
    // List all customers
    public function index()
    {
        $customers = User::where('role', 'customer')->get();
        
        return Inertia::render('Admin/Customers/Index', [
            'customers' => $customers
        ]);
    }

    // Show the form to create a new customer
    public function create()
    {
        return Inertia::render('Admin/Customers/Create');
    }

    // Store a newly created customer in the database
    public function store(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email', // Ensure unique check includes the field
            'password' => 'required|string|min:8|confirmed',
            'mobile_no' => 'nullable|string|max:15',
            'address' => 'nullable|string|max:255',
            'rental_history' => 'nullable',
        ]);
      
        // Create a new user record
        try {
            User::create([
                'name' => $request->name,
                'email' => $request->email, // Ensure to use the correct field
                'mobile_no' => $request->mobile_no, // Use mobile_no instead of phone
                'address' => $request->address,
                'password' => Hash::make($request->password),
                'role' => 'customer', // Set role as 'customer'
            ]);
    
            // Redirect back with success message
            return redirect()->route('customers.index')->with('success', 'Customer created successfully!');
        } catch (\Exception $e) {
            // Handle any exceptions that occur during the creation process
            return redirect()->route('customers.index')->with('error', 'There was an error adding the customer: ' . $e->getMessage());
        }
    }
    // Show the form for editing a specific customer
    public function edit($id)
    {
        $customer = User::findOrFail($id);
        return Inertia::render('Admin/Customers/Edit', [
            'customer' => $customer
        ]);
    }

    // Update a customer's details
    public function update(Request $request, $id)
    {
        // Find the customer by ID
        $user = User::findOrFail($id);

        // Validate incoming request data
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email,' . $user->id,
            'password' => 'nullable|string|min:8|confirmed',
            'mobile_no' => 'nullable|string|max:15',
            'address' => 'nullable|string|max:255',
        ]);

        // Update customer data
        $user->name = $request->input('name');
        $user->email = $request->input('email');

        // Only update the password if it is provided
        if ($request->input('password')) {
            $user->password = Hash::make($request->input('password'));
        }

        $user->mobile_no = $request->input('mobile_no');
        $user->address = $request->input('address');

        // Save the changes to the database
        $user->save();

        // Redirect or respond back
        return redirect()->route('customers.index')->with('success', 'Customer updated successfully!');
    }

    // Delete a customer
    public function destroy($id)
    {
        $customer = User::findOrFail($id);
        $customer->delete();

        return redirect()->route('customers.index')->with('success', 'Customer deleted successfully!');
    }
}
