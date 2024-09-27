<template>
    <Head title="Car Details" />

    <PublicLayout>
        <template #header>
            <div class="">
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">Car Details</h2>
            </div>
        </template>

        <div class="container mx-auto py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white shadow-md rounded-lg p-6">
                    <!-- Back Button -->
                    <Link href="/cars" class="text-blue-500 py-2 px-4 rounded">
                        Back to Cars
                    </Link>

                    <h1 class="text-3xl font-bold mb-6 mt-4">Car Details</h1>

                    <div class="flex">
                        <!-- Car Image -->
                        <div class="mb-4">
                            <img :src="car.image" alt="Car Image" class="w-64 h-auto rounded-md" />
                        </div>

                        <div class="ps-5">
                            <!-- Car Information -->
                            <div class="mb-2">
                                <h2 class="text-xl font-semibold">Car Name: {{ car.name }}</h2>
                            </div>
                            <div class="mb-2">
                                <h3 class="text-lg">Brand: {{ car.brand }}</h3>
                            </div>
                            <div class="mb-2">
                                <h3 class="text-lg">Model: {{ car.model }}</h3>
                            </div>
                            <div class="mb-2">
                                <h3 class="text-lg">Year: {{ car.year }}</h3>
                            </div>
                            <div class="mb-2">
                                <h3 class="text-lg">Type: {{ car.car_type }}</h3>
                            </div>
                            <div class="mb-2">
                                <h3 class="text-lg">Daily Rent Price: {{ car.daily_rent_price }}</h3>
                            </div>

                            <!-- Availability -->
                            <div class="mb-2">
                                <h3 class="text-lg">
                                    Availability:
                                    <span v-if="car.availability" class="text-green-500">Available</span>
                                    <span v-else class="text-red-500">Not Available</span>
                                </h3>
                            </div>
                        </div>
                        <div class="ps-5 ms-5">
                              <!-- Booking Form -->
                            <div v-if="car.availability && $page.props.auth.user" >
                                <div class="mb-2">
                                    <h2 class="text-xl font-semibold">Select Booking Date</h2>
                                </div>
                                <form @submit.prevent="bookCar">
                                    <div class="mb-4">
                                        <label for="start_date" class="block text-sm font-medium text-gray-700">Start Date</label>
                                        <input type="date" v-model="form.start_date" id="start_date" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required>
                                    </div>

                                    <div class="mb-4">
                                        <label for="end_date" class="block text-sm font-medium text-gray-700">End Date</label>
                                        <input type="date" v-model="form.end_date" id="end_date" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required>
                                    </div>

                                    <div v-if="!auth.user">
                                        <Link href="/login" class="bg-blue-500 text-white py-2 px-4 rounded">Login to Book</Link>
                                    </div>

                                    <div v-else>
                                        <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">Book Now</button>
                                    </div>
                                </form>

                                    <div v-if="daysSelected !== null" class="mb-4 p-3">
                                        <p class="text-lg font-semibold">Total Days: {{ daysSelected }} and Total Cost Will Be: {{ car.daily_rent_price * daysSelected }}</p>
                                    </div>

                            </div>
                            <div v-else>
                                <a :href="route('login')" class="bg-blue-500 text-white py-2 px-4 rounded">Login For Booking</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </PublicLayout>
</template>

<script setup>
import PublicLayout from '@/Layouts/PublicLayout.vue';
import { Head, Link, usePage, router } from '@inertiajs/vue3';
import { ref, watch } from 'vue';

const props = defineProps({
  car: Object,
});

const { car } = props;

// Form data
const form = ref({
  start_date: '',
  end_date: ''
});

// Get the authenticated user from Inertia's page data
const { auth } = usePage().props;


// Calculated total days between start and end date
const daysSelected = ref(null);

watch([() => form.value.start_date, () => form.value.end_date], () => {
  calculateDays();
});


const calculateDays = () => {
  const startDate = new Date(form.value.start_date);
  const endDate = new Date(form.value.end_date);

  if (!isNaN(startDate.getTime()) && !isNaN(endDate.getTime())) {
    const timeDiff = endDate.getTime() - startDate.getTime(); // Difference in milliseconds
    const dayDiff = timeDiff / (1000 * 3600 * 24); // Convert milliseconds to days

    // Set the calculated days only if endDate is greater than startDate
    daysSelected.value = dayDiff >= 0 ? dayDiff + 1 : null;
  } else {
    daysSelected.value = null;
  }
};


// Book the car by sending a POST request
const bookCar = () => {
    console.log(form.value);

  router.post(`/cars/${car.id}/book`, form.value, {
    onSuccess: () => {
      alert('Booking successful!');
    },
    onError: () => {
      alert('Booking failed. Please try again.');
    }
  });
};
</script>

<style scoped>
/* Add any custom styles here */
</style>
