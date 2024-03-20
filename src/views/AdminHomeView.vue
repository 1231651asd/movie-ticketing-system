<template>
    <div class="container">
        <div class="aside">
            <h2>导航</h2>
            <div class="schedule" @click="changeComponents('schedule')">添加排期</div>
            <div class="password" @click="changeComponents('password')">修改密码</div>
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

import '@/assets/AdminHomeView.css'
import schedule from '@/components/AddSchedule.vue'
import password from '@/components/ModifyPassword.vue'
export default {
    data() {
        return {
            currentComponent: 'schedule'
        }
    },
    methods: {
        changeComponents(component) {
            this.currentComponent = component;
        }
    },
    components: {
        schedule,
        password
    }
}

</script>