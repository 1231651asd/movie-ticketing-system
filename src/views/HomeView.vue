<template>
    <div class="background">
        <div class="form">
            <div class="title">欢迎</div>
            <div class="subtitle">请先登录!</div>

            <div class="input-container ic1">
                <input v-model="account" type="text" class="input" id="account">
                <div class="cut"></div>
                <label class="iLabel" :class="{ 'active': account !== '' }" for="account">帐号</label>
            </div>

            <div class="input-container ic2">
                <input v-model="password" type="password" class="input" id="password">
                <div class="cut"></div>
                <label class="iLabel" :class="{ 'active': password !== '' }" for="password">密码</label>
            </div>
            <button class="submit" type="text" @click="Login">登录</button>
            <button class="submit" type="text" @click="GoRegister">注册</button>
        </div>
    </div>

</template>

<script>
import axios from 'axios';
import { ElMessage } from 'element-plus'
export default {
    data() {
        return {
            account: '',
            password: ''
        }
    },
    methods: {
        GoRegister() {
            this.$router.push('/Register')
        },
        Login() {
            if (this.account === '' || this.password === '') {
                ElMessage.error('请输入相关信息')
            } else {
                axios({
                    method: 'post',
                    url: 'http://localhost:8080/admin/user/login',
                    data: {
                        userName: this.account,
                        password: this.password
                    }
                }).then((res) => {
                    let userData = res.data
                    if (userData.message === '操作成功' && userData.data.roleName === '管理员') {
                        ElMessage({
                            message: '登录成功',
                            type: 'success',
                        })
                        localStorage.setItem('userID', userData.data.userId)
                        setTimeout(() => {
                            this.$router.push('/AdminHome')
                        }, 1000)
                    } else if (userData.message === '操作成功' && userData.data.roleName === '普通用户') {
                        ElMessage({
                            message: '登录成功',
                            type: 'success',
                        })
                        localStorage.setItem('userID', userData.data.userId)
                        setTimeout(() => {
                            this.$router.push('/Home')
                        }, 1000);
                    } else {
                        ElMessage.error('用户名或密码错误')
                    }
                })
            }
        }
    }
}
</script>


<style scoped>
.background {
    background-image: url(/UserHome.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    height: 97vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.form {
    background-color: #15172b;
    border-radius: 20px;
    box-sizing: border-box;
    height: 500px;
    padding: 20px;
    width: 320px;

}

.title {
    color: #eee;
    font-family: sans-serif;
    font-size: 36px;
    font-weight: 600;
    margin-top: 30px;
}

.subtitle {
    color: #eee;
    font-family: sans-serif;
    font-size: 16px;
    font-weight: 600;
    margin-top: 10px;
}

.input-container {
    height: 50px;
    position: relative;
    width: 100%;
}

.ic1 {
    margin-top: 40px;
}

.ic2 {
    margin-top: 30px;
}

.input {
    background-color: #303245;
    border-radius: 12px;
    border: 0;
    box-sizing: border-box;
    color: #eee;
    font-size: 18px;
    height: 100%;
    outline: 0;
    padding: 4px 20px 0;
    width: 100%;
}

.cut {
    background-color: #15172b;
    border-radius: 10px;
    height: 20px;
    left: 20px;
    position: absolute;
    top: -20px;
    transform: translateY(0);
    transition: transform 200ms;
    width: 76px;
}

.cut-short {
    width: 50px;
}

.iLabel {
    color: #65657b;
    font-family: sans-serif;
    left: 20px;
    line-height: 14px;
    pointer-events: none;
    position: absolute;
    transform-origin: 0 50%;
    transition: transform 200ms, color 200ms;
    top: 20px;
}

.iLabel.active {
    transform: translateY(-30px) translateX(10px) scale(0.75);
    color: #808097;
}

.input:focus~.cut {
    transform: translateY(8px);
}

.input:focus~.iLabel {
    transform: translateY(-30px) translateX(10px) scale(0.75);
}

.input:not(:focus)~.iLabel {
    color: #808097;
}

.input:focus~.iLabel {
    color: #dc2f55;
}

.submit {
    background-color: #08d;
    border-radius: 12px;
    border: 0;
    box-sizing: border-box;
    color: #eee;
    cursor: pointer;
    font-size: 18px;
    height: 50px;
    margin-top: 38px;
    text-align: center;
    width: 100%;
}

.submit:active {
    background-color: #06b;
}
</style>