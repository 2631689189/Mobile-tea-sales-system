<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-calendar"></i> 表单
                </el-breadcrumb-item>
                <el-breadcrumb-item>添加商品</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="form-box">
                <el-form ref="form" :model="form" label-width="80px">
                    <el-form-item label="商品名称">
                        <el-input v-model="form.name"></el-input>
                    </el-form-item>
                    <el-form-item label="售价">
                        <el-input v-model="form.price"></el-input>
                    </el-form-item>
                    <el-form-item label="图片地址">
                        <el-input v-model="form.imgUrl"></el-input>
                    </el-form-item>
                    <el-form-item label="库存">
                        <el-input v-model="form.numbe"></el-input>
                    </el-form-item>
                    <el-form-item label="状态">
                        <el-input v-model="form.states"></el-input>
                    </el-form-item>
                    <el-form-item label="分类">
                        <el-input v-model="form.typeof"></el-input>
                    </el-form-item>
                    <el-form-item label="编号">
                        <el-input v-model="form.identifier"></el-input>
                    </el-form-item>
                    <el-form-item label="详情介绍">
                        <el-input type="textarea" rows="5" v-model="form.desc"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit">表单提交</el-button>
                        <el-button>取消</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</template>

<script>
import { addedit } from '../../api/index';
import qs from 'qs'
export default {
    name: 'baseform',
    data() {
        return {
            form: {
                name: '',
                price: '',
                imgUrl:'',
                numbe:'',
                states:'',
                delivery: true,
                desc: '',
                typeof:'',
                identifier:'',
                options: []
            }
        };
    },
    methods: {
        onSubmit() {
            let data = qs.stringify(this.form)
            addedit(data).then(res => {
                this.$message.success('添加成功');
                this.form.name=''
                this.form.price=''
                this.form.imgUrl=''
                this.form.numbe=''
                this.form.states=''
                this.form.desc=''
                this.form.typeof=''
                this.form.identifier=''
            })
        }
    }
};
</script>