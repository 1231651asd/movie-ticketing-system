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
                    @click="toggleSeatSelection(seat)">
                    <span v-if="seat.selected" class="icon-selected"
                        :style="{ cursor: seat.disabled ? 'not-allowed' : 'pointer' }"></span>
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
                { seatNumber: 1, seatName: '1排1座', seatRow: 1, seatCol: 1, selected: true, disabled: true },
                { seatNumber: 2, seatName: '1排2座', seatRow: 1, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 3, seatName: '1排3座', seatRow: 1, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 4, seatName: '1排4座', seatRow: 1, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 5, seatName: '1排5座', seatRow: 1, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 6, seatName: '1排6座', seatRow: 1, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 7, seatName: '1排7座', seatRow: 1, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 8, seatName: '1排8座', seatRow: 1, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 9, seatName: '1排9座', seatRow: 1, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 10, seatName: '1排10座', seatRow: 1, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 11, seatName: '1排11座', seatRow: 1, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 12, seatName: '1排12座', seatRow: 1, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 13, seatName: '2排1座', seatRow: 2, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 14, seatName: '2排2座', seatRow: 2, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 15, seatName: '2排3座', seatRow: 2, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 16, seatName: '2排4座', seatRow: 2, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 17, seatName: '2排5座', seatRow: 2, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 18, seatName: '2排6座', seatRow: 2, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 19, seatName: '2排7座', seatRow: 2, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 20, seatName: '2排8座', seatRow: 2, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 21, seatName: '2排9座', seatRow: 2, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 22, seatName: '2排10座', seatRow: 2, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 23, seatName: '2排11座', seatRow: 2, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 24, seatName: '2排12座', seatRow: 2, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 25, seatName: '3排1座', seatRow: 3, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 26, seatName: '3排2座', seatRow: 3, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 27, seatName: '3排3座', seatRow: 3, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 28, seatName: '3排4座', seatRow: 3, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 29, seatName: '3排5座', seatRow: 3, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 30, seatName: '3排6座', seatRow: 3, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 31, seatName: '3排7座', seatRow: 3, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 32, seatName: '3排8座', seatRow: 3, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 33, seatName: '3排9座', seatRow: 3, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 34, seatName: '3排10座', seatRow: 3, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 35, seatName: '3排11座', seatRow: 3, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 36, seatName: '3排12座', seatRow: 3, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 37, seatName: '4排1座', seatRow: 4, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 38, seatName: '4排2座', seatRow: 4, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 39, seatName: '4排3座', seatRow: 4, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 40, seatName: '4排4座', seatRow: 4, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 41, seatName: '4排5座', seatRow: 4, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 42, seatName: '4排6座', seatRow: 4, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 43, seatName: '4排7座', seatRow: 4, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 44, seatName: '4排8座', seatRow: 4, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 45, seatName: '4排9座', seatRow: 4, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 46, seatName: '4排10座', seatRow: 4, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 47, seatName: '4排11座', seatRow: 4, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 48, seatName: '4排12座', seatRow: 4, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 49, seatName: '5排1座', seatRow: 5, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 50, seatName: '5排2座', seatRow: 5, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 51, seatName: '5排3座', seatRow: 5, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 52, seatName: '5排4座', seatRow: 5, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 53, seatName: '5排5座', seatRow: 5, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 54, seatName: '5排6座', seatRow: 5, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 55, seatName: '5排7座', seatRow: 5, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 56, seatName: '5排8座', seatRow: 5, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 57, seatName: '5排9座', seatRow: 5, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 58, seatName: '5排10座', seatRow: 5, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 59, seatName: '5排11座', seatRow: 5, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 60, seatName: '5排12座', seatRow: 5, seatCol: 12, selected: false, disabled: false }
            ],
            ShoppingCart: []
        }
    },
    methods: {
        toggleSeatSelection(seat) {
            if (!seat.disabled) {
                if (seat.selected === false) {
                    this.ShoppingCart.push({
                        seatId: seat.seatNumber,
                        seatName: seat.seatName,
                        seatRow: seat.seatRow,
                        seatCol: seat.seatCol,
                        userId: localStorage.getItem('userID')
                    });
                } else {
                    // 取消选择时，从购物车中删除相应的座位对象
                    const index = this.ShoppingCart.findIndex(item => item.seatId === seat.seatNumber);
                    if (index !== -1) {
                        this.ShoppingCart.splice(index, 1);
                    }
                }
                // 切换座位的选中状态
                seat.selected = !seat.selected;
                console.log(this.ShoppingCart)
            }
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
            this.MovieData = res.data.data
            let seatData = res.data.data.seats
            console.log(this.MovieData)
            for (let i = 0; i < seatData.length; ++i) {
                console.log(seatData[i])
            }
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