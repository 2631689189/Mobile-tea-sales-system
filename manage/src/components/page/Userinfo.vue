<template>
  <div>
    <div class="crumbs">
        <el-breadcrumb separator="/">
            <el-breadcrumb-item>
                <i class="el-icon-lx-people"></i> 用户信息
            </el-breadcrumb-item>
        </el-breadcrumb>
    </div>
    <div class="container">
        <div class="handle-box">
            <el-input v-model="query.name" placeholder="用户手机号" class="handle-input mr10"></el-input>
            <el-button type="primary" icon="el-icon-search" @click="handleSearch">搜索</el-button>
        </div>
        <el-table
            :data="tableData"
            border
            class="table"
            ref="multipleTable"
            header-cell-class-name="table-header"
            @selection-change="handleSelectionChange"
        >
            <el-table-column type="selection" width="55" align="center"></el-table-column>
            <el-table-column prop="id" label="ID" width="55" align="center"></el-table-column>
            <el-table-column prop="nickName" label="姓名"></el-table-column>
            <el-table-column label="手机号">
                <template slot-scope="scope">{{scope.row.tel}}</template>
            </el-table-column>
            <el-table-column label="头像" align="center">
                <template slot-scope="scope">
                    <el-image
                        class="table-td-thumb"
                        :src="scope.row.imgUrl"
                        :preview-src-list="[scope.row.thumb]"
                    ></el-image>
                </template>
            </el-table-column>
            <el-table-column label="密码">
                <template slot-scope="scope">{{scope.row.pwd}}</template>
            </el-table-column>
            <el-table-column label="操作" width="180" align="center">
                <template slot-scope="scope">
                    <el-button
                        type="text"
                        icon="el-icon-edit"
                        @click="handleEdit(scope.row.id, scope.row)"
                    >编辑</el-button>
                    <el-button
                        type="text"
                        icon="el-icon-delete"
                        class="red"
                        @click="handleDelete(scope.row.id, scope.row)"
                    >删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <div class="pagination">
            <el-pagination
                background
                layout="total, prev, pager, next"
                :current-page="query.pageIndex"
                :page-size="query.pageSize"
                :total="pageTotal"
                @current-change="handlePageChange"
            ></el-pagination>
        </div>
    </div>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="30%">
        <el-form ref="form" :model="form" label-width="70px">
            <el-form-item label="姓名">
                <el-input v-model="form.nickName"></el-input>
            </el-form-item>
            <el-form-item label="手机号">
                <el-input v-model="form.tel"></el-input>
            </el-form-item>
            <el-form-item label="头像">
                <el-input v-model="form.imgUrl"></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input v-model="form.pwd"></el-input>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="editVisible = false">取 消</el-button>
            <el-button type="primary" @click="saveEdit">确 定</el-button>
        </span>
    </el-dialog>
  </div>
</template>

<script>
import { fetchUser,editdataUser,deleteeUser,searchtel } from '../../api/index';
import qs from 'qs'
export default {
    name: 'basetable',
    data() {
        return {
            query: {
                address: '',
                name: '',
                pageIndex: 5,
                pageSize: 10,
                numbe:'',
                states:'',
                price:'',
                imgUrl:''
            },
            tableData: [],
            multipleSelection: [],
            delList: [],
            editVisible: false,
            pageTotal: 0,
            form: {},
            idx: -1,
            id: -1
        };
    },
    created() {
        this.getData();
    },
    methods: {
        // 获取 easy-mock 的模拟数据
        getData() {
            fetchUser(this.query).then(res => {
                // console.log(res.list);
                this.tableData = res.list.list;
                this.pageTotal = res.pageTotal || 50;
            });
        },
        // 触发搜索按钮
        handleSearch() {
            let namex = qs.stringify({
                name:this.query.name
            })
            searchtel(namex).then(res => {
                this.tableData = res.data;
                this.$message.success(`搜索成功`);
            })
        },
        // 删除操作
        handleDelete(id, row) {
            let index = qs.stringify({
                indexid:id
            }) 
            // console.log('---',index);
            // 二次确认删除
            this.$confirm('确定要删除吗？', '提示', {
                type: 'warning'
            }).then(() => {
                deleteeUser(index).then(res => {
               if(res.status=200){
                this.$message.success(`删除成功`);
               }
            })
            })
            .catch(()=>{
                this.$message.success(`取消删除`);
            })
        },
        // 多选操作
        handleSelectionChange(val) {
            this.multipleSelection = val;
        },
        delAllSelection() {
            const length = this.multipleSelection.length;
            let str = '';
            this.delList = this.delList.concat(this.multipleSelection);
            for (let i = 0; i < length; i++) {
                str += this.multipleSelection[i].name + ' ';
            }
            this.$message.error(`删除了${str}`);
            this.multipleSelection = [];
        },
        // 编辑操作
        handleEdit(index, row) {
            this.idx = index;
            this.form = row;
            this.editVisible = true;
        },
        // 保存编辑
        saveEdit() {
            this.editVisible = false;
            let data = qs.stringify(this.form)
            editdataUser(data).then(res => {
                this.$message.success(`修改成功`);
            });
        },
        // 分页导航
        handlePageChange(val) {
            this.$set(this.query, 'pageIndex', val);
            this.getData();
        }
    }
};
</script>

<style  scoped>
.handle-box {
    margin-bottom: 20px;
}

.handle-select {
    width: 120px;
}

.handle-input {
    width: 300px;
    display: inline-block;
}
.table {
    width: 100%;
    font-size: 14px;
}
.red {
    color: #ff0000;
}
.mr10 {
    margin-right: 10px;
}
.table-td-thumb {
    display: block;
    margin: auto;
    width: 40px;
    height: 40px;
}
</style>
