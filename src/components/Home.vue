<template>
    <div class="container">
        <el-carousel :interval="3000" type="card" height="200px">
            <el-carousel-item v-for="(item, index) in ImageData" :key="index">
                <img :src="item" alt="carousel-image">
            </el-carousel-item>
        </el-carousel>
        <div class="hot">
            <div class="hot-title">
                <h3>正在热映</h3>
            </div>
            <div class="more">
                <router-link to="/MovieHome/Movie" class="more-link">更多>></router-link>
            </div>
        </div>
    </div>
    <div class="movie-container">
        <div class="movie" v-for="(item, index) in movieData" :key="index">
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

            ]
        }
    }
}
</script>
