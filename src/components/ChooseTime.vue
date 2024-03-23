<template>
    <div class="container">
        <div v-for="(item, index) in TimeData" :key="index" class="time" :style="{ top: `${index * 200}px` }"
            @click="GoHomeMovie">
            <ul class="title-list">
                <li class="title-item">观看时间</li>
                <li class="title-item">开始时间</li>
                <li class="title-item">结束时间</li>
                <li class="title-item">影厅</li>
            </ul>
            <ul class="TimeInfo-list">
                <li>{{ item.LookTime }}</li>
                <li>{{ item.StartTime }}</li>
                <li>{{ item.EndTime }}</li>
                <li>{{ item.Room }}</li>
            </ul>
        </div>
    </div>
</template>

<script>

import '@/assets/ChooseTime.css'
export default {
    data() {
        return {
            TimeData: [
                {
                    Room: 3,
                    LookTime: '2024-5-3',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00'
                },
                {
                    Room: 3,
                    LookTime: '2024-5-3',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00'
                },
                {
                    Room: 3,
                    LookTime: '2024-5-3',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00'
                },
                {
                    Room: 3,
                    LookTime: '2024-5-3',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00'
                },

            ]
        }
    },
    methods: {
        GoHomeMovie() {
            this.$router.push('/Home/Cinema/Movie')
        }
    }
}
</script>
