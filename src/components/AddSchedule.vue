<template>
    <div>
        <!-- 展示电影相关信息 -->
        <el-table :data="tableData" style="width: 100%" max-height="250">
            <el-table-column fixed prop="MovieName" label="电影名称" width="150" />
            <el-table-column prop="ReleaseTime" label="上映时间" width="120" />
            <el-table-column prop="StartTime" label="开始时间" width="120" />
            <el-table-column prop="EndTime" label="结束时间" width="120" />
            <el-table-column prop="Room" label="影厅" width="120" />
            <el-table-column prop="Performer" label="演员" width="120" />
            <el-table-column prop="Introduce" label="简介" width="6000" />
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
                <el-form-item label="影厅" :label-width="formLabelWidth">
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
                <el-form-item label="影厅" :label-width="formLabelWidth">
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
import { ElMessageBox, ElMessage } from 'element-plus';

export default {
    data() {
        return {
            fileList: [],
            EditDialogFormVisible: false,
            dialogFormVisible: false,
            form: {
                MovieName: '',
                Introduce: '',
                Performer: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: ''
            },
            formLabelWidth: '140px',
            tableData: [
                {
                    MovieName: '热辣滚烫',
                    Introduce: '乐莹（贾玲 饰）宅家多年，无所事事。大学毕业工作了一段时间后，乐莹选择脱离社会，封闭社交圈层，这是她认为与自己“和解”的最好方式。一日，在命运的几番“捉弄”下，她决定要换一种方式生活。在与外面的世界小心翼翼的接触中，乐莹结识了拳击教练昊坤（雷佳音 饰）。当她以为生活即将步入正轨时，接踵而至的考验却远超她的想像，滚烫的人生才刚刚开始………',
                    Performer: '贾玲',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1'
                },
                {
                    MovieName: '飞驰人生2',
                    Introduce: '超欢乐！真刺激！好感动！沈腾领衔喜剧大片高口碑热映中！电影工业领先制作水平带来沉浸视听极致燃爽！一句“能扛住的，一起啊”送给五年前的你，这一次，不留一丝遗憾！ 昔日冠军车手张驰（沈腾 饰）沦为落魄驾校教练，过着靠脸吃饭勉强度日的生活。不料天上掉馅饼，濒临停产的老头乐车厂厂长（贾冰 饰）主动提出赞助张驰组建车队再闯最后一届巴音布鲁克拉力赛。面对这泼天的富贵，张驰蠢蠢欲动，而厂长背后真实的目的无人知晓……带资进队的车手厉小海（范丞丞 饰），看似单纯善良却为何有着与之身份毫不相符的超强天赋？ 张驰召集老朋友孙宇强（尹正 饰）和记星（张本煜 饰），与天才车手厉小海和总是考不过科目二的驾校学员刘显德（孙艺洲 饰）组成了一个苦中作乐、鸡飞狗跳的草台班子，克服重重困难，笑料百出地奔赴赛场。这一次他将超越无数次出现在梦中的终点线……',
                    Performer: '沈腾',
                    ReleaseTime: '2024-3-30',
                    StartTime: '20:30:00',
                    EndTime: '22:30:00',
                    Room: '1'
                },
                {
                    MovieName: '功夫熊猫4',
                    Introduce: '爷青回！《功夫熊猫》新作来袭！阿宝“升职”同时，新仇旧敌集结现身，大龙竟起死回生？狐狸小真身份神秘，到底有何心机？ 阿宝被师傅要求选出下一任神龙大侠，正苦恼如何应对时，阿宝昔日的手下败将们却纷纷重出江湖！身世神秘的狐狸小真告诉阿宝，这一切的幕后黑手正是邪恶女巫魅影妖后！阿宝能否打败魅影妖后，昔日敌人又为何再次现身？这次又会发生怎样的搞笑趣事？赶快带上亲朋好友，一起到影院寻找真相吧～',
                    Performer: '黄渤',
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
            this.form = {
                MovieName: '',
                Introduce: '',
                Performer: '',
                ReleaseTime: '',
                StartTime: '',
                EndTime: '',
                Room: ''
            };
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
