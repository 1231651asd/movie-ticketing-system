<template>
    <div class="container">
        <div class="cinema" v-for="(item, index) in CinemaData" :key="index" @click="GoMovieHome(item.cinemaId)">
            <img :src="item.cinemaUrl" style="width: 300px; height: 300px">
            <h2>{{ item.cinemaName }}</h2>
            <p class="address">地址：{{ item.cinemaAddress }}</p>
            <p class="phone">电话：{{ item.cinemaPhone }}</p>
            <p class="service">{{ item.cinemaServices }}</p>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    data() {
        return {
            CinemaData: [],
            movieId: '',
        }
    },
    methods: {
        GoMovieHome(cinemaId) {
            axios({
                method: 'get',
                url: `http://localhost:8080/admin/user/screen/list/${this.movieId}/${cinemaId}`,
                params: {
                    movieId: this.movieId,
                    cinemaId: cinemaId
                }
            }).then((res) => {
                let ChooseTimeData = res.data.data
                let ChooseTimeDataArr = []
                for (let i = 0; i < ChooseTimeData.length; ++i) {
                    ChooseTimeDataArr.push(ChooseTimeData[i])
                }
                this.$router.push({ path: '/ChooseTime', query: { ChooseTimeDataArr: JSON.stringify(ChooseTimeDataArr) } })
            })
        }
    },
    mounted() {
        const cinemaIdArrString = this.$route.query.cinemaIdArr;
        this.movieId = this.$route.query.movieId;
        const cinemaIdArr = []
        for (let i = 0; i < cinemaIdArrString.length; ++i) {
            cinemaIdArr.push(Number(cinemaIdArrString[i]))
        }
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/cinema/list/' + this.movieId,
            params: {
                movieId: this.movieId,
            }
        }).then((res) => {
            let cinemaData = res.data.data
            for (let i = 0; i < cinemaData.length; ++i) {
                this.CinemaData.push({
                    cinemaId: cinemaData[i].cinemaId,
                    cinemaUrl: cinemaData[i].cinemaImageUrl,
                    cinemaName: cinemaData[i].cinemaName,
                    cinemaAddress: cinemaData[i].cinemaAddress,
                    cinemaPhone: cinemaData[i].hotlinePhone,
                    cinemaServices: cinemaData[i].cinemaServices
                })
            }
        })
    }
}
</script>


<style scoped>
body {
    background-color: #EFF3F5;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    height: 93vh;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    margin-top: 50px;
    flex-wrap: wrap;
}

.cinema {
    display: flex;
    position: relative;
    width: 100%;
    height: 300px;
    background-color: #d5c4c8;
    margin-bottom: 20px;
    cursor: pointer;
    transition: transform 0.3s;
}

.cinema:hover {
    transform: scale(1.05);
}

.cinema h2 {
    position: absolute;
    top: 5%;
    left: 50%;
    transform: translateX(-50%);
}

.address {
    position: absolute;
    top: 30%;
    left: 50%;
    transform: translateX(-50%);
    font-size: 20px;
}

.phone {
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 20px;
    transform: translateX(-50%);
}

.service {
    position: absolute;
    top: 70%;
    left: 50%;
    font-size: 20px;
    transform: translateX(-50%);
}
</style>