<template>

    <el-tabs :tab-position="tabPosition" style="height: 200px" class="demo-tabs">
        <el-tab-pane label="订单信息">User</el-tab-pane>
        <el-tab-pane label="修改密码">Config</el-tab-pane>
        <el-tab-pane label="退出登录">Role</el-tab-pane>

    </el-tabs>
</template>

<script>
import '@/assets/UserInfo.css'

export default {
    data() {
        return {
            tabPosition: 'left'
        }
    }
}
</script>
