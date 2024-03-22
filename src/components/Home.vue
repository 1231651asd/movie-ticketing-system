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
    </div>
    <div class="movie-container">
        <div class="movie" v-for="(item, index) in movieData" :key="index" @click="goToCiname">
            <div class="movie-image">
                <el-image style="width: 300px; height: 300px" :src="item.imageUrl" />
            </div>
            <div class="movie-title">
                {{ item.title }}
            </div>
        </div>
    </div>

</template>

<script>
import '@/assets/Home.css'

export default {
    data() {
        return {
            ImageData: ['/1.jpg', '/2.jpg', '/3.jpg', '/4.jpg', '/5.jpg', '/6.jpg'],
            movieData: [
                {
                    imageUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    title: '你好世界'
                },
                {
                    imageUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    title: '你好世界'
                },
                {
                    imageUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    title: '你好世界'
                },
                {
                    imageUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    title: '你好世界'
                },
                {
                    imageUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    title: '你好世界'
                },
                {
                    imageUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    title: '你好世界'
                },

            ],
            UserInfo: {
                name: 'Tom'
            }
        }
    },
    methods: {
        goToCiname() {
            this.$router.push('/Home/Cinema');
        },
        loginOut() {
            this.$router.push('/')
        },
        GoUserInfo() {
            this.$router.push('/UserInfo')
        }
    }
}
</script>
