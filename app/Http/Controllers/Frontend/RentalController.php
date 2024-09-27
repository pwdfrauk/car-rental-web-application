<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Rental;
use App\Models\Car;
use Illuminate\Http\Request;

class RentalController extends Controller
{
    public function create()
    {
        $cars = Car::where('availability', true)->get();
        return inertia('Rentals/Create', ['cars' => $cars]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'car_id' => 'required|exists:cars,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $car = Car::find($request->car_id);
        $totalCost = $car->daily_rent_price * $this->calculateDays($request->start_date, $request->end_date);

        Rental::create([
            'user_id' => auth()->id(),
            'car_id' => $car->id,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'total_cost' => $totalCost,
        ]);

        // Send email logic can be added here

        return redirect()->route('rentals.index')->with('success', 'Rental created successfully.');
    }

    public function index()
    {
        $rentals = Rental::with(['car'])->where('user_id', auth()->id())->get();
        return inertia('Rentals/Index', ['rentals' => $rentals]);
    }

    private function calculateDays($startDate, $endDate)
    {
        $start = \Carbon\Carbon::parse($startDate);
        $end = \Carbon\Carbon::parse($endDate);
        return $end->diffInDays($start) + 1; // +1 for inclusive dates
    }

    public function cancel(Rental $rental)
    {
        if ($rental->start_date > now()) {
            $rental->delete();
            return redirect()->route('rentals.index')->with('success', 'Rental canceled successfully.');
        }
        return redirect()->route('rentals.index')->with('error', 'Cannot cancel a rental that has started.');
    }
}
