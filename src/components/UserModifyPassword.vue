<template>
    <div class="UserModifyPassword">
        <p>旧密码：</p>
        <el-input v-model="OldPassword" style="width: 240px" type="password" placeholder="请输入旧密码" show-password />
        <p>新密码：</p>
        <el-input v-model="NewPassword" style="width: 240px" type="password" placeholder="请输入新密码" show-password />
        <button>确认修改</button>
    </div>
</template>

<script>
export default {
    data() {
        return {
            OldPassword: '',
            NewPassword: ''
        }
    },
    methods: {

    }
}
</script>

<style scoped>
.UserModifyPassword {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 90vh;
    margin-left: 500px;

}

.UserModifyPassword p {
    margin: 10px;
}

.UserModifyPassword button {
    background-color: #409EFF;
    color: #FFF0FF;
    margin-top: 30px;
    width: 100px;
    height: 30px;
    cursor: pointer;
    border: none;
    outline: none;
    border-radius: 5px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

.UserModifyPassword button:hover {
    background-color: #79BBFF;
}
</style>