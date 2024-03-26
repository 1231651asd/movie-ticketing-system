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
            this.$router.push('/Movie')
        }
    }
}
</script>


<style scoped>
.container {
    position: relative;
    width: 90%;
    height: 97vh;
    background-color: #E1E1E2;
    margin: 0 auto;
}

.time {
    position: absolute;
    width: 100%;
    height: 120px;
    background-color: pink;
    margin: 20px 0;
    cursor: pointer;
    transition: transform 0.3s;

}

.time:hover {
    transform: scale(1.05);

}

.title-list {
    list-style: none;
}

.TimeInfo-list {
    list-style: none;
}

.title-item {
    display: inline;
    font-size: 20px;
    font-weight: 600;
}

.title-item:first-child {
    margin-left: 90px;
}

.title-item:not(:first-child) {
    margin-left: 250px;
}

.TimeInfo-list li {
    display: inline;
    font-size: 20px;
    font-weight: 600;
    margin-top: 10px;
}

.TimeInfo-list li:nth-child(1) {
    position: absolute;
    left: 9%;
}

.TimeInfo-list li:nth-child(2) {
    position: absolute;
    left: 33.8%;
}

.TimeInfo-list li:nth-child(3) {
    position: absolute;
    left: 58.3%;
}

.TimeInfo-list li:nth-child(4) {
    position: absolute;
    right: 15%;
}
</style>
