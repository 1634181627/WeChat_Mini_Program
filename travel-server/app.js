//创建相关模块
var express=require('express');
//创建app对象
var app=express();
//指定模板引擎
app.set('views engine','ejs');
//指定模板位置
app.set('views',__dirname+'/views');
//1, 引入模块
//1,利用模板文件index.ejs渲染为html
//设置静态文件
app.use(express.static('public'));
//post提交
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({ extended: false });

var  Carousel=require("./Dao/Carousel");
Carousel=new Carousel();
Carousel.init();
var  User=require("./Dao/User");
User=new User();
User.init();
var  Hotel=require("./Dao/Hotel");
Hotel=new Hotel();
Hotel.init();
var  Tourist=require("./Dao/Tourist");
Tourist=new Tourist();
Tourist.init();
var  Tourist_type=require("./Dao/Tourist_type");
Tourist_type=new Tourist_type();
Tourist_type.init();

var  Order=require("./Dao/Order");
Order=new Order();
Order.init();
var  Manager=require("./Dao/Manager");
Manager=new Manager();
Manager.init();
app.get('/index',function (req,res) {
    // 订单查询
    // var sqlorder="SELECT * FROM  `order`";
    // Order.queryAll(sqlorder,function (data) {
    //     console.log(1111111111)
    //     console.log(data);
    //     console.log(22222222)
    // })


    // Carousel.insert('imgs/轮播图3.jpg')
    // var userGetSql = 'DELETE FROM carousel where tid = 8';

    var sqlcarousel="select * from carousel";
    var sqlUser="select * from user";
    var sqlhotel="select * from hotel";
    var sqltourist="select * from tourist";
    var sqlTourist_type="select * from tourist_type";
    //修改
    // var userModSql_Params=['imgs/轮播图1.jpg',1];
    // Carousel.updata(userModSql_Params);
    // 插入
    // Carousel.insert('imgs/轮播图3.jpg')
    // var userGetSql = 'DELETE FROM carousel where tid = 8';
    // Carousel.delete(userGetSql);

    function Resqponse(carousel,user,hotel,tourist,tourist_type) {
        this.carousel=carousel;
        this.user=user;
        this.hotel=hotel;
        this.tourist=tourist;
        this.tourist_type=tourist_type;
    }
    // var userGetSql = 'DELETE FROM user where uId = 0';
    // User.delete(userGetSql);
    // User.insert(5,'小王','男','15587954635','464444644');
    Carousel.queryAll(sqlcarousel,function (carousel) {
        User.queryAll(sqlUser,function (user) {
            console.log(user)
            Hotel.queryAll(sqlhotel,function (hotel) {
                Tourist.queryAll(sqltourist,function (tourist) {
                    Tourist_type.queryAll(sqlTourist_type,function (tourist_type) {
                        var response=new Resqponse(carousel,user,hotel,tourist,tourist_type);
                        // console.log(response)
                        res.end(JSON.stringify(response));
                    })

                })

            })
        })



    });


});
app.get('/blank',function (req,res) {
    res.render('blank',{

    })
})

//用户显示
app.get('/user',function (req,res) {
    var sqlUser="select * from user";
    User.queryAll(sqlUser,function (data) {
        var response={
            result:data
        };
        // console.log(data)
        res.end(JSON.stringify(response));
    })


})
//用户查询
app.post('/changeUser',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var sqlUser="select * from user WHERE uId="+id;
    User.queryAll(sqlUser,function (data) {
        var response={
            result:data
        }
        res.end(JSON.stringify(response));
    })
})
//用户修改保存
app.post('/updataUser',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var namea=req.body.namea;
    var sexa=req.body.sexa;
    var tela=req.body.tela;
    var carda=req.body.carda;
    var code=0;
    var userModSql_Params=[namea,sexa,tela,carda,id];
    User.updata(userModSql_Params);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));


})
//删除用户
app.post('/deleteUser',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var code=0;
    var userGetSql = 'DELETE FROM user where uId ='+id;
    User.delete(userGetSql);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));

})

//用户添加
app.post('/checkblank',urlencodedParser,function (req,res) {
    var name=req.body.name;
    var sex=req.body.sex;
    var tel=req.body.tel;
    var card=req.body.card;
    var code=0;
    User.insert(name,sex,tel,card,function (data) {
        code=code+1;
        var result={
            id:data.insertId,
            code:code
        }
        res.end(JSON.stringify(result));
    });






})
app.get('/login',function (req,res) {
    res.render('login',{

    })
})
//账户检查
app.post('/checkLogin',urlencodedParser,function (req,res) {

    var account=req.body.account;
    var password=req.body.password;
    var sql="select * from manager";
    var code="";
    Manager.queryAll(sql,function (data) {
        var length=data.length;
        for(var i=0;i<length;i++){
            if(account==data[i].mAccount&&password==data[i].mPassword){
                code=code+1;
            }else{
                code=code+0;
            }
        }
        var result={
            result:code
        }
        res.end(JSON.stringify(result));
    })

})
//景点查询
app.get('/tourist',function (req,res) {
    var sqlTourist="select * from tourist";
    Tourist.queryAll(sqlTourist,function (data) {
        var response={
            result:data
        };
        console.log(data)
        res.end(JSON.stringify(response));
    })


})
//景点添加
app.post('/addTourist',urlencodedParser,function (req,res){
    var name=req.body.name;
    var area=req.body.area;
    var img=req.body.img;
    var price=req.body.price;
    var time=req.body.time;
    var intro=req.body.intro;
    var type=req.body.type;
    var code=0;
    Tourist.insert(name,area,intro,img,price,time,type,function (data) {
        code=code+1;
        var result={
            id:data.insertId,
            code:code
        }
        res.end(JSON.stringify(result));
    });

})
//景点修改查询
app.post('/changeTourist',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var sql="select * from tourist WHERE tId="+id;
    Tourist.queryAll(sql,function (data) {
        var response={
            result:data
        }
        res.end(JSON.stringify(response));
    })
})
//景点修改保存
app.post('/updataTourist',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var name=req.body.name;
    var area=req.body.area;
    var img=req.body.img;
    var price=req.body.price;
    var time=req.body.time;
    var intro=req.body.intro;
    var type=req.body.type;
    var code=0;
    var userModSql_Params=[name,area,intro,img,price,time,type,id];
    Tourist.updata(userModSql_Params);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));
});
//景点删除保存
app.post('/deleteTourists',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var code=0;
    var userGetSql = 'DELETE FROM Tourist where tId ='+id;
    Tourist.delete(userGetSql);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));

})
//景点类型查询
app.get('/TouristType',function (req,res) {
    var sqlTouristType="select * from tourist_type";
    Tourist_type.queryAll(sqlTouristType,function (data) {
        var response={
            result:data
        };

        res.end(JSON.stringify(response));
    })


})
//景点类型添加
app.post('/addTouristType',urlencodedParser,function(req,res) {
    var name=req.body.name;
    var code=0;
    Tourist_type.insert(name,function (data) {
        code=code+1;
        var result={
            id:data.insertId,
            code:code
        }
        res.end(JSON.stringify(result));
    });
});
//景点类型修改查询
app.post('/changeTouristType',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var sql="select * from tourist_type WHERE tTypeId="+id;
    Tourist_type.queryAll(sql,function (data) {
        var response={
            result:data
        }
        res.end(JSON.stringify(response));
    })
})
//景点类型修改保存
app.post('/updateTouristType',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var name=req.body.name;
    var code=0;
    var userModSql_Params=[name,id];
    Tourist_type.updata(userModSql_Params);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));
});
//景点类型删除保存
app.post('/deleteTouristTypes',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var code=0;
    var userGetSql = 'DELETE FROM tourist_type where tTypeId ='+id;
    Tourist_type.delete(userGetSql);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));

})
//酒店查询显示
app.get('/Hotel',function (req,res) {
    var sqlHotel="select * from hotel";
    Hotel.queryAll(sqlHotel,function (data) {
        var response={
            result:data
        };
        console.log(data)
        res.end(JSON.stringify(response));
    })
})
    //添加酒店

app.post('/addHotel',urlencodedParser,function (req,res){
        var name=req.body.name;
        var area=req.body.area;
        var img=req.body.img;
        var price=req.body.price;
        var intro=req.body.intro;
        var code=0;
        console.log(name)
        Hotel.insert(name,area,intro,img,price,function (data) {
            code=code+1;
            var result={
                id:data.insertId,
                code:code
            }
            console.log(1111111)
            res.end(JSON.stringify(result));
        });

    })
//修改酒店查询
app.post('/changeHotel',urlencodedParser,function (req,res){
    var id=req.body.id;
    var sql="select * from hotel WHERE hId="+id;
    Hotel.queryAll(sql,function (data) {
        var response={
            result:data
        }
        console.log(11111)
        console.log(data)
        res.end(JSON.stringify(response));
    })

})
//酒店修改保存
app.post('/updateHotel',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var name=req.body.name;
    var area=req.body.area;
    var img=req.body.img;
    var price=req.body.price;
    var intro=req.body.intro;
    var code=0;
    var userModSql_Params=[name,area,intro,img,price,id];
    Hotel.updata(userModSql_Params);
    code=code+1;
    var response={
        code:code
    }
    console.log(111111)
    res.end(JSON.stringify(response));
});
//酒店删除保存
app.post('/deleteHotels',urlencodedParser,function (req,res) {
    var id=req.body.id;
    var code=0;
    var userGetSql = 'DELETE FROM hotel where hId ='+id;
    Hotel.delete(userGetSql);
    code=code+1;
    var response={
        code:code
    }
    res.end(JSON.stringify(response));

})
//订单查询显示
app.get('/Order',function (req,res) {
    var sqlorder="SELECT * FROM  `order`";
    Order.queryAll(sqlHotel,function (data) {
        var response={
            result:data
        };
        console.log(data)
        res.end(JSON.stringify(response));
    })
})
app.listen(8088);
