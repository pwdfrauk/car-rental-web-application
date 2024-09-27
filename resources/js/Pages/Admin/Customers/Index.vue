<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Link, Head, router } from '@inertiajs/vue3';
import { defineProps } from 'vue';

const props = defineProps({
  customers: Array,
});

const editcustomer = (id) => {
  router.get(`/admin/customers/${id}/edit`);
};

const deleteCustomer = (id) => {
  if (confirm('Are you sure you want to delete this customer?')) {
    router.delete(`/admin/customers/${id}`, {
      onSuccess: () => {
        alert("Customer deleted successfully!");
      },
      onError: (errors) => {
        console.error(errors);
        alert("There was an error deleting the customer.");
      },
    });
  }
};
</script>

<template>
  <Head title="Customer Management" />

  <AuthenticatedLayout>
    <template #header>
      <div class="flex">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Customer List</h2>
      </div>
    </template>

    <div class="py-12">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

        <Link :href="route('customers.create')" class="mb-4 inline-block bg-green-500 text-white px-4 py-2 rounded">Add Customer</Link>

        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
          <table class="min-w-full border border-gray-300">
            <thead>
              <tr class="bg-gray-200">
                <th class="border px-4 py-2">Name</th>
                <th class="border px-4 py-2">Email</th>
                <th class="border px-4 py-2">Mobile No</th>
                <th class="border px-4 py-2">Address</th>
                <th class="border px-4 py-2">Rental History</th>
                <th class="border px-4 py-2">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="customer in customers" :key="customer.id">
                <td class="border px-4 py-2">{{ customer.name }}</td>
                <td class="border px-4 py-2">{{ customer.email }}</td>
                <td class="border px-4 py-2">{{ customer.mobile_no || 'N/A' }}</td>
                <td class="border px-4 py-2">{{ customer.address || 'N/A' }}</td>
                <td class="border px-4 py-2">
                  <span v-if="customer.rental_history && customer.rental_history.length">View History</span>
                  <span v-else>No History</span>
                </td>
                <td class="border px-4 py-2 text-end" style="text-align:right;">
                  <button @click="editcustomer(customer.id)" class="bg-blue-500 text-white px-2 py-1 rounded me-2">Edit</button>
                  <button @click="deleteCustomer(customer.id)" class="bg-red-500 text-white px-2 py-1 rounded">Delete</button>
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
