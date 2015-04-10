/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.41-0+wheezy1 : Database - tuanzhao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tuanzhao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tuanzhao`;

/*Table structure for table `rd_company` */

CREATE TABLE `rd_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `user_num` mediumint(5) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `logo` varchar(128) DEFAULT NULL COMMENT 'logo',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_company_user` */

CREATE TABLE `rd_company_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_companies_rd_company_user` (`company_id`),
  KEY `rd_users_rd_company_user` (`user_id`),
  CONSTRAINT `rd_users_rd_company_user` FOREIGN KEY (`user_id`) REFERENCES `rd_user` (`id`),
  CONSTRAINT `rd_companies_rd_company_user` FOREIGN KEY (`company_id`) REFERENCES `rd_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_entity_industry` */

CREATE TABLE `rd_entity_industry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entity_key` char(10) NOT NULL,
  `industry_id` mediumint(8) unsigned NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `entity_refer_id` int(11) DEFAULT NULL COMMENT '用户ID、公司ID、...',
  PRIMARY KEY (`id`),
  KEY `rd_industry_rd_entity_industry` (`industry_id`),
  CONSTRAINT `rd_industry_rd_entity_industry` FOREIGN KEY (`industry_id`) REFERENCES `rd_industry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_entity_type` */

CREATE TABLE `rd_entity_type` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` smallint(4) NOT NULL,
  `key` char(10) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_group` */

CREATE TABLE `rd_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `desc` text NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `user_num` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_group_user` */

CREATE TABLE `rd_group_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `add_time` int(11) NOT NULL,
  `job_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_group_rd_group_users` (`group_id`),
  KEY `rd_users_rd_group_users` (`user_id`),
  CONSTRAINT `rd_users_rd_group_users` FOREIGN KEY (`user_id`) REFERENCES `rd_user` (`id`),
  CONSTRAINT `rd_group_rd_group_users` FOREIGN KEY (`group_id`) REFERENCES `rd_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_industry` */

CREATE TABLE `rd_industry` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `parent_id` mediumint(7) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_jobs` */

CREATE TABLE `rd_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_logs` */

CREATE TABLE `rd_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `detail` text,
  `user_id` int(11) NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_user` */

CREATE TABLE `rd_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `fullname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `add_time` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` char(15) NOT NULL COMMENT '注册IP',
  `id_num` varchar(40) NOT NULL COMMENT '身份证号',
  `money` int(8) DEFAULT '0' COMMENT '钱',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `mobile` int(11) DEFAULT NULL COMMENT '手机号',
  `qq` varchar(64) DEFAULT NULL COMMENT 'QQ号',
  `password` char(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rd_user_stats` */

CREATE TABLE `rd_user_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_users_rd_user_stats` (`user_id`),
  CONSTRAINT `rd_users_rd_user_stats` FOREIGN KEY (`user_id`) REFERENCES `rd_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
