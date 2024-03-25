<template>
    <div class="container">
        <div class="header">
            <img :src="MovieData.imageUrl" style="width: 232px; height: 300px">
            <div class="movie-info">
                <h3>{{ MovieData.MovieName }}</h3>
                <p class="type">{{ MovieData.type }}</p>
                <p class="release-time">{{ MovieData.ReleaseTime }}&nbsp;&nbsp;中国大陆上映</p>
                <el-button type="danger" round @click="GoBuyTickets">特惠购票</el-button>
            </div>
        </div>
        <div class="main">
            <div class="introduce">
                <h2>剧情介绍：</h2>
                <p>{{ MovieData.introduce }}</p>
                <div class="performer">
                    <h2>演员：</h2>
                    <p>{{ MovieData.performer }}</p>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            MovieData: {
                imageUrl: 'https://p0.pipi.cn/mmdb/54ecde9a2ffc7e21f0ecd8bb48ec78326e683.jpg?imageView2/1/w/464/h/644',
                MovieName: '功夫熊猫4',
                type: '动作 冒险 动画',
                ReleaseTime: '2024-3-16',
                introduce: '爷青回！《功夫熊猫》新作来袭！阿宝“升职”同时，新仇旧敌集结现身，大龙竟起死回生？狐狸小真身份神秘，到底有何心机？ 阿宝被师傅要求选出下一任神龙大侠，正苦恼如何应对时，阿宝昔日的手下败将们却纷纷重出江湖！身世神秘的狐狸小真告诉阿宝，这一切的幕后黑手正是邪恶女巫魅影妖后！阿宝能否打败魅影妖后，昔日敌人又为何再次现身？这次又会发生怎样的搞笑趣事？赶快带上亲朋好友，一起到影院寻找真相吧～',
                performer: '杰克·布莱克 黄渤 奥卡菲娜 杨幂'
            }
        }
    },
    methods: {
        GoBuyTickets() {
            this.$router.push('/BuyTickets')
        }
    }
}
</script>

<style scoped>
.container {
    background-color: #3C305A;
    height: 100vh;
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