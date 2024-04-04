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
            <el-button type="danger" plain class="buy" @click="BuyTickers">立即购买</el-button>
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
import { ElMessage } from 'element-plus';

export default {
    data() {
        return {
            imageUrl: '',
            MovieData: {},
            seatData: [
                { seatNumber: 1, seatRow: 1, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 2, seatRow: 1, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 3, seatRow: 1, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 4, seatRow: 1, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 5, seatRow: 1, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 6, seatRow: 1, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 7, seatRow: 1, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 8, seatRow: 1, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 9, seatRow: 1, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 10, seatRow: 1, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 11, seatRow: 1, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 12, seatRow: 1, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 13, seatRow: 2, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 14, seatRow: 2, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 15, seatRow: 2, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 16, seatRow: 2, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 17, seatRow: 2, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 18, seatRow: 2, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 19, seatRow: 2, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 20, seatRow: 2, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 21, seatRow: 2, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 22, seatRow: 2, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 23, seatRow: 2, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 24, seatRow: 2, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 25, seatRow: 3, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 26, seatRow: 3, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 27, seatRow: 3, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 28, seatRow: 3, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 29, seatRow: 3, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 30, seatRow: 3, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 31, seatRow: 3, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 32, seatRow: 3, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 33, seatRow: 3, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 34, seatRow: 3, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 35, seatRow: 3, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 36, seatRow: 3, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 37, seatRow: 4, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 38, seatRow: 4, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 39, seatRow: 4, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 40, seatRow: 4, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 41, seatRow: 4, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 42, seatRow: 4, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 43, seatRow: 4, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 44, seatRow: 4, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 45, seatRow: 4, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 46, seatRow: 4, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 47, seatRow: 4, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 48, seatRow: 4, seatCol: 12, selected: false, disabled: false },
                { seatNumber: 49, seatRow: 5, seatCol: 1, selected: false, disabled: false },
                { seatNumber: 50, seatRow: 5, seatCol: 2, selected: false, disabled: false },
                { seatNumber: 51, seatRow: 5, seatCol: 3, selected: false, disabled: false },
                { seatNumber: 52, seatRow: 5, seatCol: 4, selected: false, disabled: false },
                { seatNumber: 53, seatRow: 5, seatCol: 5, selected: false, disabled: false },
                { seatNumber: 54, seatRow: 5, seatCol: 6, selected: false, disabled: false },
                { seatNumber: 55, seatRow: 5, seatCol: 7, selected: false, disabled: false },
                { seatNumber: 56, seatRow: 5, seatCol: 8, selected: false, disabled: false },
                { seatNumber: 57, seatRow: 5, seatCol: 9, selected: false, disabled: false },
                { seatNumber: 58, seatRow: 5, seatCol: 10, selected: false, disabled: false },
                { seatNumber: 59, seatRow: 5, seatCol: 11, selected: false, disabled: false },
                { seatNumber: 60, seatRow: 5, seatCol: 12, selected: false, disabled: false }
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
                        seatRow: seat.seatRow,
                        seatCol: seat.seatCol,
                        userId: localStorage.getItem('userID'),
                        screenId: localStorage.getItem('screenId')
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
            }
        },
        BuyTickers() {
            if (this.ShoppingCart.length === 0) {
                ElMessage.error('请选择座位');
            } else {
                for (let i = 0; i < this.ShoppingCart.length; ++i) {
                    axios({
                        method: 'post',
                        url: 'http://localhost:8080/admin/user/order/addOrder',
                        data: {
                            seatRow: this.ShoppingCart[i].seatRow,
                            seatColumn: this.ShoppingCart[i].seatCol,
                            userId: this.ShoppingCart[i].userId,
                            screenId: this.ShoppingCart[i].screenId
                        }
                    }).then((res) => {
                        localStorage.removeItem('movieId')
                        localStorage.removeItem('cinemaId')
                        localStorage.removeItem('screenId')
                    }).catch((error) => {
                        console.error(error)
                    })
                }
                ElMessage({
                    type: 'success',
                    message: '购买成功',
                });
                setTimeout(() => {
                    this.$router.push('/Home')
                }, 1000);
            }


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
            for (var t in seatData) {
                for (var i in seatData[t]) {
                    for (let j = 0; j < this.seatData.length; ++j) {
                        if (this.seatData[j].seatRow === parseInt(i) && this.seatData[j].seatCol === parseInt(seatData[t][i])) {
                            this.seatData[j].selected = true
                            this.seatData[j].disabled = true
                        }
                    }
                }
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