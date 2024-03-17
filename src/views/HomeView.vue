<template>
    <div class="background">
        <!-- 登录表单 -->
        <div class="center-container" v-if="!isRegister">
            <div class="login-card">
                <div class="card-header">
                    <div class="log">登录</div>
                </div>
                <form @submit.prevent="handleLogin">
                    <div class="form-group">
                        <label for="username">帐号:</label>
                        <input required="" name="account" id="account" type="text" v-model="loginForm.account">
                    </div>
                    <div class="form-group">
                        <label for="password">密码:</label>
                        <input required="" name="password" id="password" type="password" v-model="loginForm.password">
                    </div>
                    <div class="form-group">
                        <input value="登录" type="submit">
                    </div>
                    <div class="form-group">
                        <input value="注册" type="button" @click="GoRegister">
                    </div>
                </form>
            </div>
        </div>
        <!-- 注册表单 -->
        <div class="center-container" v-else>
            <div class="login-card">
                <div class="card-header">
                    <div class="log">注册</div>
                </div>
                <form @submit.prevent="handleRegister">
                    <div class="form-group">
                        <label for="username">帐号:</label>
                        <input required="" name="account" id="account" type="text" v-model="registerForm.account">
                    </div>
                    <div class="form-group">
                        <label for="password">密码:</label>
                        <input required="" name="password" id="password" type="password"
                            v-model="registerForm.password">
                    </div>
                    <div class="form-group">
                        <label for="invitationCode">邀请码:</label>
                        <input required="" name="invitationCode" id="invitationCode" type="text"
                            v-model="registerForm.invitationCode">
                    </div>
                    <div class="form-group">
                        <input value="登录" type="button" @click="GoLogin">
                    </div>
                    <div class="form-group">
                        <input value="注册" type="submit">
                    </div>
                </form>
            </div>
        </div>
    </div>

</template>

<script>
import '@/assets/HomeView.css'
import axios from 'axios';
export default {
    data() {
        return {
            isRegister: false,
            loginForm: {
                account: '',
                password: ''
            },
            registerForm: {
                account: '',
                password: '',
                invitationCode: ''
            }
        }
    },
    methods: {
        handleLogin() {
            if (!this.isRegister && this.validateLoginForm()) {
                // axios({
                //     method: 'get',
                //     url: '/user.json'
                // }).then((result) => {
                //     console.log(result.data);
                // this.$router.push('/MovieHome');
                // }).catch((error) => {
                //     console.error('请求失败：', error);
                // });
            }
        },

        handleRegister() {
            if (this.isRegister && this.validateRegisterForm()) {
                // 注册逻辑
            }
        },
        GoRegister() {
            this.isRegister = true;
        },
        GoLogin() {
            this.isRegister = false;
        },
        validateLoginForm() {
            // 表单验证逻辑，根据需求自行实现
            return false; // 示例：假设验证通过
        },
        validateRegisterForm() {
            // 表单验证逻辑，根据需求自行实现
            return true; // 示例：假设验证通过
        }
    }
}
</script>
