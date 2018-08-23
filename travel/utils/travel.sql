/*
Navicat MySQL Data Transfer

Source Server         : rin
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-08-21 10:44:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `tId` int(11) NOT NULL,
  `uId` int(11) NOT NULL,
  `cTime` datetime NOT NULL,
  `cContent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tId`,`uId`,`cTime`),
  KEY `uid2` (`uId`),
  CONSTRAINT `uid2` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tid2` FOREIGN KEY (`tId`) REFERENCES `tourist` (`tId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('6', '1', '2018-06-12 10:03:30', '美啊');
INSERT INTO `comment` VALUES ('9', '2', '2018-07-04 12:04:28', '便宜实惠');
INSERT INTO `comment` VALUES ('14', '3', '2018-07-17 14:04:01', '好');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `hId` int(11) NOT NULL,
  `hName` varchar(255) DEFAULT NULL,
  `hArea` varchar(255) DEFAULT NULL,
  `hIntro` varchar(255) DEFAULT NULL,
  `hImg` varchar(255) DEFAULT NULL,
  `hPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1', '敦煌飞天大酒店', '敦煌', '敦煌飞天大酒店是涉外四星级酒店。酒店设计颇具汉唐风格，装修豪华，莫高浮雕，敦煌彩塑，名贵书画，敦煌文化氛围十分浓厚。酒店拥有总统套房、豪华商务套房、商务单间、标准间共133间。', 'imgs/敦煌飞天.jpg', '227.00');
INSERT INTO `hotel` VALUES ('2', '海口天利万豪酒店', '海口', '海口天利万豪国际大酒店坐落于海南省海口市西海岸，总建筑面积80000㎡。酒店是传统与现代相结合的建筑语言设计，是海口市的标志性建筑，是集餐饮会议、度假别墅和休闲健身于一体的、具有世界水平的滨海休闲度假胜地，可满足高标准商务休闲度假、住宿、餐饮、娱乐等多种要求。', 'imgs/海口天利万豪.jpg', '616.00');
INSERT INTO `hotel` VALUES ('3', '杭州黄龙亚朵', '杭州', '杭州滨江滨文路亚朵酒店位于浦沿路，酒店裙楼配套大型饮食购物中心——江南商业大厦盒作社，毗邻地铁4号线中医药大学站，出行方便快捷，滨江高教园区近在咫尺，有浙江中医药大学、浙江警察学院、浙江机电职业技术学院、浙江艺术职业学院、杭州医学院、浙江商业职业技术学院等。', 'imgs/杭州黄龙亚朵.jpg', '566.00');
INSERT INTO `hotel` VALUES ('4', '拉萨飞天大酒店', '拉萨', '兰州市人民政府驻拉萨办事处暨拉萨飞天国际酒店占地面积17亩，总建筑面积42700平方米，项目总投资约3.588亿元；是兰州市人民政府驻拉萨办事处办公和按五星级标准打造的综合型酒店，设有高中档客房200间、停车位116个，并设有甘肃特色展厅、游泳馆、保龄球馆等休闲娱乐场所', 'imgs/拉萨飞天.jpg', '280.00');
INSERT INTO `hotel` VALUES ('5', '南京弘阳大酒店', '南京', '南京弘阳酒店位于南京市浦口区北外滩最具人气和规模的超大型商业圈——弘阳广场，总建筑面积为14255平方米。酒店南临长江大桥，北靠高新经济开发区，百米之内汇集大型超市（沃尔玛）、果壳里、弘阳欢乐世界.', 'imgs/南京弘阳.jpg', '342.00');
INSERT INTO `hotel` VALUES ('6', '宁波香格里拉大酒店', '宁波', '宁波香格里拉大酒店是位于著名的海港城市——宁波市中心的五星级豪华大酒店。酒店波浪形的建筑与城市的中文名称“海定则波宁”之意相映成趣。 宁波香格里拉大酒店于2010年4月22日正式开业，酒店所有设施全部投入运营。', 'imgs/宁波香格里拉.jpg', '128.00');
INSERT INTO `hotel` VALUES ('7', '武汉万达瑞华大酒店', '武汉', '武汉万达瑞华酒店位于风光秀丽的东湖风景区，周围环绕着汉街、汉秀、万达电影乐园等购物休闲场所，距省委、省政府、武汉大学、湖北省博物馆仅5分钟车程，乘车至武汉著名旅游胜地黄鹤楼、户部巷、欢乐谷，也仅需10-15分钟。', 'imgs/武汉万达瑞华.jpg', '516.00');
INSERT INTO `hotel` VALUES ('8', '昆明翠湖宾馆', '云南', '翠湖宾馆位于风景秀丽、环境优美的翠湖旁。拥有16层共306间具有中西方文化特色的豪华间及高级套间，房间全部设有迷你酒吧、吹风机等。', 'imgs/昆明翠湖宾馆.jpg', '1038.00');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `tId` int(11) NOT NULL,
  `uId` int(11) NOT NULL,
  `oTime` datetime NOT NULL,
  `tName` varchar(255) DEFAULT NULL,
  `tPrice` decimal(10,2) DEFAULT NULL,
  `oNum` int(11) DEFAULT NULL,
  `stateId` int(1) DEFAULT NULL,
  `duringTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tId`,`uId`,`oTime`),
  KEY `uid3` (`uId`),
  KEY `tName3` (`tName`),
  KEY `tPrice3` (`tPrice`),
  CONSTRAINT `tPrice3` FOREIGN KEY (`tPrice`) REFERENCES `tourist` (`tPrice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tid3` FOREIGN KEY (`tId`) REFERENCES `tourist` (`tId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tName3` FOREIGN KEY (`tName`) REFERENCES `tourist` (`tName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid3` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('6', '1', '2018-06-08 10:17:08', '乐山大佛', '3000.00', '2', '3', '06月09日-06月12日');
INSERT INTO `order` VALUES ('9', '2', '2018-06-30 10:19:51', '桂林漓江', '4000.00', '1', '3', '07月01日-07月03日');
INSERT INTO `order` VALUES ('14', '3', '2018-07-10 10:21:39', '成都欢乐谷', '230.00', '3', '3', '07月16日-07月17日');

-- ----------------------------
-- Table structure for tourist
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `tId` int(11) NOT NULL,
  `tName` varchar(255) DEFAULT NULL,
  `tArea` varchar(255) DEFAULT NULL,
  `tIntro` varchar(255) DEFAULT NULL,
  `tImg` varchar(255) DEFAULT NULL,
  `tPrice` decimal(10,2) DEFAULT NULL,
  `tTime` varchar(255) DEFAULT NULL,
  `tTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`tId`),
  KEY `ttypeId` (`tTypeId`),
  KEY `tName` (`tName`),
  KEY `tPrice` (`tPrice`),
  CONSTRAINT `ttypeId` FOREIGN KEY (`tTypeId`) REFERENCES `tourist_type` (`tTypeId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
INSERT INTO `tourist` VALUES ('1', '北京故宫', '北京', '北京故宫被誉为世界五大宫之首（北京故宫、法国凡尔赛宫、英国白金汉\r\r\n宫、美国白宫、俄罗斯克里姆林宫），是国家AAAAA级旅游景区，1961年\r\r\n被列为第一批全国重点文物保护单位，1987年被列为世界文化遗产。', 'imgs/历史文化_北京故宫.jpg', '3250.00', '8:00-23:00', '2');
INSERT INTO `tourist` VALUES ('2', '北京长城', '北京', '长城，从东到西绵延万里；从古至今，其修筑延续二千多年。它那雄伟的\r\r\n风姿、美学的价值、防御的功能及所蕴含的军事谋略，都是世界文化遗留\r\r\n中少见的。它是世界的奇迹，是个伟大的奇迹，因为它深受各国人民的仰\r\r\n慕和赞叹。', 'imgs/历史文化_北京长城.jpg', '3250.00', '8:00-21:00', '2');
INSERT INTO `tourist` VALUES ('3', '都江堰青城山', '都江堰', '青城山都江堰风景名胜是国家AAAAA旅游景区；2000年被列为世界文化遗\r\r\n产，2006年作为四川大熊猫栖息地的一部分被列入世界自然遗产名录。青\r\r\n城山靠岷山雪岭，面向川西平原，群峰环绕，状若城廓；林深树密，四季\r\r\n常绿；丹梯千级，曲径通幽。全山以幽洁取胜，与剑门之险，峨眉之秀，\r\r\n夔门之雄齐名。', 'imgs/历史文化_都江堰青城山.jpg', '2550.00', '8:00-22:00', '2');
INSERT INTO `tourist` VALUES ('4', '敦煌莫高窟', '敦煌', '敦煌莫高窟是甘肃省敦煌市境内的莫高窟、西千佛洞的总称，是我国著名\r\r\n的四大石窟之一，也是世界上现存规模最宏大，保存最完好的佛教艺术宝\r\r\n库。', 'imgs/历史文化_敦煌莫高窟.jpg', '4500.00', '6:00-22:00', '2');
INSERT INTO `tourist` VALUES ('5', '江苏淮安', '江苏', '淮安至今已有2200多年的历史。秦时置县，境内有著名的“青莲岗文化”遗\r\r\n址。曾是漕运枢纽、盐运要冲，驻有漕运总督府、江南河道总督府。历史\r\r\n上与苏州、杭州、扬州并称运河沿线的“四大都市”，有“中国运河之都”的\r\r\n美誉。中国大运河淮安段入选世界遗产名录。', 'imgs/历史文化_江苏淮安.jpg', '2500.00', '7:00-21:00', '2');
INSERT INTO `tourist` VALUES ('6', '乐山大佛', '乐山', '乐山大佛，又名凌云大佛，位于四川省乐山市南岷江东岸凌云寺侧，濒大\r\r\n渡河、青衣江和岷江三江汇流处。大佛为弥勒佛坐像，通高71米，是中国\r\r\n最大的一尊摩崖石刻造像。', 'imgs/历史文化_乐山大佛.jpg', '3000.00', '7:00-22:00', '2');
INSERT INTO `tourist` VALUES ('7', '福建惠安', '福建', '惠安风俗，含岁时节日、衣食住行、婚丧喜庆、行业习俗、信仰崇拜、礼\r\r\n仪风尚等等，是经过千百年来古越族文化、中原文化以及海外华侨长期交\r\r\n融，嬗变而逐渐形成的，颇具闽南侨乡特色的民俗风情，显得古朴淳厚，\r\r\n而又五彩缤纷。', 'imgs/民俗风情_福建惠安.jpg', '2300.00', '6:00-23:00', '4');
INSERT INTO `tourist` VALUES ('8', '广东西樵山', '广东', '西樵山（Xiqiao Mountain）风景名胜区是广东四大名山之一，享有国家\r\r\nAAAAA级旅游景区、中国国家森林公园、中国国家地质公园、国家重点风\r\r\n景名胜区、“珠江文明的灯塔” 等荣誉。', 'imgs/民俗风情_广东西樵山.jpg', '3500.00', '6:00-23:00', '4');
INSERT INTO `tourist` VALUES ('9', '桂林漓江', '桂林', '漓江，属珠江流域西江水系，为支流桂江上游河段的通称，位于广西壮族\r\r\n自治区东北部。灵渠河口为桂江大溶江段和漓江段的分界点，荔浦河、恭\r\r\n城河口为漓江段和桂江段的分界点。', 'imgs/民俗风情_桂林漓江.jpg', '4000.00', '6:00-21:00', '4');
INSERT INTO `tourist` VALUES ('10', '沈阳满族民俗村', '沈阳', '满族民俗村有全国第一家满族民俗博物馆，展示清朝入关前，满族人民的\r\r\n历史、生产、生活、民间艺术的发展过程；还修建了青砖小瓦、泥坯草房\r\r\n的满族民居，以及充分体现满族特色的石牌坊、图腾柱、努尔哈赤铜像等\r\r\n等。', 'imgs/民俗风情_沈阳满族民俗村.jpg', '3500.00', '6:00-23:00', '4');
INSERT INTO `tourist` VALUES ('11', '\r\n厦门老院', '厦门', '厦门老院子景区属于国家AAAA级旅游景区，包括“老院子民俗文化风情园”\r\r\n和《闽南传奇》秀的两部分，为厦门市重大项目和福建省文化产业十大重\r\r\n点项目。', 'imgs/民俗风情_厦门老院.jpg', '3500.00', '7:00-23:00', '4');
INSERT INTO `tourist` VALUES ('12', '黄山西递宏村', '黄山', '西递、宏村为世界文化遗产，也是国家AAAAA级旅游景区。西递、宏村位\r\r\n于安徽省黄山市黟县，是安徽南部民居中最具有代表性的两座古村落，以\r\r\n世外桃源般的田园风光、保存完好的村落形态、工艺精湛的徽派民居和丰\r\r\n富多彩的历史文化内涵而闻名天下，被誉为\"画中的村庄\"。', 'imgs/民俗风情_黄山西递宏村.jpg', '4000.00', '6:00-21:00', '4');
INSERT INTO `tourist` VALUES ('13', '北京西游记公园', '北京', '以西游记小说内的场景为装修主题，花果山、水帘洞等场景让您仿佛身入\r\r\n幽境，置身于一个中国的神话世界，重拾一颗年轻的赤子之心，力求让每\r\r\n一位顾客都心满意满满载而归。西游记主题公园还在修缮过程中，目前是\r\r\n免费的，部分儿童游乐设施收费，但是不多。', 'imgs/主题公园_北京西游记.jpg', '100.00', '6:00-21:00', '3');
INSERT INTO `tourist` VALUES ('14', '成都欢乐谷', '成都', '欢乐谷连锁品牌，创立于1998年10月1日，是国家首批5A级旅游景区——\r\r\n华侨城旅游的核心产品之一，中国主题公园第一品牌。成都欢乐谷2009年1\r\r\n月18日正式开园营业，品牌理念是“创造欢乐、传递欢乐、分享欢乐”，“动\r\r\n感、视尚、激情”则是它的品牌个性。', 'imgs/主题公园_成都欢乐谷.jpg', '230.00', '7:00-21:00', '3');
INSERT INTO `tourist` VALUES ('15', '哈尔滨冰雪大世界', '哈尔滨', '中国哈尔滨冰雪大世界始创于1999年，是由黑龙江省哈尔滨市政府为迎接\r\r\n千年庆典神州世纪游活动，凭借哈尔滨的冰雪时节优势，而推出的大型冰\r\r\n雪艺术精品工程，展示了北方名城哈尔滨冰雪文化和冰雪旅游魅力。', 'imgs/主题公园_哈尔滨冰雪大世界.jpg', '400.00', '6:00-22:00', '3');
INSERT INTO `tourist` VALUES ('16', '上海迪士尼', '上海', '乐园拥有七大主题园区：米奇大街、奇想花园、探险岛、宝藏湾、明日世\r\r\n界、梦幻世界、玩具总动员；两座主题酒店：上海迪士尼乐园酒店、玩具\r\r\n总动员酒店；一座地铁站：迪士尼站；并有许多全球首发游乐项目。', 'imgs/主题公园_上海迪士尼.jpg', '1000.00', '9:00-23:00', '3');
INSERT INTO `tourist` VALUES ('17', '香港迪士尼', '香港', '乐园分为7个主题园区，分别为：美国小镇大街、探险世界、幻想世界、明\r\r\n日世界、玩具总动员大本营、灰熊山谷及迷离庄园，其中灰熊山谷和迷离\r\r\n庄园为全球独有。园区内设有主题游乐设施、娱乐表演、互动体验、餐饮\r\r\n服务、商品店铺及小食亭。此外，乐园每天晚上会呈献巡游表演节目及烟\r\r\n花汇演。', 'imgs/主题公园_香港迪士尼.jpg', '1000.00', '9:00-23:00', '3');
INSERT INTO `tourist` VALUES ('18', '郑州恐龙公园', '郑州', '郑州中华恐龙园规划占地700余亩，与常州中华恐龙园面积相当，该项目除\r\r\n了参照常州中华恐龙园原汁原味的规划设计，为游客还原一个侏罗纪时代\r\r\n冒险、游乐的体验王国，重点项目还将结合中原文化与地域特点进行内涵\r\r\n挖掘，打造当地地缘文化的专属特色区域。', 'imgs/主题公园_郑州恐龙公园.jpg', '200.00', '7:00-22:00', '3');
INSERT INTO `tourist` VALUES ('19', '九寨沟', '四川', '九寨沟县，隶属于四川省阿坝藏族羌族自治州，位于青藏高原东部边缘，\r\r\n阿坝州东北部。东、北与甘肃省文县、舟曲县、迭部县交界，西、南与四\r\r\n川省若尔盖县、平武县、松潘县接壤。', 'imgs/自然风景_九寨沟.jpg', '2500.00', '6:00-23:00', '1');
INSERT INTO `tourist` VALUES ('20', '青藏高原', '西藏', '青藏高原（Qinghai-Tibet Plateau）是中国最大、世界海拔最高的高原，\r\r\n被称为“世界屋脊”、“第三极”，南起喜马拉雅山脉南缘，北至昆仑山、阿\r\r\n尔金山和祁连山北缘，西部为帕米尔高原和喀喇昆仑山脉，东及东北部与\r\r\n秦岭山脉西段和黄土高原相接。', 'imgs/自然风景_青藏高原.jpg', '3000.00', '9:00-22:00', '1');
INSERT INTO `tourist` VALUES ('21', '三峡', '四川', '长江流经四川盆地东缘时冲开崇山峻岭，夺路奔流形成了壮丽雄奇、举世\r\r\n无双的大峡谷，即长江三峡。三峡西起重庆市奉节县的白帝城，东至湖北\r\r\n省宜昌市的南津关，由瞿塘峡、巫峡、西陵峡组成。', 'imgs/自然风景_三峡.jpg', '1500.00', '9:00-20:00', '1');
INSERT INTO `tourist` VALUES ('22', '三亚', '海南', '三亚是具有热带海滨风景特色的国际旅游城市，又被称为“东方夏威夷”。\r\r\n2016年6月14日，中国科学院对外发布《中国宜居城市研究报告》，三亚\r\r\n宜居指数在全国40个城市中位居第三。', 'imgs/自然风景_三亚.jpg', '4000.00', '6:00-23:00', '1');
INSERT INTO `tourist` VALUES ('23', '厦门鼓浪屿', '厦门', '鼓浪屿风景名胜区获得国家5A级旅游景区、全国重点文物保护单位、中国\r\r\n最美五大城区等荣誉。2017年7月8日，“鼓浪屿：国际历史社区”被列入世\r\r\n界遗产名录，成为中国第52项世界遗产项目。', 'imgs/自然风景_厦门鼓浪屿.jpg', '3000.00', '6:00-23:00', '1');
INSERT INTO `tourist` VALUES ('24', '\r\n\r\n西双版纳', '云南', '西双版纳有中国唯一的热带雨林自然保护区，气候温暖湿润，树木葱茏，\r\r\n蔓藤盘根错节，不少珍禽异兽，如亚洲象，犀鸟，孔雀，黑冠长臂猿都生\r\r\n活在这片热带丛林里。而西双版纳特有和稀有的植物中有望天树、红光树\r\r\n、云南肉豆蔻、四薮木、黄果木、胡桐、美登木、三尖杉等等。', 'imgs/自然风景_西双版纳.jpg', '4000.00', '6:00-23:00', '1');

-- ----------------------------
-- Table structure for tourist_type
-- ----------------------------
DROP TABLE IF EXISTS `tourist_type`;
CREATE TABLE `tourist_type` (
  `tTypeId` int(11) NOT NULL,
  `tTypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist_type
-- ----------------------------
INSERT INTO `tourist_type` VALUES ('1', '自然风景');
INSERT INTO `tourist_type` VALUES ('2', '历史文化');
INSERT INTO `tourist_type` VALUES ('3', '主题公园');
INSERT INTO `tourist_type` VALUES ('4', '民俗风情');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uId` int(11) NOT NULL,
  `uName` varchar(255) DEFAULT NULL,
  `uSex` varchar(255) DEFAULT NULL,
  `uTel` varchar(255) DEFAULT NULL,
  `uIDCard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小明', '男', '13745887342', '198726198406293816');
INSERT INTO `user` VALUES ('2', '小红', '女', '15608237591', '312482199203154789');
INSERT INTO `user` VALUES ('3', '小中', '男', '13538266492', '527782198702137482');
INSERT INTO `user` VALUES ('4', '小华', '女', '17427462817', '512472199206173281');
