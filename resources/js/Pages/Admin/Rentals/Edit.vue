<script setup>
import { ref, watch, defineProps } from 'vue';
import { useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router } from '@inertiajs/vue3';

// Define props to receive rental, users, and cars data
const props = defineProps({
    rental: Object, // Rental object to edit
    users: Array,
    cars: Array,
});

// Set up the form with existing rental data
const form = useForm({
    user_id: props.rental.user_id,
    car_id: props.rental.car_id,
    car_name: props.rental.car_name,
    car_brand: props.rental.car_brand,
    start_date: props.rental.start_date,
    end_date: props.rental.end_date,
    total_cost: props.rental.total_cost,
    status: props.rental.status || 'ongoing', // Default to 'ongoing' if no status is provided
});

// Watch for changes in car_id to update car_name and car_brand
watch(() => form.car_id, (newCarId) => {
    const selectedCar = props.cars.find(car => car.id === newCarId);
    if (selectedCar) {
        form.car_name = selectedCar.name;
        form.car_brand = selectedCar.brand;
    } else {
        form.car_name = '';
        form.car_brand = '';
    }
});

// Submit function to update rental
function submit() {
    router.put(`/admin/rentals/${props.rental.id}`, form, {
        onSuccess: () => {
            alert('Rental updated successfully!');
        },
        onError: (errors) => {
            console.error(errors);
            alert('There was an error updating the rental.');
        },
    });
}
</script>

<template>
    <Head title="Edit Rental" />
    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Edit Rental</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-5">
                    <h1 class="text-2xl font-bold mb-4">Edit Rental</h1>

                    <form @submit.prevent="submit">
                        <!-- User Selection -->
                        <div class="mb-4">
                            <label for="user_id" class="block">User Name:</label>
                            <select v-model="form.user_id" id="user_id" class="border rounded w-full p-2" required>
                                <option value="">Select user</option>
                                <option v-for="user in props.users" :key="user.id" :value="user.id">{{ user.name }}</option>
                            </select>
                        </div>

                        <!-- Car Selection -->
                        <div class="mb-4">
                            <label for="car_id" class="block">Car:</label>
                            <select v-model="form.car_id" id="car_id" class="border rounded w-full p-2" required>
                                <option value="">Select Car</option>
                                <option v-for="car in props.cars" :key="car.id" :value="car.id">{{ car.name }}</option>
                            </select>
                        </div>

                        <!-- Display Car Name and Brand -->
                        <div class="mb-4">
                            <label for="car_name" class="block">Car Name:</label>
                            <input type="text" v-model="form.car_name" id="car_name" class="border rounded w-full p-2" readonly />
                        </div>

                        <div class="mb-4">
                            <label for="car_brand" class="block">Car Brand:</label>
                            <input type="text" v-model="form.car_brand" id="car_brand" class="border rounded w-full p-2" readonly />
                        </div>

                        <!-- Rental Start Date Field -->
                        <div class="mb-4">
                            <label for="start_date" class="block">Start Date:</label>
                            <input type="date" v-model="form.start_date" id="start_date" class="border rounded w-full p-2" required />
                        </div>

                        <!-- Rental End Date Field -->
                        <div class="mb-4">
                            <label for="end_date" class="block">End Date:</label>
                            <input type="date" v-model="form.end_date" id="end_date" class="border rounded w-full p-2" required />
                        </div>

                        <!-- Total Cost Field -->
                        <div class="mb-4">
                            <label for="total_cost" class="block">Total Cost:</label>
                            <input type="number" v-model="form.total_cost" id="total_cost" class="border rounded w-full p-2" required />
                        </div>

                        <!-- Status Field -->
                        <div class="mb-4">
                            <label for="status" class="block">Status:</label>
                            <select v-model="form.status" id="status" class="border rounded w-full p-2" required>
                                <option value="ongoing">Ongoing</option>
                                <option value="completed">Completed</option>
                                <option value="canceled">Canceled</option>
                            </select>
                        </div>

                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Update Rental</button>
                    </form>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<style scoped>
/* Add your styles here */
</style>
