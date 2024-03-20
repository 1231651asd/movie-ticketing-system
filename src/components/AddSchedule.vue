<template>
    <el-table :data="tableData" style="width: 100%" max-height="250">
        <el-table-column fixed prop="date" label="Date" width="150" />
        <el-table-column prop="name" label="Name" width="120" />
        <el-table-column prop="state" label="State" width="120" />
        <el-table-column prop="city" label="City" width="120" />
        <el-table-column prop="address" label="Address" width="600" />
        <el-table-column prop="zip" label="Zip" width="120" />
        <el-table-column fixed="right" label="Operations" width="120">
            <template #default="scope">
                <!-- <el-button link type="primary" size="large" @click.prevent="openEditDialog(scope.$index)">
                    编辑
                </el-button> -->
                <el-button link type="primary" size="large" @click.prevent="openConfirmDialog(scope.$index)">
                    删除
                </el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-button class="mt-4" style="width: 100%;color: red;" @click="onAddItem">添加电影</el-button>
</template>

<script>
import { ElMessageBox, ElMessage } from 'element-plus';
export default {
    data() {
        return {
            tableData: [
                {
                    date: '2016-05-01',
                    name: 'Tom',
                    state: 'California',
                    city: 'Los Angeles',
                    address: 'No. 189, Grove St, Los Angeles',
                    zip: 'CA 90036',
                },
                {
                    date: '2016-05-02',
                    name: 'Tom',
                    state: 'California',
                    city: 'Los Angeles',
                    address: 'No. 189, Grove St, Los Angeles',
                    zip: 'CA 90036',
                },
                {
                    date: '2016-05-03',
                    name: 'Tom',
                    state: 'California',
                    city: 'Los Angeles',
                    address: 'No. 189, Grove St, Los Angeles',
                    zip: 'CA 90036',
                }
            ]
        };
    },
    methods: {
        deleteRow(index) {
            this.tableData.splice(index, 1);
        },
        openConfirmDialog(index) {
            ElMessageBox.confirm(
                '确定要删除这行数据吗？',
                '警告',
                {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning',
                }
            )
                .then(() => {
                    this.deleteRow(index);
                    ElMessage({
                        type: 'success',
                        message: '删除成功',
                    });
                })
                .catch(() => {
                    ElMessage({
                        type: 'info',
                        message: '取消删除',
                    });
                });
        },
        onAddItem() {
            this.$prompt('请输入日期', '添加电影', {
                confirmButtonText: '确认',
                cancelButtonText: '取消',
                inputPattern: /^(.+)$/,
                inputErrorMessage: '请输入有效的值',
                inputPlaceholder: '请输入日期',
            })
                .then(({ value: date }) => {
                    this.$prompt('请输入名称', '添加电影', {
                        confirmButtonText: '确认',
                        cancelButtonText: '取消',
                        inputPattern: /^(.+)$/,
                        inputErrorMessage: '请输入有效的值',
                        inputPlaceholder: '请输入名称',
                    })
                        .then(({ value: name }) => {
                            this.$prompt('请输入州', '添加电影', {
                                confirmButtonText: '确认',
                                cancelButtonText: '取消',
                                inputPattern: /^(.+)$/,
                                inputErrorMessage: '请输入有效的值',
                                inputPlaceholder: '请输入州',
                            })
                                .then(({ value: state }) => {
                                    this.$prompt('请输入城市', '添加电影', {
                                        confirmButtonText: '确认',
                                        cancelButtonText: '取消',
                                        inputPattern: /^(.+)$/,
                                        inputErrorMessage: '请输入有效的值',
                                        inputPlaceholder: '请输入城市',
                                    })
                                        .then(({ value: city }) => {
                                            this.$prompt('请输入地址', '添加电影', {
                                                confirmButtonText: '确认',
                                                cancelButtonText: '取消',
                                                inputPattern: /^(.+)$/,
                                                inputErrorMessage: '请输入有效的值',
                                                inputPlaceholder: '请输入地址',
                                            })
                                                .then(({ value: address }) => {
                                                    this.$prompt('请输入邮编', '添加电影', {
                                                        confirmButtonText: '确认',
                                                        cancelButtonText: '取消',
                                                        inputPattern: /^(.+)$/,
                                                        inputErrorMessage: '请输入有效的值',
                                                        inputPlaceholder: '请输入邮编',
                                                    })
                                                        .then(({ value: zip }) => {
                                                            this.tableData.push({
                                                                date,
                                                                name,
                                                                state,
                                                                city,
                                                                address,
                                                                zip,
                                                            });
                                                            this.$message({
                                                                type: 'success',
                                                                message: '添加成功',
                                                            });
                                                        })
                                                        .catch(() => {
                                                            this.$message({
                                                                type: 'info',
                                                                message: '取消操作',
                                                            });
                                                        });
                                                })
                                                .catch(() => {
                                                    this.$message({
                                                        type: 'info',
                                                        message: '取消操作',
                                                    });
                                                });
                                        })
                                        .catch(() => {
                                            this.$message({
                                                type: 'info',
                                                message: '取消操作',
                                            });
                                        });
                                })
                                .catch(() => {
                                    this.$message({
                                        type: 'info',
                                        message: '取消操作',
                                    });
                                });
                        })
                        .catch(() => {
                            this.$message({
                                type: 'info',
                                message: '取消操作',
                            });
                        });
                })
                .catch(() => {
                    this.$message({
                        type: 'info',
                        message: '取消操作',
                    });
                });
        },
    },

}
</script>

<style></style>
