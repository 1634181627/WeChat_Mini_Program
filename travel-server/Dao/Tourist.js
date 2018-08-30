function Tourist() {
        var connection;
        this.init = function () {
            var mysql = require('mysql');  //调用MySQL模块

            //1，创建一个connection
            connection = mysql.createConnection({
                host: 'localhost',       //主机 ip
                user: 'root',            //MySQL认证用户名
                password: 'root',                //MySQL认证用户密码
                port: '3306',                 //端口号
                database: 'travel'          //数据库里面的数据
            });
            //2,连接
            connection.connect();
        }
        //插入操作
        this.insert=function (tName,tArea,tIntro,tImg,tPrice,tTime,tTypeId,call) {
            //1,编写sql语句
            var  userAddSql = 'INSERT INTO tourist(tName,tArea,tIntro,tImg,tPrice,tTime,tTypeId) VALUES(?,?,?,?,?,?,?)';
            var  userAddSql_Params = [tName,tArea,tIntro,tImg,tPrice,tTime,tTypeId];
            //2,进行插入操作
            /**
             *query，mysql语句执行的方法
             * 1，userAddSql编写的sql语句
             * 2，userAddSql_Params，sql语句中的值
             * 3，function (err, result)，回调函数，err当执行错误时，回传一个err值，当执行成功时，传回result
             */
            connection.query(userAddSql,userAddSql_Params,function (err, result) {
                if(err){
                    console.log('[INSERT ERROR] - ',err.message);
                    return;
                }
                call(result);
            });

        }
        //查询操作
        this.queryAll = function (sql,call) {
            connection.query(sql, function (err, result) {
                if (err) {
                    console.log('[SELECT ERROR] - ', err.message);
                    return;
                }
                call(result);
            });

        }
        //更新
        this.updata=function (userModSql_Params) {
            //4,编写sql语句
            var userModSql = 'UPDATE tourist SET tName=?,tArea=?,tIntro=?,tImg=?,tPrice=?,tTime=?,tTypeId=?  WHERE tId = ?';
            //5，更新操作
            connection.query(userModSql,userModSql_Params,function (err, result) {
                if(err){
                    console.log('[INSERT ERROR] - ',err.message);
                    return;
                }
            });
        }
        //删除
        this.delete=function (userGetSql) {
            /**
             * 1，userGetSql，sql语句
             * 2，function (err, result)，回调函数，err当执行错误时，回传一个err值，当执行成功时，传回result
             */
            connection.query(userGetSql,function (err, result) {
                if(err){
                    console.log('[INSERT ERROR] - ',err.message);
                    return;
                }
            });
        }
}
module.exports = Tourist;