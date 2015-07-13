/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50543
Source Host           : 120.24.96.166:3306
Source Database       : website

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2015-07-08 07:46:26
*/
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `MENU`
-- ----------------------------
DROP TABLE IF EXISTS `MENU`;
CREATE TABLE `MENU` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) NOT NULL,
  `IS_LEAF` int(1) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('系统管理','0',NULL,'0','2015-7-6','2015-7-6');
insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('个人设置','0',NULL,'0','2015-7-6','2015-7-6');
insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('用户管理','1','1','0','2015-7-6','2015-7-6');
insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('角色管理','1','1','0','2015-7-6','2015-7-6');
insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('菜单管理','1','1','0','2015-7-6','2015-7-6');
insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('权限管理','1','1','0','2015-7-6','2015-7-6');
insert into MENU(title,is_leaf, parent_id,is_delete,update_time,create_time)
values('修改密码','1','2','0','2015-7-6','2015-7-6');
-- ----------------------------
-- Records of MENU
-- ----------------------------

-- ----------------------------
-- Table structure for `PERMISSION`
-- ----------------------------
DROP TABLE IF EXISTS `PERMISSION`;
CREATE TABLE `PERMISSION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PNAME` varchar(100) NOT NULL,
  `PMENU_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PERMISSION_MENU` (`PMENU_ID`),
  CONSTRAINT `FK_PERMISSION_MENU` FOREIGN KEY (`PMENU_ID`) REFERENCES `MENU` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into PERMISSION(pname,pmenu_id,is_delete,update_time,create_time)
values('管理员删除','1','0','2015-7-6','2015-7-6');
insert into PERMISSION(pname,pmenu_id,is_delete,update_time,create_time)
values('管理员新增','1','0','2015-7-6','2015-7-6');
insert into PERMISSION(pname,pmenu_id,is_delete,update_time,create_time)
values('管理员修改','1','0','2015-7-6','2015-7-6');
-- ----------------------------
-- Records of PERMISSION
-- ----------------------------

-- ----------------------------
-- Table structure for `ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `ROLE`;
CREATE TABLE `ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RNAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATOR_ID` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into ROLE(rname,description,creator_id,is_delete,update_time,create_time) 
values ('ROLE_ADMIN','系统管理员','1','0','2015-7-6','2015-7-6');

insert into ROLE(rname,description,creator_id,is_delete,update_time,create_time) 
values ('ROLE_USER','普通用户','1','0','2015-7-6','2015-7-6');
-- ----------------------------
-- Records of ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for `ROLE_PERMISSION`
-- ----------------------------
DROP TABLE IF EXISTS `ROLE_PERMISSION`;
CREATE TABLE `ROLE_PERMISSION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) NOT NULL,
  `PERMISSION_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLEPERMISSION_ROLE` (`ROLE_ID`),
  KEY `FK_ROLEPERMISSION_PERMISSION` (`PERMISSION_ID`),
  CONSTRAINT `FK_ROLEPERMISSION_PERMISSION` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`ID`),
  CONSTRAINT `FK_ROLEPERMISSION_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into  ROLE_PERMISSION(role_id,permission_id,is_delete,update_time,create_time)
values('1','1','0','2015-7-6','2015-7-6');
insert into  ROLE_PERMISSION(role_id,permission_id,is_delete,update_time,create_time)
values('1','2','0','2015-7-6','2015-7-6');
insert into  ROLE_PERMISSION(role_id,permission_id,is_delete,update_time,create_time)
values('1','3','0','2015-7-6','2015-7-6');

-- ----------------------------
-- Records of ROLE_PERMISSION
-- ----------------------------

-- ----------------------------
-- Table structure for `USER`
-- ----------------------------
DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(50) NOT NULL,
  `PASSWORD` varchar(60) NOT NULL,
  `REAL_NAME` varchar(50) DEFAULT NULL,
  `SEX` int(1) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into USER(account,password,real_name,sex,birthday,mobile,email,is_delete,update_time,create_time) 
values          ('admin','root','系统管理员','0','1991-03-27','13040818614','www.975764577@qq.com','0','2015-7-6','2015-7-6'); 
insert into USER(account,password,real_name,sex,birthday,mobile,email,is_delete,update_time,create_time) 
values          ('user','root','普通用户','0','1991-03-27','13040818614','www.975764577@qq.com','0','2015-7-6','2015-7-6');
-- ----------------------------
-- Records of USER
-- ----------------------------

-- ----------------------------
-- Table structure for `USER_ROLE`
-- ----------------------------
DROP TABLE IF EXISTS `USER_ROLE`;
CREATE TABLE `USER_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USERROLE_ROLE` (`ROLE_ID`),
  KEY `FK_USERROLE_USER` (`ACCOUNT_ID`),
  CONSTRAINT `FK_USERROLE_USER` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `USER` (`ID`),
  CONSTRAINT `FK_USERROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert   into  USER_ROLE(account_id, role_id,is_delete,update_time,create_time)
values ('1','1','0','2015-7-6','2015-7-6'); 
insert   into  USER_ROLE(account_id, role_id,is_delete,update_time,create_time)
values ('1','2','0','2015-7-6','2015-7-6'); 
insert   into  USER_ROLE(account_id,role_id,is_delete,update_time,create_time)
values ('2','2','0','2015-7-6','2015-7-6'); 
-- ----------------------------
-- Records of USER_ROLE
-- ----------------------------
