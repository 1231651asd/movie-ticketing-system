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
            this.$router.push('/ChooseTime')
        }
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