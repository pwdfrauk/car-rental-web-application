<script setup>
import { ref } from 'vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm, router } from '@inertiajs/vue3';

const form = useForm({
  name: '',
  email: '',
  password: '',
  password_confirmation: '',
  mobile_no: '', // Added this field
  address: '', // Added this field
 
});

// Submit form function
function submit() {
 

  router.post(`/admin/customers/`, form, {
    onSuccess: () => {
      alert('Customer Added successfully!');
    },
    onError: (errors) => {
      console.error(errors);
      alert('There was an error Adding the Customer.');
    },
  });
}
</script>

<template>
    <Head title="Customer Management" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight"> Add Customer</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-5">
                    <h1 class="text-2xl font-bold mb-4">Add New Customer</h1>

                    <form @submit.prevent="submit" enctype="multipart/form-data">
                        <!-- Name Field -->
                        <div class="mb-4">
                            <label for="name" class="block">Customer Name:</label>
                            <input type="text" v-model="form.name" id="name" class="border rounded w-full p-2" required />
                            <span v-if="form.errors.name" class="text-red-500">{{ form.errors.name }}</span>
                        </div>

                        <!-- Email Field -->
                        <div class="mb-4">
                            <label for="email" class="block">Email:</label>
                            <input type="email" v-model="form.email" id="email" class="border rounded w-full p-2" required />
                            <span v-if="form.errors.email" class="text-red-500">{{ form.errors.email }}</span>
                        </div>

                        <!-- Password Field -->
                        <div class="mb-4">
                            <label for="password" class="block">Password:</label>
                            <input type="password" v-model="form.password" id="password" class="border rounded w-full p-2" required />
                            <span v-if="form.errors.password" class="text-red-500">{{ form.errors.password }}</span>
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="mb-4">
                            <label for="password_confirmation" class="block">Retype Password:</label>
                            <input type="password" v-model="form.password_confirmation" id="password_confirmation" class="border rounded w-full p-2" required />
                            <span v-if="form.errors.password_confirmation" class="text-red-500">{{ form.errors.password_confirmation }}</span>
                        </div>

                        <!-- Mobile Number Field (Optional) -->
                        <div class="mb-4">
                            <label for="mobile_no" class="block">Mobile Number:</label>
                            <input type="text" v-model="form.mobile_no" id="mobile_no" class="border rounded w-full p-2" />
                            <span v-if="form.errors.mobile_no" class="text-red-500">{{ form.errors.mobile_no }}</span>
                        </div>

                        <!-- Address Field (Optional) -->
                        <div class="mb-4">
                            <label for="address" class="block">Address:</label>
                            <input type="text" v-model="form.address" id="address" class="border rounded w-full p-2" />
                            <span v-if="form.errors.address" class="text-red-500">{{ form.errors.address }}</span>
                        </div>

                        <!-- Rental History Field (Optional) -->
                       <!-- <div class="mb-4">
                            <label for="rental_history" class="block">Rental History:</label>
                            <textarea v-model="form.rental_history" id="rental_history" class="border rounded w-full p-2" placeholder='[{"property_id": 1, "rented_from": "2024-01-01"}, {"property_id": 2, "rented_from": "2024-02-01"}]'></textarea>
                            <span v-if="form.errors.rental_history" class="text-red-500">{{ form.errors.rental_history }}</span>
                        </div>-->

                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Add Customer</button>
                    </form>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<style scoped>
/* Add your styles here */
</style>
