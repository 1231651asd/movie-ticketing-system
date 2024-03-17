<template>
    <div class="header">
        <img :src="MovieData.imageUrl" style="width: 232px; height: 300px">
        <div class="movie-info">
            <h3>{{ MovieData.MovieName }}</h3>
            <p class="type">{{ MovieData.type }}</p>
            <p class="release-time">{{ MovieData.ReleaseTime }}&nbsp;&nbsp;中国大陆上映</p>
            <el-button type="danger" round @click="GoBuyTickets">特惠购票</el-button>
        </div>
    </div>
</template>
<script>
import '@/assets/Movie.css'
export default {
    data() {
        return {
            MovieData: {
                imageUrl: 'https://p0.pipi.cn/mmdb/54ecde9a2ffc7e21f0ecd8bb48ec78326e683.jpg?imageView2/1/w/464/h/644',
                MovieName: '功夫熊猫4',
                type: '动作 冒险 动画',
                ReleaseTime: '2024-3-16'
            }
        }
    },
    methods: {
        GoBuyTickets() {
            this.$router.push('/Home/Cinema/Movie/BuyTickets')
        }
    }
}
</script>