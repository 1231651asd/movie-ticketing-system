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


<style scoped>
.background {
    background-image: url(/UserHome.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    height: 97vh;
}

.center-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    /* 让内部容器在垂直方向上居中显示 */
}

.login-card {
    width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #e8e8e8;
    box-shadow: 2px 2px 10px #ccc;
}

.card-header {
    text-align: center;
    margin-bottom: 20px
}

.card-header .log {
    margin: 0;
    font-size: 24px;
    color: black;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-size: 18px;
    margin-bottom: 5px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 12px 20px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    transition: 0.5s;
}

input[type="submit"] {
    width: 100%;
    background-color: #333;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #ccc;
    color: black;
}

input[type="button"] {
    width: 100%;
    background-color: #333;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="button"]:hover {
    background-color: #ccc;
    color: black;
}
</style>