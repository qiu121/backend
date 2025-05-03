/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 03/05/2025 16:30:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alarm_info
-- ----------------------------
DROP TABLE IF EXISTS `alarm_info`;
CREATE TABLE `alarm_info`  (
                               `alarm_id` int(11) NOT NULL COMMENT '报警信息接收配置表',
                               `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '报警模块',
                               `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人姓名',
                               `alarm_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '报警邮箱',
                               `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
                               `create_time` datetime NOT NULL COMMENT '创建时间',
                               `update_time` datetime NOT NULL COMMENT '更新时间',
                               PRIMARY KEY (`alarm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alarm_info
-- ----------------------------
INSERT INTO `alarm_info` VALUES (1, 'ALL', '测试人员', '503297590@qq.com', 'START', '2024-05-24 12:35:45', '2024-05-24 12:35:48');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
                          `book_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '书籍ID',
                          `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
                          `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
                          `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出版社',
                          `publish_date` date NULL DEFAULT NULL COMMENT '出版日期',
                          `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类',
                          `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          PRIMARY KEY (`book_id`) USING BTREE,
                          UNIQUE INDEX `uk_book_title`(`title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (73, '红楼梦', '曹雪芹', '中华书局', '1791-01-01', '文学', 0, '2025-03-26 00:28:12', '2025-05-03 00:04:45');
INSERT INTO `books` VALUES (74, '三国演义', '罗贯中', '人民文学出版社', '1522-01-01', '文学', 24, '2025-03-26 00:28:12', '2025-05-03 10:58:24');
INSERT INTO `books` VALUES (75, '西游记', '吴承恩', '中华书局', '1592-01-01', '文学', 20, '2025-03-26 00:28:12', '2025-05-03 10:58:10');
INSERT INTO `books` VALUES (76, '水浒传', '施耐庵', '人民文学出版社', '1589-01-01', '文学', 18, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (77, '百年孤独', '加西亚·马尔克斯', '南海出版公司', '1967-06-01', '文学', 15, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (78, '追风筝的人', '卡勒德·胡赛尼', '上海人民出版社', '2003-05-01', '文学', 22, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (79, '小王子', '安托万·德·圣-埃克苏佩里', '人民文学出版社', '1943-04-01', '文学', 35, '2025-03-26 00:28:12', '2025-05-03 11:00:29');
INSERT INTO `books` VALUES (80, '哈利·波特与魔法石', 'J.K. 罗琳', '人民文学出版社', '1997-06-01', '文学', 28, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (81, '傲慢与偏见', '简·奥斯汀', '译林出版社', '1813-01-01', '文学', 12, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (82, '悲惨世界', '维克多·雨果', '译林出版社', '1862-04-01', '文学', 10, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (83, '全球通史', '斯塔夫里阿诺斯', '北京大学出版社', '2006-05-01', '历史', 15, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (84, '人类简史', '尤瓦尔·赫拉利', '中信出版社', '2014-10-01', '历史', 18, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (85, '明朝那些事儿', '当年明月', '中国友谊出版公司', '2006-01-01', '历史', 20, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (86, '万历十五年', '黄仁宇', '中华书局', '1982-06-01', '历史', 13, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (87, '大秦帝国', '孙皓晖', '作家出版社', '2001-08-01', '历史', 11, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (88, '资本论', '卡尔·马克思', '人民出版社', '1867-09-01', '经济', 10, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (89, '国富论', '亚当·斯密', '商务印书馆', '1776-01-01', '经济', 8, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (90, '穷爸爸富爸爸', '罗伯特·清崎', '四川人民出版社', '1997-04-01', '经济', 30, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (91, '经济学原理', '曼昆', '机械工业出版社', '1998-07-01', '经济', 22, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (92, '苏菲的世界', '乔斯坦·贾德', '作家出版社', '1991-12-01', '哲学', 12, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (93, '沉思录', '马可·奥勒留', '中华书局', '0180-01-01', '哲学', 14, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (94, '道德经', '老子', '中华书局', NULL, '哲学', 25, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (95, '存在与时间', '马丁·海德格尔', '商务印书馆', '1927-01-01', '哲学', 10, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (96, '时间简史', '史蒂芬·霍金', '湖南科学技术出版社', '1988-04-01', '科学', 19, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (97, '宇宙的结构', '布赖恩·格林', '湖南科学技术出版社', '2003-07-01', '科学', 15, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (98, '万物简史', '比尔·布莱森', '接力出版社', '2003-05-01', '科学', 17, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (99, '自私的基因', '理查德·道金斯', '译林出版社', '1976-01-01', '科学', 13, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (100, '乌合之众', '古斯塔夫·勒庞', '中央编译出版社', '1895-01-01', '心理学', 12, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (101, '影响力', '罗伯特·西奥迪尼', '中国财政经济出版社', '1984-01-01', '心理学', 20, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (102, '社会性动物', '艾略特·阿伦森', '华东师范大学出版社', '1972-01-01', '心理学', 18, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (103, '乔布斯传', '沃尔特·艾萨克森', '中信出版社', '2011-10-01', '传记', 25, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (104, '巴菲特之道', '罗伯特·哈格斯特朗', '机械工业出版社', '1994-07-01', '传记', 20, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (105, '拿破仑传', '埃米尔·路德维希', '译林出版社', '1927-01-01', '传记', 12, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (106, '艺术的故事', '贡布里希', '广西美术出版社', '1950-07-01', '艺术', 10, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (107, '西方美学史', '朱光潜', '商务印书馆', '1985-01-01', '艺术', 15, '2025-03-26 00:28:12', '2025-05-02 23:37:27');
INSERT INTO `books` VALUES (108, '摄影的艺术', '安塞尔·亚当斯', '人民美术出版社', '1983-06-01', '艺术', 18, '2025-03-26 00:28:12', '2025-05-02 23:37:27');

-- ----------------------------
-- Table structure for borrow_record
-- ----------------------------
DROP TABLE IF EXISTS `borrow_record`;
CREATE TABLE `borrow_record`  (
                                  `borrow_record_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '借阅用户ID',
                                  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
                                  `borrow_time` datetime NOT NULL COMMENT '借阅时间',
                                  `expect_return_time` datetime NOT NULL COMMENT '应归还时间',
                                  `actual_return_time` datetime NULL DEFAULT NULL COMMENT '实际归还时间',
                                  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '借阅状态(1:进行中 2:已归还 3:逾期)',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标记(0:正常 1:删除)',
                                  PRIMARY KEY (`borrow_record_id`) USING BTREE,
                                  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
                                  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书借阅记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_record
-- ----------------------------
INSERT INTO `borrow_record` VALUES (1, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-03-24 00:00:00', '2025-03-27 00:00:00', '2025-05-02 23:56:12', 2, '2025-03-26 00:33:13', '2025-03-26 00:33:13', 0);
INSERT INTO `borrow_record` VALUES (2, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 73, '2025-03-26 00:00:00', '2025-03-30 00:00:00', '2025-05-03 00:04:45', 2, '2025-03-26 00:34:17', '2025-03-26 00:34:17', 0);
INSERT INTO `borrow_record` VALUES (3, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-02-25 00:00:00', '2025-03-07 00:00:00', '2025-05-03 00:23:37', 2, '2025-03-28 23:57:19', '2025-03-28 23:57:19', 0);
INSERT INTO `borrow_record` VALUES (4, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 75, '2025-05-01 00:00:00', '2025-05-08 00:00:00', '2025-05-03 10:56:06', 2, '2025-05-02 22:36:17', '2025-05-02 22:36:17', 0);
INSERT INTO `borrow_record` VALUES (5, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 74, '2025-05-11 00:00:00', '2025-05-18 00:00:00', '2025-05-03 10:58:24', 2, '2025-05-03 00:07:18', '2025-05-03 00:07:18', 0);
INSERT INTO `borrow_record` VALUES (6, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 75, '2025-05-01 00:00:00', '2025-05-25 00:00:00', '2025-05-03 10:58:10', 2, '2025-05-03 10:56:22', '2025-05-03 10:56:22', 0);
INSERT INTO `borrow_record` VALUES (7, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 79, '2025-05-10 00:00:00', '2025-05-25 00:00:00', '2025-05-03 11:00:29', 2, '2025-05-03 11:00:23', '2025-05-03 11:00:23', 0);
INSERT INTO `borrow_record` VALUES (8, 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 73, '2025-04-30 00:00:00', '2025-05-16 00:00:00', NULL, 1, '2025-05-03 11:07:41', '2025-05-03 11:07:41', 0);

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
                              `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件表',
                              `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称',
                              `common_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属id',
                              `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属模块',
                              `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件地址',
                              `create_time` datetime NOT NULL COMMENT '创建时间',
                              `update_time` datetime NOT NULL COMMENT '更新时间',
                              PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_info
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
                        `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                        `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录的ip',
                        `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
                        `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用的方法',
                        `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用的模块',
                        `commit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
                        `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
                        `create_time` datetime NULL DEFAULT NULL COMMENT '日志的时间',
                        PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
                               `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能权限表',
                               `permission_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能Code',
                               `permission_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能名称',
                               `permission_ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `action_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `data_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'AccountManagement', '账号管理', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (2, 'other', '其他', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (3, 'user', '个人中心', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (4, 'MyProject', '我的项目', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (5, 'MyProduct', '供货列表', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (6, 'Management', '维护权限', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (7, 'Book', '图书列表', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (8, 'MyBorrow', '我的借阅', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (9, 'BorrowManagement', '借阅管理', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permission_action
-- ----------------------------
DROP TABLE IF EXISTS `permission_action`;
CREATE TABLE `permission_action`  (
                                      `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能详情表',
                                      `permission_id` int(11) NOT NULL COMMENT '功能表id',
                                      `action_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方法code',
                                      `default_check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      `describes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名字',
                                      PRIMARY KEY (`action_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_action
-- ----------------------------
INSERT INTO `permission_action` VALUES (43, 1, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (44, 1, 'get', 'false', '详情');
INSERT INTO `permission_action` VALUES (45, 1, 'export', 'false', '导出');
INSERT INTO `permission_action` VALUES (46, 1, 'del', 'false', '删除');
INSERT INTO `permission_action` VALUES (47, 2, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (48, 2, 'get', 'false', '详情');
INSERT INTO `permission_action` VALUES (49, 2, 'export', 'false', '导出');
INSERT INTO `permission_action` VALUES (50, 2, 'del', 'false', '删除');
INSERT INTO `permission_action` VALUES (51, 3, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (52, 3, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (53, 3, 'get', 'false', '详情');
INSERT INTO `permission_action` VALUES (54, 3, 'export', 'false', '导出');
INSERT INTO `permission_action` VALUES (55, 3, 'del', 'false', '删除');
INSERT INTO `permission_action` VALUES (56, 4, 'del', 'false', '删除');
INSERT INTO `permission_action` VALUES (57, 4, 'export', 'false', '导出');
INSERT INTO `permission_action` VALUES (58, 4, 'get', 'false', '详情');
INSERT INTO `permission_action` VALUES (59, 4, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (60, 5, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (61, 5, 'get', 'false', '详情');
INSERT INTO `permission_action` VALUES (62, 5, 'export', 'false', '导出');
INSERT INTO `permission_action` VALUES (63, 5, 'del', 'false', '删除');
INSERT INTO `permission_action` VALUES (64, 6, 'add', 'false', '添加');
INSERT INTO `permission_action` VALUES (65, 6, 'get', 'false', '详情');
INSERT INTO `permission_action` VALUES (66, 6, 'export', 'false', '导出');
INSERT INTO `permission_action` VALUES (67, 6, 'del', 'false', '删除');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                           `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '待完成' COMMENT '数据状态(草稿、未提交、已提交)',
                           `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
                           `record_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '实验记录名称',
                           `submit_time` datetime NULL DEFAULT NULL COMMENT '记录提交时间(初始化为空)',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
                           PRIMARY KEY (`id`) USING BTREE,
                           INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1802973639771926530 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '实验记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, '已完成', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', '实验一', '2024-06-17 13:22:27', '2024-05-30 11:01:42', '2024-06-17 13:22:26', 0);
INSERT INTO `record` VALUES (1796162840143466497, '已完成', '1888dee2-c173-48e0-ac2c-e5a043dec7d4', '实验二', '2024-06-17 09:47:33', '2024-05-30 20:52:46', '2024-06-18 16:15:19', 0);
INSERT INTO `record` VALUES (1801488063201726466, '已完成', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', '实验三', '2024-06-17 09:47:12', '2024-05-30 11:01:42', '2024-06-18 14:48:09', 0);
INSERT INTO `record` VALUES (1802918888518692865, '已完成', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', '测试', '2024-06-18 16:51:55', '2024-06-18 12:18:54', '2024-06-18 16:52:08', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
                         `role_id` int(11) NOT NULL,
                         `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                         `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                         PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, 'admin', '系统管理员');
INSERT INTO `role` VALUES (1, 'maintain', '维护人员');
INSERT INTO `role` VALUES (2, 'user', '用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
                                    `role_permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限功能表',
                                    `permission_id` int(11) NOT NULL COMMENT '功能ID',
                                    `role_id` int(11) NOT NULL COMMENT '权限id',
                                    PRIMARY KEY (`role_permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (43, 1, 0);
INSERT INTO `role_permission` VALUES (44, 2, 0);
INSERT INTO `role_permission` VALUES (45, 3, 0);
INSERT INTO `role_permission` VALUES (46, 2, 1);
INSERT INTO `role_permission` VALUES (47, 3, 1);
INSERT INTO `role_permission` VALUES (48, 6, 1);
INSERT INTO `role_permission` VALUES (49, 3, 2);
INSERT INTO `role_permission` VALUES (50, 4, 2);
INSERT INTO `role_permission` VALUES (51, 5, 2);
INSERT INTO `role_permission` VALUES (52, 7, 2);
INSERT INTO `role_permission` VALUES (53, 7, 1);
INSERT INTO `role_permission` VALUES (54, 7, 0);
INSERT INTO `role_permission` VALUES (55, 8, 2);
INSERT INTO `role_permission` VALUES (56, 9, 0);

-- ----------------------------
-- Table structure for sample_type
-- ----------------------------
DROP TABLE IF EXISTS `sample_type`;
CREATE TABLE `sample_type`  (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                `sample_type_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE INDEX `uk_type_name`(`sample_type_name` ASC) USING BTREE COMMENT '唯一样本类型'
) ENGINE = InnoDB AUTO_INCREMENT = 1802873775411138562 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '样本类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sample_type
-- ----------------------------
INSERT INTO `sample_type` VALUES (1797499575100112897, '草地', '2024-06-03 13:24:29', '2024-06-03 20:36:30', 0);
INSERT INTO `sample_type` VALUES (1797568827433848833, '林地', '2024-06-03 17:59:40', '2024-06-03 20:36:41', 0);
INSERT INTO `sample_type` VALUES (1801059724293038082, '砂土', '2024-06-13 09:11:15', '2024-06-13 09:11:15', 0);
INSERT INTO `sample_type` VALUES (1801495063151169537, '空气', '2024-06-14 14:01:07', '2024-06-14 14:01:40', 0);

-- ----------------------------
-- Table structure for soil_sample
-- ----------------------------
DROP TABLE IF EXISTS `soil_sample`;
CREATE TABLE `soil_sample`  (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                `sample_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '样本名称',
                                `sample_type_id` bigint(20) NOT NULL COMMENT '样本类型id',
                                `record_id` bigint(20) NOT NULL COMMENT '记录id',
                                `color` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '颜色',
                                `smell` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '气味',
                                `organism` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '生物种类',
                                `hardness` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '颗粒硬度',
                                `size_gt2mm` decimal(5, 2) NOT NULL COMMENT '颗粒大小>2mm',
                                `size_lt2mm` decimal(5, 2) NOT NULL COMMENT '颗粒大小<2mm',
                                `viscosity` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '黏度',
                                `humidity` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '湿度',
                                `density` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '紧实度',
                                `water_retention` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '保水性',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `idx_record_id`(`record_id` ASC) USING BTREE COMMENT '实验记录id',
                                INDEX `idx_sample_type_id`(`sample_type_id` ASC) USING BTREE COMMENT '样本类型id'
) ENGINE = InnoDB AUTO_INCREMENT = 1802987592434532354 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '土壤样本表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of soil_sample
-- ----------------------------
INSERT INTO `soil_sample` VALUES (1796162840185409538, '土壤样本一', 1797499575100112897, 1, '棕色', '土腥味', '植物根系', '中/较软', 2.39, 7.03, '中', '中', '高', '中', '2024-06-06 15:28:41', '2024-06-07 09:38:07', 0);
INSERT INTO `soil_sample` VALUES (1796162840185409539, '土壤样本二', 1797568827433848833, 1, '棕色', '土腥味', '树根系', '软/低', 4.27, 5.34, '高', '大', '中', '高', '2024-06-06 15:28:41', '2024-06-07 13:19:06', 0);
INSERT INTO `soil_sample` VALUES (1796162840185409540, '土壤样本三', 1797499575100112897, 1796162840143466497, '棕色', '土腥味', '植物根系', '中/较软', 2.39, 7.03, '中', '中', '高', '中', '2024-06-07 16:18:03', '2024-06-07 16:17:20', 0);
INSERT INTO `soil_sample` VALUES (1801496589299011585, '土壤2004', 1797568827433848833, 1801496132535111681, '黑', '无', '昆虫', '松', 5.00, 10.00, '一般', '40', '一般', '高', '2024-06-14 14:07:11', '2024-06-14 14:07:51', 0);
INSERT INTO `soil_sample` VALUES (1802002236214005762, '909', 1801495063151169537, 1801488063201726466, '2', '2', '2', '2', 0.10, 1.00, '11', '111', '11', '22', '2024-06-15 23:36:27', '2024-06-18 14:48:09', 0);
INSERT INTO `soil_sample` VALUES (1802987592434532353, '12122222', 1797568827433848833, 1802918888518692865, '1212', '12', '12', '12', 12.00, 12.00, '12', '12', '12', '121', '2024-06-18 16:51:54', '2024-06-18 16:52:08', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
                              `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
                              `user_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                              `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                              `pass_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                              `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                              `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                              `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
                              `status` int(11) NULL DEFAULT NULL COMMENT '0禁用 1正常 2备用',
                              `created_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
                              PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1888dee2-c173-48e0-ac2c-e5a043dec7d4', 'admin', '系统管理员', 'e6009df49d3ce361dbc2fa7788c6f0a4', '562eef70-9f78-4736-ae26-8c6b82907241', '12345678', '12345678', 1, '2024-03-06 16:03:25');
INSERT INTO `user_info` VALUES ('189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', 'shanghai123', '123', '97446b776d94c3b907c59bbc224e5a30', '40f9c810-15a9-40cf-a604-68bd219ac15e', '123456', '123456', 1, '2024-06-14 14:02:48');
INSERT INTO `user_info` VALUES ('554c9e86-e577-4bfb-891d-45fd14723e1a', 'maintain', '维护人员', 'ccdf5ef6227ca812583fd8b58e8e29de', '450fba82-a565-47f2-a2c5-26d3f6ebb13a', '12345678', '123456789', 1, '2024-06-06 12:37:57');
INSERT INTO `user_info` VALUES ('e5fbd029-b4b0-4f12-8679-510ef9695be3', 'user', '用户', '17d5e423900efcd06d1997eca49642a5', '2a874930-a0d0-4fe3-9772-a1e1ebf02656', '12345678', '1111', 1, '2024-06-06 12:38:35');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
                              `user_role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
                              `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
                              `role_id` int(11) NULL DEFAULT NULL,
                              PRIMARY KEY (`user_role_id`) USING BTREE,
                              INDEX `user_role_user_info_id`(`user_id` ASC) USING BTREE,
                              INDEX `user_role_role_id`(`role_id` ASC) USING BTREE,
                              CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                              CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1888dee2-c173-48e0-ac2c-e5a043dec7d4', 0);
INSERT INTO `user_role` VALUES ('2f9684b0-ff99-4c2d-b5b1-631230b9bcaa', '554c9e86-e577-4bfb-891d-45fd14723e1a', 1);
INSERT INTO `user_role` VALUES ('cf7fc751-6b29-4932-acfb-942b433b53ef', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 2);
INSERT INTO `user_role` VALUES ('e082fe57-3a53-4c66-9603-fbc3958763bd', '189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', 2);

SET FOREIGN_KEY_CHECKS = 1;
