<template>
    <div class="container">
        <div class="cinema" v-for="(item, index) in CinemaData" :key="index" @click="GoMovieHome">
            <img :src="item.cinemaUrl" style="width: 300px; height: 300px">
            <h2>{{ item.cinemaName }}</h2>
            <p class="address">地址：{{ item.cinemaAddress }}</p>
            <p class="phone">电话：{{ item.cinemaPhone }}</p>
            <p class="service">影院服务: 改签、3D眼镜免押金、免费WIFI、儿童优惠</p>
        </div>
    </div>
</template>

<script>
import '@/assets/Cinema.css'

export default {
    data() {
        return {
            CinemaData: [
                {
                    cinemaUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    cinemaName: '万达影城',
                    cinemaAddress: '江夏区杨桥湖大道8号',
                    cinemaPhone: '123456789'
                },
                {
                    cinemaUrl: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
                    cinemaName: '新世纪影城',
                    cinemaAddress: '江夏区杨桥湖大道8号',
                    cinemaPhone: '123456789'


                }
            ]


        }
    },
    methods: {
        GoMovieHome() {
            this.$router.push('/Home/Cinema/Movie')
        }
    }
}
</script>