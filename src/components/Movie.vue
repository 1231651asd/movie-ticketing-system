<template>
    <div class="container">
        <div class="header">
            <img :src="MovieData.posterUrl" style="width: 232px; height: 300px">
            <div class="movie-info">
                <h3>{{ MovieData.movieName }}</h3>
                <p class="type">{{ MovieData.movieType }}</p>
                <p class="release-time">{{ MovieData.releaseDate }}&nbsp;&nbsp;{{ MovieData.address }}上映</p>
                <el-button type="danger" round @click="GoBuyTickets">特惠购票</el-button>
            </div>
        </div>
        <div class="main">
            <div class="introduce">
                <h2>剧情介绍：</h2>
                <p>{{ MovieData.synopsis }}</p>
                <div class="performer">
                    <h2>演员：</h2>
                    <p>{{ MovieData.actors }}</p>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';
export default {
    data() {
        return {
            MovieData: {}
        }
    },
    methods: {
        GoBuyTickets() {
            this.$router.push({ path: '/BuyTickets', query: { posterUrl: this.MovieData.posterUrl } })
        }
    },
    mounted() {
        const movieId = localStorage.getItem('movieId')

        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/movie/getById/' + movieId,
            params: {
                movieId: movieId
            }
        }).then((res) => {
            this.MovieData = res.data.data
        })
    }

}
</script>

<style scoped>
.container {
    background-color: #dfdbe7;
    height: 100vh;
    width: 100%;
    position: fixed;
}



.header {
    display: flex;
    width: 90%;
    height: 300px;
    margin: 0 auto;
    margin-top: 30px;
    background-color: #a6a9ad;
}

.header img {
    margin-left: 20px;
}

.header .movie-info {
    display: flex;
    flex-direction: column;
    margin-top: 30px;
    margin-left: 50px;
}

.header h3 {
    font-size: 50px;
    margin: 0 auto;
}

.header .type {
    margin-top: 10px;
    font-size: 20px;
    font-weight: 700;
}

.header .release-time {
    font-size: 20px;
    font-weight: 700;
}

.main {
    display: flex;
    width: 90%;
    height: 300px;
    margin: 0 auto;
    margin-top: 30px;
    background-color: white;
}

.introduce h2 {
    margin-left: 20px;
}

.introduce p {
    margin: 0 20px;
    font-size: 20px;
}
</style>