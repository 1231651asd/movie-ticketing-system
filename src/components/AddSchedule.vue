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
            <el-table-column fixed="right" label="操作" width="120">
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
                    <el-select v-model="form.Room" placeholder="请选择影厅">
                        <el-option v-for="item in RoomOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取消</el-button>
                    <el-button type="primary" @click="addMovieSchedule">
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
                    <el-select v-model="form.Room" placeholder="请选择影厅">
                        <el-option v-for="item in RoomOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
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
            CinemaOptions: [],

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
                { label: '犯罪', value: '犯罪' },
                { label: '悬疑', value: '悬疑' },
            ],


            // 影厅数据选项
            RoomOptions: [
                { label: '一号厅', value: '一号厅' },
                { label: '二号厅', value: '二号厅' },
                { label: '三号厅', value: '三号厅' },
                { label: '四号厅', value: '四号厅' },
                { label: '五号厅', value: '五号厅' },
            ],

            // 表格内容展示
            tableData: []
        };
    },
    methods: {
        // 删除电影排期
        deleteSchedule(screenId) {
            axios({
                method: 'delete',
                url: `http://localhost:8080/admin/user/screen/saveScreens/${screenId}`,
            }).then(response => {
                ElMessage({
                    type: 'success',
                    message: '删除成功',
                });
            }).catch(error => {
                console.error(error);
                ElMessage.error('删除失败'); screenId
            });
        },
        deleteRow(index) {
            const screenIdToDelete = this.tableData[index].ScreenId;
            this.tableData.splice(index, 1);
            this.deleteSchedule(screenIdToDelete); // 调用删除电影排期的方法

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
            ).then(() => {
                this.deleteRow(index);
            }).catch(() => {
                ElMessage({
                    type: 'info',
                    message: '取消删除',
                });
            });
        },

        // 判断是否有空数据
        validateFormData() {
            if (!this.form.Cinema) {
                ElMessage.error('请选择影城');
                return false;
            }
            if (!this.form.MovieName) {
                ElMessage.error('请选择电影');
                return false;
            }
            if (!this.form.ReleaseTime) {
                ElMessage.error('请选择观看时间');
                return false;
            }
            if (!this.form.StartTime) {
                ElMessage.error('请选择开始时间');
                return false;
            }
            if (!this.form.EndTime) {
                ElMessage.error('请选择结束时间');
                return false;
            }
            if (!this.form.Room) {
                ElMessage.error('请选择影厅');
                return false;
            }
            return true;
        },
        // 添加电影排期
        onAddItem() {
            this.dialogFormVisible = true;
            this.form = {
                Cinema: '',
                MovieName: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: '',
            };
        },
        addMovieSchedule() {
            if (!this.validateFormData()) {
                return;
            }
            // 根据影城名称查询对应的影城ID
            const cinema = this.CinemaOptions.find(option => option.value === this.form.Cinema);
            const cinemaId = cinema ? cinema.value : null;

            // 根据电影名称查询对应的电影ID
            const movie = this.MovieOptions.find(option => option.value === this.form.MovieName);
            const movieId = movie ? movie.value : null;
            // 检查影城ID和电影ID的有效性
            if (!cinemaId) {
                ElMessage.error('请选择有效的影城');
                return;
            }

            if (!movieId) {
                ElMessage.error('请选择有效的电影');
                return;
            }

            // 将数据添加到表格中
            this.tableData.push({
                ...this.form,
                Cinema: cinema.label, // 替换为影城名称的label
                MovieName: movie.label // 替换为电影名称的label
            });

            // 将数据添加到数据库
            axios({
                method: 'post',
                url: 'http://localhost:8080/admin/user/screen/saveScreens',
                data: {
                    cinemaId: cinemaId,
                    movieId: movieId,
                    screenName: this.form.Room,
                    showDate: this.form.ReleaseTime,
                    startTime: this.form.StartTime,
                    endTime: this.form.EndTime
                }
            }).then((res) => {
                console.log(res);
                ElMessage.success('添加电影排期成功');
            }).catch((error) => {
                console.error(error);
                ElMessage.error('添加电影排期失败');
            });

            this.dialogFormVisible = false;
            this.form = {
                Cinema: '',
                MovieName: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: '',
            };
        },

        openEditDialog(row) {
            // 将选中行的信息复制到表单中
            this.form = { ...row };
            this.EditDialogFormVisible = true;
        },
        updateMovie() {
            const index = this.tableData.findIndex(item => item.MovieId === this.form.MovieId);

            // 更新电影信息
            if (index !== -1) {
                // 更新表格中的数据
                this.tableData[index] = { ...this.form };

                // 根据影城名称查询对应的影城ID
                const cinema = this.CinemaOptions.find(option => option.value === this.form.Cinema);
                const cinemaLabel = cinema ? cinema.label : '';

                // 根据电影名称查询对应的电影ID
                const movie = this.MovieOptions.find(option => option.value === this.form.MovieName);
                const movieLabel = movie ? movie.label : '';

                // 更新表格中的影城和电影名称为label
                this.tableData[index].Cinema = cinemaLabel;
                this.tableData[index].MovieName = movieLabel;

                // 更新数据库中的信息
                axios({
                    method: 'put',
                    url: 'http://localhost:8080/admin/user/screen/changeScreens',
                    data: {
                        screenId: this.form.ScreenId,
                        cinemaId: this.form.Cinema,
                        screenName: this.form.Room,
                        movieId: this.form.MovieName,
                        showDate: this.form.ReleaseTime,
                        startTime: this.form.StartTime,
                        endTime: this.form.EndTime
                    }
                }).then(() => {
                    ElMessage.success('更新电影信息成功');

                }).catch((error) => {
                    console.error(error)
                })
                this.EditDialogFormVisible = false;
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

        // 获取电影选项
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/movie/list/all'
        }).then((res) => {
            let Data = res.data.data
            for (let i = 0; i < Data.length; ++i) {
                this.MovieOptions.push({
                    value: Data[i].movieId,
                    label: Data[i].movieName,
                });
            }
        }).catch((err) => {
            console.error(err)
        })

        // 获取影城选项
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/cinema/list'
        }).then((res) => {
            let CinemaData = res.data.data
            for (let i = 0; i < CinemaData.length; ++i) {
                this.CinemaOptions.push({
                    value: CinemaData[i].cinemaId,
                    label: CinemaData[i].cinemaName,
                });
            }
        }).catch((error) => {
            console.error(error)
        })

        // 获取所有排期信息
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/screen/list/all'
        }).then((res) => {
            let Data = res.data.data
            for (let i = 0; i < Data.length; ++i) {
                this.tableData.push({
                    ScreenId: Data[i].screenId,
                    CinemaId: Data[i].cinemaId,
                    MovieId: Data[i].movieId,
                    MovieName: Data[i].movieName,
                    Cinema: Data[i].cinemaName,
                    ReleaseTime: Data[i].showDate,
                    StartTime: Data[i].startTime,
                    EndTime: Data[i].endTime,
                    Room: Data[i].screenName
                })
            }
        }).catch((error) => {
            console.error(error)
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
