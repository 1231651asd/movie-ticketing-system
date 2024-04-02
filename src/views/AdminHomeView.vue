<template>
    <div class="container">
        <div class="aside">
            <h2>导航</h2>
            <div class="movieData" @click="changeComponents('movieData')">添加电影信息</div>
            <div class="schedule" @click="changeComponents('schedule')">添加排期</div>
            <div class="password" @click="changeComponents('password')">修改密码</div>
            <div class="loginOut" @click="loginOut">退出登录</div>
        </div>
        <div class="header">
            <h2>电影购票管理系统</h2>
        </div>
        <div class="main">
            <component :is="currentComponent"></component>
        </div>
    </div>
</template>


<script>
import { ElMessage } from 'element-plus'

import schedule from '@/components/AddSchedule.vue'
import password from '@/components/ModifyPassword.vue'
import movieData from '@/components/MovieData.vue'

export default {
    data() {
        return {
            currentComponent: 'movieData'
        }
    },
    methods: {
        changeComponents(component) {
            this.currentComponent = component;
        },
        loginOut() {
            localStorage.removeItem('userID')
            this.$router.push('/')
            ElMessage({
                message: '退出成功',
                type: 'success',
            })
        },
    },
    components: {
        schedule,
        password,
        movieData
    }
}

</script>
<style scoped>
body {
    background-color: #D7DFF2;
}

.container {
    height: 97vh;
}

.aside {
    position: relative;
    float: left;
    width: 250px;
    height: 100%;
    background-color: #209CE2;
}

.aside h2 {
    position: absolute;
    margin-top: 30px;
    margin-left: 100px;
    color: white;
}

.movieData {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    background-color: #6EAC36;
}

.movieData:hover {
    cursor: pointer;
    color: white;
    background-color: gray;
}

.schedule {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 25%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    background-color: #6EAC36;
}

.schedule:hover {
    cursor: pointer;
    color: white;
    background-color: gray;
}

.password {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 35%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #6EAC36;
    margin-top: 10px;
}

.password:hover {
    cursor: pointer;
    color: white;
    background-color: gray;
}

.loginOut {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #6EAC36;
    margin-top: 10px;
}

.loginOut:hover {
    cursor: pointer;
    color: white;
    background-color: gray;
}

.header {
    background-color: #9b9090;
    width: 1200px;
    height: 50px;
    float: left;
    margin-left: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.main {
    position: absolute;
    width: 1200px;
    height: 88%;
    top: 10%;
    right: 2.5%;
    background-color: #E0E0E0;
}
</style>