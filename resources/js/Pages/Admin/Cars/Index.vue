<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router, Link } from '@inertiajs/vue3';


import { defineProps } from 'vue';

const props = defineProps({
  cars: Array,
});


const editCar = (id) => {
  router.get(`/admin/cars/${id}/edit`);
};


const deleteCar = (id) => {
  
  router.delete(`/admin/cars/${id}`, {
        onSuccess: () => {
            // Optionally handle success here (e.g., redirect, show a message)
            alert("Car Delete successfully!");
        },
        onError: (errors) => {
            // Handle errors (e.g., show validation errors)
            console.error(errors);
            alert("There was an error Delete the car.");
        },
    });
};



</script>

<template>
    <Head title="Car Managment" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex"><h2 class="font-semibold text-xl text-gray-800 leading-tight"> Car List</h2></div>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

                 <Link :href="route('cars.create')" class="mb-4 inline-block bg-green-500 text-white px-4 py-2 rounded">Add Car</Link>

                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <table class="min-w-full border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                        <th class="border px-4 py-2">Car Name</th>
                        <th class="border px-4 py-2">Brand</th>
                        <th class="border px-4 py-2">Model</th>
                        <th class="border px-4 py-2">Year</th>
                        <th class="border px-4 py-2">Daily Rent Price</th>
                        <th class="border px-4 py-2">Availability</th>
                        <th class="border px-4 py-2">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="car in cars" :key="car.id">
                        <td class="border px-4 py-2">{{ car.name }}</td>
                        <td class="border px-4 py-2">{{ car.brand }}</td>
                        <td class="border px-4 py-2">{{ car.model }}</td>
                        <td class="border px-4 py-2">{{ car.year }}</td>
                        <td class="border px-4 py-2">{{ car.daily_rent_price }}</td>
                        <td class="border px-4 py-2">{{ car.availability ? 'Available' : 'Not Available' }}</td>
                        <td class="border px-4 py-2">
                            <button @click="editCar(car.id)" class="bg-blue-500 text-white px-2 py-1 rounded me-2">Edit</button>
                            <button @click="deleteCar(car.id)" class="bg-red-500 text-white px-2 py-1 rounded">Delete</button>
                        </td>
                        </tr>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>





<style scoped>
/* Add your styles here */
</style>
