/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-12-28 19:35:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_advice
-- ----------------------------
DROP TABLE IF EXISTS `tb_advice`;
CREATE TABLE `tb_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `createDate` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `tb_advice_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_advice
-- ----------------------------
INSERT INTO `tb_advice` VALUES ('1', '吖吖，你在哪', '2017-12-25 17:09:06', '吖吖', '2');
INSERT INTO `tb_advice` VALUES ('2', '二吖', '2017-12-15 20:14:12', '二傻', '4');

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept` VALUES ('1', '财务部', '管理工作营收状况和员工工资福利');
INSERT INTO `tb_dept` VALUES ('2', 'IT部', '负责公司设备软硬件的维护开发');
INSERT INTO `tb_dept` VALUES ('3', '人力资源部', '负责企业文化宣传，招聘，新员工入职，离职培训等');

-- ----------------------------
-- Table structure for tb_doc
-- ----------------------------
DROP TABLE IF EXISTS `tb_doc`;
CREATE TABLE `tb_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `remark` text,
  `title` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqotp8dpcld7dkdg84wnh0sbyn` (`uid`),
  CONSTRAINT `FKqotp8dpcld7dkdg84wnh0sbyn` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_doc
-- ----------------------------
INSERT INTO `tb_doc` VALUES ('1', '2017-12-27 02:48:00', '16.jpg', '带你去旅行', '吖吖', '2');
INSERT INTO `tb_doc` VALUES ('4', '2017-12-27 03:00:27', '1.jpg', '11', '11', '2');

-- ----------------------------
-- Table structure for tb_employee
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `cardId` varchar(100) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `hobby` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `party` varchar(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `postCode` varchar(10) DEFAULT NULL,
  `qqNum` varchar(12) DEFAULT NULL,
  `race` varchar(20) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `jid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20rb7xemki9d1uelw062oj32x` (`did`),
  KEY `FKqw823gjf4xdm6hnf69oe5ec7h` (`jid`),
  KEY `FKjqdy99v1y0j83xutkf7umtwwl` (`uid`),
  CONSTRAINT `FK20rb7xemki9d1uelw062oj32x` FOREIGN KEY (`did`) REFERENCES `tb_dept` (`id`),
  CONSTRAINT `FKjqdy99v1y0j83xutkf7umtwwl` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `FKqw823gjf4xdm6hnf69oe5ec7h` FOREIGN KEY (`jid`) REFERENCES `tb_job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------
INSERT INTO `tb_employee` VALUES ('1', '云南省-丽江市-古城区', '2017-12-01 00:00:00', '123456789321532132', '2017-12-21 16:50:38', '教授', 'wangwu@fwefe.com', '1', '开车', '王五', '屌丝', '12341234234', '部分代表的', '358532821', '哈哈哈', '不是去幼儿园的车啊', '爱情', '3', '3', '4');
INSERT INTO `tb_employee` VALUES ('6', '青海省-果洛藏族自治州-甘德县', '1112-12-15 00:00:00', '123123152328746372', '2017-12-24 10:32:59', '研究生', 'xiuxian@wendao.com', '1', '长生问道', '灵羽', '家族长老', '18888888888', null, '1111111112', '灵族', '元神境仙人', '修仙', '3', '1', null);

-- ----------------------------
-- Table structure for tb_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_job`;
CREATE TABLE `tb_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `remark` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_job
-- ----------------------------
INSERT INTO `tb_job` VALUES ('1', '项目经理', '负责项目各项工作,很忙啊');
INSERT INTO `tb_job` VALUES ('2', '职员', '实力背锅，卖力讨好');
INSERT INTO `tb_job` VALUES ('3', '主管', '上下为难，经理太挑剔，职员不给力');

-- ----------------------------
-- Table structure for tb_sign
-- ----------------------------
DROP TABLE IF EXISTS `tb_sign`;
CREATE TABLE `tb_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlll66hyar28qupsy32umn3bms` (`uid`),
  CONSTRAINT `FKlll66hyar28qupsy32umn3bms` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sign
-- ----------------------------
INSERT INTO `tb_sign` VALUES ('1', '2017-12-27 15:04:05', '1', '2');
INSERT INTO `tb_sign` VALUES ('2', '2017-12-28 07:32:50', '1', '2');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL,
  `loginname` varchar(16) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('2', '2017-12-20', 'aaa', '123', '1', 'aaa');
INSERT INTO `tb_user` VALUES ('4', '2017-12-21', 'bbb', '123', '0', 'bbb');
INSERT INTO `tb_user` VALUES ('5', '2017-12-26', 'ccc', '123', '1', 'ccc');
