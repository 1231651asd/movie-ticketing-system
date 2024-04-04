<template>
    <div>
        <!-- 展示电影相关信息 -->
        <el-table :data="tableData" style="width: 100%" max-height="250">
            <el-table-column prop="MovieName" label="电影名称" width="150" />
            <el-table-column prop="Region" label="上映地区" width="150" />
            <el-table-column prop="ReleaseTime" label="上映时间" width="120" />
            <el-table-column prop="Type" label="类型" width="120" />
            <el-table-column prop="Performer" label="演员" width="120" />
            <el-table-column prop="Introduce" label="简介" width="6000" />
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
        <!-- 添加电影 -->
        <el-button class="mt-4" style="width: 100%; color: red;" @click="onAddItem">添加电影</el-button>
        <el-dialog v-model="dialogFormVisible" title="添加电影" width="500">
            <el-form :model="form">
                <el-form-item label="上传海报" :label-width="formLabelWidth">
                    <input type="file" @change="handleFileUpload" accept="image/*">
                    <img :src="form.ImageUrl" style="width: 160px;height: 235px;" v-if="form.ImageUrl">
                </el-form-item>
                <el-form-item label="上映地区" :label-width="formLabelWidth">
                    <el-select v-model="form.Region" placeholder="地区">
                        <el-option v-for="item in RegionOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="电影名称" :label-width="formLabelWidth">
                    <el-input v-model="form.MovieName" autocomplete="off" />
                </el-form-item>
                <el-form-item label="上映时间" :label-width="formLabelWidth">
                    <el-date-picker v-model="form.ReleaseTime" type="date" placeholder="选择日期" format="YYYY/MM/DD"
                        value-format="YYYY-MM-DD" />
                </el-form-item>
                <el-form-item label="电影类型" :label-width="formLabelWidth">
                    <el-select v-model="form.Type" placeholder="请选择电影类型" multiple>
                        <el-option v-for="item in TypeOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="演员" :label-width="formLabelWidth">
                    <el-input v-model="form.Performer" style="width: 240px" />
                </el-form-item>
                <el-form-item label="简介" :label-width="formLabelWidth">
                    <el-input v-model="form.Introduce" style="width: 240px" autosize type="textarea" />
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
                    <input type="file" @change="handleFileUpload" accept="image/*">
                    <img :src="form.ImageUrl" style="width: 160px;height: 235px;" v-if="form.ImageUrl">
                </el-form-item>
                <el-form-item label="上映地区" :label-width="formLabelWidth">
                    <el-select v-model="form.Region" placeholder="请选择影城">
                        <el-option v-for="item in RegionOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="电影名称" :label-width="formLabelWidth">
                    <el-input v-model="form.MovieName" autocomplete="off" />
                </el-form-item>
                <el-form-item label="上映时间" :label-width="formLabelWidth">
                    <el-date-picker v-model="form.ReleaseTime" type="date" placeholder="选择日期" format="YYYY/MM/DD"
                        value-format="YYYY-MM-DD" />
                </el-form-item>
                <el-form-item label="电影类型" :label-width="formLabelWidth">
                    <el-select v-model="form.Type" placeholder="请选择电影类型" multiple>
                        <el-option v-for="item in TypeOptions" :key="item.value" :label="item.label"
                            :value="item.value" />
                    </el-select>
                </el-form-item>
                <el-form-item label="演员" :label-width="formLabelWidth">
                    <el-input v-model="form.Performer" style="width: 240px" />
                </el-form-item>
                <el-form-item label="简介" :label-width="formLabelWidth">
                    <el-input v-model="form.Introduce" style="width: 240px" autosize type="textarea" />
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
import axios from 'axios';

import { ElMessageBox, ElMessage } from 'element-plus';

export default {
    data() {
        return {
            fileList: [],//用于存放电影图片

            EditDialogFormVisible: false,
            dialogFormVisible: false,

            // 表单内容
            form: {
                ImageUrl: '',
                Region: '',
                MovieName: '',
                Introduce: '',
                Performer: '',
                ReleaseTime: '',
                Type: ''
            },
            formLabelWidth: '140px',

            // 影城选项
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

            // 类型选项
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

            // 表格内容展示
            tableData: []
        };
    },
    methods: {
        // 删除电影
        deleteMovie(movieId) {
            axios({
                method: 'delete',
                url: `http://localhost:8080/admin/user/movie/removeMovie/${movieId}`,
            }).then(response => {
                ElMessage({
                    type: 'success',
                    message: '删除成功',
                });
            }).catch(error => {
                console.error(error);
                ElMessage.error('删除失败');
            });
        },
        deleteRow(index) {
            const movieIdToDelete = this.tableData[index].movieId;
            // 发送电影ID给后端来删除电影
            this.tableData.splice(index, 1);
            this.deleteMovie(movieIdToDelete); // 调用删除电影的方法
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

        // 添加电影
        onAddItem() {
            this.dialogFormVisible = true;
            this.form = {
                ImageUrl: '',
                Region: '',
                MovieName: '',
                Introduce: '',
                Performer: '',
                ReleaseTime: '',
                Type: ''
            };
        },
        openEditDialog(row) {
            // 将选中行的信息复制到表单中
            this.form = { ...row };
            // 检查类型属性是否为字符串
            if (typeof row.Type === 'string') {
                // 如果是字符串，将其转换为数组
                this.form.Type = row.Type.split(',');
            }
            this.EditDialogFormVisible = true;
        },


        //添加电影信息
        addMovie() {
            axios({
                method: 'post',
                url: 'http://localhost:8080/admin/user/movie/addMovie',
                data: {
                    address: this.form.Region,
                    movieName: this.form.MovieName,
                    movieType: this.form.Type,
                    actors: this.form.Performer,
                    posterUrl: this.form.ImageUrl,
                    synopsis: this.form.Introduce,
                    releaseDate: this.form.ReleaseTime
                }
            }).then(response => {
                ElMessage.success('添加电影成功');
                console.log(this.form)
                this.tableData.push({ ...this.form });
            }).catch(error => {
                console.error(error);
                ElMessage.error('添加电影失败');
            });
            this.dialogFormVisible = false;
        },
        updateMovie() {
            const index = this.tableData.findIndex(item => item.movieId === this.form.movieId);
            // 更新电影信息
            if (index !== -1) {
                // 更新电影表格
                this.tableData[index].Type = this.form.Type
                this.tableData[index].ImageUrl = this.form.ImageUrl
                this.tableData[index].Region = this.form.Region
                this.tableData[index].MovieName = this.form.MovieName
                this.tableData[index].Introduce = this.form.Introduce
                this.tableData[index].Performer = this.form.Performer
                this.tableData[index].ReleaseTime = this.form.ReleaseTime

                // 更新数据库中的数据
                axios({
                    method: 'put',
                    url: 'http://localhost:8080/admin/user/movie/changeMovie',
                    data: {
                        movieId: this.form.movieId,
                        movieName: this.form.MovieName,
                        movieType: this.form.Type,
                        actors: this.form.Performer,
                        posterUrl: this.form.ImageUrl,
                        address: this.form.Region,
                        synopsis: this.form.Introduce,
                        releaseDate: this.form.ReleaseTime
                    }
                }).then(() => {
                    ElMessage.success('更新电影信息成功');
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
        axios({
            method: 'get',
            url: 'http://localhost:8080/admin/user/movie/list/all'
        }).then((res) => {
            let Data = res.data.data
            for (let i = 0; i < Data.length; ++i) {
                this.tableData.push({
                    movieId: Data[i].movieId,
                    ImageUrl: Data[i].posterUrl,
                    MovieName: Data[i].movieName,
                    Region: Data[i].address,
                    Introduce: Data[i].synopsis,
                    Performer: Data[i].actors,
                    ReleaseTime: Data[i].releaseDate,
                    Type: Data[i].movieType
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
