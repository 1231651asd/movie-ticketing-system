<template>
    <div class="container">
        <el-card style="max-width: 250px;margin-left: 30px;margin-top: 10px;max-height: 404.263px;"
            v-for="(item, index) in TicketData" :key="index">
            <template #footer>
                <el-button type="primary" @click="dialogFormVisible = true" style="margin-left: 55px;">
                    详细信息
                </el-button>
            </template>
            <el-dialog v-model="dialogFormVisible" title="详细信息" width="800">
                <el-form :model="item">
                    <el-form-item label="订单号" :label-width="formLabelWidth">
                        <el-input disabled v-model="item.OrderID" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="电影名称" :label-width="formLabelWidth">
                        <el-input disabled v-model="item.MovieName" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="观影日期" :label-width="formLabelWidth">
                        <el-input disabled v-model="item.LookTime" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="开始时间" :label-width="formLabelWidth">
                        <el-input disabled v-model="item.StartTime" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="座位" :label-width="formLabelWidth">
                        <el-input disabled v-model="item.Seat" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="影厅" :label-width="formLabelWidth">
                        <el-input disabled v-model="item.Room" autocomplete="off" />
                    </el-form-item>
                    <el-form-item label="二维码" :label-width="formLabelWidth">
                        <el-image style="width: 100px; height: 100px" :src="item.QR" fit="cover"
                            :preview-src-list="[item.QR]" />
                    </el-form-item>
                </el-form>
            </el-dialog>
            <img :src="item.Cover" style="width: 100%" />
        </el-card>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            TicketData: [],
            dialogFormVisible: false,
            formLabelWidth: '140px'
        }
    },
    mounted() {
        let userId = localStorage.getItem('userID');
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/order/list/' + userId,
            params: {
                userId: userId
            }
        }).then((res) => {
            let orderData = res.data.data
            for (let i = 0; i < orderData.length; ++i) {
                this.TicketData.push({
                    OrderID: orderData[i].orderId,
                    MovieName: orderData[i].movieName,
                    LookTime: orderData[i].showDate,
                    StartTime: orderData[i].startTime,
                    Room: orderData[i].venueAddress,
                    Seat: orderData[i].seatRow + '排' + orderData[i].seatColumn + '座',
                    Cover: orderData[i].posterUrl,
                    QR: '/QR.jpg',
                })
            }
        }).catch((error) => {
            console.error(error)
        })

    }
}
</script>

<style scoped>
.container {
    display: flex;
    flex-wrap: wrap;
}
</style>