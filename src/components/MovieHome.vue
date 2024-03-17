<template>
    <div>
        <el-tabs v-model="activeTab">
            <el-tab-pane label="首页" name="Home">
                <component :is='activeTab'></component>
            </el-tab-pane>
            <el-tab-pane label="影院" name="Cinema">
                <component :is='activeTab'></component>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
import '@/assets/MovieHome.css'
import Home from '../components/Home.vue';
import Cinema from '../components/Cinema.vue';

export default {
    data() {
        return {
            activeName: '首页',
            activeTab: 'Home'
        };
    },
    components: {
        Home,
        Cinema
    },
    methods: {

    }
};
</script>
