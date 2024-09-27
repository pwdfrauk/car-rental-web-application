<script setup>
import { ref } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';

// Define props to receive rental data, including associated users and cars
const props = defineProps({
    rentals: Array,
});

// Deleting a rental
function deleteRental(rentalId) {
    if (confirm('Are you sure you want to delete this rental?')) {
        // Perform delete operation (you may need to adjust the route based on your setup)
        router.delete(`/admin/rentals/${rentalId}`, {
            onSuccess: () => {
                alert('Rental deleted successfully.');
            },
            onError: (errors) => {
                console.error(errors);
                alert('There was an error deleting the rental.');
            },
        });
    }
}
</script>

<template>
    <Head title="Rental List" />
    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Rental Management</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
             <Link :href="route('rentals.create')" class="mb-4 inline-block bg-green-500 text-white px-4 py-2 rounded">Add Rental</Link>
            
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-5">
                    <h1 class="text-2xl font-bold mb-4">Rental List</h1>

                    <table class="min-w-full bg-white">
                        <thead>
                            <tr>
                                <th class="py-2 px-4 border-b">Rental ID</th>
                                <th class="py-2 px-4 border-b">User</th>
                                <th class="py-2 px-4 border-b">Car</th>
                                <th class="py-2 px-4 border-b">Start Date</th>
                                <th class="py-2 px-4 border-b">End Date</th>
                                <th class="py-2 px-4 border-b">Total Cost</th>
                                <th class="py-2 px-4 border-b">Status</th>
                                <th class="py-2 px-4 border-b">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="rental in props.rentals" :key="rental.id">
                                <td class="py-2 px-4 border-b">{{ rental.id }}</td>
                                <td class="py-2 px-4 border-b">{{ rental.user.name }}</td>
                                <td class="py-2 px-4 border-b">{{ rental.car.name }}</td>
                                <td class="py-2 px-4 border-b">{{ rental.start_date }}</td>
                                <td class="py-2 px-4 border-b">{{ rental.end_date }}</td>
                                <td class="py-2 px-4 border-b">{{ rental.total_cost }}</td>
                                <td class="py-2 px-4 border-b">
                                    <span :class="{
                                        'bg-green-500 text-white px-2 py-1 rounded': rental.status === 'ongoing',
                                        'bg-blue-500 text-white px-2 py-1 rounded': rental.status === 'completed',
                                        'bg-red-500 text-white px-2 py-1 rounded': rental.status === 'canceled',
                                    }">
                                        {{ rental.status }}
                                    </span>
                                </td>
                                <td class="py-2 px-4 border-b">
                                    <!-- View or Edit Rental -->
                                    <Link :href="`/admin/rentals/${rental.id}/edit`" class="bg-yellow-500 text-white px-2 py-1 rounded mr-2">Edit</Link>
                                    <!-- Delete Rental -->
                                    <button @click="deleteRental(rental.id)" class="bg-red-500 text-white px-2 py-1 rounded">Delete</button>
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
