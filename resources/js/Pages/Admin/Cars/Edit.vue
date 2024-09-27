
    <script setup>

    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head, useForm, router } from '@inertiajs/vue3';
    import { ref } from 'vue';


    const props =  defineProps({
        erro: Object,
        car: Object,
    });


    const car = useForm({
         forceFormData: true,
        id:props.car.id,
        name: props.car.name,
        brand: props.car.brand,
        model: props.car.model,
        year: props.car.year,
        car_type: props.car.car_type,
        daily_rent_price: props.car.daily_rent_price,
        availability: props.car.availability,
        image: props.car.image,
    });

    const handleFileUpload = (event) => {

        const file = event.target.files[0];
        if (file) {
            car.image = event.target.files[0];
            
        }
    };


    function submit(id) {
        // This will alert the car id
        router.put(`/admin/cars/${id}`, car, {
            onSuccess: () => {
                // Optionally handle success here (e.g., redirect, show a message)
                alert("Car updated successfully!");
            },
            onError: (errors) => {
                // Handle errors (e.g., show validation errors)
                console.error(errors);
                alert("There was an error updating the car.");
            },
        });
    }

    </script>


    <template>
        <Head title="Car Management" />

        <AuthenticatedLayout>
            <template #header>
                <div class="flex">
                    <h2 class="font-semibold text-xl text-gray-800 leading-tight">Car Edit</h2>
                </div>
            </template>

            <div class="py-12">
                <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-8">
                        <h1 class="text-2xl font-bold mb-6">Edit Car</h1>
                        <form @submit.prevent="submit(car.id)" enctype="multipart/form-data">
                            <div class="mb-4">
                                <label for="id" class="block">Car id</label>
                                <input
                                    type="text"
                                    id="id"
                                    v-model="car.id"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>
                            <div class="mb-4">
                                <label for="name" class="block">Car Name</label>
                                <input
                                    type="text"
                                    id="name"
                                    v-model="car.name"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>

                            <div class="mb-4">
                                <label for="brand" class="block">Brand</label>
                                <input
                                    type="text"
                                    id="brand"
                                    v-model="car.brand"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>

                            <div class="mb-4">
                                <label for="model" class="block">Model</label>
                                <input
                                    type="text"
                                    id="model"
                                    v-model="car.model"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>

                            <div class="mb-4">
                                <label for="year" class="block">Year</label>
                                <input
                                    type="number"
                                    id="year"
                                    v-model="car.year"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>

                            <div class="mb-4">
                                <label for="car_type" class="block">Car Type</label>
                                <input
                                    type="text"
                                    id="car_type"
                                    v-model="car.car_type"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>

                            <div class="mb-4">
                                <label for="daily_rent_price" class="block">Daily Rent Price</label>
                                <input
                                    type="number"
                                    id="daily_rent_price"
                                    v-model="car.daily_rent_price"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                    required
                                />
                            </div>

                            <div class="mb-4">
                                <label for="availability" class="block">Availability</label>
                                <select id="availability" v-model="car.availability" class="mt-1 block w-full border border-gray-300 rounded-md p-2">
                                    <option value="1">Available</option>
                                    <option value="0">Not Available</option>
                                </select>
                            </div>

                            <div class="mb-4">
                                <label for="image" class="block">Car Image</label>
                                <input
                                    type="file"
                                    id="image"
                                    @change="handleFileUpload"
                                    class="mt-1 block w-full border border-gray-300 rounded-md p-2"
                                />
                            </div>

                            <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">
                                Update Car
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    </template>


    <style scoped>
    /* Add any necessary styles here */
    </style>
