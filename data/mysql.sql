/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42-0ubuntu0.22.04.1)
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 10/05/2025 20:52:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `book_id` tinyint NOT NULL AUTO_INCREMENT COMMENT '书籍ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出版社',
  `publish_date` date DEFAULT NULL COMMENT '出版日期',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分类',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`book_id`) USING BTREE,
  UNIQUE KEY `uk_book_title_author_publisher` (`title`,`author`,`publisher`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='图书表';

-- ----------------------------
-- Records of books
-- ----------------------------
BEGIN;
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (73, '红楼梦', '曹雪芹', '中华书局', '1791-01-01', '文学', 1, '2025-03-26 00:28:12', '2025-05-05 02:26:08');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (74, '三国演义', '罗贯中', '人民文学出版社', '1522-01-01', '文学', 23, '2025-03-26 00:28:12', '2025-05-03 10:58:24');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (75, '西游记', '吴承恩', '中华书局', '1592-01-01', '文学', 20, '2025-03-26 00:28:12', '2025-05-03 10:58:10');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (77, '百年孤独', '加西亚·马尔克斯', '南海出版公司', '1967-06-01', '文学', 14, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (79, '小王子', '安托万·德·圣-埃克苏佩里', '人民文学出版社', '1943-04-01', '文学', 38, '2025-03-26 00:28:12', '2025-05-10 20:51:09');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (81, '傲慢与偏见', '简·奥斯汀', '译林出版社', '1813-01-01', '文学', 12, '2025-03-26 00:28:12', '2025-05-03 22:23:44');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (95, '存在与时间', '马丁·海德格尔', '商务印书馆', '1927-01-01', '哲学', 10, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (96, '时间简史', '史蒂芬·霍金', '湖南科学技术出版社', '1988-04-01', '科学', 19, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (97, '宇宙的结构', '布赖恩·格林', '湖南科学技术出版社', '2003-07-01', '科学', 15, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (98, '万物简史', '比尔·布莱森', '接力出版社', '2003-05-01', '科学', 17, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (99, '自私的基因', '理查德·道金斯', '译林出版社', '1976-01-01', '科学', 13, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (100, '乌合之众', '古斯塔夫·勒庞', '中央编译出版社', '1895-01-01', '心理学', 12, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (101, '影响力', '罗伯特·西奥迪尼', '中国财政经济出版社', '1984-01-01', '心理学', 20, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (102, '社会性动物', '艾略特·阿伦森', '华东师范大学出版社', '1972-01-01', '心理学', 18, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `publish_date`, `category`, `stock`, `create_time`, `update_time`) VALUES (103, '乔布斯传', '沃尔特·艾萨克森', '中信出版社', '2011-10-01', '传记', 25, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
COMMIT;

-- ----------------------------
-- Table structure for borrow_record
-- ----------------------------
DROP TABLE IF EXISTS `borrow_record`;
CREATE TABLE `borrow_record` (
  `borrow_record_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '借阅用户ID',
  `book_id` bigint NOT NULL COMMENT '图书ID',
  `borrow_time` datetime NOT NULL COMMENT '借阅时间',
  `expect_return_time` datetime NOT NULL COMMENT '应归还时间',
  `actual_return_time` datetime DEFAULT NULL COMMENT '实际归还时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '借阅状态(1:进行中 2:已归还 3:逾期)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记(0:正常 1:删除)',
  PRIMARY KEY (`borrow_record_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_book_id` (`book_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='图书借阅记录表';

-- ----------------------------
-- Records of borrow_record
-- ----------------------------
BEGIN;
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (1, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-03-24 00:00:00', '2025-03-27 00:00:00', '2025-05-02 23:56:12', 2, '2025-03-26 00:33:13', '2025-03-26 00:33:13', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (2, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 73, '2025-03-26 00:00:00', '2025-03-30 00:00:00', '2025-05-03 00:04:45', 2, '2025-03-26 00:34:17', '2025-03-26 00:34:17', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (3, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-02-25 00:00:00', '2025-03-07 00:00:00', '2025-05-03 00:23:37', 2, '2025-03-28 23:57:19', '2025-03-28 23:57:19', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (4, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 75, '2025-05-01 00:00:00', '2025-05-08 00:00:00', '2025-05-03 10:56:06', 2, '2025-05-02 22:36:17', '2025-05-02 22:36:17', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (5, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-05-11 00:00:00', '2025-05-18 00:00:00', '2025-05-03 10:58:24', 2, '2025-05-03 00:07:18', '2025-05-03 00:07:18', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (6, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 75, '2025-05-01 00:00:00', '2025-05-25 00:00:00', '2025-05-03 10:58:10', 2, '2025-05-03 10:56:22', '2025-05-03 10:56:22', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (7, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 79, '2025-05-10 00:00:00', '2025-05-25 00:00:00', '2025-05-03 11:00:29', 2, '2025-05-03 11:00:23', '2025-05-03 11:00:23', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (8, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 73, '2025-04-30 00:00:00', '2025-05-16 00:00:00', '2025-05-05 02:26:08', 2, '2025-05-03 11:07:41', '2025-05-03 11:07:41', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (9, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-05-01 00:00:00', '2025-05-11 00:00:00', NULL, 1, '2025-05-03 20:49:09', '2025-05-03 20:49:09', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (10, '189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', 77, '2025-04-30 00:00:00', '2025-05-10 00:00:00', NULL, 1, '2025-05-03 20:56:38', '2025-05-03 20:56:38', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (11, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 81, '2025-04-29 00:00:00', '2025-05-10 00:00:00', '2025-05-03 22:23:44', 2, '2025-05-03 22:23:23', '2025-05-03 22:23:23', 0);
INSERT INTO `borrow_record` (`borrow_record_id`, `user_id`, `book_id`, `borrow_time`, `expect_return_time`, `actual_return_time`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (14, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 79, '2025-05-01 00:00:00', '2025-05-07 00:00:00', '2025-05-10 20:51:09', 3, '2025-05-10 20:50:50', '2025-05-10 20:50:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '登录的ip',
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名',
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '调用的方法',
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '调用的模块',
  `commit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '事件',
  `params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '请求参数',
  `create_time` datetime DEFAULT NULL COMMENT '日志的时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT COMMENT '功能权限表',
  `permission_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能Code',
  `permission_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能名称',
  `permission_ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `action_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (1, 'AccountManagement', '账号管理', NULL, NULL, NULL, NULL);
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (2, 'Other', '其他', NULL, NULL, NULL, NULL);
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (3, 'UserInfo', '个人中心', NULL, NULL, NULL, NULL);
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (7, 'Book', '图书列表', NULL, NULL, NULL, NULL);
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (8, 'MyBorrow', '我的借阅', NULL, NULL, NULL, NULL);
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (9, 'BorrowManagement', '借阅管理', NULL, NULL, NULL, NULL);
INSERT INTO `permission` (`permission_id`, `permission_code`, `permission_name`, `permission_ename`, `action_list`, `data_access`, `remark`) VALUES (10, 'BookManagement', '图书管理', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`role_id`, `role`, `role_name`) VALUES (0, 'admin', '系统管理员');
INSERT INTO `role` (`role_id`, `role`, `role_name`) VALUES (1, 'maintain', '维护人员');
INSERT INTO `role` (`role_id`, `role`, `role_name`) VALUES (2, 'user', '用户');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_permission_id` int NOT NULL AUTO_INCREMENT COMMENT '权限功能表',
  `permission_id` int NOT NULL COMMENT '功能ID',
  `role_id` int NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (43, 1, 0);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (44, 2, 0);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (45, 3, 0);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (46, 2, 1);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (47, 3, 1);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (48, 6, 1);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (49, 3, 2);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (50, 4, 2);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (51, 5, 2);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (52, 7, 2);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (53, 7, 1);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (55, 8, 2);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (56, 9, 0);
INSERT INTO `role_permission` (`role_permission_id`, `permission_id`, `role_id`) VALUES (57, 10, 0);
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pass_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0禁用 1正常 2备用',
  `created_time` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` (`user_id`, `user_name`, `name`, `pass_word`, `salt`, `phone`, `email`, `status`, `created_time`) VALUES ('1888dee2-c173-48e0-ac2c-e5a043dec7d4', 'admin', '系统管理员', '9c91e85e5f8f26f3e4002d839cfcfcbc', 'b581e52d-8e35-4390-abbf-1968403af525', '12345678', '12345678', 1, '2024-03-06 16:03:25');
INSERT INTO `user_info` (`user_id`, `user_name`, `name`, `pass_word`, `salt`, `phone`, `email`, `status`, `created_time`) VALUES ('189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', 'shanghai123', '123', '97446b776d94c3b907c59bbc224e5a30', '40f9c810-15a9-40cf-a604-68bd219ac15e', '123456', '123456', 1, '2024-06-14 14:02:48');
INSERT INTO `user_info` (`user_id`, `user_name`, `name`, `pass_word`, `salt`, `phone`, `email`, `status`, `created_time`) VALUES ('554c9e86-e577-4bfb-891d-45fd14723e1a', 'maintain', '维护人员', 'ccdf5ef6227ca812583fd8b58e8e29de', '450fba82-a565-47f2-a2c5-26d3f6ebb13a', '12345678', '123456789', 1, '2024-06-06 12:37:57');
INSERT INTO `user_info` (`user_id`, `user_name`, `name`, `pass_word`, `salt`, `phone`, `email`, `status`, `created_time`) VALUES ('6129d161-f38b-4022-9440-da07134df815', 'test', 'test', 'd40f4a4fb0e2e9dad843d1a4ef1c9b2e', '79f3aece-54b7-4a79-b4e2-68311aef8fbe', '11111111111111111', '1111111111111111111', 1, '2025-05-05 22:13:55');
INSERT INTO `user_info` (`user_id`, `user_name`, `name`, `pass_word`, `salt`, `phone`, `email`, `status`, `created_time`) VALUES ('e5fbd029-b4b0-4f12-8679-510ef9695be3', 'user', '用户', '17d5e423900efcd06d1997eca49642a5', '2a874930-a0d0-4fe3-9772-a1e1ebf02656', '12345678', '1111', 1, '2024-06-06 12:38:35');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE,
  KEY `user_role_user_info_id` (`user_id`) USING BTREE,
  KEY `user_role_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES ('1', '1888dee2-c173-48e0-ac2c-e5a043dec7d4', 0);
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES ('2f9684b0-ff99-4c2d-b5b1-631230b9bcaa', '554c9e86-e577-4bfb-891d-45fd14723e1a', 1);
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES ('94ef1bf1-ac15-40ad-b5b0-ef2627601898', '6129d161-f38b-4022-9440-da07134df815', 2);
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES ('cf7fc751-6b29-4932-acfb-942b433b53ef', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 2);
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES ('e082fe57-3a53-4c66-9603-fbc3958763bd', '189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
