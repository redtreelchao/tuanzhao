# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V8.1.2                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          tuanzhao.dez                                    #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database creation script                        #
# Created on:            2015-04-09 10:01                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "rd_users"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_users` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(32) NOT NULL COMMENT '用户名',
    `fullname` VARCHAR(20) COMMENT '真实姓名',
    `add_time` INTEGER(11) COMMENT '注册时间',
    `reg_ip` VARCHAR(15) COMMENT '注册IP',
    `id_num` VARCHAR(40) COMMENT '身份证号',
    `money` INTEGER(8) COMMENT '钱',
    `email` VARCHAR(64) COMMENT '邮箱',
    `mobile` INTEGER(11) COMMENT '手机号',
    `qq` VARCHAR(64) COMMENT 'QQ号',
    CONSTRAINT `PK_rd_users` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_user_stats"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_user_stats` (
    `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER(11) NOT NULL,
    `add_time` INTEGER(11) NOT NULL,
    CONSTRAINT `PK_rd_user_stats` PRIMARY KEY (`id`, `user_id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_companies"                                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_companies` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    `user_num` MEDIUMINT(5) NOT NULL DEFAULT 0,
    `desc` TEXT NOT NULL DEFAULT '这是填写公司介绍',
    `logo` VARCHAR(128) COMMENT 'logo',
    `add_time` INTEGER(11) NOT NULL,
    CONSTRAINT `PK_rd_companies` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_company_user"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_company_user` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER(11) NOT NULL,
    `company_id` INTEGER(11) NOT NULL,
    `add_time` INTEGER(11) NOT NULL,
    CONSTRAINT `PK_rd_company_user` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_industry"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_industry` (
    `id` MEDIUMINT(7) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `parent_id` MEDIUMINT(7) NOT NULL DEFAULT 0,
    `add_time` INTEGER(11) NOT NULL,
    CONSTRAINT `PK_rd_industry` PRIMARY KEY (`id`)
)
行业分类;

# ---------------------------------------------------------------------- #
# Add table "rd_entity_type"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_entity_type` (
    `id` SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` SMALLINT(4) NOT NULL,
    `key` VARCHAR(10) NOT NULL,
    `add_time` INTEGER(11) NOT NULL,
    CONSTRAINT `PK_rd_entity_type` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_entity_industry"                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_entity_industry` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `entity_key` CHAR(10) NOT NULL,
    `industry_id` INTEGER(8) NOT NULL,
    `add_time` INTEGER(11),
    `entity_refer_id` INTEGER(11) COMMENT '用户ID、公司ID、...',
    CONSTRAINT `PK_rd_entity_industry` PRIMARY KEY (`id`)
)
记录公司、团队所属行业;

# ---------------------------------------------------------------------- #
# Add table "rd_group"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_group` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER(11) NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `desc` TEXT NOT NULL DEFAULT '团队描述',
    `add_time` INTEGER(11),
    `user_num` SMALLINT(4),
    CONSTRAINT `PK_rd_group` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_jobs"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_jobs` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `add_time` INTEGER(11),
    CONSTRAINT `PK_rd_jobs` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add table "rd_logs"                                                    #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_logs` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(12) NOT NULL,
    `detail` TEXT,
    `user_id` INTEGER(11) NOT NULL,
    `add_time` INTEGER(11),
    CONSTRAINT `PK_rd_logs` PRIMARY KEY (`id`)
)
记录用户所有的操作。;

# ---------------------------------------------------------------------- #
# Add table "rd_group_users"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `rd_group_users` (
    `id` INTEGER(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER(11) NOT NULL,
    `user_id` INTEGER(11) NOT NULL,
    `add_time` INTEGER(11) NOT NULL,
    `job_id` MEDIUMINT(8) NOT NULL,
    CONSTRAINT `PK_rd_group_users` PRIMARY KEY (`id`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `rd_user_stats` ADD CONSTRAINT `rd_users_rd_user_stats` 
    FOREIGN KEY (`user_id`) REFERENCES `rd_users` (`id`);

ALTER TABLE `rd_company_user` ADD CONSTRAINT `rd_companies_rd_company_user` 
    FOREIGN KEY (`company_id`) REFERENCES `rd_companies` (`id`);

ALTER TABLE `rd_company_user` ADD CONSTRAINT `rd_users_rd_company_user` 
    FOREIGN KEY (`user_id`) REFERENCES `rd_users` (`id`);

ALTER TABLE `rd_entity_industry` ADD CONSTRAINT `rd_industry_rd_entity_industry` 
    FOREIGN KEY (`industry_id`) REFERENCES `rd_industry` (`id`);

ALTER TABLE `rd_entity_industry` ADD CONSTRAINT `rd_entity_type_rd_entity_industry` 
    FOREIGN KEY (`entity_key`) REFERENCES `rd_entity_type` (`key`);

ALTER TABLE `rd_group_users` ADD CONSTRAINT `rd_group_rd_group_users` 
    FOREIGN KEY (`group_id`) REFERENCES `rd_group` (`id`);

ALTER TABLE `rd_group_users` ADD CONSTRAINT `rd_users_rd_group_users` 
    FOREIGN KEY (`user_id`) REFERENCES `rd_users` (`id`);
