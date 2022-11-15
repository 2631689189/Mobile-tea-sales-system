<template>
  <div>
    <div class="crumbs">
        <el-breadcrumb separator="/">
            <el-breadcrumb-item>
                <i class="el-icon-lx-calendar"></i> 用户留言
            </el-breadcrumb-item>
        </el-breadcrumb>
    </div>
    <div class="container">
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
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column label="手机号">
                <template slot-scope="scope">{{scope.row.tel}}</template>
            </el-table-column>
            <el-table-column label="邮箱">
                <template slot-scope="scope">{{scope.row.email}}</template>
            </el-table-column>
            <el-table-column label="留言信息">
                <template slot-scope="scope">{{scope.row.propse}}</template>
            </el-table-column>
            <el-table-column label="操作" width="180" align="center">
                <template slot-scope="scope">
                    <el-button
                        type="text"
                        icon="el-icon-delete"
                        class="red"
                        @click="handleDelete(scope.row.id)"
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
  </div>
</template>

<script>
import { fetchNews,deleteeUserNews} from '../../api/index';
import qs from 'qs'
export default {
    name: 'Upload',
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
        getData() {
            fetchNews(this.query).then(res => {
                // console.log(res.list);
                this.tableData = res.list.list;
                this.pageTotal = res.pageTotal || 50;
            });
        },
        // 删除操作
        handleDelete(id) {
            let index = qs.stringify({
                indexid:id
            }) 
            // console.log('---',index);
            // 二次确认删除
            this.$confirm('确定要删除吗？', '提示', {
                type: 'warning'
            }).then(() => {
                deleteeUserNews(index).then(res => {
               if(res.status=200){
                this.$message.success(`删除成功`);
                this.$router.go(0)
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
        // 分页导航
        handlePageChange(val) {
            this.$set(this.query, 'pageIndex', val);
            this.getData();
        }
    }
};
</script>

<style scoped>
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
