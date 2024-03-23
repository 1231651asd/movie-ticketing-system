<template>
    <div class="container">
        <div class="aside">
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
import '@/assets/UserInfo.css'
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
        }
    },
    components: {
        OrderingInformation,
        UserModifyPassword
    }
}
</script>
