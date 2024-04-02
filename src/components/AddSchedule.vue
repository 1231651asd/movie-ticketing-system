<template>
    <div>
        <!-- 展示电影相关信息 -->
        <el-table :data="tableData" style="width: 100%" max-height="250">
            <el-table-column prop="Cinema" label="影城" width="180" />
            <el-table-column prop="MovieName" label="电影名称" width="180" />
            <el-table-column prop="ReleaseTime" label="观看时间" width="180" />
            <el-table-column prop="StartTime" label="开始时间" width="180" />
            <el-table-column prop="EndTime" label="结束时间" width="180" />
            <el-table-column prop="Room" label="影厅" width="180" />
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
        <!-- 添加电影排期 -->
        <el-button class="mt-4" style="width: 100%; color: red;" @click="onAddItem">添加电影排期</el-button>
        <el-dialog v-model="dialogFormVisible" title="添加电影" width="500">
            <el-form :model="form">
                <el-form-item label="影城" :label-width="formLabelWidth">
                    <el-select v-model="form.Cinema" placeholder="请选择影城">
                        <el-option v-for="item in CinemaOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="电影名称" :label-width="formLabelWidth">
                    <el-select v-model="form.MovieName" placeholder="请选择电影">
                        <el-option v-for="item in MovieOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="观看时间" :label-width="formLabelWidth">
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
                <el-form-item label="影城" :label-width="formLabelWidth">
                    <el-select v-model="form.Cinema" placeholder="请选择影城">
                        <el-option v-for="item in CinemaOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="电影名称" :label-width="formLabelWidth">
                    <el-select v-model="form.MovieName" placeholder="请选择电影">
                        <el-option v-for="item in MovieOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="观看时间" :label-width="formLabelWidth">
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
import axios from 'axios';

export default {
    data() {
        return {
            fileList: [],//用于存放电影图片
            EditDialogFormVisible: false,
            dialogFormVisible: false,

            // 表单内容
            form: {
                Cinema: '',
                MovieName: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: '',
            },
            formLabelWidth: '140px',

            // 影院选项
            CinemaOptions: [
                { label: "1929嘉莱电影公园(武汉光谷店)", value: "1929嘉莱电影公园(武汉光谷店)" },
                {
                    label: "CGV影城（凯德西城IMAX店）", value: "CGV影城（凯德西城IMAX店）"
                },
                { label: "TLV影城（永旺金桥IMAX店）", value: "TLV影城（永旺金桥IMAX店）" },
            ],

            // 上映地区选项
            RegionOptions: [
                { label: '中国大陆', value: '中国大陆' },
                { label: '中国香港', value: '中国香港' },
                { label: '中国台湾', value: '中国台湾' },
                { label: '英国', value: '英国' },
                { label: '法国', value: '法国' },
                { label: '德国', value: '德国' },
                { label: '意大利', value: '意大利' },
                { label: '加拿大', value: '加拿大' },
                { label: '澳大利亚', value: '澳大利亚' },
                { label: '韩国', value: '韩国' },
            ],

            // 电影数据选项
            MovieOptions: [],

            // 电影类型选项
            TypeOptions: [
                { label: '动作', value: '动作' },
                { label: '喜剧', value: '喜剧' },
                { label: '爱情', value: '爱情' },
                { label: '科幻', value: '科幻' },
                { label: '恐怖', value: '恐怖' },
                { label: '剧情', value: '剧情' },
                { label: '动画', value: '动画' },
                { label: '纪录', value: '纪录' },
                { label: '惊悚', value: '惊悚' },
            ],

            // 表格内容展示
            tableData: [
                {
                    Cinema: '万达影城',
                    MovieName: '热辣滚烫',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1',
                },
                {
                    Cinema: '新世纪影城',
                    MovieName: '飞驰人生2',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1',
                },
                {
                    Cinema: '万达影城',
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
        // 删除电影排期
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

        // 添加电影排期
        onAddItem() {
            this.dialogFormVisible = true;
            this.form = {
                ImageUrl: '',
                Cinema: '',
                MovieName: '',
                Introduce: '',
                Performer: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: '',
                Type: ''
            };
        },
        addMovie() {
            this.tableData.push({ ...this.form });
            this.fileList = [];
            this.dialogFormVisible = false;
            this.form = {
                ImageUrl: '',
                Cinema: '',
                MovieName: '',
                Introduce: '',
                Performer: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: '',
                Type: ''
            };
            ElMessage.success('添加电影排期成功');
        },
        openEditDialog(row) {
            this.form = { ...row };
            this.EditDialogFormVisible = true;
        },
        updateMovie() {
            const index = this.tableData.findIndex(item => item.MovieName === this.form.MovieName);
            // 更新电影信息
            if (index !== -1) {
                this.tableData[index] = { ...this.form };
                this.EditDialogFormVisible = false;
                ElMessage.success('更新电影信息成功');
            } else {
                ElMessage.error('未找到要更新的电影');
            }
        },

        // 添加图片
        handleFileUpload(event) {
            const file = event.target.files[0];
            if (file) {
                this.form.ImageUrl = URL.createObjectURL(file);
            }
        },
    },
    mounted() {
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/movie/list/3'
        }).then((res) => {
            let Data = res.data.data
            for (let i = 0; i < Data.length; ++i) {
                this.MovieOptions.push({
                    value: Data[i].movieName,
                    label: Data[i].movieName,
                });
            }
        }).catch((err) => {
            console.error(err)
        })
    }
};
</script>

<style scoped>
.upload-demo {
    display: inline-block;
    margin-bottom: 20px;
}
</style>
