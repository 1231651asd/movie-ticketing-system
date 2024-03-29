<template>
    <div class="container">
        <div class="aside">
            <h3>
                <el-page-header @back="goBack">
                    <template #content>
                        <span class="text-large font-600 mr-3"> 个人信息 </span>
                    </template>
                </el-page-header>
            </h3>
            <h2>导航</h2>
            <div class="order" @click="changeComponents('OrderingInformation')">订单信息</div>
            <div class="password" @click="changeComponents('UserModifyPassword')">修改密码</div>
        </div>
        <div class="right">
            <component :is="currentComponent"></component>
        </div>
    </div>

</template>

<script>
import OrderingInformation from '@/components/OrderingInformation.vue'
import UserModifyPassword from '@/components/UserModifyPassword.vue'
export default {
    data() {
        return {
            currentComponent: 'OrderingInformation'

        }
    },
    methods: {
        changeComponents(component) {
            this.currentComponent = component
        },
        goBack() {
            this.$router.push('/Home')
        }
    },
    components: {
        OrderingInformation,
        UserModifyPassword
    }
}
</script>

<style scoped>
body {
    background-color: #D7DFF2;
}

.container {
    height: 100vh;
}

.aside {
    position: relative;
    float: left;
    width: 250px;
    height: 100%;
    background-color: #209CE2;
}

.aside h3 {
    position: absolute;
    margin-top: 10px;
    margin-left: 10px;
    font-size: 20px;
    font-weight: 1000;
}

.aside h3:hover {
    color: red;
    cursor: pointer;
}

.aside h2 {
    position: absolute;
    margin-top: 150px;
    margin-left: 100px;
    color: white;
}

.order {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 100px;
    background-color: #6EAC36;
}

.order:hover {
    cursor: pointer;
    color: white;
    background-color: gray;
}

.password {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 25%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #6EAC36;
    margin-top: 100px;
}

.password:hover {
    cursor: pointer;
    color: white;
    background-color: gray;
}

.container .right {
    float: left;
    display: flex;
    flex-wrap: wrap;
    margin-left: 53px;
    width: 1200px;
    height: 100%;
}

.right .ticket {
    width: 250px;
    height: 280px;
    background-color: #3CB371;
    margin-top: 30px;
    margin-left: 30px;
}

.ticket p {
    margin-top: 10px;
    margin-left: 5px;
    font-size: 17px;
    font-weight: 600;
}
</style>
