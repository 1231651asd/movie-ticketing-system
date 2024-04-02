<template>
    <div class="container">
        <div class="movie">
            <img :src="imageUrl" style="width: 232px; height: 300px">
            <p>影院：{{ MovieData.cinemaName }}</p>
            <p>影厅：{{ MovieData.screenName }}</p>
            <p>场次：{{ MovieData.showDate }}&nbsp;&nbsp;{{ MovieData.startTime }}</p>
        </div>
        <div class="seat">
            <h1>银幕中央</h1>
            <el-button type="danger" plain class="buy" @click="GoHome">立即购买</el-button>
            <div class="seats">
                <span v-for="seat in seatData" :key="seat.seatNumber" :class="{ 'selected': seat.selected }"
                    :style="{ cursor: seat.disabled ? 'not-allowed' : 'pointer' }" @click="toggleSeatSelection(seat)">
                    <span v-if="seat.selected" class="icon-selected"></span>
                    <span v-else class="icon-normal"></span>
                </span>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            imageUrl: '',
            MovieData: {},
            seatData: [
                { seatNumber: 1, selected: false, disabled: true },
                { seatNumber: 2, selected: false, disabled: false },
                { seatNumber: 3, selected: false, disabled: false },
                { seatNumber: 4, selected: false, disabled: false },
                { seatNumber: 5, selected: false, disabled: false },
                { seatNumber: 6, selected: false, disabled: false },
                { seatNumber: 7, selected: false, disabled: false },
                { seatNumber: 8, selected: false, disabled: false },
                { seatNumber: 9, selected: false, disabled: false },
                { seatNumber: 10, selected: false, disabled: false },
                { seatNumber: 11, selected: false, disabled: false },
                { seatNumber: 12, selected: false, disabled: false },
                { seatNumber: 13, selected: false, disabled: false },
                { seatNumber: 14, selected: false, disabled: false },
                { seatNumber: 15, selected: false, disabled: false },
                { seatNumber: 16, selected: false, disabled: false },
                { seatNumber: 17, selected: false, disabled: false },
                { seatNumber: 18, selected: false, disabled: false },
                { seatNumber: 19, selected: false, disabled: false },
                { seatNumber: 20, selected: false, disabled: false },
                { seatNumber: 21, selected: false, disabled: false },
                { seatNumber: 22, selected: false, disabled: false },
                { seatNumber: 23, selected: false, disabled: false },
                { seatNumber: 24, selected: false, disabled: false },
                { seatNumber: 25, selected: false, disabled: false },
                { seatNumber: 26, selected: false, disabled: false },
                { seatNumber: 27, selected: false, disabled: false },
                { seatNumber: 28, selected: false, disabled: false },
                { seatNumber: 29, selected: false, disabled: false },
                { seatNumber: 30, selected: false, disabled: false },
                { seatNumber: 31, selected: false, disabled: false },
                { seatNumber: 32, selected: false, disabled: false },
                { seatNumber: 33, selected: false, disabled: false },
                { seatNumber: 34, selected: false, disabled: false },
                { seatNumber: 35, selected: false, disabled: false },
                { seatNumber: 36, selected: false, disabled: false },
                { seatNumber: 37, selected: false, disabled: false },
                { seatNumber: 38, selected: false, disabled: false },
                { seatNumber: 39, selected: false, disabled: false },
                { seatNumber: 40, selected: false, disabled: false },
                { seatNumber: 41, selected: false, disabled: false },
                { seatNumber: 42, selected: false, disabled: false },
                { seatNumber: 43, selected: false, disabled: false },
                { seatNumber: 44, selected: false, disabled: false },
                { seatNumber: 45, selected: false, disabled: false },
                { seatNumber: 46, selected: false, disabled: false },
                { seatNumber: 47, selected: false, disabled: false },
                { seatNumber: 48, selected: false, disabled: false },
                { seatNumber: 49, selected: false, disabled: false },
                { seatNumber: 50, selected: false, disabled: false },
                { seatNumber: 51, selected: false, disabled: false },
                { seatNumber: 52, selected: false, disabled: false },
                { seatNumber: 53, selected: false, disabled: false },
                { seatNumber: 54, selected: false, disabled: false },
                { seatNumber: 55, selected: false, disabled: false },
                { seatNumber: 56, selected: false, disabled: false },
                { seatNumber: 57, selected: false, disabled: false },
                { seatNumber: 58, selected: false, disabled: false },
                { seatNumber: 59, selected: false, disabled: false },
                { seatNumber: 60, selected: false, disabled: false }
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
        const screenId = localStorage.getItem('screenId')
        const posterUrl = this.$route.query.posterUrl
        this.imageUrl = posterUrl
        axios({
            method: 'get',
            url: `http://localhost:8080/admin/user/screen/list/${screenId}`
        }).then((res) => {
            let screenData = res.data.data
            this.MovieData = screenData
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
    background-color: #DFDBE7;
    margin: 0 auto;
    margin-top: 30px;
}


.movie {
    position: absolute;
    width: 260px;
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