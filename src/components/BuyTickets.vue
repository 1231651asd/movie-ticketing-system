<template>
    <div class="container">
        <div class="movie">
            <img :src="MovieData.imageUrl" style="width: 232px; height: 300px">
            <p>影院：{{ MovieData.cinema }}</p>
            <p>影厅：{{ MovieData.room }}</p>
            <p>场次：{{ MovieData.time }}</p>
        </div>
        <div class="seat">
            <h1>银幕中央</h1>
            <el-button type="danger" plain class="buy">立即购买</el-button>
            <div class="seats">
                <span v-for="seat in seatData" :key="seat.seatNumber" :class="{ 'selected': seat.selected }"
                    @click="toggleSeatSelection(seat)">
                    <span v-if="seat.selected" class="icon-selected"></span>
                    <span v-else class="icon-normal"></span>
                </span>
            </div>
        </div>
    </div>
</template>

<script>
import '@/assets/BuyTickets.css'

export default {
    data() {
        return {
            MovieData: {
                imageUrl: 'https://p0.pipi.cn/mmdb/54ecde9a2ffc7e21f0ecd8bb48ec78326e683.jpg?imageView2/1/w/464/h/644',
                cinema: '万达影院',
                room: '1',
                time: '2024-3-18 14:00:00'
            },
            seatData: [
                { seatNumber: 1, selected: false },
                { seatNumber: 2, selected: false },
                { seatNumber: 3, selected: false },
                { seatNumber: 4, selected: false },
                { seatNumber: 5, selected: false },
                { seatNumber: 6, selected: false },
                { seatNumber: 7, selected: false },
                { seatNumber: 8, selected: false },
                { seatNumber: 9, selected: false },
                { seatNumber: 10, selected: false },
                { seatNumber: 11, selected: false },
                { seatNumber: 12, selected: false },
                { seatNumber: 13, selected: false },
                { seatNumber: 14, selected: false },
                { seatNumber: 15, selected: false },
                { seatNumber: 16, selected: false },
                { seatNumber: 17, selected: false },
                { seatNumber: 18, selected: false },
                { seatNumber: 19, selected: false },
                { seatNumber: 20, selected: false },
                { seatNumber: 21, selected: false },
                { seatNumber: 22, selected: false },
                { seatNumber: 23, selected: false },
                { seatNumber: 24, selected: false },
                { seatNumber: 25, selected: false },
                { seatNumber: 26, selected: false },
                { seatNumber: 27, selected: false },
                { seatNumber: 28, selected: false },
                { seatNumber: 29, selected: false },
                { seatNumber: 30, selected: false },
                { seatNumber: 31, selected: false },
                { seatNumber: 32, selected: false },
                { seatNumber: 33, selected: false },
                { seatNumber: 34, selected: false },
                { seatNumber: 35, selected: false },
                { seatNumber: 36, selected: false },
                { seatNumber: 37, selected: false },
                { seatNumber: 38, selected: false },
                { seatNumber: 39, selected: false },
                { seatNumber: 40, selected: false },
                { seatNumber: 41, selected: false },
                { seatNumber: 42, selected: false },
                { seatNumber: 43, selected: false },
                { seatNumber: 44, selected: false },
                { seatNumber: 45, selected: false },
                { seatNumber: 46, selected: false },
                { seatNumber: 47, selected: false },
                { seatNumber: 48, selected: false },
                { seatNumber: 49, selected: false },
                { seatNumber: 50, selected: false },
                { seatNumber: 51, selected: false },
                { seatNumber: 52, selected: false },
                { seatNumber: 53, selected: false },
                { seatNumber: 54, selected: false },
                { seatNumber: 55, selected: false },
                { seatNumber: 56, selected: false },
                { seatNumber: 57, selected: false },
                { seatNumber: 58, selected: false },
                { seatNumber: 59, selected: false },
                { seatNumber: 60, selected: false }
            ]
        }
    },
    methods: {
        toggleSeatSelection(seat) {
            seat.selected = !seat.selected;
        }
    }
}

</script>