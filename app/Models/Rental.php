<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rental extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', // Foreign key reference to the customer
        'car_id',    // Name of the car
        'start_date',  // Rental start date
        'end_date',    // Rental end date
        'total_cost',  // Total cost of the rental
        'status'       // Rental status
    ];

    
    public function car()
    {
        return $this->belongsTo(Car::class);
    }
    
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
