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
    width: 90%;
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
