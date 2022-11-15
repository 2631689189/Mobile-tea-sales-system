// 导入加密
const bcrypt = require('bcryptjs')

//验证数据库中的用户相关内容
const User = {
	//查询用户手机号
	queryUserTel(option) {

		return 'select * from my_db_01.ev_users where tel = ' + option.userTel + '';

	},
	//查询密码
	queryUserPwd(option) {
		// bcrypt.compareSync(userinfo.password, results[0].password)
		// return `select * from my_db_01.ev_users where tel = '${option.userTel}'  and pwd = '${option.userPwd}'`;
		return `select * from my_db_01.ev_users where tel = '${option.userTel}'`;
	},
	//新增用户
	inserData(option) {

		// 对用户的密码,进行 bcrype 加密，返回值是加密之后的密码字符串
		// userinfo.password = bcrypt.hashSync(userinfo.password, 10)

		let userTel = option.userTel;
		// let userPwd = option.userPwd || '666666';
		let userPwd = bcrypt.hashSync(option.userPwd || '666666', 10);
		// console.log('加密后的密码', userPwd);
		//引入token包
		let jwt = require('jsonwebtoken');
		//用户信息
		let payload = { tel: userTel };
		//口令
		let secret = 'xiaoluxian';
		//生成token
		let token = jwt.sign(payload, secret);
		// console.log(token);

		return 'insert into my_db_01.ev_users (tel,pwd,imgUrl,nickName,token) values ("' + userTel + '","' + userPwd + '","/images/user.jpeg","' + userTel + '","' + token + '")';
	}
}
exports = module.exports = User;