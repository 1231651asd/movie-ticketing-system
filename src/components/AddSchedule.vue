<template>
    <div>
        <!-- 展示电影相关信息 -->
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
        <!-- 添加电影 -->
        <el-button class="mt-4" style="width: 100%; color: red;" @click="onAddItem">添加电影</el-button>
        <el-dialog v-model="dialogFormVisible" title="添加电影" width="500">
            <el-form :model="form">
                <el-form-item label="上传海报" :label-width="formLabelWidth">
                    <el-upload class="upload-demo" action="/uploadUrl" :on-success="handleUploadSuccess" :limit="1"
                        :file-list="fileList" list-type="picture">
                        <el-button size="small" type="primary">点击上传</el-button>
                    </el-upload>
                </el-form-item>
                <el-form-item label="电影名称" :label-width="formLabelWidth">
                    <el-input v-model="form.MovieName" autocomplete="off" />
                </el-form-item>
                <el-form-item label="上映时间" :label-width="formLabelWidth">
                    <el-date-picker v-model="form.ReleaseTime" type="date" placeholder="选择日期" format="YYYY/MM/DD"
                        value-format="YYYY-MM-DD" />
                </el-form-item>
                <el-form-item label="开始时间" :label-width="formLabelWidth">
                    <el-time-picker v-model="form.StartTime" placeholder="选择开始时间" format="HH:mm:ss"
                        value-format="HH:mm:ss" />
                </el-form-item>
                <el-form-item label="结束时间" :label-width="formLabelWidth">
                    <el-time-picker v-model="form.EndTime" placeholder="选择结束时间" format="HH:mm:ss"
                        value-format="HH:mm:ss" />
                </el-form-item>
                <el-form-item label="影厅" :label-width="formLabelWidth">
                    <el-input v-model="form.Room" autocomplete="off" />
                </el-form-item>
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取消</el-button>
                    <el-button type="primary" @click="addMovie">
                        确认
                    </el-button>
                </div>
            </template>
        </el-dialog>
        <!-- 编辑电影信息 -->
        <el-dialog v-model="EditDialogFormVisible" title="电影信息编辑" width="500">
            <el-form :model="form">
                <el-form-item label="上传海报" :label-width="formLabelWidth">
                    <el-upload class="upload-demo" action="/uploadUrl" :on-success="handleUploadSuccess" :limit="1"
                        :file-list="fileList" list-type="picture">
                        <el-button size="small" type="primary">点击上传</el-button>
                    </el-upload>
                </el-form-item>
                <el-form-item label="电影名称" :label-width="formLabelWidth">
                    <el-input v-model="form.MovieName" autocomplete="off" />
                </el-form-item>
                <el-form-item label="上映时间" :label-width="formLabelWidth">
                    <el-date-picker v-model="form.ReleaseTime" type="date" placeholder="选择日期" format="YYYY/MM/DD"
                        value-format="YYYY-MM-DD" />
                </el-form-item>
                <el-form-item label="开始时间" :label-width="formLabelWidth">
                    <el-time-picker v-model="form.StartTime" placeholder="选择开始时间" format="HH:mm:ss"
                        value-format="HH:mm:ss" />
                </el-form-item>
                <el-form-item label="结束时间" :label-width="formLabelWidth">
                    <el-time-picker v-model="form.EndTime" placeholder="选择结束时间" format="HH:mm:ss"
                        value-format="HH:mm:ss" />
                </el-form-item>
                <el-form-item label="影厅" :label-width="formLabelWidth">
                    <el-input v-model="form.Room" autocomplete="off" />
                </el-form-item>
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button @click="EditDialogFormVisible = false">取消</el-button>
                    <el-button type="primary" @click="updateMovie">
                        确认
                    </el-button>
                </div>
            </template>
        </el-dialog>
    </div>
</template>

<script>
import { ElMessageBox, ElMessage } from 'element-plus';

export default {
    data() {
        return {
            fileList: [],
            EditDialogFormVisible: false,
            dialogFormVisible: false,
            form: {
                MovieName: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: ''
            },
            formLabelWidth: '140px',
            tableData: [
                {
                    MovieName: '热辣滚烫',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1'
                },
                {
                    MovieName: '飞驰人生2',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1'
                },
                {
                    MovieName: '功夫熊猫4',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1'
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
            this.dialogFormVisible = true;
        },
        openEditDialog(row) {
            this.form = { ...row };
            this.EditDialogFormVisible = true;
        },
        addMovie() {
            this.tableData.push({ ...this.form });
            this.fileList = [];
            this.dialogFormVisible = false;
            this.form = {
                MovieName: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: ''
            };
            ElMessage.success('添加电影成功');
        },
        handleUploadSuccess(response, file, fileList) {
            this.fileList = fileList;
        }
    },
};
</script>

<style>
.upload-demo {
    display: inline-block;
    margin-bottom: 20px;
}
</style>
