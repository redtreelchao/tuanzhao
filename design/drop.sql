# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V8.1.2                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          tuanzhao.dez                                    #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database drop script                            #
# Created on:            2015-04-09 10:01                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `rd_user_stats` DROP FOREIGN KEY `rd_users_rd_user_stats`;

ALTER TABLE `rd_company_user` DROP FOREIGN KEY `rd_companies_rd_company_user`;

ALTER TABLE `rd_company_user` DROP FOREIGN KEY `rd_users_rd_company_user`;

ALTER TABLE `rd_entity_industry` DROP FOREIGN KEY `rd_industry_rd_entity_industry`;

ALTER TABLE `rd_entity_industry` DROP FOREIGN KEY `rd_entity_type_rd_entity_industry`;

ALTER TABLE `rd_group_users` DROP FOREIGN KEY `rd_group_rd_group_users`;

ALTER TABLE `rd_group_users` DROP FOREIGN KEY `rd_users_rd_group_users`;

# ---------------------------------------------------------------------- #
# Drop table "rd_group_users"                                            #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_group_users` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_group_users` DROP PRIMARY KEY;

DROP TABLE `rd_group_users`;

# ---------------------------------------------------------------------- #
# Drop table "rd_logs"                                                   #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_logs` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_logs` DROP PRIMARY KEY;

DROP TABLE `rd_logs`;

# ---------------------------------------------------------------------- #
# Drop table "rd_jobs"                                                   #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_jobs` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_jobs` DROP PRIMARY KEY;

DROP TABLE `rd_jobs`;

# ---------------------------------------------------------------------- #
# Drop table "rd_group"                                                  #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_group` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_group` ALTER COLUMN `desc` DROP DEFAULT;

ALTER TABLE `rd_group` DROP PRIMARY KEY;

DROP TABLE `rd_group`;

# ---------------------------------------------------------------------- #
# Drop table "rd_entity_industry"                                        #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_entity_industry` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_entity_industry` DROP PRIMARY KEY;

DROP TABLE `rd_entity_industry`;

# ---------------------------------------------------------------------- #
# Drop table "rd_entity_type"                                            #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_entity_type` MODIFY `id` SMALLINT(4) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_entity_type` DROP PRIMARY KEY;

DROP TABLE `rd_entity_type`;

# ---------------------------------------------------------------------- #
# Drop table "rd_industry"                                               #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_industry` MODIFY `id` MEDIUMINT(7) NOT NULL;

# Drop constraints #

ALTER TABLE `rd_industry` ALTER COLUMN `parent_id` DROP DEFAULT;

ALTER TABLE `rd_industry` DROP PRIMARY KEY;

DROP TABLE `rd_industry`;

# ---------------------------------------------------------------------- #
# Drop table "rd_company_user"                                           #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_company_user` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_company_user` DROP PRIMARY KEY;

DROP TABLE `rd_company_user`;

# ---------------------------------------------------------------------- #
# Drop table "rd_companies"                                              #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_companies` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_companies` ALTER COLUMN `user_num` DROP DEFAULT;

ALTER TABLE `rd_companies` ALTER COLUMN `desc` DROP DEFAULT;

ALTER TABLE `rd_companies` DROP PRIMARY KEY;

DROP TABLE `rd_companies`;

# ---------------------------------------------------------------------- #
# Drop table "rd_user_stats"                                             #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_user_stats` MODIFY `id` INTEGER(11) NOT NULL;

# Drop constraints #

ALTER TABLE `rd_user_stats` DROP PRIMARY KEY;

DROP TABLE `rd_user_stats`;

# ---------------------------------------------------------------------- #
# Drop table "rd_users"                                                  #
# ---------------------------------------------------------------------- #

# Remove autoinc for PK drop #

ALTER TABLE `rd_users` MODIFY `id` INTEGER(11) UNSIGNED NOT NULL;

# Drop constraints #

ALTER TABLE `rd_users` DROP PRIMARY KEY;

DROP TABLE `rd_users`;
