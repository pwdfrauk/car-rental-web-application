
<script setup>
import PublicLayout from '@/Layouts/PublicLayout.vue';
import { Head, router } from '@inertiajs/vue3';


import { defineProps } from 'vue';

const props = defineProps({
  cars: Array,
});



const showCar = (id) => {
  router.get(`/cars/${id}`);
};

</script>

<template>
    <Head title="Home" />

    <PublicLayout>
        <template #header>
            <div class=""><h2 class="font-semibold text-xl text-gray-800 leading-tight">Browsing Car</h2></div>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <h1 class="text-2xl p-4 font-bold">Available Cars</h1>
                    <div class="flex ">
                        <div v-for="car in cars" :key="car.id" class="card w-50 m-3 p-3">
                            <div>
                                 <img :src="car.image" alt="Car Image">
                            </div>
                                <h5>Name: {{ car.name }}</h5>
                                <p>Brand: {{ car.brand }}</p>
                                <p>Per Day: {{ car.daily_rent_price }}Tk.</p>
                               <div class="text-center mt-2">
                                 <a @click ="showCar(car.id)" class="bg-blue-500 text-white px-2 py-1 rounded me-2">View</a>
                               </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </PublicLayout>
</template>


<style scoped>
.card { 
    width:200px;
  
    border:1px solid #ddd;
    margin:15px;
}

/* Add your styles here */
</style>

