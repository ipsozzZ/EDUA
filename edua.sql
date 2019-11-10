
/**
 * 第6小组数据库建表语句
 * author ipso
 */

CREATE SCHEMA edua;

use `edua`

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(8) DEFAULT NULL comment '学生学号',
  `pid` int DEFAULT NULL comment '学生专业id',
  `pass` varchar(200) DEFAULT '666666' comment '学生登录密码',
  `phone` varchar(255) DEFAULT NULL comment '联系电话',
  `email` varchar(255) DEFAULT NULL comment '学生邮箱',
  `name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `logo` varchar(1000) DEFAULT '/static/picture/s_logo.png' COMMENT '学生头像',
  `intro` varchar(1000) DEFAULT NULL COMMENT '300字以内简介',
  PRIMARY KEY (`id`),
  index pid (pid),
  foreign key (pid) references profession (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE student COMMENT = '学生表';

CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '专业名称',
  `pno` varchar(11) DEFAULT NULL COMMENT '专业编号',
  `intro` varchar(1000) DEFAULT NULL COMMENT '300字以内简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE profession COMMENT = '专业表';

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jno` varchar(8) DEFAULT NULL comment '教师工号',
  `profession` varchar(255) DEFAULT NULL comment '专业',
  `phone` varchar(255) DEFAULT NULL comment '联系电话',
  `pass` varchar(200) DEFAULT '666666' comment '教师登录密码',
  `email` varchar(255) DEFAULT NULL comment '教师邮箱',
  `name` varchar(255) DEFAULT NULL COMMENT '教师姓名',
  `logo` varchar(1000) DEFAULT '/static/picture/t_logo.png' COMMENT '教室头像',
  `intro` varchar(1000) DEFAULT NULL COMMENT '300字以内简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE teacher COMMENT = '教师表';

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ano` varchar(8) DEFAULT NULL comment '管理员工号',
  `phone` varchar(255) DEFAULT NULL comment '联系电话',
  `pass` varchar(200) DEFAULT '666666' comment '管理员登录密码',
  `email` varchar(255) DEFAULT NULL comment '管理员邮箱',
  `name` varchar(255) DEFAULT NULL COMMENT '管理员姓名',
  `logo` varchar(1000) DEFAULT '/static/picture/a_logo.png' COMMENT '管理员头像',
  `intro` varchar(1000) DEFAULT NULL COMMENT '300字以内简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE admin COMMENT = '管理员表';

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cno` varchar(11) DEFAULT NULL comment '课程编号',
  `tid` int DEFAULT NULL comment '开课教师id',
  `date` datetime DEFAULT NULL comment '开课日期',
  `name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `intro` varchar(1000) DEFAULT NULL COMMENT '300字以内课程简介',
  PRIMARY KEY (`id`),
  index tid (tid),  -- 设置索引
  foreign key (tid) references teacher (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE course COMMENT = '开课信息表';

CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int DEFAULT NULL comment '学生id',
  `cid` int DEFAULT NULL comment '课程id',
  `mark` tinyint DEFAULT 1 comment '课程性质，0：必修  1：选修',
  `score` int DEFAULT NULL comment '课程得分',
  PRIMARY KEY (`id`),
  index tid (cid),  -- 设置索引
  index sid (sid),  -- 设置索引
  foreign key (sid) references student (id),
  foreign key (cid) references course (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE class COMMENT = '课程报名';

CREATE TABLE `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int DEFAULT NULL comment 'class id',
  `state` int DEFAULT NULL comment '教室状态',
  `intro` varchar(1000) DEFAULT NULL comment '教室描述',
  PRIMARY KEY (`id`),
  index tid (cid),  -- 设置索引
  foreign key (cid) references course (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE classroom COMMENT = '教室表';

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int DEFAULT NULL comment '公告状态',
  `content` text DEFAULT NULL comment '公告信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE message COMMENT = '公告表';

CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint DEFAULT 1 comment '系统状态，1：正常运行  2: 系统维修，关站，',
  `config` text DEFAULT NULL comment '系统配置信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
ALTER TABLE config COMMENT = '配置表';
