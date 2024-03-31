<template>
    <div class="container">
        <el-backtop :right="30" :bottom="100" />
        <div class="header">
            <div class="user">您好，<span @click="GoUserInfo">{{ UserInfo.name }}</span></div>
            <div class="loginOut" @click="loginOut">退出登录</div>
        </div>
        <el-carousel :interval="3000" type="card" height="200px">
            <el-carousel-item v-for="(item, index) in ImageData" :key="index">
                <img :src="item" alt="carousel-image">
            </el-carousel-item>
        </el-carousel>
        <div class="hot">
            <div class="hot-title">
                <h3>正在热映</h3>
            </div>
        </div>
        <div class="movie-container">
            <div class="movie" v-for="(item, index) in movieData" :key="index" @click="goToCiname(item.movieId)">
                <div class="movie-image">
                    <el-image style="width: 300px; height: 300px" :src="item.imageUrl" />
                </div>
                <div class="movie-title">
                    {{ item.title }}
                </div>
            </div>
        </div>
    </div>


</template>

<script>
import axios from 'axios';
import { ElMessage } from 'element-plus'

export default {
    data() {
        return {
            ImageData: ['/1.jpg', '/2.jpg', '/3.jpg', '/4.jpg', '/5.jpg', '/6.jpg'],
            movieData: [],
            UserInfo: {
                name: 'Tom'
            }
        }
    },
    methods: {
        goToCiname(movieId) {
            axios({
                method: 'get',
                url: 'http://localhost:8080/admin/user/cinema/list/' + movieId,
                params: {
                    movieId: movieId
                }
            }).then((res) => {
                let CinemaData = res.data.data
                let cinemaIdArr = []
                for (let i = 0; i < CinemaData.length; ++i) {
                    cinemaIdArr.push(CinemaData[i].cinemaId)
                }
                localStorage.setItem('movieId', movieId)
                this.$router.push({ path: '/Cinema', query: { cinemaIdArr: cinemaIdArr } })
            }).catch((err) => {
                console.error(err)
            })
        },
        loginOut() {
            localStorage.clear()
            this.$router.push('/')
            ElMessage({
                message: '退出成功',
                type: 'success',
            })
        },
        GoUserInfo() {
            this.$router.push('/UserInfo')
        }
    },
    mounted() {
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/movie/list/3'
        }).then((res) => {
            let Data = res.data.data
            for (let i = 0; i < Data.length; ++i) {
                this.movieData.push({
                    movieId: Data[i].movieId,
                    imageUrl: Data[i].posterUrl,
                    title: Data[i].movieName
                });
            }
        }).catch((err) => {
            console.error(err)
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
    height: 100%;
    background-color: #d5c4c8;
    margin: 0 auto;
    position: relative;

}

.hot {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 50px;
    width: 100%;
    height: 100px;
    background-color: #778391;
}

.hot-title {
    text-align: center;
    flex: 1;
}



.movie-container {
    width: 100%;
    height: 100%;
    background-color: #d5c4c8;
    margin: 0 auto;
    position: relative;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.movie {
    margin: 30px 50px;
    width: 300px;
    height: 400px;
    background-color: white;
    box-shadow: 5px 5px 5px #888888;
    cursor: pointer;
    transition: transform 0.3s;
}

.movie:hover {
    transform: scale(1.1);
}

.movie-title {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 30px;
    font-size: 20px;
    font-weight: bold;
}

.movie-link {
    text-decoration: none;
    color: black;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 50px;
    background-color: skyblue;
    color: white;
    padding: 0 20px;
    margin-bottom: 30px;
    position: relative;
    /* 添加相对定位 */
}


.header .user {
    position: absolute;
    right: 20%;
    font-size: 20px;
    font-weight: 600;
}

.user span {
    color: red;
    cursor: pointer;
}

.user span:hover {
    color: chartreuse;
}

.loginOut {
    position: absolute;
    right: 5%;
    font-size: 20px;
    font-weight: 600;
    color: black;
    cursor: pointer;
}

.loginOut:hover {
    color: coral;
}
</style>
