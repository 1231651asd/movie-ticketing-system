<template>
    <div class="container">
        <p>旧密码：</p>
        <el-input v-model="OldPassword" style="width: 240px" type="password" placeholder="请输入旧密码" show-password />
        <p>新密码：</p>
        <el-input v-model="NewPassword" style="width: 240px" type="password" placeholder="请输入新密码" show-password />
        <br>
        <br>
        <br>
        <br>
        <el-button type="primary" @click="getInput">确认修改</el-button>
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
        getInput() {
            console.log(this.OldPassword);
            console.log(this.NewPassword);

        }
    }
}
</script>

<style></style>