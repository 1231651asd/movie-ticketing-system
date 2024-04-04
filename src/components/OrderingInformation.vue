<template>
    <div class="container">
        <el-card style="max-width: 250px;margin-left: 30px;margin-top: 10px;max-height: 404.263px;"
            v-for="(item, index) in TicketData" :key="index">
            <template #footer>
                <el-button type="primary" @click="openDialog(index)" style=" margin-left: 35px;">
                    详细信息
                </el-button>
                <el-button type="danger" @click="openDeleteDialog(index)">
                    <Delete style="width: 1em; height: 1em;" />
                </el-button>
                <!-- 订单信息表 -->
            </template>
            <el-dialog v-model="item.dialogFormVisible" title="详细信息" width="800">
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

            <!-- 删除对话 -->
            <el-dialog v-model="item.dialogVisible" title="删除" width="500">
                <span>你确认删除这个订单吗？</span>
                <template #footer>
                    <div class="dialog-footer">
                        <el-button @click="item.dialogVisible = false">取消</el-button>
                        <el-button type="danger" @click="deleteOrder(item.OrderID, index)">
                            确认
                        </el-button>
                    </div>
                </template>
            </el-dialog>
        </el-card>
    </div>
</template>

<script>
import axios from 'axios'
import { ElMessage } from 'element-plus'

export default {
    data() {
        return {
            TicketData: [],//存取订单信息
            formLabelWidth: '140px',
            dialogVisible: false
        }
    },
    //获取用户的所有订单信息
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
                    dialogFormVisible: false,
                    dialogVisible: false
                })
            }
            console.log()
        }).catch((error) => {
            console.error(error)
        })

    },
    methods: {
        // 控制详细信息对话框的打开
        openDialog(index) {
            this.TicketData.forEach((item, i) => {
                if (i === index) {
                    item.dialogFormVisible = true; // 只打开点击的卡片对应的对话框
                } else {
                    item.dialogFormVisible = false; // 关闭其他卡片的对话框
                }
            });
        },

        //打开删除信息对话框
        openDeleteDialog(index) {
            this.TicketData.forEach((item, i) => {
                if (i === index) {
                    item.dialogVisible = true; // 只打开点击的卡片对应的对话框
                } else {
                    item.dialogVisible = false; // 关闭其他卡片的对话框
                }
            });
        },
        // 删除订单
        deleteOrder(OrderID, index) {
            axios({
                method: 'delete',
                url: 'http://localhost:8080/admin/user/order/deleteOrderById',
                params: {
                    orderId: OrderID
                }
            }).then((res) => {
                this.TicketData.splice(index, 1);
                this.dialogVisible = false
                ElMessage({
                    message: '删除成功',
                    type: 'success',
                })
            })

        }
    }
}
</script>

<style scoped>
.container {
    display: flex;
    flex-wrap: wrap;
}
</style>