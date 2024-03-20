<template>
    <el-table :data="tableData" style="width: 100%" max-height="250">
        <el-table-column prop="MovieName" label="MovieName" width="150" />
        <el-table-column prop="ReleaseTime" label="ReleaseTime" width="120" />
        <el-table-column prop="StartTime" label="StartTime" width="120" />
        <el-table-column prop="EndTime" label="EndTime" width="120" />
        <el-table-column prop="Room" label="Room" width="600" />
        <el-table-column fixed="right" label="Operations" width="120">
            <template #default="scope">
                <el-button link type="primary" size="large" @click.prevent="openEditDialog(scope.row)">
                    编辑
                </el-button>
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
                    MovieName: '热辣滚烫',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1',
                },
                {
                    MovieName: '飞驰人生2',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1',
                },
                {
                    MovieName: '功夫熊猫4',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1',
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
            this.$prompt('请输入电影名称', '添加电影', {
                confirmButtonText: '确认',
                cancelButtonText: '取消',
                inputPattern: /^(.+)$/,
                inputErrorMessage: '请输入有效的值',
                inputPlaceholder: '请输入电影名称',
            })
                .then(({ value: ReleaseTime }) => {
                    this.$prompt('请输入上映时间', '添加电影', {
                        confirmButtonText: '确认',
                        cancelButtonText: '取消',
                        inputPattern: /^(.+)$/,
                        inputErrorMessage: '请输入有效的值',
                        inputPlaceholder: '请输入上映时间',
                    })
                        .then(({ value: StartTime }) => {
                            this.$prompt('请输入开始时间', '添加电影', {
                                confirmButtonText: '确认',
                                cancelButtonText: '取消',
                                inputPattern: /^(.+)$/,
                                inputErrorMessage: '请输入有效的值',
                                inputPlaceholder: '请输入开始时间',
                            })
                                .then(({ value: EndTime }) => {
                                    this.$prompt('请输入结束时间', '添加电影', {
                                        confirmButtonText: '确认',
                                        cancelButtonText: '取消',
                                        inputPattern: /^(.+)$/,
                                        inputErrorMessage: '请输入有效的值',
                                        inputPlaceholder: '请输入结束时间',
                                    })
                                        .then(({ value: Room }) => {
                                            this.$prompt('请输入影厅', '添加电影', {
                                                confirmButtonText: '确认',
                                                cancelButtonText: '取消',
                                                inputPattern: /^(.+)$/,
                                                inputErrorMessage: '请输入有效的值',
                                                inputPlaceholder: '请输入影厅',
                                            })
                                                .catch(() => {
                                                    ElMessage({
                                                        type: 'info',
                                                        message: '取消操作',
                                                    });
                                                });
                                        })
                                        .catch(() => {
                                            ElMessage({
                                                type: 'info',
                                                message: '取消操作',
                                            });
                                        });
                                })
                                .catch(() => {
                                    ElMessage({
                                        type: 'info',
                                        message: '取消操作',
                                    });
                                });
                        })
                        .catch(() => {
                            ElMessage({
                                type: 'info',
                                message: '取消操作',
                            });
                        });
                })
                .catch(() => {
                    ElMessage({
                        type: 'info',
                        message: '取消操作',
                    });
                });
        },
        openEditDialog(row) {
            console.log('编辑按钮被点击，打开编辑对话框，允许用户编辑数据', row)
        }
    },

}
</script>

<style></style>
