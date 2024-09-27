


<script setup>
import { ref } from 'vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm, router} from '@inertiajs/vue3';

const form = useForm({
  name: '',
  brand: '',
  model: '',
  year: '',
  car_type: '',
  daily_rent_price: '',
  availability: true,
  image: null,
});

const errors = ref({});

const handleFileUpload = (event) => {
  const file = event.target.files[0];
  if (file) {
    form.image = event.target.files[0];
  }
};

const submit = () => {
  router.post('/admin/cars', form, {
    onError: (errorBag) => {
      errors.value = errorBag; // Capture validation errors
    },
    onSuccess: () => {
      // Redirect or perform any action on success
      router.get('/admin/cars'); // Redirect to the cars index page
    },
  });
};
</script>

<template>
    <Head title="Car Managment" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight"> Add Car</h2>
        </template>

        
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-5">
          
                    <h1 class="text-2xl font-bold mb-4">Add New Car</h1>

                    <form @submit.prevent="submit" enctype="multipart/form-data">
                    <div class="mb-4">
                        <label for="name" class="block">Car Name:</label>
                        <input type="text" v-model="form.name" id="name" class="border rounded w-full p-2" required />
                        <span v-if="errors.name" class="text-red-500">{{ errors.name }}</span>
                    </div>

                    <div class="mb-4">
                        <label for="brand" class="block">Brand:</label>
                        <input type="text" v-model="form.brand" id="brand" class="border rounded w-full p-2" required />
                        <span v-if="errors.brand" class="text-red-500">{{ errors.brand }}</span>
                    </div>

                    <div class="mb-4">
                        <label for="model" class="block">Model:</label>
                        <input type="text" v-model="form.model" id="model" class="border rounded w-full p-2" required />
                        <span v-if="errors.model" class="text-red-500">{{ errors.model }}</span>
                    </div>

                    <div class="mb-4">
                        <label for="year" class="block">Year of Manufacture:</label>
                        <input type="number" v-model="form.year" id="year" class="border rounded w-full p-2" required />
                        <span v-if="errors.year" class="text-red-500">{{ errors.year }}</span>
                    </div>

                    <div class="mb-4">
                        <label for="car_type" class="block">Car Type:</label>
                        <input type="text" v-model="form.car_type" id="car_type" class="border rounded w-full p-2" required />
                        <span v-if="errors.car_type" class="text-red-500">{{ errors.car_type }}</span>
                    </div>

                    <div class="mb-4">
                        <label for="daily_rent_price" class="block">Daily Rent Price:</label>
                        <input type="number" v-model="form.daily_rent_price" id="daily_rent_price" class="border rounded w-full p-2" required />
                        <span v-if="errors.daily_rent_price" class="text-red-500">{{ errors.daily_rent_price }}</span>
                    </div>

                    <div class="mb-4">
                        <label for="availability" class="block">Availability:</label>
                        <select v-model="form.availability" id="availability" class="border rounded w-full p-2" required>
                        <option :value="true">Available</option>
                        <option :value="false">Not Available</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="image" class="block">Car Image:</label>
                        <input type="file" @change="handleFileUpload" id="image" class="border rounded w-full p-2" />
                        <span v-if="errors.image" class="text-red-500">{{ errors.image }}</span>
                    </div>

                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Add Car</button>
                    </form>
  
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>







<style scoped>
/* Add your styles here */
</style>
