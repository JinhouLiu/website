/*
 * 
 *用户表 
 *  
 */
DROP TABLE IF EXISTS t_user;
create table t_user(
id bigint(20) not null auto_increment PRIMARY KEY,
account_name varchar(100) not  null,
username_email varchar(100) not  null, 
password varchar(100) not null,
nick_name varchar(100) default  null,
user_status int(11)  not null,
register_time datetime not  null,
locked_time  datetime  not  null,
login_status int(11)  not  null, 
last_login_time  datetime not null,
comment varchar(100)  default null,
delete_flag int(11) not null,
create_by  bigint(20) not  null,
create_time  datetime not null,
update_by  bigint(20)  not  null,
update_time  datetime not  null,
attribute1   varchar(100)  default null,
attribute2  varchar(100)   default  null,
attribute3  varchar(100)   default null
);

/*
 * 
 * 用户附加信息表
 * 
 */
DROP TABLE IF EXISTS t_user_addition;
create table t_user_addition
(
id  bigint(20) not null PRIMARY KEY auto_increment,
user_id  bigint(20)  not  null,
sex int(11) not null,
birthday  date not  null,
real_name varchar(100) default null,
id_card varchar(100)  not null,
delete_flag   int(11) not  null,
create_by  bigint(20) not  null,
create_time datetime  not null,
update_by bigint(20)  not  null,
update_time datetime  not  null,
attribute1 varchar(100)  default null,
attribute2 varchar(100)  default null,
attribute3  varchar(100) default null
);
/*
 *  
 * 角色资源表
 * 
 */
DROP TABLE IF EXISTS t_role_resource;
create  table  t_role_resource
(
id bigint(20)  not  null PRIMARY KEY auto_increment,
role_id   bigint(20)  not  null,
res_id  bigint(20) not  null,
delete_flag   int(11)  not  null,
create_by  bigint(20)  not  null,
create_time datetime   not  null,
update_by  bigint(20) not  null,
update_time  datetime  not  null,
attribute1 varchar(100)  default null,
attribure2 varchar(100)  default  null,
attribute3  varchar(100)  default  null
);
/*
 *
 * 用户角色表 
 * 
 */
DROP TABLE IF EXISTS t_user_role;
create  table  t_user_role
(
id  bigint(20)  not  null  PRIMARY KEY auto_increment,
user_id bigint(20) not  null,
role_id  bigint(20) not  null,
delete_flag  int(11) not  null,
create_by  bigint(20)  not  null,
create_time datetime   not  null,
update_by  bigint(20) not  null,
update_time  datetime  not  null,
attribute1 varchar(100)  default null,
attribure2 varchar(100)  default  null,
attribute3  varchar(100)  default  null
);
/*
 * 角色表
 * 
 */
DROP TABLE IF EXISTS t_role;
create  table  t_role
(
id  bigint(20) not  null PRIMARY KEY auto_increment,
role_name   varchar(100) not  null,
description  varchar(100)  not null,
delete_flag  int(11) not  null,
create_by  bigint(20)  not  null,
create_time datetime   not  null,
update_by  bigint(20) not  null,
update_time  datetime  not  null,
attribute1 varchar(100)  default null,
attribure2 varchar(100)  default  null,
attribute3  varchar(100)  default  null
);

/* 
 *资源表
 * 
 */
DROP TABLE IF EXISTS t_resource;
create table t_resource
(
id  bigint(20)  not  null PRIMARY KEY  auto_increment,
res_code   varchar(100)  not  null,
res_name varchar(100)  not  null,
parent_id  bigint(20)  not  null,
parent_code   varchar(100)  not  null,
res_depth   int(11)  not  null,
res_url   varchar(100)  not  null,
res_type   int(11)    not  null,
description   varchar(100)  not  null,
delete_flag  int(11) not  null,
create_by  bigint(20)  not  null,
create_time datetime   not  null,
update_by  bigint(20) not  null,
update_time  datetime  not  null,
attribute1 varchar(100)  default null,
attribure2 varchar(100)  default  null,
attribute3  varchar(100)  default  null
);




