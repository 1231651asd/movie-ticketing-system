<template>
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
                <el-form-item label="购买时间" :label-width="formLabelWidth">
                    <el-input disabled v-model="item.BuyTime" autocomplete="off" />
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
                <el-form-item label="结束时间" :label-width="formLabelWidth">
                    <el-input disabled v-model="item.EndTime" autocomplete="off" />
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
</template>

<script>
export default {
    data() {
        return {
            TicketData: [
                {
                    BuyTime: '2024-2-3',
                    OrderID: 123456789,
                    MovieName: '功夫熊猫4',
                    LookTime: '2024-3-23',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00',
                    Room: 3,
                    QR: '/QR.jpg',
                    Cover: 'https://p0.pipi.cn/mmdb/54ecde9a2ffc7e21f0ecd8bb48ec78326e683.jpg?imageView2/1/w/464/h/644'
                },
                {
                    BuyTime: '2024-2-3',
                    OrderID: 123456789,
                    MovieName: '周处除三害',
                    LookTime: '2024-3-23',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00',
                    Room: 3,
                    QR: '/QR.jpg',
                    Cover: 'https://p0.pipi.cn/mmdb/54ecdebe80751becd8c9fd799d14608745656.jpg?imageView2/1/w/464/h/644'
                },
                {
                    BuyTime: '2024-2-3',
                    OrderID: 123456789,
                    MovieName: '功夫熊猫4',
                    LookTime: '2024-3-23',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00',
                    Room: 3,
                    QR: '/QR.jpg',
                    Cover: 'https://p0.pipi.cn/mmdb/54ecde9a2ffc7e21f0ecd8bb48ec78326e683.jpg?imageView2/1/w/464/h/644'
                },
                {
                    BuyTime: '2024-2-3',
                    OrderID: 123456789,
                    MovieName: '功夫熊猫4',
                    LookTime: '2024-3-23',
                    StartTime: '14:00:00',
                    EndTime: '17:00:00',
                    Room: 3,
                    QR: '/QR.jpg',
                    Cover: 'https://p0.pipi.cn/mmdb/54ecde9a2ffc7e21f0ecd8bb48ec78326e683.jpg?imageView2/1/w/464/h/644'
                }
            ],
            dialogFormVisible: false,
            formLabelWidth: '140px'
        }
    }
}
</script>

<style></style>