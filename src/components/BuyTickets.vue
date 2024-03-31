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
            <el-button type="danger" plain class="buy" @click="GoHome">立即购买</el-button>
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
import axios from 'axios';
import { useCounterStore } from '../stores/counter'

export default {
    data() {
        return {
            MovieData: {},
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
        },
        GoHome() {
            this.$router.push('/Home')
        }
    },
    mounted() {
        const useStore = useCounterStore()

        const posterUrl = this.$route.query.posterUrl
        this.MovieData.imageUrl = posterUrl
        axios({
            method: 'get',
            url: `http://localhost:8080/admin/user/screen/list/${useStore.movieId}/${useStore.cinemaId}`
        }).then((res) => {
            let screenData = res.data.data
            console.log(screenData.cinemaId)
        })
    }
}

</script>

<style scoped>
body {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    background-color: #3C305A;
}

.container {
    position: relative;
    width: 90%;
    height: 650px;
    background-color: white;
    margin: 0 auto;
    margin-top: 30px;
}


.movie {
    position: absolute;
    width: 232px;
    height: 500px;
    margin-top: 80px;
    margin-left: 50px;
}

.movie p {
    margin-top: 20px;
    margin-left: 15px;
    font-size: 17px;
    font-weight: 700;
    color: blue;
}

.seat h1 {
    position: absolute;
    right: 35%;
    top: 5%;
    color: gray;
}

.seat .buy {
    position: absolute;
    right: 50%;
    bottom: 5%;
}

.seats {
    position: absolute;
    display: flex;
    flex-wrap: wrap;
    top: 20%;
    left: 25%;
}

.seats span {
    width: 50px;
    height: 50px;
    margin: 0 15px;
    margin-top: 20px;
    cursor: pointer;
    display: inline-block;
    background-size: cover;
}

.icon-selected {
    background-image: url('/yes.png');
}

.icon-normal {
    background-image: url('/no.png');
}
</style>