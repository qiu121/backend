/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : experiment_admin

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 24/06/2024 23:26:08
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
) ENGINE = InnoDB AUTO_INCREMENT = 3545 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1688, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 16:05:09');
INSERT INTO `log` VALUES (1689, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-17 16:05:09');
INSERT INTO `log` VALUES (1690, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[]', '2024-06-17 16:05:09');
INSERT INTO `log` VALUES (1691, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-17 16:05:22');
INSERT INTO `log` VALUES (1692, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-17 16:05:25');
INSERT INTO `log` VALUES (1693, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-17 16:05:25');
INSERT INTO `log` VALUES (1694, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 16:05:27');
INSERT INTO `log` VALUES (1695, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 16:05:28');
INSERT INTO `log` VALUES (1696, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-17 16:05:30');
INSERT INTO `log` VALUES (1697, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[]', '2024-06-17 16:05:30');
INSERT INTO `log` VALUES (1698, '0:0:0:0:0:0:0:1', '非用户调用', 'http://localhost:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-17 17:24:40');
INSERT INTO `log` VALUES (1699, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:26:42');
INSERT INTO `log` VALUES (1700, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:27:11');
INSERT INTO `log` VALUES (1701, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":100,\"currentPage\":1}]', '2024-06-17 17:27:43');
INSERT INTO `log` VALUES (1702, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":100,\"currentPage\":10}]', '2024-06-17 17:27:53');
INSERT INTO `log` VALUES (1703, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2}]', '2024-06-17 17:28:32');
INSERT INTO `log` VALUES (1704, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2}]', '2024-06-17 17:28:40');
INSERT INTO `log` VALUES (1705, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:53:18');
INSERT INTO `log` VALUES (1706, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-17 17:53:19');
INSERT INTO `log` VALUES (1707, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[]', '2024-06-17 17:53:19');
INSERT INTO `log` VALUES (1708, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-17 17:53:22');
INSERT INTO `log` VALUES (1709, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-17 17:53:27');
INSERT INTO `log` VALUES (1710, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:53:27');
INSERT INTO `log` VALUES (1711, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:53:28');
INSERT INTO `log` VALUES (1712, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1}]', '2024-06-17 17:53:39');
INSERT INTO `log` VALUES (1713, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":50,\"currentPage\":1}]', '2024-06-17 17:53:43');
INSERT INTO `log` VALUES (1714, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:53:59');
INSERT INTO `log` VALUES (1715, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:54:00');
INSERT INTO `log` VALUES (1716, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:54:04');
INSERT INTO `log` VALUES (1717, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:54:05');
INSERT INTO `log` VALUES (1718, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2}]', '2024-06-17 17:54:06');
INSERT INTO `log` VALUES (1719, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:54:12');
INSERT INTO `log` VALUES (1720, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2}]', '2024-06-17 17:54:17');
INSERT INTO `log` VALUES (1721, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":1}]', '2024-06-17 17:54:19');
INSERT INTO `log` VALUES (1722, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2}]', '2024-06-17 17:54:19');
INSERT INTO `log` VALUES (1723, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":1}]', '2024-06-17 17:54:20');
INSERT INTO `log` VALUES (1724, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2}]', '2024-06-17 17:54:21');
INSERT INTO `log` VALUES (1725, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:58:13');
INSERT INTO `log` VALUES (1726, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:58:16');
INSERT INTO `log` VALUES (1727, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:58:39');
INSERT INTO `log` VALUES (1728, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:58:40');
INSERT INTO `log` VALUES (1729, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:58:43');
INSERT INTO `log` VALUES (1730, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:58:48');
INSERT INTO `log` VALUES (1731, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:58:51');
INSERT INTO `log` VALUES (1732, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:59:04');
INSERT INTO `log` VALUES (1733, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:59:05');
INSERT INTO `log` VALUES (1734, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:06');
INSERT INTO `log` VALUES (1735, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":1,\"currentPage\":2},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:10');
INSERT INTO `log` VALUES (1736, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:14');
INSERT INTO `log` VALUES (1737, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:19');
INSERT INTO `log` VALUES (1738, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":100,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:22');
INSERT INTO `log` VALUES (1739, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:59:25');
INSERT INTO `log` VALUES (1740, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:26');
INSERT INTO `log` VALUES (1741, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 17:59:35');
INSERT INTO `log` VALUES (1742, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:36');
INSERT INTO `log` VALUES (1743, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-17 17:59:38');
INSERT INTO `log` VALUES (1744, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[]', '2024-06-17 17:59:38');
INSERT INTO `log` VALUES (1745, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:59:39');
INSERT INTO `log` VALUES (1746, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:40');
INSERT INTO `log` VALUES (1747, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 17:59:45');
INSERT INTO `log` VALUES (1748, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-17 17:59:48');
INSERT INTO `log` VALUES (1749, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-17 17:59:49');
INSERT INTO `log` VALUES (1750, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[]', '2024-06-17 17:59:49');
INSERT INTO `log` VALUES (1751, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/login', '【系统管理员】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-17 19:22:37');
INSERT INTO `log` VALUES (1752, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:22:37');
INSERT INTO `log` VALUES (1753, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[]', '2024-06-17 19:22:45');
INSERT INTO `log` VALUES (1754, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-17 19:22:46');
INSERT INTO `log` VALUES (1755, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:23:25');
INSERT INTO `log` VALUES (1756, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-17 19:23:26');
INSERT INTO `log` VALUES (1757, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 19:23:43');
INSERT INTO `log` VALUES (1758, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[]', '2024-06-17 19:23:55');
INSERT INTO `log` VALUES (1759, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:24:46');
INSERT INTO `log` VALUES (1760, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:24:51');
INSERT INTO `log` VALUES (1761, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:25:25');
INSERT INTO `log` VALUES (1762, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[]', '2024-06-17 19:25:27');
INSERT INTO `log` VALUES (1763, '0:0:0:0:0:0:0:1', '非用户调用', 'http://localhost:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-17 19:35:29');
INSERT INTO `log` VALUES (1764, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 19:40:45');
INSERT INTO `log` VALUES (1765, '0:0:0:0:0:0:0:1', '非用户调用', 'http://localhost:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-17 19:44:24');
INSERT INTO `log` VALUES (1766, '0:0:0:0:0:0:0:1', '非用户调用', 'http://localhost:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-17 19:45:28');
INSERT INTO `log` VALUES (1767, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:46:57');
INSERT INTO `log` VALUES (1768, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 19:46:59');
INSERT INTO `log` VALUES (1769, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 19:50:24');
INSERT INTO `log` VALUES (1770, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":1,\"currentPage\":1}]', '2024-06-17 19:50:36');
INSERT INTO `log` VALUES (1771, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":1,\"currentPage\":1}]', '2024-06-17 19:51:29');
INSERT INTO `log` VALUES (1772, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":2,\"currentPage\":1}]', '2024-06-17 19:51:41');
INSERT INTO `log` VALUES (1773, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":2,\"currentPage\":1}]', '2024-06-17 19:52:52');
INSERT INTO `log` VALUES (1774, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":2,\"currentPage\":1}]', '2024-06-17 19:53:20');
INSERT INTO `log` VALUES (1775, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":2,\"currentPage\":1}]', '2024-06-17 19:53:32');
INSERT INTO `log` VALUES (1776, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":2,\"currentPage\":1}]', '2024-06-17 19:54:41');
INSERT INTO `log` VALUES (1777, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:54:56');
INSERT INTO `log` VALUES (1778, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 19:54:57');
INSERT INTO `log` VALUES (1779, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 19:55:10');
INSERT INTO `log` VALUES (1780, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 19:55:11');
INSERT INTO `log` VALUES (1781, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-17 20:02:21');
INSERT INTO `log` VALUES (1782, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 20:02:22');
INSERT INTO `log` VALUES (1783, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 20:02:28');
INSERT INTO `log` VALUES (1784, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 20:02:41');
INSERT INTO `log` VALUES (1785, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 20:03:22');
INSERT INTO `log` VALUES (1786, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-17 20:03:28');
INSERT INTO `log` VALUES (1787, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 09:09:24');
INSERT INTO `log` VALUES (1788, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:09:24');
INSERT INTO `log` VALUES (1789, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 09:09:28');
INSERT INTO `log` VALUES (1790, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1}]', '2024-06-18 09:09:34');
INSERT INTO `log` VALUES (1791, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:18:25');
INSERT INTO `log` VALUES (1792, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 09:18:26');
INSERT INTO `log` VALUES (1793, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/add', '【系统管理员】新增样本类型', '执行成功！', '[{\"sampleTypeName\":\"1212\"}]', '2024-06-18 09:19:39');
INSERT INTO `log` VALUES (1794, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 09:19:39');
INSERT INTO `log` VALUES (1795, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/del/1802873775411138561', '【系统管理员】删除样本类型', '执行成功！', '[1802873775411138561]', '2024-06-18 09:19:44');
INSERT INTO `log` VALUES (1796, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 09:19:44');
INSERT INTO `log` VALUES (1797, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:19:46');
INSERT INTO `log` VALUES (1798, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:20:40');
INSERT INTO `log` VALUES (1799, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:20:40');
INSERT INTO `log` VALUES (1800, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:34:46');
INSERT INTO `log` VALUES (1801, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:34:46');
INSERT INTO `log` VALUES (1802, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"roleId\":2,\"userName\":\"00000000\",\"phone\":\"00000000\",\"name\":\"00000000\",\"email\":\"00000000\",\"status\":0}]', '2024-06-18 09:35:39');
INSERT INTO `log` VALUES (1803, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:35:39');
INSERT INTO `log` VALUES (1804, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"roleId\":2,\"userName\":\"00000000\",\"phone\":\"00000000\",\"name\":\"00000000\",\"email\":\"00000000\",\"status\":0}]', '2024-06-18 09:39:23');
INSERT INTO `log` VALUES (1805, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"roleId\":2,\"userName\":\"00000000\",\"phone\":\"00000000\",\"name\":\"00000000\",\"email\":\"00000000\",\"status\":0}]', '2024-06-18 09:39:51');
INSERT INTO `log` VALUES (1806, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"roleId\":2,\"userName\":\"00000000\",\"phone\":\"00000000\",\"name\":\"00000000\",\"email\":\"000000\",\"status\":0}]', '2024-06-18 09:40:50');
INSERT INTO `log` VALUES (1807, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:41:35');
INSERT INTO `log` VALUES (1808, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:41:37');
INSERT INTO `log` VALUES (1809, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:42:28');
INSERT INTO `log` VALUES (1810, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:42:30');
INSERT INTO `log` VALUES (1811, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:42:46');
INSERT INTO `log` VALUES (1812, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:47:21');
INSERT INTO `log` VALUES (1813, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:47:21');
INSERT INTO `log` VALUES (1814, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"cfcd208495d565ef66e7dff9f98764da\",\"roleId\":2,\"userName\":\"00000000\",\"phone\":\"0000\",\"name\":\"00000000000\",\"email\":\"00\",\"status\":0}]', '2024-06-18 09:50:20');
INSERT INTO `log` VALUES (1815, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/delUserInfoByUserId', '【系统管理员】删除用户信息', '执行成功！', '[\"73b3eeef-c48c-4ecf-8724-cd95eafb75d4\"]', '2024-06-18 09:50:39');
INSERT INTO `log` VALUES (1816, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:50:39');
INSERT INTO `log` VALUES (1817, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:53:21');
INSERT INTO `log` VALUES (1818, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 09:53:24');
INSERT INTO `log` VALUES (1819, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 09:53:25');
INSERT INTO `log` VALUES (1820, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 09:55:17');
INSERT INTO `log` VALUES (1821, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:14:42');
INSERT INTO `log` VALUES (1822, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:14:42');
INSERT INTO `log` VALUES (1823, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"a\"}]', '2024-06-18 10:14:59');
INSERT INTO `log` VALUES (1824, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"a\"}]', '2024-06-18 10:15:03');
INSERT INTO `log` VALUES (1825, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"a\"}]', '2024-06-18 10:15:04');
INSERT INTO `log` VALUES (1826, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"dad\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"a\"}]', '2024-06-18 10:15:21');
INSERT INTO `log` VALUES (1827, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:15:25');
INSERT INTO `log` VALUES (1828, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:15:32');
INSERT INTO `log` VALUES (1829, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:15:33');
INSERT INTO `log` VALUES (1830, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:15:34');
INSERT INTO `log` VALUES (1831, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:15:34');
INSERT INTO `log` VALUES (1832, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:15:34');
INSERT INTO `log` VALUES (1833, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":0}]', '2024-06-18 10:15:37');
INSERT INTO `log` VALUES (1834, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 10:15:39');
INSERT INTO `log` VALUES (1835, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 10:15:45');
INSERT INTO `log` VALUES (1836, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 10:17:26');
INSERT INTO `log` VALUES (1837, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 10:19:50');
INSERT INTO `log` VALUES (1838, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 10:19:53');
INSERT INTO `log` VALUES (1839, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 10:20:09');
INSERT INTO `log` VALUES (1840, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 10:20:27');
INSERT INTO `log` VALUES (1841, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:21:46');
INSERT INTO `log` VALUES (1842, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:21:47');
INSERT INTO `log` VALUES (1843, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:22:20');
INSERT INTO `log` VALUES (1844, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:22:32');
INSERT INTO `log` VALUES (1845, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:22:38');
INSERT INTO `log` VALUES (1846, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:22:48');
INSERT INTO `log` VALUES (1847, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 10:23:17');
INSERT INTO `log` VALUES (1848, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 10:36:44');
INSERT INTO `log` VALUES (1849, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 10:36:50');
INSERT INTO `log` VALUES (1850, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:36:50');
INSERT INTO `log` VALUES (1851, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:36:54');
INSERT INTO `log` VALUES (1852, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:07');
INSERT INTO `log` VALUES (1853, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:18');
INSERT INTO `log` VALUES (1854, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:32');
INSERT INTO `log` VALUES (1855, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:36');
INSERT INTO `log` VALUES (1856, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:40');
INSERT INTO `log` VALUES (1857, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:44');
INSERT INTO `log` VALUES (1858, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:39:57');
INSERT INTO `log` VALUES (1859, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:02');
INSERT INTO `log` VALUES (1860, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行失败！', '[{},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:40:03');
INSERT INTO `log` VALUES (1861, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:11');
INSERT INTO `log` VALUES (1862, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:15');
INSERT INTO `log` VALUES (1863, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:18');
INSERT INTO `log` VALUES (1864, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行失败！', '[{},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:40:19');
INSERT INTO `log` VALUES (1865, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:21');
INSERT INTO `log` VALUES (1866, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行失败！', '[{},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:40:22');
INSERT INTO `log` VALUES (1867, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:25');
INSERT INTO `log` VALUES (1868, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:29');
INSERT INTO `log` VALUES (1869, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:33');
INSERT INTO `log` VALUES (1870, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:40:36');
INSERT INTO `log` VALUES (1871, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:40:37');
INSERT INTO `log` VALUES (1872, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:41:09');
INSERT INTO `log` VALUES (1873, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:41:10');
INSERT INTO `log` VALUES (1874, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:41:12');
INSERT INTO `log` VALUES (1875, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:41:13');
INSERT INTO `log` VALUES (1876, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:43:50');
INSERT INTO `log` VALUES (1877, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:43:50');
INSERT INTO `log` VALUES (1878, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:43:54');
INSERT INTO `log` VALUES (1879, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:01');
INSERT INTO `log` VALUES (1880, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:20');
INSERT INTO `log` VALUES (1881, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:21');
INSERT INTO `log` VALUES (1882, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 10:44:22');
INSERT INTO `log` VALUES (1883, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:26');
INSERT INTO `log` VALUES (1884, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:31');
INSERT INTO `log` VALUES (1885, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 10:44:41');
INSERT INTO `log` VALUES (1886, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:42');
INSERT INTO `log` VALUES (1887, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-18 10:44:43');
INSERT INTO `log` VALUES (1888, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:44:45');
INSERT INTO `log` VALUES (1889, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 10:44:49');
INSERT INTO `log` VALUES (1890, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 10:45:03');
INSERT INTO `log` VALUES (1891, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 10:45:05');
INSERT INTO `log` VALUES (1892, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 10:45:09');
INSERT INTO `log` VALUES (1893, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 10:45:09');
INSERT INTO `log` VALUES (1894, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 10:45:11');
INSERT INTO `log` VALUES (1895, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 10:45:12');
INSERT INTO `log` VALUES (1896, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 10:45:12');
INSERT INTO `log` VALUES (1897, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:02:28');
INSERT INTO `log` VALUES (1898, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:02:29');
INSERT INTO `log` VALUES (1899, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:02:33');
INSERT INTO `log` VALUES (1900, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:04:39');
INSERT INTO `log` VALUES (1901, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:04:41');
INSERT INTO `log` VALUES (1902, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:07:14');
INSERT INTO `log` VALUES (1903, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":0,\"userName\":\"12345678\",\"userId\":\"246a47af-5820-483d-b83f-c8c233e8f7bc\",\"phone\":\"12345678\",\"name\":\"12345678\",\"email\":\"12345678\",\"status\":1}]', '2024-06-18 11:07:20');
INSERT INTO `log` VALUES (1904, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:07:20');
INSERT INTO `log` VALUES (1905, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:07:22');
INSERT INTO `log` VALUES (1906, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":1,\"userName\":\"12345678\",\"userId\":\"246a47af-5820-483d-b83f-c8c233e8f7bc\",\"phone\":\"12345678\",\"name\":\"12345678\",\"email\":\"12345678\",\"status\":1}]', '2024-06-18 11:07:25');
INSERT INTO `log` VALUES (1907, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:07:25');
INSERT INTO `log` VALUES (1908, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:07:50');
INSERT INTO `log` VALUES (1909, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:07:57');
INSERT INTO `log` VALUES (1910, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:08:13');
INSERT INTO `log` VALUES (1911, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:08:16');
INSERT INTO `log` VALUES (1912, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:08:20');
INSERT INTO `log` VALUES (1913, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:08:20');
INSERT INTO `log` VALUES (1914, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:08:25');
INSERT INTO `log` VALUES (1915, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:08:52');
INSERT INTO `log` VALUES (1916, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:11:17');
INSERT INTO `log` VALUES (1917, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:11:18');
INSERT INTO `log` VALUES (1918, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:11:44');
INSERT INTO `log` VALUES (1919, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:11:55');
INSERT INTO `log` VALUES (1920, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:11:56');
INSERT INTO `log` VALUES (1921, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:13:51');
INSERT INTO `log` VALUES (1922, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:14:44');
INSERT INTO `log` VALUES (1923, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:14:48');
INSERT INTO `log` VALUES (1924, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:14:50');
INSERT INTO `log` VALUES (1925, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:14:53');
INSERT INTO `log` VALUES (1926, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:15:12');
INSERT INTO `log` VALUES (1927, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:15:15');
INSERT INTO `log` VALUES (1928, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:15:30');
INSERT INTO `log` VALUES (1929, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:15:34');
INSERT INTO `log` VALUES (1930, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:15:39');
INSERT INTO `log` VALUES (1931, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:16:08');
INSERT INTO `log` VALUES (1932, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:16:12');
INSERT INTO `log` VALUES (1933, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:16:19');
INSERT INTO `log` VALUES (1934, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:16:24');
INSERT INTO `log` VALUES (1935, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:16:25');
INSERT INTO `log` VALUES (1936, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:16:27');
INSERT INTO `log` VALUES (1937, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:16:43');
INSERT INTO `log` VALUES (1938, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:17:07');
INSERT INTO `log` VALUES (1939, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:17:08');
INSERT INTO `log` VALUES (1940, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:17:14');
INSERT INTO `log` VALUES (1941, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:17:27');
INSERT INTO `log` VALUES (1942, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:19:56');
INSERT INTO `log` VALUES (1943, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:19:59');
INSERT INTO `log` VALUES (1944, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"554c9e86-e577-4bfb-891d-45fd14723e1a\"]', '2024-06-18 11:20:04');
INSERT INTO `log` VALUES (1945, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:20:07');
INSERT INTO `log` VALUES (1946, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:20:20');
INSERT INTO `log` VALUES (1947, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:20:26');
INSERT INTO `log` VALUES (1948, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:20:29');
INSERT INTO `log` VALUES (1949, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:20:32');
INSERT INTO `log` VALUES (1950, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:20:33');
INSERT INTO `log` VALUES (1951, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:20:34');
INSERT INTO `log` VALUES (1952, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:20:39');
INSERT INTO `log` VALUES (1953, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:21:06');
INSERT INTO `log` VALUES (1954, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:21:10');
INSERT INTO `log` VALUES (1955, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:21:14');
INSERT INTO `log` VALUES (1956, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:21:45');
INSERT INTO `log` VALUES (1957, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:21:56');
INSERT INTO `log` VALUES (1958, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:21:56');
INSERT INTO `log` VALUES (1959, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 11:21:57');
INSERT INTO `log` VALUES (1960, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:22:00');
INSERT INTO `log` VALUES (1961, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:22:02');
INSERT INTO `log` VALUES (1962, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"554c9e86-e577-4bfb-891d-45fd14723e1a\"]', '2024-06-18 11:22:08');
INSERT INTO `log` VALUES (1963, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:22:12');
INSERT INTO `log` VALUES (1964, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":2,\"userName\":\"12345678\",\"userId\":\"246a47af-5820-483d-b83f-c8c233e8f7bc\",\"phone\":\"12345678\",\"name\":\"12345678\",\"email\":\"12345678\",\"status\":1}]', '2024-06-18 11:22:17');
INSERT INTO `log` VALUES (1965, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:22:17');
INSERT INTO `log` VALUES (1966, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:22:23');
INSERT INTO `log` VALUES (1967, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":2,\"userName\":\"12345678\",\"userId\":\"246a47af-5820-483d-b83f-c8c233e8f7bc\",\"phone\":\"12345678\",\"name\":\"12345678\",\"email\":\"12345678\",\"status\":0}]', '2024-06-18 11:22:28');
INSERT INTO `log` VALUES (1968, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:22:29');
INSERT INTO `log` VALUES (1969, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 11:22:35');
INSERT INTO `log` VALUES (1970, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"25d55ad283aa400af464c76d713c07ad\",\"userName\":\"12345678\",\"status\":0}]', '2024-06-18 11:22:42');
INSERT INTO `log` VALUES (1971, '127.0.0.1', '12345678', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【12345678】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:22:42');
INSERT INTO `log` VALUES (1972, '127.0.0.1', '12345678', 'http://127.0.0.1:8091/loginOut', '【12345678】退出登录', '执行失败！', '[]', '2024-06-18 11:22:44');
INSERT INTO `log` VALUES (1973, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 11:22:48');
INSERT INTO `log` VALUES (1974, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:22:48');
INSERT INTO `log` VALUES (1975, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:22:49');
INSERT INTO `log` VALUES (1976, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:22:51');
INSERT INTO `log` VALUES (1977, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 11:22:52');
INSERT INTO `log` VALUES (1978, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":2,\"userName\":\"12345678\",\"userId\":\"246a47af-5820-483d-b83f-c8c233e8f7bc\",\"phone\":\"12345678\",\"name\":\"12345678\",\"email\":\"12345678\",\"status\":1}]', '2024-06-18 11:22:55');
INSERT INTO `log` VALUES (1979, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:22:55');
INSERT INTO `log` VALUES (1980, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:31:33');
INSERT INTO `log` VALUES (1981, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:31:35');
INSERT INTO `log` VALUES (1982, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:31:36');
INSERT INTO `log` VALUES (1983, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:31:43');
INSERT INTO `log` VALUES (1984, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:31:48');
INSERT INTO `log` VALUES (1985, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:31:49');
INSERT INTO `log` VALUES (1986, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:31:52');
INSERT INTO `log` VALUES (1987, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 11:31:55');
INSERT INTO `log` VALUES (1988, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:47:10');
INSERT INTO `log` VALUES (1989, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:47:12');
INSERT INTO `log` VALUES (1990, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:47:13');
INSERT INTO `log` VALUES (1991, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:47:14');
INSERT INTO `log` VALUES (1992, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:47:14');
INSERT INTO `log` VALUES (1993, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:47:15');
INSERT INTO `log` VALUES (1994, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:47:16');
INSERT INTO `log` VALUES (1995, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:48:24');
INSERT INTO `log` VALUES (1996, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:48:31');
INSERT INTO `log` VALUES (1997, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"1bbd886460827015e5d605ed44252251\",\"roleId\":2,\"userName\":\"user\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":1}]', '2024-06-18 11:48:39');
INSERT INTO `log` VALUES (1998, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:48:39');
INSERT INTO `log` VALUES (1999, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 11:48:41');
INSERT INTO `log` VALUES (2000, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:45');
INSERT INTO `log` VALUES (2001, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"25d55ad283aa400af464c76d713c07ad\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:48');
INSERT INTO `log` VALUES (2002, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"25d55ad283aa400af464c76d713c07ad\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:49');
INSERT INTO `log` VALUES (2003, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"25d55ad283aa400af464c76d713c07ad\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:50');
INSERT INTO `log` VALUES (2004, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"25d55ad283aa400af464c76d713c07ad\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:50');
INSERT INTO `log` VALUES (2005, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"25d55ad283aa400af464c76d713c07ad\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:50');
INSERT INTO `log` VALUES (2006, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:55');
INSERT INTO `log` VALUES (2007, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:56');
INSERT INTO `log` VALUES (2008, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:48:56');
INSERT INTO `log` VALUES (2009, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 11:49:00');
INSERT INTO `log` VALUES (2010, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:49:00');
INSERT INTO `log` VALUES (2011, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:49:02');
INSERT INTO `log` VALUES (2012, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:49:03');
INSERT INTO `log` VALUES (2013, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:49:04');
INSERT INTO `log` VALUES (2014, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"roleId\":2,\"userName\":\"user\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":1}]', '2024-06-18 11:49:10');
INSERT INTO `log` VALUES (2015, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:49:10');
INSERT INTO `log` VALUES (2016, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 11:49:21');
INSERT INTO `log` VALUES (2017, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:49:25');
INSERT INTO `log` VALUES (2018, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:50:04');
INSERT INTO `log` VALUES (2019, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 11:50:14');
INSERT INTO `log` VALUES (2020, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:50:14');
INSERT INTO `log` VALUES (2021, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 11:50:15');
INSERT INTO `log` VALUES (2022, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:50:18');
INSERT INTO `log` VALUES (2023, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:50:21');
INSERT INTO `log` VALUES (2024, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"roleId\":2,\"userName\":\"user\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":1}]', '2024-06-18 11:51:09');
INSERT INTO `log` VALUES (2025, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 11:51:09');
INSERT INTO `log` VALUES (2026, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 11:51:56');
INSERT INTO `log` VALUES (2027, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 11:52:00');
INSERT INTO `log` VALUES (2028, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 11:52:00');
INSERT INTO `log` VALUES (2029, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 11:52:02');
INSERT INTO `log` VALUES (2030, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 12:03:29');
INSERT INTO `log` VALUES (2031, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 12:03:34');
INSERT INTO `log` VALUES (2032, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:03:34');
INSERT INTO `log` VALUES (2033, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:03:36');
INSERT INTO `log` VALUES (2034, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:03:41');
INSERT INTO `log` VALUES (2035, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:03:43');
INSERT INTO `log` VALUES (2036, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:03:44');
INSERT INTO `log` VALUES (2037, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:03:49');
INSERT INTO `log` VALUES (2038, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":2,\"userName\":\"shanghai123\",\"userId\":\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\",\"phone\":\"123456\",\"name\":\"123\",\"email\":\"123456\",\"status\":0}]', '2024-06-18 12:03:53');
INSERT INTO `log` VALUES (2039, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:03:53');
INSERT INTO `log` VALUES (2040, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:04:10');
INSERT INTO `log` VALUES (2041, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":0,\"userName\":\"shanghai123\",\"userId\":\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\",\"phone\":\"123456\",\"name\":\"123\",\"email\":\"123456\",\"status\":0}]', '2024-06-18 12:04:13');
INSERT INTO `log` VALUES (2042, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:04:13');
INSERT INTO `log` VALUES (2043, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:04:55');
INSERT INTO `log` VALUES (2044, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":2,\"userName\":\"shanghai123\",\"userId\":\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\",\"phone\":\"123456\",\"name\":\"123\",\"email\":\"123456\",\"status\":1}]', '2024-06-18 12:05:00');
INSERT INTO `log` VALUES (2045, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:05:00');
INSERT INTO `log` VALUES (2046, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:05:06');
INSERT INTO `log` VALUES (2047, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"roleId\":2,\"userName\":\"shanghai123\",\"userId\":\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\",\"phone\":\"123456\",\"name\":\"123\",\"email\":\"123456\",\"status\":1}]', '2024-06-18 12:05:12');
INSERT INTO `log` VALUES (2048, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:05:12');
INSERT INTO `log` VALUES (2049, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 12:05:15');
INSERT INTO `log` VALUES (2050, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"shanghai123\",\"status\":0}]', '2024-06-18 12:05:21');
INSERT INTO `log` VALUES (2051, '127.0.0.1', 'shanghai123', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【123】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:05:21');
INSERT INTO `log` VALUES (2052, '127.0.0.1', 'shanghai123', 'http://127.0.0.1:8091/api/record/getRecord/189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', '【123】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:05:22');
INSERT INTO `log` VALUES (2053, '127.0.0.1', 'shanghai123', 'http://127.0.0.1:8091/api/record/getRecord/189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', '【123】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:05:25');
INSERT INTO `log` VALUES (2054, '127.0.0.1', 'shanghai123', 'http://127.0.0.1:8091/loginOut', '【123】退出登录', '执行失败！', '[]', '2024-06-18 12:05:28');
INSERT INTO `log` VALUES (2055, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 12:05:31');
INSERT INTO `log` VALUES (2056, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:05:31');
INSERT INTO `log` VALUES (2057, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:05:33');
INSERT INTO `log` VALUES (2058, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:05:34');
INSERT INTO `log` VALUES (2059, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 12:05:36');
INSERT INTO `log` VALUES (2060, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"b0fc70cdadda3f237342d041ad012a27\",\"roleId\":2,\"userName\":\"shanghai123\",\"userId\":\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\",\"phone\":\"123456\",\"name\":\"123\",\"email\":\"123456\",\"status\":1}]', '2024-06-18 12:05:52');
INSERT INTO `log` VALUES (2061, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:05:52');
INSERT INTO `log` VALUES (2062, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:06:59');
INSERT INTO `log` VALUES (2063, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:07:00');
INSERT INTO `log` VALUES (2064, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 12:07:25');
INSERT INTO `log` VALUES (2065, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 12:07:28');
INSERT INTO `log` VALUES (2066, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:07:28');
INSERT INTO `log` VALUES (2067, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:07:29');
INSERT INTO `log` VALUES (2068, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:07:31');
INSERT INTO `log` VALUES (2069, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:07:31');
INSERT INTO `log` VALUES (2070, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 12:07:43');
INSERT INTO `log` VALUES (2071, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 12:07:47');
INSERT INTO `log` VALUES (2072, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:07:47');
INSERT INTO `log` VALUES (2073, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:07:50');
INSERT INTO `log` VALUES (2074, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:08:34');
INSERT INTO `log` VALUES (2075, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:08:36');
INSERT INTO `log` VALUES (2076, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:08:36');
INSERT INTO `log` VALUES (2077, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:08:42');
INSERT INTO `log` VALUES (2078, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:08:43');
INSERT INTO `log` VALUES (2079, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:08:47');
INSERT INTO `log` VALUES (2080, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:08:47');
INSERT INTO `log` VALUES (2081, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:09:05');
INSERT INTO `log` VALUES (2082, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:09:05');
INSERT INTO `log` VALUES (2083, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:10:50');
INSERT INTO `log` VALUES (2084, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1}]', '2024-06-18 12:10:52');
INSERT INTO `log` VALUES (2085, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:11:07');
INSERT INTO `log` VALUES (2086, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:11:10');
INSERT INTO `log` VALUES (2087, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:11:10');
INSERT INTO `log` VALUES (2088, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:11:57');
INSERT INTO `log` VALUES (2089, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:11:59');
INSERT INTO `log` VALUES (2090, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:14:36');
INSERT INTO `log` VALUES (2091, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:14:37');
INSERT INTO `log` VALUES (2092, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行失败！', '[{}]', '2024-06-18 12:14:37');
INSERT INTO `log` VALUES (2093, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:14:41');
INSERT INTO `log` VALUES (2094, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:14:43');
INSERT INTO `log` VALUES (2095, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行失败！', '[{}]', '2024-06-18 12:14:43');
INSERT INTO `log` VALUES (2096, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:16:53');
INSERT INTO `log` VALUES (2097, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 12:16:56');
INSERT INTO `log` VALUES (2098, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 12:17:02');
INSERT INTO `log` VALUES (2099, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:17:02');
INSERT INTO `log` VALUES (2100, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:17:04');
INSERT INTO `log` VALUES (2101, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 12:17:10');
INSERT INTO `log` VALUES (2102, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 12:17:13');
INSERT INTO `log` VALUES (2103, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:17:14');
INSERT INTO `log` VALUES (2104, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:17:15');
INSERT INTO `log` VALUES (2105, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 12:17:28');
INSERT INTO `log` VALUES (2106, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:17:28');
INSERT INTO `log` VALUES (2107, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:17:30');
INSERT INTO `log` VALUES (2108, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 12:17:42');
INSERT INTO `log` VALUES (2109, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:17:48');
INSERT INTO `log` VALUES (2110, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:17:56');
INSERT INTO `log` VALUES (2111, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:18:00');
INSERT INTO `log` VALUES (2112, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 12:18:10');
INSERT INTO `log` VALUES (2113, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:18:15');
INSERT INTO `log` VALUES (2114, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:18:26');
INSERT INTO `log` VALUES (2115, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:18:27');
INSERT INTO `log` VALUES (2116, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行失败！', '[{}]', '2024-06-18 12:18:27');
INSERT INTO `log` VALUES (2117, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:18:36');
INSERT INTO `log` VALUES (2118, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:18:43');
INSERT INTO `log` VALUES (2119, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/add', '【系统管理员】新增实验记录', '执行成功！', '[{\"recordName\":\"测试实验\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 12:18:54');
INSERT INTO `log` VALUES (2120, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:18:54');
INSERT INTO `log` VALUES (2121, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:19:07');
INSERT INTO `log` VALUES (2122, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:15');
INSERT INTO `log` VALUES (2123, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:19:22');
INSERT INTO `log` VALUES (2124, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:22');
INSERT INTO `log` VALUES (2125, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:24');
INSERT INTO `log` VALUES (2126, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:32');
INSERT INTO `log` VALUES (2127, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:37');
INSERT INTO `log` VALUES (2128, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行失败！', '[{}]', '2024-06-18 12:19:48');
INSERT INTO `log` VALUES (2129, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:49');
INSERT INTO `log` VALUES (2130, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行失败！', '[{}]', '2024-06-18 12:19:56');
INSERT INTO `log` VALUES (2131, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:19:56');
INSERT INTO `log` VALUES (2132, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 12:20:04');
INSERT INTO `log` VALUES (2133, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 12:20:07');
INSERT INTO `log` VALUES (2134, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:20:07');
INSERT INTO `log` VALUES (2135, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:20:09');
INSERT INTO `log` VALUES (2136, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:20:10');
INSERT INTO `log` VALUES (2137, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:20:17');
INSERT INTO `log` VALUES (2138, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行失败！', '[{}]', '2024-06-18 12:20:17');
INSERT INTO `log` VALUES (2139, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 12:20:46');
INSERT INTO `log` VALUES (2140, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 12:20:50');
INSERT INTO `log` VALUES (2141, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 12:20:50');
INSERT INTO `log` VALUES (2142, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:20:53');
INSERT INTO `log` VALUES (2143, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:21:01');
INSERT INTO `log` VALUES (2144, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 12:21:03');
INSERT INTO `log` VALUES (2145, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:21:04');
INSERT INTO `log` VALUES (2146, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行失败！', '[{}]', '2024-06-18 12:21:04');
INSERT INTO `log` VALUES (2147, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 12:21:36');
INSERT INTO `log` VALUES (2148, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1}]', '2024-06-18 12:21:41');
INSERT INTO `log` VALUES (2149, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 12:22:09');
INSERT INTO `log` VALUES (2150, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行失败！', '[{}]', '2024-06-18 12:22:09');
INSERT INTO `log` VALUES (2151, '0:0:0:0:0:0:0:1', '非用户调用', 'http://localhost:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 12:57:51');
INSERT INTO `log` VALUES (2152, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":2,\"currentPage\":1}]', '2024-06-18 12:58:38');
INSERT INTO `log` VALUES (2153, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[null]', '2024-06-18 12:58:52');
INSERT INTO `log` VALUES (2154, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":1,\"currentPage\":1}]', '2024-06-18 12:59:07');
INSERT INTO `log` VALUES (2155, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":1,\"currentPage\":1}]', '2024-06-18 13:00:07');
INSERT INTO `log` VALUES (2156, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:00:24');
INSERT INTO `log` VALUES (2157, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:00:33');
INSERT INTO `log` VALUES (2158, '0:0:0:0:0:0:0:1', 'admin', 'http://localhost:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[null]', '2024-06-18 13:01:04');
INSERT INTO `log` VALUES (2159, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/login', '【系统管理员】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 13:01:35');
INSERT INTO `log` VALUES (2160, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:01:35');
INSERT INTO `log` VALUES (2161, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:01:38');
INSERT INTO `log` VALUES (2162, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:01:42');
INSERT INTO `log` VALUES (2163, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 13:01:44');
INSERT INTO `log` VALUES (2164, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:01:44');
INSERT INTO `log` VALUES (2165, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:01:52');
INSERT INTO `log` VALUES (2166, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:01:53');
INSERT INTO `log` VALUES (2167, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:01:54');
INSERT INTO `log` VALUES (2168, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行失败！', '[{}]', '2024-06-18 13:02:03');
INSERT INTO `log` VALUES (2169, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:02:03');
INSERT INTO `log` VALUES (2170, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:03:12');
INSERT INTO `log` VALUES (2171, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:03:12');
INSERT INTO `log` VALUES (2172, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 13:03:13');
INSERT INTO `log` VALUES (2173, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:03:14');
INSERT INTO `log` VALUES (2174, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:03:14');
INSERT INTO `log` VALUES (2175, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:03:18');
INSERT INTO `log` VALUES (2176, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:03:19');
INSERT INTO `log` VALUES (2177, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:03:35');
INSERT INTO `log` VALUES (2178, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:03:37');
INSERT INTO `log` VALUES (2179, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:04:06');
INSERT INTO `log` VALUES (2180, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:04:07');
INSERT INTO `log` VALUES (2181, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 13:04:08');
INSERT INTO `log` VALUES (2182, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:04:08');
INSERT INTO `log` VALUES (2183, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:04:09');
INSERT INTO `log` VALUES (2184, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行失败！', '[{\"recordName\":\"实验\"}]', '2024-06-18 13:04:17');
INSERT INTO `log` VALUES (2185, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:04:17');
INSERT INTO `log` VALUES (2186, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 13:05:00');
INSERT INTO `log` VALUES (2187, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 13:05:05');
INSERT INTO `log` VALUES (2188, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:05:05');
INSERT INTO `log` VALUES (2189, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:05:06');
INSERT INTO `log` VALUES (2190, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:05:08');
INSERT INTO `log` VALUES (2191, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:08:03');
INSERT INTO `log` VALUES (2192, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:08:04');
INSERT INTO `log` VALUES (2193, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 13:12:18');
INSERT INTO `log` VALUES (2194, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 13:12:21');
INSERT INTO `log` VALUES (2195, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:12:21');
INSERT INTO `log` VALUES (2196, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:23');
INSERT INTO `log` VALUES (2197, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:24');
INSERT INTO `log` VALUES (2198, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:28');
INSERT INTO `log` VALUES (2199, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:30');
INSERT INTO `log` VALUES (2200, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:32');
INSERT INTO `log` VALUES (2201, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:39');
INSERT INTO `log` VALUES (2202, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:46');
INSERT INTO `log` VALUES (2203, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:12:51');
INSERT INTO `log` VALUES (2204, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:13:01');
INSERT INTO `log` VALUES (2205, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:13:21');
INSERT INTO `log` VALUES (2206, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:13:23');
INSERT INTO `log` VALUES (2207, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:15:30');
INSERT INTO `log` VALUES (2208, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:15:48');
INSERT INTO `log` VALUES (2209, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:15:50');
INSERT INTO `log` VALUES (2210, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:16:01');
INSERT INTO `log` VALUES (2211, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:02');
INSERT INTO `log` VALUES (2212, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:16:04');
INSERT INTO `log` VALUES (2213, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:16:08');
INSERT INTO `log` VALUES (2214, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:09');
INSERT INTO `log` VALUES (2215, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:16:12');
INSERT INTO `log` VALUES (2216, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:13');
INSERT INTO `log` VALUES (2217, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:16:22');
INSERT INTO `log` VALUES (2218, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:22');
INSERT INTO `log` VALUES (2219, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行成功！', '[{\"recordName\":\"发生发顺丰\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 13:16:30');
INSERT INTO `log` VALUES (2220, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:30');
INSERT INTO `log` VALUES (2221, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/del/1802933384050094082', '【用户】删除实验记录', '执行成功！', '[1802933384050094082]', '2024-06-18 13:16:36');
INSERT INTO `log` VALUES (2222, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:36');
INSERT INTO `log` VALUES (2223, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:40');
INSERT INTO `log` VALUES (2224, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:16:56');
INSERT INTO `log` VALUES (2225, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:17:03');
INSERT INTO `log` VALUES (2226, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:17:55');
INSERT INTO `log` VALUES (2227, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:18:30');
INSERT INTO `log` VALUES (2228, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 13:19:33');
INSERT INTO `log` VALUES (2229, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 13:19:38');
INSERT INTO `log` VALUES (2230, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:19:38');
INSERT INTO `log` VALUES (2231, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:19:39');
INSERT INTO `log` VALUES (2232, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:19:41');
INSERT INTO `log` VALUES (2233, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/update', '【系统管理员】修改实验记录', '执行成功！', '[{\"recordName\":\"测试实验1\",\"id\":1802918888518692865}]', '2024-06-18 13:19:44');
INSERT INTO `log` VALUES (2234, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:19:44');
INSERT INTO `log` VALUES (2235, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:22:56');
INSERT INTO `log` VALUES (2236, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:22:57');
INSERT INTO `log` VALUES (2237, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 13:23:12');
INSERT INTO `log` VALUES (2238, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 13:23:15');
INSERT INTO `log` VALUES (2239, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:23:15');
INSERT INTO `log` VALUES (2240, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:23:16');
INSERT INTO `log` VALUES (2241, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:23:18');
INSERT INTO `log` VALUES (2242, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/update', '【用户】修改实验记录', '执行成功！', '[{\"recordName\":\"测试实验\",\"id\":1802918888518692865}]', '2024-06-18 13:23:24');
INSERT INTO `log` VALUES (2243, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:23:24');
INSERT INTO `log` VALUES (2244, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:27:57');
INSERT INTO `log` VALUES (2245, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:27:58');
INSERT INTO `log` VALUES (2246, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:28:02');
INSERT INTO `log` VALUES (2247, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:28:03');
INSERT INTO `log` VALUES (2248, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:28:32');
INSERT INTO `log` VALUES (2249, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:28:32');
INSERT INTO `log` VALUES (2250, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:28:36');
INSERT INTO `log` VALUES (2251, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:30:08');
INSERT INTO `log` VALUES (2252, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:30:10');
INSERT INTO `log` VALUES (2253, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:30:13');
INSERT INTO `log` VALUES (2254, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:30:14');
INSERT INTO `log` VALUES (2255, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:30:17');
INSERT INTO `log` VALUES (2256, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:30:19');
INSERT INTO `log` VALUES (2257, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:30:21');
INSERT INTO `log` VALUES (2258, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:30:22');
INSERT INTO `log` VALUES (2259, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:30:25');
INSERT INTO `log` VALUES (2260, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:30:25');
INSERT INTO `log` VALUES (2261, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:30:33');
INSERT INTO `log` VALUES (2262, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:04');
INSERT INTO `log` VALUES (2263, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:33:06');
INSERT INTO `log` VALUES (2264, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:10');
INSERT INTO `log` VALUES (2265, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:33:11');
INSERT INTO `log` VALUES (2266, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:13');
INSERT INTO `log` VALUES (2267, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:33:14');
INSERT INTO `log` VALUES (2268, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:17');
INSERT INTO `log` VALUES (2269, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:33:19');
INSERT INTO `log` VALUES (2270, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:25');
INSERT INTO `log` VALUES (2271, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:29');
INSERT INTO `log` VALUES (2272, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:33:30');
INSERT INTO `log` VALUES (2273, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:33:44');
INSERT INTO `log` VALUES (2274, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:33:45');
INSERT INTO `log` VALUES (2275, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:34:28');
INSERT INTO `log` VALUES (2276, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:34:42');
INSERT INTO `log` VALUES (2277, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行成功！', '[{\"recordName\":\"22222\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 13:35:07');
INSERT INTO `log` VALUES (2278, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:35:07');
INSERT INTO `log` VALUES (2279, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/del/1802938066487193601', '【用户】删除实验记录', '执行成功！', '[1802938066487193601]', '2024-06-18 13:35:11');
INSERT INTO `log` VALUES (2280, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:35:11');
INSERT INTO `log` VALUES (2281, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:36:21');
INSERT INTO `log` VALUES (2282, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:36:27');
INSERT INTO `log` VALUES (2283, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:28');
INSERT INTO `log` VALUES (2284, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:36:32');
INSERT INTO `log` VALUES (2285, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:33');
INSERT INTO `log` VALUES (2286, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:36:36');
INSERT INTO `log` VALUES (2287, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:37');
INSERT INTO `log` VALUES (2288, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:36:40');
INSERT INTO `log` VALUES (2289, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:41');
INSERT INTO `log` VALUES (2290, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:45');
INSERT INTO `log` VALUES (2291, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:36:48');
INSERT INTO `log` VALUES (2292, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:48');
INSERT INTO `log` VALUES (2293, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:36:52');
INSERT INTO `log` VALUES (2294, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:37:05');
INSERT INTO `log` VALUES (2295, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:37:46');
INSERT INTO `log` VALUES (2296, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:37:47');
INSERT INTO `log` VALUES (2297, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/update', '【用户】修改实验记录', '执行成功！', '[{\"recordName\":\"测试实验11\",\"id\":1802918888518692865}]', '2024-06-18 13:38:04');
INSERT INTO `log` VALUES (2298, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:38:04');
INSERT INTO `log` VALUES (2299, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:39:42');
INSERT INTO `log` VALUES (2300, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:39:44');
INSERT INTO `log` VALUES (2301, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:39:52');
INSERT INTO `log` VALUES (2302, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:39:53');
INSERT INTO `log` VALUES (2303, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:39:56');
INSERT INTO `log` VALUES (2304, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:39:58');
INSERT INTO `log` VALUES (2305, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/update', '【用户】修改实验记录', '执行成功！', '[{\"recordName\":\"测试实验\",\"id\":1802918888518692865}]', '2024-06-18 13:40:05');
INSERT INTO `log` VALUES (2306, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:40:05');
INSERT INTO `log` VALUES (2307, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:40:21');
INSERT INTO `log` VALUES (2308, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:40:22');
INSERT INTO `log` VALUES (2309, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 13:41:00');
INSERT INTO `log` VALUES (2310, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:41:01');
INSERT INTO `log` VALUES (2311, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:41:11');
INSERT INTO `log` VALUES (2312, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 13:41:12');
INSERT INTO `log` VALUES (2313, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:41:12');
INSERT INTO `log` VALUES (2314, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:41:12');
INSERT INTO `log` VALUES (2315, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:41:27');
INSERT INTO `log` VALUES (2316, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:41:32');
INSERT INTO `log` VALUES (2317, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 13:41:38');
INSERT INTO `log` VALUES (2318, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 13:41:43');
INSERT INTO `log` VALUES (2319, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:41:43');
INSERT INTO `log` VALUES (2320, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:41:45');
INSERT INTO `log` VALUES (2321, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:42:10');
INSERT INTO `log` VALUES (2322, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 13:42:11');
INSERT INTO `log` VALUES (2323, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:42:11');
INSERT INTO `log` VALUES (2324, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:42:12');
INSERT INTO `log` VALUES (2325, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:42:21');
INSERT INTO `log` VALUES (2326, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:42:24');
INSERT INTO `log` VALUES (2327, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:43:09');
INSERT INTO `log` VALUES (2328, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:43:10');
INSERT INTO `log` VALUES (2329, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:43:11');
INSERT INTO `log` VALUES (2330, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:43:11');
INSERT INTO `log` VALUES (2331, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:43:15');
INSERT INTO `log` VALUES (2332, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:43:16');
INSERT INTO `log` VALUES (2333, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 13:43:38');
INSERT INTO `log` VALUES (2334, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:43:39');
INSERT INTO `log` VALUES (2335, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 13:43:41');
INSERT INTO `log` VALUES (2336, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 13:43:41');
INSERT INTO `log` VALUES (2337, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:43:52');
INSERT INTO `log` VALUES (2338, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:45:39');
INSERT INTO `log` VALUES (2339, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:45:45');
INSERT INTO `log` VALUES (2340, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:45:46');
INSERT INTO `log` VALUES (2341, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 13:46:29');
INSERT INTO `log` VALUES (2342, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 13:46:36');
INSERT INTO `log` VALUES (2343, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 13:46:40');
INSERT INTO `log` VALUES (2344, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/delUserInfoByUserId', '【系统管理员】删除用户信息', '执行成功！', '[\"246a47af-5820-483d-b83f-c8c233e8f7bc\"]', '2024-06-18 13:46:44');
INSERT INTO `log` VALUES (2345, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 13:46:44');
INSERT INTO `log` VALUES (2346, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:46:53');
INSERT INTO `log` VALUES (2347, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/add', '【系统管理员】新增样本类型', '执行成功！', '[{\"sampleTypeName\":\"78787878\"}]', '2024-06-18 13:47:00');
INSERT INTO `log` VALUES (2348, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:47:00');
INSERT INTO `log` VALUES (2349, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/del/1802941056212250626', '【系统管理员】删除样本类型', '执行成功！', '[1802941056212250626]', '2024-06-18 13:47:11');
INSERT INTO `log` VALUES (2350, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:47:11');
INSERT INTO `log` VALUES (2351, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 13:50:19');
INSERT INTO `log` VALUES (2352, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:50:21');
INSERT INTO `log` VALUES (2353, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:54:11');
INSERT INTO `log` VALUES (2354, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:54:12');
INSERT INTO `log` VALUES (2355, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:54:13');
INSERT INTO `log` VALUES (2356, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:54:14');
INSERT INTO `log` VALUES (2357, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 13:54:19');
INSERT INTO `log` VALUES (2358, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:54:19');
INSERT INTO `log` VALUES (2359, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 13:54:20');
INSERT INTO `log` VALUES (2360, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:54:22');
INSERT INTO `log` VALUES (2361, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:54:40');
INSERT INTO `log` VALUES (2362, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:54:40');
INSERT INTO `log` VALUES (2363, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 13:54:43');
INSERT INTO `log` VALUES (2364, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 13:54:44');
INSERT INTO `log` VALUES (2365, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:54:58');
INSERT INTO `log` VALUES (2366, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:54:58');
INSERT INTO `log` VALUES (2367, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:55:26');
INSERT INTO `log` VALUES (2368, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:55:27');
INSERT INTO `log` VALUES (2369, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:55:28');
INSERT INTO `log` VALUES (2370, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:55:29');
INSERT INTO `log` VALUES (2371, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:55:30');
INSERT INTO `log` VALUES (2372, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:55:31');
INSERT INTO `log` VALUES (2373, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:55:58');
INSERT INTO `log` VALUES (2374, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:55:59');
INSERT INTO `log` VALUES (2375, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:55:59');
INSERT INTO `log` VALUES (2376, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:56:08');
INSERT INTO `log` VALUES (2377, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:56:08');
INSERT INTO `log` VALUES (2378, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:56:09');
INSERT INTO `log` VALUES (2379, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:56:10');
INSERT INTO `log` VALUES (2380, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:59:17');
INSERT INTO `log` VALUES (2381, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:59:18');
INSERT INTO `log` VALUES (2382, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 13:59:19');
INSERT INTO `log` VALUES (2383, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 13:59:20');
INSERT INTO `log` VALUES (2384, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 14:00:02');
INSERT INTO `log` VALUES (2385, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:00:03');
INSERT INTO `log` VALUES (2386, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 14:00:07');
INSERT INTO `log` VALUES (2387, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 14:00:25');
INSERT INTO `log` VALUES (2388, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:00:25');
INSERT INTO `log` VALUES (2389, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 14:00:31');
INSERT INTO `log` VALUES (2390, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:00:35');
INSERT INTO `log` VALUES (2391, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:00:35');
INSERT INTO `log` VALUES (2392, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 14:00:42');
INSERT INTO `log` VALUES (2393, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"b752390a6cad0e04c969691f4061bdd6\",\"userName\":\"maintain\",\"status\":0}]', '2024-06-18 14:00:47');
INSERT INTO `log` VALUES (2394, '127.0.0.1', 'maintain', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【维护人员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:00:47');
INSERT INTO `log` VALUES (2395, '127.0.0.1', 'maintain', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【维护人员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:00:56');
INSERT INTO `log` VALUES (2396, '127.0.0.1', 'maintain', 'http://127.0.0.1:8091/loginOut', '【维护人员】退出登录', '执行失败！', '[]', '2024-06-18 14:00:58');
INSERT INTO `log` VALUES (2397, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 14:01:05');
INSERT INTO `log` VALUES (2398, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:01:05');
INSERT INTO `log` VALUES (2399, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:01:06');
INSERT INTO `log` VALUES (2400, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:01:22');
INSERT INTO `log` VALUES (2401, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:01:23');
INSERT INTO `log` VALUES (2402, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:01:24');
INSERT INTO `log` VALUES (2403, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:01:24');
INSERT INTO `log` VALUES (2404, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:01:48');
INSERT INTO `log` VALUES (2405, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:01:49');
INSERT INTO `log` VALUES (2406, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:01:51');
INSERT INTO `log` VALUES (2407, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:02:14');
INSERT INTO `log` VALUES (2408, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:02:15');
INSERT INTO `log` VALUES (2409, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:02:16');
INSERT INTO `log` VALUES (2410, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:02:17');
INSERT INTO `log` VALUES (2411, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:02:18');
INSERT INTO `log` VALUES (2412, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:03:00');
INSERT INTO `log` VALUES (2413, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:03:02');
INSERT INTO `log` VALUES (2414, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:03:53');
INSERT INTO `log` VALUES (2415, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:03:54');
INSERT INTO `log` VALUES (2416, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:03:55');
INSERT INTO `log` VALUES (2417, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:03:56');
INSERT INTO `log` VALUES (2418, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"undefined\"]', '2024-06-18 14:05:07');
INSERT INTO `log` VALUES (2419, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:10');
INSERT INTO `log` VALUES (2420, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:21');
INSERT INTO `log` VALUES (2421, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:23');
INSERT INTO `log` VALUES (2422, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:30');
INSERT INTO `log` VALUES (2423, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:36');
INSERT INTO `log` VALUES (2424, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:42');
INSERT INTO `log` VALUES (2425, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:05:46');
INSERT INTO `log` VALUES (2426, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:06:03');
INSERT INTO `log` VALUES (2427, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:06:04');
INSERT INTO `log` VALUES (2428, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:06:05');
INSERT INTO `log` VALUES (2429, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:06:06');
INSERT INTO `log` VALUES (2430, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:07:18');
INSERT INTO `log` VALUES (2431, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:07:19');
INSERT INTO `log` VALUES (2432, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:07:20');
INSERT INTO `log` VALUES (2433, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:07:20');
INSERT INTO `log` VALUES (2434, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:07:26');
INSERT INTO `log` VALUES (2435, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"\"]', '2024-06-18 14:07:28');
INSERT INTO `log` VALUES (2436, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"\"]', '2024-06-18 14:07:34');
INSERT INTO `log` VALUES (2437, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"\"]', '2024-06-18 14:07:36');
INSERT INTO `log` VALUES (2438, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:09');
INSERT INTO `log` VALUES (2439, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:10');
INSERT INTO `log` VALUES (2440, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:14');
INSERT INTO `log` VALUES (2441, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:14');
INSERT INTO `log` VALUES (2442, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:08:15');
INSERT INTO `log` VALUES (2443, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:23');
INSERT INTO `log` VALUES (2444, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:23');
INSERT INTO `log` VALUES (2445, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:08:24');
INSERT INTO `log` VALUES (2446, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:29');
INSERT INTO `log` VALUES (2447, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:30');
INSERT INTO `log` VALUES (2448, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:08:31');
INSERT INTO `log` VALUES (2449, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:37');
INSERT INTO `log` VALUES (2450, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:38');
INSERT INTO `log` VALUES (2451, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:08:39');
INSERT INTO `log` VALUES (2452, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:43');
INSERT INTO `log` VALUES (2453, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:44');
INSERT INTO `log` VALUES (2454, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:46');
INSERT INTO `log` VALUES (2455, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:46');
INSERT INTO `log` VALUES (2456, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:08:47');
INSERT INTO `log` VALUES (2457, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"\"]', '2024-06-18 14:08:48');
INSERT INTO `log` VALUES (2458, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:08:59');
INSERT INTO `log` VALUES (2459, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:09:00');
INSERT INTO `log` VALUES (2460, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:09:08');
INSERT INTO `log` VALUES (2461, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:09:09');
INSERT INTO `log` VALUES (2462, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:09:10');
INSERT INTO `log` VALUES (2463, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:09:35');
INSERT INTO `log` VALUES (2464, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:09:35');
INSERT INTO `log` VALUES (2465, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:09:38');
INSERT INTO `log` VALUES (2466, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:09:39');
INSERT INTO `log` VALUES (2467, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:10:02');
INSERT INTO `log` VALUES (2468, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:10:02');
INSERT INTO `log` VALUES (2469, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:10:03');
INSERT INTO `log` VALUES (2470, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:10:09');
INSERT INTO `log` VALUES (2471, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:10:10');
INSERT INTO `log` VALUES (2472, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:10:12');
INSERT INTO `log` VALUES (2473, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:11:45');
INSERT INTO `log` VALUES (2474, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:36');
INSERT INTO `log` VALUES (2475, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:37');
INSERT INTO `log` VALUES (2476, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:39');
INSERT INTO `log` VALUES (2477, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:40');
INSERT INTO `log` VALUES (2478, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:12:40');
INSERT INTO `log` VALUES (2479, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"undefined\"]', '2024-06-18 14:12:41');
INSERT INTO `log` VALUES (2480, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:45');
INSERT INTO `log` VALUES (2481, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:46');
INSERT INTO `log` VALUES (2482, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"undefined\"]', '2024-06-18 14:12:47');
INSERT INTO `log` VALUES (2483, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:12:48');
INSERT INTO `log` VALUES (2484, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:12:49');
INSERT INTO `log` VALUES (2485, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:38');
INSERT INTO `log` VALUES (2486, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:38');
INSERT INTO `log` VALUES (2487, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:15:39');
INSERT INTO `log` VALUES (2488, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:44');
INSERT INTO `log` VALUES (2489, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:45');
INSERT INTO `log` VALUES (2490, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:47');
INSERT INTO `log` VALUES (2491, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:49');
INSERT INTO `log` VALUES (2492, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:49');
INSERT INTO `log` VALUES (2493, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:15:51');
INSERT INTO `log` VALUES (2494, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:55');
INSERT INTO `log` VALUES (2495, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:15:55');
INSERT INTO `log` VALUES (2496, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:15:56');
INSERT INTO `log` VALUES (2497, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:17:53');
INSERT INTO `log` VALUES (2498, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:17:54');
INSERT INTO `log` VALUES (2499, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:17:57');
INSERT INTO `log` VALUES (2500, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:17:57');
INSERT INTO `log` VALUES (2501, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:17:58');
INSERT INTO `log` VALUES (2502, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:18:03');
INSERT INTO `log` VALUES (2503, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:18:38');
INSERT INTO `log` VALUES (2504, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:18:38');
INSERT INTO `log` VALUES (2505, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:18:40');
INSERT INTO `log` VALUES (2506, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:18:41');
INSERT INTO `log` VALUES (2507, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:19:08');
INSERT INTO `log` VALUES (2508, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:22:29');
INSERT INTO `log` VALUES (2509, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:22:29');
INSERT INTO `log` VALUES (2510, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:22:30');
INSERT INTO `log` VALUES (2511, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:22:33');
INSERT INTO `log` VALUES (2512, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:22:34');
INSERT INTO `log` VALUES (2513, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:22:35');
INSERT INTO `log` VALUES (2514, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"userId\"]', '2024-06-18 14:22:35');
INSERT INTO `log` VALUES (2515, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:22:39');
INSERT INTO `log` VALUES (2516, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"userId\"]', '2024-06-18 14:22:39');
INSERT INTO `log` VALUES (2517, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:23:02');
INSERT INTO `log` VALUES (2518, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:23:03');
INSERT INTO `log` VALUES (2519, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 14:24:01');
INSERT INTO `log` VALUES (2520, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:24:05');
INSERT INTO `log` VALUES (2521, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:24:05');
INSERT INTO `log` VALUES (2522, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:24:09');
INSERT INTO `log` VALUES (2523, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【用户】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"oldPassWord\":\"\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":0}]', '2024-06-18 14:24:19');
INSERT INTO `log` VALUES (2524, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【用户】更新用户基本信息', '执行成功！', '[{\"passWord\":\"1bbd886460827015e5d605ed44252251\",\"oldPassWord\":\"421f39a8ff4dd996a3e57877c3d98146\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":0}]', '2024-06-18 14:24:41');
INSERT INTO `log` VALUES (2525, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【用户】更新用户基本信息', '执行成功！', '[{\"passWord\":\"1bbd886460827015e5d605ed44252251\",\"oldPassWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":0}]', '2024-06-18 14:24:48');
INSERT INTO `log` VALUES (2526, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 14:24:50');
INSERT INTO `log` VALUES (2527, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"1bbd886460827015e5d605ed44252251\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:24:57');
INSERT INTO `log` VALUES (2528, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:24:57');
INSERT INTO `log` VALUES (2529, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 14:24:59');
INSERT INTO `log` VALUES (2530, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:25:04');
INSERT INTO `log` VALUES (2531, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"1bbd886460827015e5d605ed44252251\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:25:09');
INSERT INTO `log` VALUES (2532, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:25:09');
INSERT INTO `log` VALUES (2533, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:25:11');
INSERT INTO `log` VALUES (2534, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:25:56');
INSERT INTO `log` VALUES (2535, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:25:56');
INSERT INTO `log` VALUES (2536, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:25:59');
INSERT INTO `log` VALUES (2537, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:26:00');
INSERT INTO `log` VALUES (2538, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:26:01');
INSERT INTO `log` VALUES (2539, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:26:02');
INSERT INTO `log` VALUES (2540, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:26:15');
INSERT INTO `log` VALUES (2541, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:26:15');
INSERT INTO `log` VALUES (2542, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:26:15');
INSERT INTO `log` VALUES (2543, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:26:16');
INSERT INTO `log` VALUES (2544, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:26:17');
INSERT INTO `log` VALUES (2545, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:26:27');
INSERT INTO `log` VALUES (2546, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:26:27');
INSERT INTO `log` VALUES (2547, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:26:28');
INSERT INTO `log` VALUES (2548, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:26:29');
INSERT INTO `log` VALUES (2549, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:27:34');
INSERT INTO `log` VALUES (2550, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:27:34');
INSERT INTO `log` VALUES (2551, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:27:35');
INSERT INTO `log` VALUES (2552, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:27:35');
INSERT INTO `log` VALUES (2553, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:03');
INSERT INTO `log` VALUES (2554, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:03');
INSERT INTO `log` VALUES (2555, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:04');
INSERT INTO `log` VALUES (2556, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:05');
INSERT INTO `log` VALUES (2557, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:12');
INSERT INTO `log` VALUES (2558, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:13');
INSERT INTO `log` VALUES (2559, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:15');
INSERT INTO `log` VALUES (2560, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:15');
INSERT INTO `log` VALUES (2561, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:16');
INSERT INTO `log` VALUES (2562, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:17');
INSERT INTO `log` VALUES (2563, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:26');
INSERT INTO `log` VALUES (2564, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:26');
INSERT INTO `log` VALUES (2565, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:28');
INSERT INTO `log` VALUES (2566, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:29');
INSERT INTO `log` VALUES (2567, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:29');
INSERT INTO `log` VALUES (2568, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:33');
INSERT INTO `log` VALUES (2569, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:33');
INSERT INTO `log` VALUES (2570, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:34');
INSERT INTO `log` VALUES (2571, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:34');
INSERT INTO `log` VALUES (2572, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:40');
INSERT INTO `log` VALUES (2573, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:28:40');
INSERT INTO `log` VALUES (2574, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:41');
INSERT INTO `log` VALUES (2575, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:28:42');
INSERT INTO `log` VALUES (2576, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:09');
INSERT INTO `log` VALUES (2577, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:10');
INSERT INTO `log` VALUES (2578, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:13');
INSERT INTO `log` VALUES (2579, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:13');
INSERT INTO `log` VALUES (2580, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:29:14');
INSERT INTO `log` VALUES (2581, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:29:15');
INSERT INTO `log` VALUES (2582, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:19');
INSERT INTO `log` VALUES (2583, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:19');
INSERT INTO `log` VALUES (2584, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:29:20');
INSERT INTO `log` VALUES (2585, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:29:21');
INSERT INTO `log` VALUES (2586, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:28');
INSERT INTO `log` VALUES (2587, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:29:28');
INSERT INTO `log` VALUES (2588, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:29:29');
INSERT INTO `log` VALUES (2589, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:29:29');
INSERT INTO `log` VALUES (2590, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:31:22');
INSERT INTO `log` VALUES (2591, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:31:22');
INSERT INTO `log` VALUES (2592, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:31:23');
INSERT INTO `log` VALUES (2593, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:31:23');
INSERT INTO `log` VALUES (2594, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:31:44');
INSERT INTO `log` VALUES (2595, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:31:44');
INSERT INTO `log` VALUES (2596, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:31:45');
INSERT INTO `log` VALUES (2597, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:31:46');
INSERT INTO `log` VALUES (2598, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:32:07');
INSERT INTO `log` VALUES (2599, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:32:11');
INSERT INTO `log` VALUES (2600, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:32:13');
INSERT INTO `log` VALUES (2601, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:32:14');
INSERT INTO `log` VALUES (2602, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 14:32:57');
INSERT INTO `log` VALUES (2603, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 14:33:01');
INSERT INTO `log` VALUES (2604, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:33:01');
INSERT INTO `log` VALUES (2605, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 14:33:03');
INSERT INTO `log` VALUES (2606, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 14:33:08');
INSERT INTO `log` VALUES (2607, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:33:11');
INSERT INTO `log` VALUES (2608, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:33:12');
INSERT INTO `log` VALUES (2609, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:33:12');
INSERT INTO `log` VALUES (2610, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:34:26');
INSERT INTO `log` VALUES (2611, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:34:28');
INSERT INTO `log` VALUES (2612, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:34:28');
INSERT INTO `log` VALUES (2613, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:34:47');
INSERT INTO `log` VALUES (2614, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:34:49');
INSERT INTO `log` VALUES (2615, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:34:49');
INSERT INTO `log` VALUES (2616, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:35:09');
INSERT INTO `log` VALUES (2617, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:35:11');
INSERT INTO `log` VALUES (2618, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:35:12');
INSERT INTO `log` VALUES (2619, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:35:49');
INSERT INTO `log` VALUES (2620, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:35:51');
INSERT INTO `log` VALUES (2621, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:35:51');
INSERT INTO `log` VALUES (2622, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:36:39');
INSERT INTO `log` VALUES (2623, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:36:39');
INSERT INTO `log` VALUES (2624, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:36:40');
INSERT INTO `log` VALUES (2625, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:37:55');
INSERT INTO `log` VALUES (2626, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:37:58');
INSERT INTO `log` VALUES (2627, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:37:58');
INSERT INTO `log` VALUES (2628, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:37:58');
INSERT INTO `log` VALUES (2629, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:38:27');
INSERT INTO `log` VALUES (2630, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:38:28');
INSERT INTO `log` VALUES (2631, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:38:28');
INSERT INTO `log` VALUES (2632, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:38:57');
INSERT INTO `log` VALUES (2633, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:38:59');
INSERT INTO `log` VALUES (2634, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:38:59');
INSERT INTO `log` VALUES (2635, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:39:03');
INSERT INTO `log` VALUES (2636, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:39:04');
INSERT INTO `log` VALUES (2637, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:39:04');
INSERT INTO `log` VALUES (2638, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:39:11');
INSERT INTO `log` VALUES (2639, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:39:11');
INSERT INTO `log` VALUES (2640, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:39:12');
INSERT INTO `log` VALUES (2641, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:39:50');
INSERT INTO `log` VALUES (2642, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:39:52');
INSERT INTO `log` VALUES (2643, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:39:52');
INSERT INTO `log` VALUES (2644, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:40:38');
INSERT INTO `log` VALUES (2645, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:40:40');
INSERT INTO `log` VALUES (2646, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:40:40');
INSERT INTO `log` VALUES (2647, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:40:43');
INSERT INTO `log` VALUES (2648, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:40:44');
INSERT INTO `log` VALUES (2649, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:40:44');
INSERT INTO `log` VALUES (2650, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:40:57');
INSERT INTO `log` VALUES (2651, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:40:59');
INSERT INTO `log` VALUES (2652, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:40:59');
INSERT INTO `log` VALUES (2653, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:41:04');
INSERT INTO `log` VALUES (2654, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:41:06');
INSERT INTO `log` VALUES (2655, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:41:07');
INSERT INTO `log` VALUES (2656, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:41:14');
INSERT INTO `log` VALUES (2657, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:41:18');
INSERT INTO `log` VALUES (2658, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:41:19');
INSERT INTO `log` VALUES (2659, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:41:19');
INSERT INTO `log` VALUES (2660, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:41:22');
INSERT INTO `log` VALUES (2661, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:41:23');
INSERT INTO `log` VALUES (2662, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:41:23');
INSERT INTO `log` VALUES (2663, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:41:29');
INSERT INTO `log` VALUES (2664, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:41:31');
INSERT INTO `log` VALUES (2665, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:41:31');
INSERT INTO `log` VALUES (2666, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:45:18');
INSERT INTO `log` VALUES (2667, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:45:19');
INSERT INTO `log` VALUES (2668, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:45:19');
INSERT INTO `log` VALUES (2669, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:45:22');
INSERT INTO `log` VALUES (2670, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:45:24');
INSERT INTO `log` VALUES (2671, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:45:24');
INSERT INTO `log` VALUES (2672, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:45:26');
INSERT INTO `log` VALUES (2673, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:45:26');
INSERT INTO `log` VALUES (2674, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:45:26');
INSERT INTO `log` VALUES (2675, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:45:44');
INSERT INTO `log` VALUES (2676, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:45:46');
INSERT INTO `log` VALUES (2677, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:45:46');
INSERT INTO `log` VALUES (2678, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:45:49');
INSERT INTO `log` VALUES (2679, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 14:45:49');
INSERT INTO `log` VALUES (2680, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:45:49');
INSERT INTO `log` VALUES (2681, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 14:46:27');
INSERT INTO `log` VALUES (2682, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:46:30');
INSERT INTO `log` VALUES (2683, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"1bbd886460827015e5d605ed44252251\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:46:34');
INSERT INTO `log` VALUES (2684, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:46:34');
INSERT INTO `log` VALUES (2685, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:46:36');
INSERT INTO `log` VALUES (2686, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【用户】更新用户基本信息', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"oldPassWord\":\"1bbd886460827015e5d605ed44252251\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":0}]', '2024-06-18 14:47:00');
INSERT INTO `log` VALUES (2687, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 14:47:03');
INSERT INTO `log` VALUES (2688, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 14:47:06');
INSERT INTO `log` VALUES (2689, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:47:06');
INSERT INTO `log` VALUES (2690, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:47:08');
INSERT INTO `log` VALUES (2691, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:47:09');
INSERT INTO `log` VALUES (2692, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:47:11');
INSERT INTO `log` VALUES (2693, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 14:47:15');
INSERT INTO `log` VALUES (2694, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:47:15');
INSERT INTO `log` VALUES (2695, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:47:17');
INSERT INTO `log` VALUES (2696, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-18 14:47:18');
INSERT INTO `log` VALUES (2697, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:47:18');
INSERT INTO `log` VALUES (2698, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/update', '【用户】修改样本记录', '执行成功！', '[{\"color\":\"2\",\"density\":\"11\",\"organism\":\"2\",\"sizeLt2mm\":1.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"2\",\"sizeGt2mm\":0.1,\"recordId\":1801488063201726466,\"sampleName\":\"909\",\"hardness\":\"2\",\"viscosity\":\"11\",\"waterRetention\":\"22\",\"humidity\":\"111\",\"id\":1802002236214005762}]', '2024-06-18 14:47:57');
INSERT INTO `log` VALUES (2699, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-18 14:47:57');
INSERT INTO `log` VALUES (2700, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/update', '【用户】修改样本记录', '执行成功！', '[{\"color\":\"2\",\"density\":\"11\",\"organism\":\"2\",\"sizeLt2mm\":1.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"2\",\"sizeGt2mm\":0.1,\"recordId\":1801488063201726466,\"sampleName\":\"909\",\"hardness\":\"2\",\"viscosity\":\"11\",\"waterRetention\":\"22\",\"humidity\":\"111\",\"id\":1802002236214005762}]', '2024-06-18 14:48:05');
INSERT INTO `log` VALUES (2701, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-18 14:48:05');
INSERT INTO `log` VALUES (2702, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/update', '【用户】修改样本记录', '执行成功！', '[{\"color\":\"2\",\"density\":\"11\",\"organism\":\"2\",\"sizeLt2mm\":1.0,\"sampleTypeId\":1801495063151169537,\"smell\":\"2\",\"sizeGt2mm\":0.1,\"recordId\":1801488063201726466,\"sampleName\":\"909\",\"hardness\":\"2\",\"viscosity\":\"11\",\"waterRetention\":\"22\",\"humidity\":\"111\",\"id\":1802002236214005762}]', '2024-06-18 14:48:09');
INSERT INTO `log` VALUES (2703, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-18 14:48:09');
INSERT INTO `log` VALUES (2704, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:48:15');
INSERT INTO `log` VALUES (2705, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 14:50:38');
INSERT INTO `log` VALUES (2706, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:50:38');
INSERT INTO `log` VALUES (2707, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 14:50:42');
INSERT INTO `log` VALUES (2708, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:50:42');
INSERT INTO `log` VALUES (2709, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:50:43');
INSERT INTO `log` VALUES (2710, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/update', '【用户】修改实验记录', '执行成功！', '[{\"recordName\":\"测试\",\"id\":1802918888518692865}]', '2024-06-18 14:50:48');
INSERT INTO `log` VALUES (2711, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:50:48');
INSERT INTO `log` VALUES (2712, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 14:50:55');
INSERT INTO `log` VALUES (2713, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:50:55');
INSERT INTO `log` VALUES (2714, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/add', '【用户】新增样本记录', '执行成功！', '[{\"color\":\"dadad\",\"density\":\"dad ad\",\"organism\":\"dadad\",\"sizeLt2mm\":10.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"dadad\",\"sizeGt2mm\":1.12,\"recordId\":1802918888518692865,\"sampleName\":\"dadadad\",\"hardness\":\"dada\",\"viscosity\":\"dada\",\"waterRetention\":\"dada\",\"humidity\":\"dadad\"}]', '2024-06-18 14:51:28');
INSERT INTO `log` VALUES (2715, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 14:51:28');
INSERT INTO `log` VALUES (2716, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:52:14');
INSERT INTO `log` VALUES (2717, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-18 14:52:17');
INSERT INTO `log` VALUES (2718, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 14:52:17');
INSERT INTO `log` VALUES (2719, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:52:20');
INSERT INTO `log` VALUES (2720, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:52:22');
INSERT INTO `log` VALUES (2721, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:52:23');
INSERT INTO `log` VALUES (2722, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:52:26');
INSERT INTO `log` VALUES (2723, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 14:52:27');
INSERT INTO `log` VALUES (2724, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 15:25:54');
INSERT INTO `log` VALUES (2725, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:25:54');
INSERT INTO `log` VALUES (2726, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:25:59');
INSERT INTO `log` VALUES (2727, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:26:01');
INSERT INTO `log` VALUES (2728, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:26:04');
INSERT INTO `log` VALUES (2729, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:26:11');
INSERT INTO `log` VALUES (2730, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 15:26:16');
INSERT INTO `log` VALUES (2731, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:26:16');
INSERT INTO `log` VALUES (2732, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/del/1802957280740618242', '【系统管理员】删除样本记录', '执行成功！', '[1802957280740618242]', '2024-06-18 15:26:20');
INSERT INTO `log` VALUES (2733, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 15:26:20');
INSERT INTO `log` VALUES (2734, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:26:21');
INSERT INTO `log` VALUES (2735, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 15:26:43');
INSERT INTO `log` VALUES (2736, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:26:43');
INSERT INTO `log` VALUES (2737, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:26:47');
INSERT INTO `log` VALUES (2738, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:26:51');
INSERT INTO `log` VALUES (2739, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:26:54');
INSERT INTO `log` VALUES (2740, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-18 15:27:00');
INSERT INTO `log` VALUES (2741, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:27:00');
INSERT INTO `log` VALUES (2742, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:27:02');
INSERT INTO `log` VALUES (2743, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:27:05');
INSERT INTO `log` VALUES (2744, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 15:27:06');
INSERT INTO `log` VALUES (2745, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 15:27:07');
INSERT INTO `log` VALUES (2746, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:27:07');
INSERT INTO `log` VALUES (2747, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:27:09');
INSERT INTO `log` VALUES (2748, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 15:27:10');
INSERT INTO `log` VALUES (2749, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 15:27:12');
INSERT INTO `log` VALUES (2750, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:27:12');
INSERT INTO `log` VALUES (2751, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 15:27:13');
INSERT INTO `log` VALUES (2752, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 15:27:19');
INSERT INTO `log` VALUES (2753, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:27:27');
INSERT INTO `log` VALUES (2754, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:27:34');
INSERT INTO `log` VALUES (2755, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:27:39');
INSERT INTO `log` VALUES (2756, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:27:40');
INSERT INTO `log` VALUES (2757, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 15:27:42');
INSERT INTO `log` VALUES (2758, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 15:28:24');
INSERT INTO `log` VALUES (2759, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 15:29:37');
INSERT INTO `log` VALUES (2760, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:29:37');
INSERT INTO `log` VALUES (2761, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:29:39');
INSERT INTO `log` VALUES (2762, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:29:40');
INSERT INTO `log` VALUES (2763, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:29:41');
INSERT INTO `log` VALUES (2764, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:42');
INSERT INTO `log` VALUES (2765, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:44');
INSERT INTO `log` VALUES (2766, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:45');
INSERT INTO `log` VALUES (2767, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:45');
INSERT INTO `log` VALUES (2768, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:45');
INSERT INTO `log` VALUES (2769, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:45');
INSERT INTO `log` VALUES (2770, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:29:48');
INSERT INTO `log` VALUES (2771, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:29:48');
INSERT INTO `log` VALUES (2772, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:29:52');
INSERT INTO `log` VALUES (2773, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 15:30:17');
INSERT INTO `log` VALUES (2774, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:32:14');
INSERT INTO `log` VALUES (2775, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:32:15');
INSERT INTO `log` VALUES (2776, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:32:16');
INSERT INTO `log` VALUES (2777, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:32:16');
INSERT INTO `log` VALUES (2778, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:32:16');
INSERT INTO `log` VALUES (2779, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行失败！', '[\"{\\\"userId\\\":\\\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\\\"}\"]', '2024-06-18 15:32:16');
INSERT INTO `log` VALUES (2780, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:34:49');
INSERT INTO `log` VALUES (2781, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:34:50');
INSERT INTO `log` VALUES (2782, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:36:58');
INSERT INTO `log` VALUES (2783, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:36:59');
INSERT INTO `log` VALUES (2784, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:38:18');
INSERT INTO `log` VALUES (2785, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:38:19');
INSERT INTO `log` VALUES (2786, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:39:12');
INSERT INTO `log` VALUES (2787, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:39:12');
INSERT INTO `log` VALUES (2788, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:39:16');
INSERT INTO `log` VALUES (2789, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:39:16');
INSERT INTO `log` VALUES (2790, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:39:27');
INSERT INTO `log` VALUES (2791, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:39:29');
INSERT INTO `log` VALUES (2792, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 15:39:34');
INSERT INTO `log` VALUES (2793, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 15:39:38');
INSERT INTO `log` VALUES (2794, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:39:38');
INSERT INTO `log` VALUES (2795, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:39:40');
INSERT INTO `log` VALUES (2796, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:39:45');
INSERT INTO `log` VALUES (2797, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:39:46');
INSERT INTO `log` VALUES (2798, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:40:15');
INSERT INTO `log` VALUES (2799, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:40:15');
INSERT INTO `log` VALUES (2800, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:40:16');
INSERT INTO `log` VALUES (2801, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:40:18');
INSERT INTO `log` VALUES (2802, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 15:40:21');
INSERT INTO `log` VALUES (2803, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:40:37');
INSERT INTO `log` VALUES (2804, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:40:40');
INSERT INTO `log` VALUES (2805, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:40:42');
INSERT INTO `log` VALUES (2806, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:40:44');
INSERT INTO `log` VALUES (2807, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:40:50');
INSERT INTO `log` VALUES (2808, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:40:51');
INSERT INTO `log` VALUES (2809, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-18 15:40:53');
INSERT INTO `log` VALUES (2810, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":0}]', '2024-06-18 15:41:11');
INSERT INTO `log` VALUES (2811, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":0}]', '2024-06-18 15:42:31');
INSERT INTO `log` VALUES (2812, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\",\"status\":1}]', '2024-06-18 15:42:33');
INSERT INTO `log` VALUES (2813, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:43:27');
INSERT INTO `log` VALUES (2814, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:43:27');
INSERT INTO `log` VALUES (2815, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"8ce87b8ec346ff4c80635f667d1592ae\",\"roleId\":2,\"userName\":\"12121212\",\"phone\":\"1212\",\"name\":\"12\",\"email\":\"1212\",\"status\":0}]', '2024-06-18 15:43:56');
INSERT INTO `log` VALUES (2816, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:43:56');
INSERT INTO `log` VALUES (2817, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 15:44:04');
INSERT INTO `log` VALUES (2818, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"8ce87b8ec346ff4c80635f667d1592ae\",\"userName\":\"12121212\",\"status\":0}]', '2024-06-18 15:44:25');
INSERT INTO `log` VALUES (2819, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【12】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:44:25');
INSERT INTO `log` VALUES (2820, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【12】根据用户ID获取用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:44:29');
INSERT INTO `log` VALUES (2821, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/record/getRecord/1db95e0b-6de0-4a51-8c3c-2339f3b7925a', '【12】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:44:30');
INSERT INTO `log` VALUES (2822, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【12】根据用户ID获取用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:44:31');
INSERT INTO `log` VALUES (2823, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【12】更新用户基本信息', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"oldPassWord\":\"8ce87b8ec346ff4c80635f667d1592ae\",\"phone\":\"1212\",\"name\":\"12\",\"email\":\"1212\",\"status\":0}]', '2024-06-18 15:44:55');
INSERT INTO `log` VALUES (2824, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/loginOut', '【12】退出登录', '执行失败！', '[]', '2024-06-18 15:45:09');
INSERT INTO `log` VALUES (2825, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"12121212\",\"status\":0}]', '2024-06-18 15:45:19');
INSERT INTO `log` VALUES (2826, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【12】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:45:19');
INSERT INTO `log` VALUES (2827, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:45:24');
INSERT INTO `log` VALUES (2828, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:45:40');
INSERT INTO `log` VALUES (2829, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:45:41');
INSERT INTO `log` VALUES (2830, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:45:42');
INSERT INTO `log` VALUES (2831, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":1,\"userName\":\"12121212\",\"userId\":\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\",\"phone\":\"1212\",\"name\":\"12\",\"email\":\"1212\",\"status\":1}]', '2024-06-18 15:45:46');
INSERT INTO `log` VALUES (2832, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:45:46');
INSERT INTO `log` VALUES (2833, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【12】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:45:53');
INSERT INTO `log` VALUES (2834, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/record/getRecord/1db95e0b-6de0-4a51-8c3c-2339f3b7925a', '【12】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:45:55');
INSERT INTO `log` VALUES (2835, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/loginOut', '【12】退出登录', '执行失败！', '[]', '2024-06-18 15:45:57');
INSERT INTO `log` VALUES (2836, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"12121212\",\"status\":0}]', '2024-06-18 15:46:06');
INSERT INTO `log` VALUES (2837, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【12】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:46:06');
INSERT INTO `log` VALUES (2838, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【12】根据用户ID获取用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:46:11');
INSERT INTO `log` VALUES (2839, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【12】根据用户ID获取用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:46:14');
INSERT INTO `log` VALUES (2840, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/delUserInfoByUserId', '【系统管理员】删除用户信息', '执行成功！', '[\"1db95e0b-6de0-4a51-8c3c-2339f3b7925a\"]', '2024-06-18 15:54:57');
INSERT INTO `log` VALUES (2841, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 15:54:57');
INSERT INTO `log` VALUES (2842, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:54:59');
INSERT INTO `log` VALUES (2843, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/add', '【系统管理员】新增样本类型', '执行成功！', '[{\"sampleTypeName\":\"12121\"}]', '2024-06-18 15:55:04');
INSERT INTO `log` VALUES (2844, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:55:04');
INSERT INTO `log` VALUES (2845, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/update', '【系统管理员】修改样本类型', '执行成功！', '[{\"sampleTypeName\":\"1212100\",\"id\":1802973288905814017}]', '2024-06-18 15:55:09');
INSERT INTO `log` VALUES (2846, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:55:09');
INSERT INTO `log` VALUES (2847, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/del/1802973288905814017', '【系统管理员】删除样本类型', '执行成功！', '[1802973288905814017]', '2024-06-18 15:55:11');
INSERT INTO `log` VALUES (2848, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:55:11');
INSERT INTO `log` VALUES (2849, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 15:55:22');
INSERT INTO `log` VALUES (2850, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:55:28');
INSERT INTO `log` VALUES (2851, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/add', '【系统管理员】新增实验记录', '执行成功！', '[{\"recordName\":\"00000000000\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 15:55:43');
INSERT INTO `log` VALUES (2852, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:55:43');
INSERT INTO `log` VALUES (2853, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【12】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:55:49');
INSERT INTO `log` VALUES (2854, '127.0.0.1', '12121212', 'http://127.0.0.1:8091/loginOut', '【12】退出登录', '执行失败！', '[]', '2024-06-18 15:55:50');
INSERT INTO `log` VALUES (2855, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 15:55:57');
INSERT INTO `log` VALUES (2856, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:55:57');
INSERT INTO `log` VALUES (2857, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:55:58');
INSERT INTO `log` VALUES (2858, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:55:59');
INSERT INTO `log` VALUES (2859, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/update', '【系统管理员】修改实验记录', '执行成功！', '[{\"recordName\":\"0000000000011111\",\"id\":1802973448977231874}]', '2024-06-18 15:56:09');
INSERT INTO `log` VALUES (2860, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:56:09');
INSERT INTO `log` VALUES (2861, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 15:56:15');
INSERT INTO `log` VALUES (2862, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:56:15');
INSERT INTO `log` VALUES (2863, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/add', '【系统管理员】新增实验记录', '执行成功！', '[{\"recordName\":\"0\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 15:56:28');
INSERT INTO `log` VALUES (2864, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:56:28');
INSERT INTO `log` VALUES (2865, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973639771926529', '【系统管理员】删除实验记录', '执行成功！', '[1802973639771926529]', '2024-06-18 15:56:39');
INSERT INTO `log` VALUES (2866, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:56:39');
INSERT INTO `log` VALUES (2867, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:56:40');
INSERT INTO `log` VALUES (2868, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:56:40');
INSERT INTO `log` VALUES (2869, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/add', '【系统管理员】新增样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"1212122\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\"}]', '2024-06-18 15:56:53');
INSERT INTO `log` VALUES (2870, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:56:53');
INSERT INTO `log` VALUES (2871, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:56:55');
INSERT INTO `log` VALUES (2872, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 15:57:00');
INSERT INTO `log` VALUES (2873, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:57:00');
INSERT INTO `log` VALUES (2874, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 15:57:05');
INSERT INTO `log` VALUES (2875, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 15:57:05');
INSERT INTO `log` VALUES (2876, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:57:18');
INSERT INTO `log` VALUES (2877, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 15:57:18');
INSERT INTO `log` VALUES (2878, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"1212122\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 15:57:25');
INSERT INTO `log` VALUES (2879, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:57:25');
INSERT INTO `log` VALUES (2880, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:57:35');
INSERT INTO `log` VALUES (2881, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:57:40');
INSERT INTO `log` VALUES (2882, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:58:16');
INSERT INTO `log` VALUES (2883, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 15:59:35');
INSERT INTO `log` VALUES (2884, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:01:01');
INSERT INTO `log` VALUES (2885, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:01:02');
INSERT INTO `log` VALUES (2886, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:01:02');
INSERT INTO `log` VALUES (2887, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:01:44');
INSERT INTO `log` VALUES (2888, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:01:44');
INSERT INTO `log` VALUES (2889, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:01:44');
INSERT INTO `log` VALUES (2890, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"1212122\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:01:51');
INSERT INTO `log` VALUES (2891, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:01:51');
INSERT INTO `log` VALUES (2892, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:02:05');
INSERT INTO `log` VALUES (2893, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"121210000\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:02:13');
INSERT INTO `log` VALUES (2894, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:02:13');
INSERT INTO `log` VALUES (2895, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:02:40');
INSERT INTO `log` VALUES (2896, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:02:41');
INSERT INTO `log` VALUES (2897, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:02:41');
INSERT INTO `log` VALUES (2898, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:05:08');
INSERT INTO `log` VALUES (2899, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:05:09');
INSERT INTO `log` VALUES (2900, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:05:09');
INSERT INTO `log` VALUES (2901, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:05:14');
INSERT INTO `log` VALUES (2902, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:05:16');
INSERT INTO `log` VALUES (2903, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:05:16');
INSERT INTO `log` VALUES (2904, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:05:19');
INSERT INTO `log` VALUES (2905, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:05:21');
INSERT INTO `log` VALUES (2906, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:05:21');
INSERT INTO `log` VALUES (2907, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:05:40');
INSERT INTO `log` VALUES (2908, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:05:41');
INSERT INTO `log` VALUES (2909, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:05:42');
INSERT INTO `log` VALUES (2910, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:05:47');
INSERT INTO `log` VALUES (2911, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:05:49');
INSERT INTO `log` VALUES (2912, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:05:50');
INSERT INTO `log` VALUES (2913, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:05:52');
INSERT INTO `log` VALUES (2914, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:05:53');
INSERT INTO `log` VALUES (2915, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:05:53');
INSERT INTO `log` VALUES (2916, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:07:16');
INSERT INTO `log` VALUES (2917, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:07:23');
INSERT INTO `log` VALUES (2918, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:07:24');
INSERT INTO `log` VALUES (2919, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:07:24');
INSERT INTO `log` VALUES (2920, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:07:33');
INSERT INTO `log` VALUES (2921, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"121210000\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:07:43');
INSERT INTO `log` VALUES (2922, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:07:43');
INSERT INTO `log` VALUES (2923, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"12121000012\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:07:49');
INSERT INTO `log` VALUES (2924, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:07:49');
INSERT INTO `log` VALUES (2925, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:08:15');
INSERT INTO `log` VALUES (2926, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:08:17');
INSERT INTO `log` VALUES (2927, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:08:17');
INSERT INTO `log` VALUES (2928, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:08:51');
INSERT INTO `log` VALUES (2929, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"12121000012\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:09:06');
INSERT INTO `log` VALUES (2930, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:09:06');
INSERT INTO `log` VALUES (2931, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:10:28');
INSERT INTO `log` VALUES (2932, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:10:29');
INSERT INTO `log` VALUES (2933, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:10:29');
INSERT INTO `log` VALUES (2934, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:12:54');
INSERT INTO `log` VALUES (2935, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:12:54');
INSERT INTO `log` VALUES (2936, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:12:54');
INSERT INTO `log` VALUES (2937, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/login', '【系统管理员】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 16:14:34');
INSERT INTO `log` VALUES (2938, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:14:35');
INSERT INTO `log` VALUES (2939, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 16:14:37');
INSERT INTO `log` VALUES (2940, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 16:14:40');
INSERT INTO `log` VALUES (2941, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 16:14:41');
INSERT INTO `log` VALUES (2942, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:14:41');
INSERT INTO `log` VALUES (2943, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:14:45');
INSERT INTO `log` VALUES (2944, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 16:14:45');
INSERT INTO `log` VALUES (2945, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:14:45');
INSERT INTO `log` VALUES (2946, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:15:08');
INSERT INTO `log` VALUES (2947, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 16:15:09');
INSERT INTO `log` VALUES (2948, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:15:09');
INSERT INTO `log` VALUES (2949, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:15:14');
INSERT INTO `log` VALUES (2950, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 16:15:14');
INSERT INTO `log` VALUES (2951, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:15:15');
INSERT INTO `log` VALUES (2952, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"棕色\",\"density\":\"高\",\"organism\":\"植物根系\",\"sizeLt2mm\":7.03,\"sampleTypeId\":1797499575100112897,\"smell\":\"土腥味\",\"sizeGt2mm\":2.39,\"recordId\":1796162840143466497,\"sampleName\":\"土壤样本三\",\"hardness\":\"中/较软\",\"viscosity\":\"中\",\"waterRetention\":\"中\",\"humidity\":\"中\",\"id\":1796162840185409540}]', '2024-06-18 16:15:19');
INSERT INTO `log` VALUES (2953, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-18 16:15:19');
INSERT INTO `log` VALUES (2954, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 16:15:25');
INSERT INTO `log` VALUES (2955, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 16:15:25');
INSERT INTO `log` VALUES (2956, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:15:26');
INSERT INTO `log` VALUES (2957, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:15:30');
INSERT INTO `log` VALUES (2958, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:15:30');
INSERT INTO `log` VALUES (2959, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"12121000012\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:15:41');
INSERT INTO `log` VALUES (2960, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:15:41');
INSERT INTO `log` VALUES (2961, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:15:57');
INSERT INTO `log` VALUES (2962, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:15:57');
INSERT INTO `log` VALUES (2963, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"21\",\"organism\":\"0\",\"sizeLt2mm\":2.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"0\",\"sizeGt2mm\":1.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"12\",\"humidity\":\"121\",\"id\":1802973746282082306}]', '2024-06-18 16:16:02');
INSERT INTO `log` VALUES (2964, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:16:02');
INSERT INTO `log` VALUES (2965, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:17:06');
INSERT INTO `log` VALUES (2966, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:17:07');
INSERT INTO `log` VALUES (2967, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:17:07');
INSERT INTO `log` VALUES (2968, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:27:53');
INSERT INTO `log` VALUES (2969, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:27:53');
INSERT INTO `log` VALUES (2970, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:27:53');
INSERT INTO `log` VALUES (2971, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:27:56');
INSERT INTO `log` VALUES (2972, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 16:27:59');
INSERT INTO `log` VALUES (2973, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:27:59');
INSERT INTO `log` VALUES (2974, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/update', '【系统管理员】修改实验记录', '执行成功！', '[{\"recordName\":\"0000000000011111\",\"id\":1802973448977231874}]', '2024-06-18 16:28:01');
INSERT INTO `log` VALUES (2975, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:28:01');
INSERT INTO `log` VALUES (2976, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 16:28:04');
INSERT INTO `log` VALUES (2977, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:28:04');
INSERT INTO `log` VALUES (2978, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:28:16');
INSERT INTO `log` VALUES (2979, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:28:16');
INSERT INTO `log` VALUES (2980, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:29:01');
INSERT INTO `log` VALUES (2981, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:29:03');
INSERT INTO `log` VALUES (2982, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:29:03');
INSERT INTO `log` VALUES (2983, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:29:25');
INSERT INTO `log` VALUES (2984, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:29:26');
INSERT INTO `log` VALUES (2985, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:29:27');
INSERT INTO `log` VALUES (2986, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:31:01');
INSERT INTO `log` VALUES (2987, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 16:31:04');
INSERT INTO `log` VALUES (2988, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:31:04');
INSERT INTO `log` VALUES (2989, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:31:06');
INSERT INTO `log` VALUES (2990, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:31:06');
INSERT INTO `log` VALUES (2991, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:31:58');
INSERT INTO `log` VALUES (2992, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:32:00');
INSERT INTO `log` VALUES (2993, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:32:00');
INSERT INTO `log` VALUES (2994, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/add', '【系统管理员】新增样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\"}]', '2024-06-18 16:32:38');
INSERT INTO `log` VALUES (2995, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:32:38');
INSERT INTO `log` VALUES (2996, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:32:42');
INSERT INTO `log` VALUES (2997, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:32:42');
INSERT INTO `log` VALUES (2998, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:32:46');
INSERT INTO `log` VALUES (2999, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:32:46');
INSERT INTO `log` VALUES (3000, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:32:51');
INSERT INTO `log` VALUES (3001, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:32:51');
INSERT INTO `log` VALUES (3002, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:33:13');
INSERT INTO `log` VALUES (3003, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:13');
INSERT INTO `log` VALUES (3004, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:33:18');
INSERT INTO `log` VALUES (3005, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:18');
INSERT INTO `log` VALUES (3006, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1801495063151169537,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:33:27');
INSERT INTO `log` VALUES (3007, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:27');
INSERT INTO `log` VALUES (3008, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":12.0,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:33:33');
INSERT INTO `log` VALUES (3009, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:33');
INSERT INTO `log` VALUES (3010, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"0\",\"density\":\"2\",\"organism\":\"1\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"0\",\"sizeGt2mm\":12.05,\"recordId\":1802973448977231874,\"sampleName\":\"0\",\"hardness\":\"0\",\"viscosity\":\"12\",\"waterRetention\":\"1\",\"humidity\":\"1\",\"id\":1802982739998126082}]', '2024-06-18 16:33:39');
INSERT INTO `log` VALUES (3011, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:39');
INSERT INTO `log` VALUES (3012, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/del/1802982739998126082', '【系统管理员】删除样本记录', '执行失败！', '[1802982739998126082]', '2024-06-18 16:33:42');
INSERT INTO `log` VALUES (3013, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:43');
INSERT INTO `log` VALUES (3014, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:33:44');
INSERT INTO `log` VALUES (3015, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 16:33:47');
INSERT INTO `log` VALUES (3016, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:33:47');
INSERT INTO `log` VALUES (3017, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 16:33:54');
INSERT INTO `log` VALUES (3018, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:33:54');
INSERT INTO `log` VALUES (3019, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:55');
INSERT INTO `log` VALUES (3020, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:33:55');
INSERT INTO `log` VALUES (3021, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/del/1802973746282082306', '【系统管理员】删除样本记录', '执行成功！', '[1802973746282082306]', '2024-06-18 16:33:57');
INSERT INTO `log` VALUES (3022, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802973448977231874', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802973448977231874]', '2024-06-18 16:33:57');
INSERT INTO `log` VALUES (3023, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:33:58');
INSERT INTO `log` VALUES (3024, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1802973448977231874', '【系统管理员】删除实验记录', '执行成功！', '[1802973448977231874]', '2024-06-18 16:34:02');
INSERT INTO `log` VALUES (3025, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:02');
INSERT INTO `log` VALUES (3026, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 16:34:06');
INSERT INTO `log` VALUES (3027, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 16:34:09');
INSERT INTO `log` VALUES (3028, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 16:34:11');
INSERT INTO `log` VALUES (3029, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 16:34:12');
INSERT INTO `log` VALUES (3030, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-18 16:34:15');
INSERT INTO `log` VALUES (3031, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 16:34:16');
INSERT INTO `log` VALUES (3032, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 16:34:19');
INSERT INTO `log` VALUES (3033, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:34:19');
INSERT INTO `log` VALUES (3034, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:21');
INSERT INTO `log` VALUES (3035, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:26');
INSERT INTO `log` VALUES (3036, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行成功！', '[{\"recordName\":\"12121\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 16:34:32');
INSERT INTO `log` VALUES (3037, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:32');
INSERT INTO `log` VALUES (3038, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/del/1802983219365130242', '【用户】删除实验记录', '执行成功！', '[1802983219365130242]', '2024-06-18 16:34:35');
INSERT INTO `log` VALUES (3039, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:35');
INSERT INTO `log` VALUES (3040, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行成功！', '[{\"recordName\":\"000000000000\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 16:34:40');
INSERT INTO `log` VALUES (3041, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:40');
INSERT INTO `log` VALUES (3042, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802983251812265986', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802983251812265986]', '2024-06-18 16:34:45');
INSERT INTO `log` VALUES (3043, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:34:45');
INSERT INTO `log` VALUES (3044, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:52');
INSERT INTO `log` VALUES (3045, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:34:56');
INSERT INTO `log` VALUES (3046, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:35:24');
INSERT INTO `log` VALUES (3047, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:35:25');
INSERT INTO `log` VALUES (3048, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:35:25');
INSERT INTO `log` VALUES (3049, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:35:25');
INSERT INTO `log` VALUES (3050, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:35:28');
INSERT INTO `log` VALUES (3051, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:35:28');
INSERT INTO `log` VALUES (3052, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-18 16:35:40');
INSERT INTO `log` VALUES (3053, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 16:35:45');
INSERT INTO `log` VALUES (3054, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:35:45');
INSERT INTO `log` VALUES (3055, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 16:35:47');
INSERT INTO `log` VALUES (3056, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-18 16:35:51');
INSERT INTO `log` VALUES (3057, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 16:35:53');
INSERT INTO `log` VALUES (3058, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 16:35:56');
INSERT INTO `log` VALUES (3059, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:35:56');
INSERT INTO `log` VALUES (3060, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:35:58');
INSERT INTO `log` VALUES (3061, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:36:08');
INSERT INTO `log` VALUES (3062, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:09');
INSERT INTO `log` VALUES (3063, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:36:17');
INSERT INTO `log` VALUES (3064, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:18');
INSERT INTO `log` VALUES (3065, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:23');
INSERT INTO `log` VALUES (3066, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:25');
INSERT INTO `log` VALUES (3067, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:27');
INSERT INTO `log` VALUES (3068, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/update', '【用户】修改实验记录', '执行成功！', '[{\"recordName\":\"0000000000001\",\"id\":1802983251812265986}]', '2024-06-18 16:36:38');
INSERT INTO `log` VALUES (3069, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:38');
INSERT INTO `log` VALUES (3070, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802983251812265986', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802983251812265986]', '2024-06-18 16:36:40');
INSERT INTO `log` VALUES (3071, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:36:40');
INSERT INTO `log` VALUES (3072, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:41');
INSERT INTO `log` VALUES (3073, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/add', '【用户】新增实验记录', '执行成功！', '[{\"recordName\":\"00\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-18 16:36:47');
INSERT INTO `log` VALUES (3074, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:36:47');
INSERT INTO `log` VALUES (3075, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802983251812265986', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802983251812265986]', '2024-06-18 16:36:48');
INSERT INTO `log` VALUES (3076, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:36:48');
INSERT INTO `log` VALUES (3077, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/add', '【用户】新增样本记录', '执行成功！', '[{\"color\":\"748\",\"density\":\"1\",\"organism\":\"8\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"787\",\"sizeGt2mm\":12.0,\"recordId\":1802983251812265986,\"sampleName\":\"121212\",\"hardness\":\"78\",\"viscosity\":\"1212\",\"waterRetention\":\"212\",\"humidity\":\"12\"}]', '2024-06-18 16:37:00');
INSERT INTO `log` VALUES (3078, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802983251812265986', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802983251812265986]', '2024-06-18 16:37:00');
INSERT INTO `log` VALUES (3079, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/update', '【用户】修改样本记录', '执行成功！', '[{\"color\":\"748\",\"density\":\"1\",\"organism\":\"00000\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"78\",\"sizeGt2mm\":12.0,\"recordId\":1802983251812265986,\"sampleName\":\"121212\",\"hardness\":\"78\",\"viscosity\":\"1212\",\"waterRetention\":\"212\",\"humidity\":\"12\",\"id\":1802983840570912769}]', '2024-06-18 16:37:10');
INSERT INTO `log` VALUES (3080, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802983251812265986', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802983251812265986]', '2024-06-18 16:37:10');
INSERT INTO `log` VALUES (3081, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/del/1802983840570912769', '【用户】删除样本记录', '执行成功！', '[1802983840570912769]', '2024-06-18 16:37:17');
INSERT INTO `log` VALUES (3082, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802983251812265986', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802983251812265986]', '2024-06-18 16:37:17');
INSERT INTO `log` VALUES (3083, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:37:18');
INSERT INTO `log` VALUES (3084, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/del/1802983251812265986', '【用户】删除实验记录', '执行成功！', '[1802983251812265986]', '2024-06-18 16:37:21');
INSERT INTO `log` VALUES (3085, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:37:21');
INSERT INTO `log` VALUES (3086, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/del/1802983786867044353', '【用户】删除实验记录', '执行成功！', '[1802983786867044353]', '2024-06-18 16:37:23');
INSERT INTO `log` VALUES (3087, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:37:23');
INSERT INTO `log` VALUES (3088, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:37:25');
INSERT INTO `log` VALUES (3089, '127.0.0.1', 'user', 'http://127.0.0.1:8091/login', '【用户】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-18 16:51:36');
INSERT INTO `log` VALUES (3090, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 16:51:36');
INSERT INTO `log` VALUES (3091, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 16:51:38');
INSERT INTO `log` VALUES (3092, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 16:51:40');
INSERT INTO `log` VALUES (3093, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 16:51:43');
INSERT INTO `log` VALUES (3094, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-18 16:51:43');
INSERT INTO `log` VALUES (3095, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/add', '【系统管理员】新增样本记录', '执行成功！', '[{\"color\":\"1212\",\"density\":\"12\",\"organism\":\"12\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"12\",\"sizeGt2mm\":12.0,\"recordId\":1802918888518692865,\"sampleName\":\"12122\",\"hardness\":\"12\",\"viscosity\":\"12\",\"waterRetention\":\"121\",\"humidity\":\"12\"}]', '2024-06-18 16:51:55');
INSERT INTO `log` VALUES (3096, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 16:51:55');
INSERT INTO `log` VALUES (3097, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"1212\",\"density\":\"12\",\"organism\":\"12\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"12\",\"sizeGt2mm\":12.0,\"recordId\":1802918888518692865,\"sampleName\":\"12122\",\"hardness\":\"12\",\"viscosity\":\"12\",\"waterRetention\":\"121\",\"humidity\":\"12\",\"id\":1802987592434532353}]', '2024-06-18 16:52:00');
INSERT INTO `log` VALUES (3098, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 16:52:00');
INSERT INTO `log` VALUES (3099, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"1212\",\"density\":\"12\",\"organism\":\"12\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"12\",\"sizeGt2mm\":12.0,\"recordId\":1802918888518692865,\"sampleName\":\"12122222\",\"hardness\":\"12\",\"viscosity\":\"12\",\"waterRetention\":\"121\",\"humidity\":\"12\",\"id\":1802987592434532353}]', '2024-06-18 16:52:08');
INSERT INTO `log` VALUES (3100, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-18 16:52:08');
INSERT INTO `log` VALUES (3101, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 17:01:49');
INSERT INTO `log` VALUES (3102, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:01:52');
INSERT INTO `log` VALUES (3103, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 17:01:53');
INSERT INTO `log` VALUES (3104, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:01:54');
INSERT INTO `log` VALUES (3105, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:01:55');
INSERT INTO `log` VALUES (3106, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":20,\"currentPage\":1}]', '2024-06-18 17:01:58');
INSERT INTO `log` VALUES (3107, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":50,\"currentPage\":1}]', '2024-06-18 17:02:04');
INSERT INTO `log` VALUES (3108, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:03:56');
INSERT INTO `log` VALUES (3109, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:03:56');
INSERT INTO `log` VALUES (3110, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:03:57');
INSERT INTO `log` VALUES (3111, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 17:03:58');
INSERT INTO `log` VALUES (3112, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:04:26');
INSERT INTO `log` VALUES (3113, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:04:27');
INSERT INTO `log` VALUES (3114, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:04:27');
INSERT INTO `log` VALUES (3115, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-18 17:04:27');
INSERT INTO `log` VALUES (3116, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-18 17:04:45');
INSERT INTO `log` VALUES (3117, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:04:45');
INSERT INTO `log` VALUES (3118, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:04:46');
INSERT INTO `log` VALUES (3119, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-18 17:04:48');
INSERT INTO `log` VALUES (3120, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:04:48');
INSERT INTO `log` VALUES (3121, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:04:50');
INSERT INTO `log` VALUES (3122, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:05:09');
INSERT INTO `log` VALUES (3123, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:05:10');
INSERT INTO `log` VALUES (3124, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:05:11');
INSERT INTO `log` VALUES (3125, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:05:11');
INSERT INTO `log` VALUES (3126, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:05:51');
INSERT INTO `log` VALUES (3127, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:05:52');
INSERT INTO `log` VALUES (3128, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:05:52');
INSERT INTO `log` VALUES (3129, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:05:53');
INSERT INTO `log` VALUES (3130, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:09');
INSERT INTO `log` VALUES (3131, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:06:17');
INSERT INTO `log` VALUES (3132, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:06:17');
INSERT INTO `log` VALUES (3133, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:18');
INSERT INTO `log` VALUES (3134, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:18');
INSERT INTO `log` VALUES (3135, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":2},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:29');
INSERT INTO `log` VALUES (3136, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":3},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:31');
INSERT INTO `log` VALUES (3137, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":4},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:31');
INSERT INTO `log` VALUES (3138, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:34');
INSERT INTO `log` VALUES (3139, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:06:53');
INSERT INTO `log` VALUES (3140, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-18 17:06:54');
INSERT INTO `log` VALUES (3141, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:54');
INSERT INTO `log` VALUES (3142, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-18 17:06:56');
INSERT INTO `log` VALUES (3143, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 09:05:11');
INSERT INTO `log` VALUES (3144, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 09:05:12');
INSERT INTO `log` VALUES (3145, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:05:13');
INSERT INTO `log` VALUES (3146, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 09:05:15');
INSERT INTO `log` VALUES (3147, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 09:05:17');
INSERT INTO `log` VALUES (3148, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:05:17');
INSERT INTO `log` VALUES (3149, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:05:23');
INSERT INTO `log` VALUES (3150, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 09:05:26');
INSERT INTO `log` VALUES (3151, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 09:05:28');
INSERT INTO `log` VALUES (3152, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 09:05:28');
INSERT INTO `log` VALUES (3153, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 09:05:29');
INSERT INTO `log` VALUES (3154, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-19 09:05:30');
INSERT INTO `log` VALUES (3155, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 09:05:30');
INSERT INTO `log` VALUES (3156, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 09:05:32');
INSERT INTO `log` VALUES (3157, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-19 09:05:32');
INSERT INTO `log` VALUES (3158, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 09:05:32');
INSERT INTO `log` VALUES (3159, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 09:05:35');
INSERT INTO `log` VALUES (3160, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:05:35');
INSERT INTO `log` VALUES (3161, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 09:17:25');
INSERT INTO `log` VALUES (3162, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:17:25');
INSERT INTO `log` VALUES (3163, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 09:17:43');
INSERT INTO `log` VALUES (3164, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:17:45');
INSERT INTO `log` VALUES (3165, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 09:50:57');
INSERT INTO `log` VALUES (3166, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 09:50:59');
INSERT INTO `log` VALUES (3167, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 10:35:58');
INSERT INTO `log` VALUES (3168, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 10:36:00');
INSERT INTO `log` VALUES (3169, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 10:36:00');
INSERT INTO `log` VALUES (3170, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 10:36:05');
INSERT INTO `log` VALUES (3171, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 10:36:05');
INSERT INTO `log` VALUES (3172, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 10:36:05');
INSERT INTO `log` VALUES (3173, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 10:36:28');
INSERT INTO `log` VALUES (3174, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 10:36:29');
INSERT INTO `log` VALUES (3175, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 10:36:29');
INSERT INTO `log` VALUES (3176, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:11:11');
INSERT INTO `log` VALUES (3177, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:11:14');
INSERT INTO `log` VALUES (3178, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:11:15');
INSERT INTO `log` VALUES (3179, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 11:11:17');
INSERT INTO `log` VALUES (3180, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:11:21');
INSERT INTO `log` VALUES (3181, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:11:22');
INSERT INTO `log` VALUES (3182, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:11:24');
INSERT INTO `log` VALUES (3183, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:11:25');
INSERT INTO `log` VALUES (3184, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-19 11:11:26');
INSERT INTO `log` VALUES (3185, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"\",\"roleId\":2,\"userName\":\"shanghai123\",\"userId\":\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\",\"phone\":\"1234567\",\"name\":\"123\",\"email\":\"123456\",\"status\":1}]', '2024-06-19 11:11:31');
INSERT INTO `log` VALUES (3186, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:11:31');
INSERT INTO `log` VALUES (3187, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-19 11:11:37');
INSERT INTO `log` VALUES (3188, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-19 11:11:39');
INSERT INTO `log` VALUES (3189, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:11:47');
INSERT INTO `log` VALUES (3190, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:11:55');
INSERT INTO `log` VALUES (3191, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:11:56');
INSERT INTO `log` VALUES (3192, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 11:11:57');
INSERT INTO `log` VALUES (3193, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 11:11:57');
INSERT INTO `log` VALUES (3194, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/add', '【系统管理员】新增样本记录', '执行成功！', '[{\"color\":\"灰\",\"density\":\"小\",\"organism\":\"树根系\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"无色\",\"sizeGt2mm\":12.0,\"recordId\":1802918888518692865,\"sampleName\":\"实验1\",\"hardness\":\"大\",\"viscosity\":\"大\",\"waterRetention\":\"高\",\"humidity\":\"中\"}]', '2024-06-19 11:13:37');
INSERT INTO `log` VALUES (3195, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 11:13:37');
INSERT INTO `log` VALUES (3196, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"灰\",\"density\":\"小\",\"organism\":\"树根系\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797499575100112897,\"smell\":\"无色\",\"sizeGt2mm\":12.0,\"recordId\":1802918888518692865,\"sampleName\":\"实验1\",\"hardness\":\"大\",\"viscosity\":\"大\",\"waterRetention\":\"高\",\"humidity\":\"中\",\"id\":1803264845621981186}]', '2024-06-19 11:13:43');
INSERT INTO `log` VALUES (3197, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 11:13:43');
INSERT INTO `log` VALUES (3198, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 11:45:51');
INSERT INTO `log` VALUES (3199, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 11:45:52');
INSERT INTO `log` VALUES (3200, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 11:45:52');
INSERT INTO `log` VALUES (3201, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 11:46:02');
INSERT INTO `log` VALUES (3202, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:46:19');
INSERT INTO `log` VALUES (3203, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:46:20');
INSERT INTO `log` VALUES (3204, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 11:46:22');
INSERT INTO `log` VALUES (3205, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:46:24');
INSERT INTO `log` VALUES (3206, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:46:25');
INSERT INTO `log` VALUES (3207, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 11:46:28');
INSERT INTO `log` VALUES (3208, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:46:31');
INSERT INTO `log` VALUES (3209, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:46:33');
INSERT INTO `log` VALUES (3210, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 11:46:36');
INSERT INTO `log` VALUES (3211, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 11:46:36');
INSERT INTO `log` VALUES (3212, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:46:40');
INSERT INTO `log` VALUES (3213, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 11:46:42');
INSERT INTO `log` VALUES (3214, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 11:46:45');
INSERT INTO `log` VALUES (3215, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 11:46:49');
INSERT INTO `log` VALUES (3216, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 11:46:49');
INSERT INTO `log` VALUES (3217, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:46:51');
INSERT INTO `log` VALUES (3218, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:46:55');
INSERT INTO `log` VALUES (3219, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:03');
INSERT INTO `log` VALUES (3220, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:06');
INSERT INTO `log` VALUES (3221, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-19 11:47:08');
INSERT INTO `log` VALUES (3222, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 11:47:12');
INSERT INTO `log` VALUES (3223, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 11:47:12');
INSERT INTO `log` VALUES (3224, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 11:47:16');
INSERT INTO `log` VALUES (3225, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 11:47:18');
INSERT INTO `log` VALUES (3226, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 11:47:23');
INSERT INTO `log` VALUES (3227, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 11:47:23');
INSERT INTO `log` VALUES (3228, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:26');
INSERT INTO `log` VALUES (3229, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:29');
INSERT INTO `log` VALUES (3230, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:30');
INSERT INTO `log` VALUES (3231, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-19 11:47:33');
INSERT INTO `log` VALUES (3232, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 11:47:33');
INSERT INTO `log` VALUES (3233, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:36');
INSERT INTO `log` VALUES (3234, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 11:47:37');
INSERT INTO `log` VALUES (3235, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:30:10');
INSERT INTO `log` VALUES (3236, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:30:10');
INSERT INTO `log` VALUES (3237, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:30:12');
INSERT INTO `log` VALUES (3238, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:31:40');
INSERT INTO `log` VALUES (3239, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:31:45');
INSERT INTO `log` VALUES (3240, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:32:36');
INSERT INTO `log` VALUES (3241, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:33:05');
INSERT INTO `log` VALUES (3242, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:33:28');
INSERT INTO `log` VALUES (3243, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:33:30');
INSERT INTO `log` VALUES (3244, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:35:16');
INSERT INTO `log` VALUES (3245, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:35:18');
INSERT INTO `log` VALUES (3246, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:35:22');
INSERT INTO `log` VALUES (3247, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:35:46');
INSERT INTO `log` VALUES (3248, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:36:07');
INSERT INTO `log` VALUES (3249, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:40:40');
INSERT INTO `log` VALUES (3250, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:40:48');
INSERT INTO `log` VALUES (3251, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:40:53');
INSERT INTO `log` VALUES (3252, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:40:55');
INSERT INTO `log` VALUES (3253, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:41:07');
INSERT INTO `log` VALUES (3254, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:41:30');
INSERT INTO `log` VALUES (3255, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:42:46');
INSERT INTO `log` VALUES (3256, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:42:58');
INSERT INTO `log` VALUES (3257, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:43:34');
INSERT INTO `log` VALUES (3258, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:43:41');
INSERT INTO `log` VALUES (3259, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:43:43');
INSERT INTO `log` VALUES (3260, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:43:47');
INSERT INTO `log` VALUES (3261, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:43:53');
INSERT INTO `log` VALUES (3262, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:43:54');
INSERT INTO `log` VALUES (3263, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:44:10');
INSERT INTO `log` VALUES (3264, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:44:13');
INSERT INTO `log` VALUES (3265, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:44:14');
INSERT INTO `log` VALUES (3266, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:44:22');
INSERT INTO `log` VALUES (3267, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 14:44:23');
INSERT INTO `log` VALUES (3268, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-19 14:44:27');
INSERT INTO `log` VALUES (3269, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"c1e8a000473957b8c5d51542c4c75e0c\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 14:44:31');
INSERT INTO `log` VALUES (3270, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 14:44:37');
INSERT INTO `log` VALUES (3271, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:44:37');
INSERT INTO `log` VALUES (3272, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 14:44:39');
INSERT INTO `log` VALUES (3273, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 14:44:42');
INSERT INTO `log` VALUES (3274, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 14:44:43');
INSERT INTO `log` VALUES (3275, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:47:47');
INSERT INTO `log` VALUES (3276, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:50:07');
INSERT INTO `log` VALUES (3277, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:51:36');
INSERT INTO `log` VALUES (3278, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:51:47');
INSERT INTO `log` VALUES (3279, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:51:57');
INSERT INTO `log` VALUES (3280, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:52:00');
INSERT INTO `log` VALUES (3281, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:52:12');
INSERT INTO `log` VALUES (3282, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:52:20');
INSERT INTO `log` VALUES (3283, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 14:55:05');
INSERT INTO `log` VALUES (3284, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 15:20:13');
INSERT INTO `log` VALUES (3285, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 15:52:39');
INSERT INTO `log` VALUES (3286, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 15:53:12');
INSERT INTO `log` VALUES (3287, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:49:07');
INSERT INTO `log` VALUES (3288, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:49:11');
INSERT INTO `log` VALUES (3289, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:49:34');
INSERT INTO `log` VALUES (3290, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:49:54');
INSERT INTO `log` VALUES (3291, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:49:57');
INSERT INTO `log` VALUES (3292, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:50:23');
INSERT INTO `log` VALUES (3293, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:50:25');
INSERT INTO `log` VALUES (3294, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:50:27');
INSERT INTO `log` VALUES (3295, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:50:28');
INSERT INTO `log` VALUES (3296, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:50:34');
INSERT INTO `log` VALUES (3297, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:50:36');
INSERT INTO `log` VALUES (3298, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:50:37');
INSERT INTO `log` VALUES (3299, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:50:38');
INSERT INTO `log` VALUES (3300, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:50:45');
INSERT INTO `log` VALUES (3301, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:50:46');
INSERT INTO `log` VALUES (3302, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:50:51');
INSERT INTO `log` VALUES (3303, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:50:53');
INSERT INTO `log` VALUES (3304, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:51:26');
INSERT INTO `log` VALUES (3305, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:51:27');
INSERT INTO `log` VALUES (3306, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:51:49');
INSERT INTO `log` VALUES (3307, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 16:51:51');
INSERT INTO `log` VALUES (3308, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1796162840143466497', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1796162840143466497]', '2024-06-19 16:52:15');
INSERT INTO `log` VALUES (3309, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 16:52:15');
INSERT INTO `log` VALUES (3310, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 16:52:16');
INSERT INTO `log` VALUES (3311, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:52:48');
INSERT INTO `log` VALUES (3312, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 16:52:48');
INSERT INTO `log` VALUES (3313, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:53:08');
INSERT INTO `log` VALUES (3314, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 16:53:09');
INSERT INTO `log` VALUES (3315, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:53:28');
INSERT INTO `log` VALUES (3316, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 16:53:29');
INSERT INTO `log` VALUES (3317, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:53:49');
INSERT INTO `log` VALUES (3318, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 16:53:49');
INSERT INTO `log` VALUES (3319, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:53:51');
INSERT INTO `log` VALUES (3320, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:53:57');
INSERT INTO `log` VALUES (3321, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:53:57');
INSERT INTO `log` VALUES (3322, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:54:00');
INSERT INTO `log` VALUES (3323, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:54:00');
INSERT INTO `log` VALUES (3324, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:54:01');
INSERT INTO `log` VALUES (3325, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-19 16:54:08');
INSERT INTO `log` VALUES (3326, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 16:54:08');
INSERT INTO `log` VALUES (3327, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:54:10');
INSERT INTO `log` VALUES (3328, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 16:54:13');
INSERT INTO `log` VALUES (3329, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 16:54:13');
INSERT INTO `log` VALUES (3330, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:54:18');
INSERT INTO `log` VALUES (3331, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 16:54:36');
INSERT INTO `log` VALUES (3332, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 16:54:42');
INSERT INTO `log` VALUES (3333, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-19 16:54:45');
INSERT INTO `log` VALUES (3334, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 16:54:45');
INSERT INTO `log` VALUES (3335, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:54:57');
INSERT INTO `log` VALUES (3336, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-19 16:54:57');
INSERT INTO `log` VALUES (3337, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 16:54:57');
INSERT INTO `log` VALUES (3338, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:55:02');
INSERT INTO `log` VALUES (3339, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:56:42');
INSERT INTO `log` VALUES (3340, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:56:43');
INSERT INTO `log` VALUES (3341, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:00');
INSERT INTO `log` VALUES (3342, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:00');
INSERT INTO `log` VALUES (3343, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:05');
INSERT INTO `log` VALUES (3344, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:07');
INSERT INTO `log` VALUES (3345, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:08');
INSERT INTO `log` VALUES (3346, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:13');
INSERT INTO `log` VALUES (3347, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:14');
INSERT INTO `log` VALUES (3348, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:16');
INSERT INTO `log` VALUES (3349, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:17');
INSERT INTO `log` VALUES (3350, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:19');
INSERT INTO `log` VALUES (3351, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:21');
INSERT INTO `log` VALUES (3352, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:24');
INSERT INTO `log` VALUES (3353, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:25');
INSERT INTO `log` VALUES (3354, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:32');
INSERT INTO `log` VALUES (3355, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:33');
INSERT INTO `log` VALUES (3356, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:46');
INSERT INTO `log` VALUES (3357, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:47');
INSERT INTO `log` VALUES (3358, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:57:56');
INSERT INTO `log` VALUES (3359, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:57:57');
INSERT INTO `log` VALUES (3360, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:58:16');
INSERT INTO `log` VALUES (3361, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:58:17');
INSERT INTO `log` VALUES (3362, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:58:35');
INSERT INTO `log` VALUES (3363, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/null', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"null\"]', '2024-06-19 16:58:35');
INSERT INTO `log` VALUES (3364, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:58:55');
INSERT INTO `log` VALUES (3365, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:59:25');
INSERT INTO `log` VALUES (3366, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:59:29');
INSERT INTO `log` VALUES (3367, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:59:32');
INSERT INTO `log` VALUES (3368, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:59:48');
INSERT INTO `log` VALUES (3369, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 16:59:51');
INSERT INTO `log` VALUES (3370, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:01:54');
INSERT INTO `log` VALUES (3371, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:02:00');
INSERT INTO `log` VALUES (3372, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:02:21');
INSERT INTO `log` VALUES (3373, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:02:29');
INSERT INTO `log` VALUES (3374, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:03:22');
INSERT INTO `log` VALUES (3375, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:03:44');
INSERT INTO `log` VALUES (3376, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:03:47');
INSERT INTO `log` VALUES (3377, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:03:50');
INSERT INTO `log` VALUES (3378, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:03:54');
INSERT INTO `log` VALUES (3379, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:05:30');
INSERT INTO `log` VALUES (3380, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:05:34');
INSERT INTO `log` VALUES (3381, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:05:37');
INSERT INTO `log` VALUES (3382, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:06:30');
INSERT INTO `log` VALUES (3383, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:06:33');
INSERT INTO `log` VALUES (3384, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:06:41');
INSERT INTO `log` VALUES (3385, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:07:00');
INSERT INTO `log` VALUES (3386, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:07:26');
INSERT INTO `log` VALUES (3387, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:07:59');
INSERT INTO `log` VALUES (3388, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:09:07');
INSERT INTO `log` VALUES (3389, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:09:16');
INSERT INTO `log` VALUES (3390, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:09:22');
INSERT INTO `log` VALUES (3391, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:10:35');
INSERT INTO `log` VALUES (3392, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:11:20');
INSERT INTO `log` VALUES (3393, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:11:40');
INSERT INTO `log` VALUES (3394, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:14:22');
INSERT INTO `log` VALUES (3395, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:15:15');
INSERT INTO `log` VALUES (3396, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:17:42');
INSERT INTO `log` VALUES (3397, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:20:08');
INSERT INTO `log` VALUES (3398, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:20:14');
INSERT INTO `log` VALUES (3399, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:20:24');
INSERT INTO `log` VALUES (3400, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:25:33');
INSERT INTO `log` VALUES (3401, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:25:37');
INSERT INTO `log` VALUES (3402, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:25:38');
INSERT INTO `log` VALUES (3403, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:25:39');
INSERT INTO `log` VALUES (3404, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-19 17:25:41');
INSERT INTO `log` VALUES (3405, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 17:25:43');
INSERT INTO `log` VALUES (3406, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 17:25:50');
INSERT INTO `log` VALUES (3407, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:25:50');
INSERT INTO `log` VALUES (3408, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:25:59');
INSERT INTO `log` VALUES (3409, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:26:01');
INSERT INTO `log` VALUES (3410, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:26:03');
INSERT INTO `log` VALUES (3411, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 17:26:06');
INSERT INTO `log` VALUES (3412, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 17:26:06');
INSERT INTO `log` VALUES (3413, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:26:28');
INSERT INTO `log` VALUES (3414, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/add', '【系统管理员】新增实验记录', '执行成功！', '[{\"recordName\":\"A\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"}]', '2024-06-19 17:26:34');
INSERT INTO `log` VALUES (3415, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:26:34');
INSERT INTO `log` VALUES (3416, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1803358700899889154', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1803358700899889154]', '2024-06-19 17:26:40');
INSERT INTO `log` VALUES (3417, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 17:26:40');
INSERT INTO `log` VALUES (3418, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/add', '【系统管理员】新增样本记录', '执行成功！', '[{\"color\":\"a\",\"density\":\"a\",\"organism\":\"a\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1797568827433848833,\"smell\":\"a\",\"sizeGt2mm\":12.0,\"recordId\":1803358700899889154,\"sampleName\":\"a\",\"hardness\":\"a\",\"viscosity\":\"a\",\"waterRetention\":\"a\",\"humidity\":\"a\"}]', '2024-06-19 17:26:58');
INSERT INTO `log` VALUES (3419, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1803358700899889154', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1803358700899889154]', '2024-06-19 17:26:58');
INSERT INTO `log` VALUES (3420, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/update', '【系统管理员】修改样本记录', '执行成功！', '[{\"color\":\"a\",\"density\":\"a\",\"organism\":\"a\",\"sizeLt2mm\":12.0,\"sampleTypeId\":1801059724293038082,\"smell\":\"a\",\"sizeGt2mm\":12.0,\"recordId\":1803358700899889154,\"sampleName\":\"a0\",\"hardness\":\"a\",\"viscosity\":\"a\",\"waterRetention\":\"a\",\"humidity\":\"a\",\"id\":1803358800799821826}]', '2024-06-19 17:27:08');
INSERT INTO `log` VALUES (3421, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1803358700899889154', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1803358700899889154]', '2024-06-19 17:27:08');
INSERT INTO `log` VALUES (3422, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:27:15');
INSERT INTO `log` VALUES (3423, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1803358700899889154', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1803358700899889154]', '2024-06-19 17:27:29');
INSERT INTO `log` VALUES (3424, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 17:27:29');
INSERT INTO `log` VALUES (3425, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/del/1803358800799821826', '【系统管理员】删除样本记录', '执行成功！', '[1803358800799821826]', '2024-06-19 17:27:32');
INSERT INTO `log` VALUES (3426, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1803358700899889154', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1803358700899889154]', '2024-06-19 17:27:32');
INSERT INTO `log` VALUES (3427, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:27:39');
INSERT INTO `log` VALUES (3428, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:27:46');
INSERT INTO `log` VALUES (3429, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"roleId\":2,\"userName\":\"ss\",\"phone\":\"000000\",\"name\":\"ss\",\"email\":\"00000\",\"status\":0}]', '2024-06-19 17:28:07');
INSERT INTO `log` VALUES (3430, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:28:07');
INSERT INTO `log` VALUES (3431, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 17:28:10');
INSERT INTO `log` VALUES (3432, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"ss\",\"status\":0}]', '2024-06-19 17:28:15');
INSERT INTO `log` VALUES (3433, '127.0.0.1', 'ss', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【ss】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:28:15');
INSERT INTO `log` VALUES (3434, '127.0.0.1', 'ss', 'http://127.0.0.1:8091/api/record/getRecord/988a0635-6c53-4b58-b038-14216d49b034', '【ss】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"988a0635-6c53-4b58-b038-14216d49b034\"]', '2024-06-19 17:28:16');
INSERT INTO `log` VALUES (3435, '127.0.0.1', 'ss', 'http://127.0.0.1:8091/loginOut', '【ss】退出登录', '执行失败！', '[]', '2024-06-19 17:28:40');
INSERT INTO `log` VALUES (3436, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 17:28:44');
INSERT INTO `log` VALUES (3437, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:28:44');
INSERT INTO `log` VALUES (3438, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:28:46');
INSERT INTO `log` VALUES (3439, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:29:01');
INSERT INTO `log` VALUES (3440, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:29:04');
INSERT INTO `log` VALUES (3441, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:29:23');
INSERT INTO `log` VALUES (3442, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 17:29:36');
INSERT INTO `log` VALUES (3443, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:29:40');
INSERT INTO `log` VALUES (3444, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:29:40');
INSERT INTO `log` VALUES (3445, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:29:41');
INSERT INTO `log` VALUES (3446, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:29:48');
INSERT INTO `log` VALUES (3447, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【用户】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-19 17:29:54');
INSERT INTO `log` VALUES (3448, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/sampleType/list', '【用户】获取所有样本类型', '执行成功！', '[{}]', '2024-06-19 17:29:54');
INSERT INTO `log` VALUES (3449, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:29:56');
INSERT INTO `log` VALUES (3450, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:29:59');
INSERT INTO `log` VALUES (3451, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:30:05');
INSERT INTO `log` VALUES (3452, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:30:15');
INSERT INTO `log` VALUES (3453, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:30:36');
INSERT INTO `log` VALUES (3454, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【用户】更新用户基本信息', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"oldPassWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":0}]', '2024-06-19 17:31:05');
INSERT INTO `log` VALUES (3455, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-19 17:31:09');
INSERT INTO `log` VALUES (3456, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:31:16');
INSERT INTO `log` VALUES (3457, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:31:16');
INSERT INTO `log` VALUES (3458, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:31:19');
INSERT INTO `log` VALUES (3459, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:31:25');
INSERT INTO `log` VALUES (3460, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:31:30');
INSERT INTO `log` VALUES (3461, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:31:37');
INSERT INTO `log` VALUES (3462, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:32:27');
INSERT INTO `log` VALUES (3463, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:36:32');
INSERT INTO `log` VALUES (3464, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-19 17:36:38');
INSERT INTO `log` VALUES (3465, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:36:42');
INSERT INTO `log` VALUES (3466, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:36:47');
INSERT INTO `log` VALUES (3467, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 17:47:26');
INSERT INTO `log` VALUES (3468, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:47:26');
INSERT INTO `log` VALUES (3469, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 17:47:28');
INSERT INTO `log` VALUES (3470, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:47:32');
INSERT INTO `log` VALUES (3471, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"29c3eea3f305d6b823f562ac4be35217\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:47:35');
INSERT INTO `log` VALUES (3472, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:47:41');
INSERT INTO `log` VALUES (3473, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 17:47:45');
INSERT INTO `log` VALUES (3474, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:47:45');
INSERT INTO `log` VALUES (3475, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:47:47');
INSERT INTO `log` VALUES (3476, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:47:50');
INSERT INTO `log` VALUES (3477, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:47:55');
INSERT INTO `log` VALUES (3478, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:47:57');
INSERT INTO `log` VALUES (3479, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"roleId\":2,\"userName\":\"user\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":1}]', '2024-06-19 17:48:04');
INSERT INTO `log` VALUES (3480, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:48:04');
INSERT INTO `log` VALUES (3481, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-19 17:48:07');
INSERT INTO `log` VALUES (3482, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:48:11');
INSERT INTO `log` VALUES (3483, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:48:22');
INSERT INTO `log` VALUES (3484, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:48:23');
INSERT INTO `log` VALUES (3485, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:48:28');
INSERT INTO `log` VALUES (3486, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:48:29');
INSERT INTO `log` VALUES (3487, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-19 17:48:35');
INSERT INTO `log` VALUES (3488, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 17:48:35');
INSERT INTO `log` VALUES (3489, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-19 17:48:36');
INSERT INTO `log` VALUES (3490, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:48:38');
INSERT INTO `log` VALUES (3491, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-19 17:48:42');
INSERT INTO `log` VALUES (3492, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"roleId\":2,\"userName\":\"user\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":1}]', '2024-06-19 17:48:51');
INSERT INTO `log` VALUES (3493, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 17:48:51');
INSERT INTO `log` VALUES (3494, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:49:01');
INSERT INTO `log` VALUES (3495, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:49:08');
INSERT INTO `log` VALUES (3496, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:49:09');
INSERT INTO `log` VALUES (3497, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"dd4b21e9ef71e1291183a46b913ae6f2\",\"userName\":\"user\",\"status\":0}]', '2024-06-19 17:49:10');
INSERT INTO `log` VALUES (3498, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 18:38:49');
INSERT INTO `log` VALUES (3499, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 18:38:53');
INSERT INTO `log` VALUES (3500, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-19 19:09:15');
INSERT INTO `log` VALUES (3501, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-19 19:09:17');
INSERT INTO `log` VALUES (3502, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-24 22:34:59');
INSERT INTO `log` VALUES (3503, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:34:59');
INSERT INTO `log` VALUES (3504, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 22:35:03');
INSERT INTO `log` VALUES (3505, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:35:04');
INSERT INTO `log` VALUES (3506, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:35:05');
INSERT INTO `log` VALUES (3507, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-24 22:35:08');
INSERT INTO `log` VALUES (3508, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 22:35:16');
INSERT INTO `log` VALUES (3509, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/delUserInfoByUserId', '【系统管理员】删除用户信息', '执行成功！', '[\"988a0635-6c53-4b58-b038-14216d49b034\"]', '2024-06-24 22:35:24');
INSERT INTO `log` VALUES (3510, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 22:35:24');
INSERT INTO `log` VALUES (3511, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"roleId\":2,\"userName\":\"123456\",\"phone\":\"1\",\"name\":\"测试新用户\",\"email\":\"1\",\"status\":0}]', '2024-06-24 22:36:00');
INSERT INTO `log` VALUES (3512, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 22:36:00');
INSERT INTO `log` VALUES (3513, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/loginOut', '【系统管理员】退出登录', '执行失败！', '[]', '2024-06-24 22:36:03');
INSERT INTO `log` VALUES (3514, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"userName\":\"123456\",\"status\":0}]', '2024-06-24 22:36:10');
INSERT INTO `log` VALUES (3515, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:36:10');
INSERT INTO `log` VALUES (3516, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:36:12');
INSERT INTO `log` VALUES (3517, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【测试新用户】根据用户ID获取用户信息', '执行成功！', '[\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:36:14');
INSERT INTO `log` VALUES (3518, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:36:16');
INSERT INTO `log` VALUES (3519, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:36:30');
INSERT INTO `log` VALUES (3520, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:36:36');
INSERT INTO `log` VALUES (3521, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:36:36');
INSERT INTO `log` VALUES (3522, '127.0.0.1', '123456', 'http://127.0.0.1:8091/loginOut', '【测试新用户】退出登录', '执行失败！', '[]', '2024-06-24 22:36:45');
INSERT INTO `log` VALUES (3523, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-24 22:36:49');
INSERT INTO `log` VALUES (3524, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:36:49');
INSERT INTO `log` VALUES (3525, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 22:36:53');
INSERT INTO `log` VALUES (3526, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:36:55');
INSERT INTO `log` VALUES (3527, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 22:36:58');
INSERT INTO `log` VALUES (3528, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"userName\":\"123456\",\"status\":0}]', '2024-06-24 22:37:16');
INSERT INTO `log` VALUES (3529, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:37:16');
INSERT INTO `log` VALUES (3530, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:37:18');
INSERT INTO `log` VALUES (3531, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:37:21');
INSERT INTO `log` VALUES (3532, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:37:22');
INSERT INTO `log` VALUES (3533, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:37:45');
INSERT INTO `log` VALUES (3534, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 22:37:51');
INSERT INTO `log` VALUES (3535, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:37:57');
INSERT INTO `log` VALUES (3536, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:38:56');
INSERT INTO `log` VALUES (3537, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:38:56');
INSERT INTO `log` VALUES (3538, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:39:18');
INSERT INTO `log` VALUES (3539, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:39:21');
INSERT INTO `log` VALUES (3540, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:39:22');
INSERT INTO `log` VALUES (3541, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:39:30');
INSERT INTO `log` VALUES (3542, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:39:30');
INSERT INTO `log` VALUES (3543, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:40:49');
INSERT INTO `log` VALUES (3544, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:40:50');
INSERT INTO `log` VALUES (3545, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:45:48');
INSERT INTO `log` VALUES (3546, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:45:49');
INSERT INTO `log` VALUES (3547, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:02');
INSERT INTO `log` VALUES (3548, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:08');
INSERT INTO `log` VALUES (3549, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:10');
INSERT INTO `log` VALUES (3550, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:13');
INSERT INTO `log` VALUES (3551, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:17');
INSERT INTO `log` VALUES (3552, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:18');
INSERT INTO `log` VALUES (3553, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:22');
INSERT INTO `log` VALUES (3554, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:24');
INSERT INTO `log` VALUES (3555, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:25');
INSERT INTO `log` VALUES (3556, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 22:46:26');
INSERT INTO `log` VALUES (3557, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:46:44');
INSERT INTO `log` VALUES (3558, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:46:45');
INSERT INTO `log` VALUES (3559, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:47:27');
INSERT INTO `log` VALUES (3560, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:47:28');
INSERT INTO `log` VALUES (3561, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-24 22:47:32');
INSERT INTO `log` VALUES (3562, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:47:37');
INSERT INTO `log` VALUES (3563, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 22:47:39');
INSERT INTO `log` VALUES (3564, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:48:05');
INSERT INTO `log` VALUES (3565, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 22:48:06');
INSERT INTO `log` VALUES (3566, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/login', '【系统管理员】用户登录', '执行成功！', '[{\"passWord\":\"21232f297a57a5a743894a0e4a801fc3\",\"userName\":\"admin\",\"status\":0}]', '2024-06-24 22:48:24');
INSERT INTO `log` VALUES (3567, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:48:24');
INSERT INTO `log` VALUES (3568, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:48:26');
INSERT INTO `log` VALUES (3569, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 22:48:29');
INSERT INTO `log` VALUES (3570, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 22:48:31');
INSERT INTO `log` VALUES (3571, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-24 22:48:32');
INSERT INTO `log` VALUES (3572, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 22:49:01');
INSERT INTO `log` VALUES (3573, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-24 22:49:02');
INSERT INTO `log` VALUES (3574, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【系统管理员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 23:21:26');
INSERT INTO `log` VALUES (3575, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/1888dee2-c173-48e0-ac2c-e5a043dec7d4', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"1888dee2-c173-48e0-ac2c-e5a043dec7d4\"]', '2024-06-24 23:21:27');
INSERT INTO `log` VALUES (3576, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecord', '【系统管理员】查询所有用户的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1}]', '2024-06-24 23:21:29');
INSERT INTO `log` VALUES (3577, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:21:31');
INSERT INTO `log` VALUES (3578, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-24 23:21:39');
INSERT INTO `log` VALUES (3579, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-24 23:21:39');
INSERT INTO `log` VALUES (3580, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:21:42');
INSERT INTO `log` VALUES (3581, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-24 23:21:44');
INSERT INTO `log` VALUES (3582, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-24 23:21:44');
INSERT INTO `log` VALUES (3583, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/del/1802987592434532353', '【系统管理员】删除样本记录', '执行失败！', '[1802987592434532353]', '2024-06-24 23:21:47');
INSERT INTO `log` VALUES (3584, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-24 23:21:48');
INSERT INTO `log` VALUES (3585, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:21:49');
INSERT INTO `log` VALUES (3586, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1]', '2024-06-24 23:21:51');
INSERT INTO `log` VALUES (3587, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-24 23:21:51');
INSERT INTO `log` VALUES (3588, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:21:53');
INSERT INTO `log` VALUES (3589, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-24 23:21:54');
INSERT INTO `log` VALUES (3590, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-24 23:21:54');
INSERT INTO `log` VALUES (3591, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/del/1802002236214005762', '【系统管理员】删除样本记录', '执行成功！', '[1802002236214005762]', '2024-06-24 23:21:58');
INSERT INTO `log` VALUES (3592, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1801488063201726466', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1801488063201726466]', '2024-06-24 23:21:58');
INSERT INTO `log` VALUES (3593, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:22:00');
INSERT INTO `log` VALUES (3594, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1803358700899889154', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1803358700899889154]', '2024-06-24 23:22:02');
INSERT INTO `log` VALUES (3595, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-24 23:22:03');
INSERT INTO `log` VALUES (3596, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:22:04');
INSERT INTO `log` VALUES (3597, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/del/1803358700899889154', '【系统管理员】删除实验记录', '执行成功！', '[1803358700899889154]', '2024-06-24 23:22:08');
INSERT INTO `log` VALUES (3598, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/record/listRecordByUserId/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【系统管理员】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:22:08');
INSERT INTO `log` VALUES (3599, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/soilSample/list/1802918888518692865', '【系统管理员】获取实验记录下的所有样本记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},1802918888518692865]', '2024-06-24 23:22:13');
INSERT INTO `log` VALUES (3600, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/sampleType/list', '【系统管理员】获取所有样本类型', '执行成功！', '[{}]', '2024-06-24 23:22:13');
INSERT INTO `log` VALUES (3601, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 23:22:18');
INSERT INTO `log` VALUES (3602, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/87f5f07c-e18d-4766-97e7-9170dc843e98', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 23:22:18');
INSERT INTO `log` VALUES (3603, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 23:22:25');
INSERT INTO `log` VALUES (3604, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/delUserInfoByUserId', '【系统管理员】删除用户信息', '执行成功！', '[\"87f5f07c-e18d-4766-97e7-9170dc843e98\"]', '2024-06-24 23:22:29');
INSERT INTO `log` VALUES (3605, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 23:22:29');
INSERT INTO `log` VALUES (3606, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/delUserInfoByUserId', '【系统管理员】删除用户信息', '执行成功！', '[\"189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e\"]', '2024-06-24 23:22:36');
INSERT INTO `log` VALUES (3607, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 23:22:36');
INSERT INTO `log` VALUES (3608, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/registerUser', '【系统管理员】注册用户信息', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"roleId\":2,\"userName\":\"123456\",\"phone\":\"1\",\"name\":\"测试新用户\",\"email\":\"1\",\"status\":0}]', '2024-06-24 23:23:07');
INSERT INTO `log` VALUES (3609, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 23:23:07');
INSERT INTO `log` VALUES (3610, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:23:14');
INSERT INTO `log` VALUES (3611, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"roleId\":2,\"userName\":\"user\",\"userId\":\"e5fbd029-b4b0-4f12-8679-510ef9695be3\",\"phone\":\"12345678\",\"name\":\"用户\",\"email\":\"1111\",\"status\":1}]', '2024-06-24 23:23:24');
INSERT INTO `log` VALUES (3612, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 23:23:24');
INSERT INTO `log` VALUES (3613, '127.0.0.1', '123456', 'http://127.0.0.1:8091/loginOut', '【测试新用户】退出登录', '执行失败！', '[]', '2024-06-24 23:23:30');
INSERT INTO `log` VALUES (3614, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"ee11cbb19052e40b07aac0ca060c23ee\",\"userName\":\"user\",\"status\":0}]', '2024-06-24 23:23:34');
INSERT INTO `log` VALUES (3615, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 23:23:34');
INSERT INTO `log` VALUES (3616, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/record/getRecord/e5fbd029-b4b0-4f12-8679-510ef9695be3', '【用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:23:35');
INSERT INTO `log` VALUES (3617, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:23:38');
INSERT INTO `log` VALUES (3618, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"554c9e86-e577-4bfb-891d-45fd14723e1a\"]', '2024-06-24 23:23:51');
INSERT INTO `log` VALUES (3619, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:24:00');
INSERT INTO `log` VALUES (3620, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【系统管理员】根据用户ID获取用户信息', '执行成功！', '[\"554c9e86-e577-4bfb-891d-45fd14723e1a\"]', '2024-06-24 23:24:04');
INSERT INTO `log` VALUES (3621, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/modifyUserInfo', '【系统管理员】更新用户基本信息', '执行成功！', '[{\"passWord\":\"b752390a6cad0e04c969691f4061bdd6\",\"roleId\":1,\"userName\":\"maintain\",\"userId\":\"554c9e86-e577-4bfb-891d-45fd14723e1a\",\"phone\":\"12345678\",\"name\":\"维护人员\",\"email\":\"123456789\",\"status\":1}]', '2024-06-24 23:24:21');
INSERT INTO `log` VALUES (3622, '127.0.0.1', 'admin', 'http://127.0.0.1:8091/api/user/getAllUserInfo', '【系统管理员】查询所有用户信息', '执行成功！', '[{\"name\":\"\",\"pageSize\":10,\"currentPage\":1,\"userName\":\"\"}]', '2024-06-24 23:24:21');
INSERT INTO `log` VALUES (3623, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 23:24:28');
INSERT INTO `log` VALUES (3624, '127.0.0.1', 'user', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【用户】根据用户ID获取用户信息', '执行成功！', '[\"e5fbd029-b4b0-4f12-8679-510ef9695be3\"]', '2024-06-24 23:24:29');
INSERT INTO `log` VALUES (3625, '127.0.0.1', 'user', 'http://127.0.0.1:8091/loginOut', '【用户】退出登录', '执行失败！', '[]', '2024-06-24 23:24:30');
INSERT INTO `log` VALUES (3626, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"b752390a6cad0e04c969691f4061bdd6\",\"userName\":\"maintain\",\"status\":0}]', '2024-06-24 23:24:35');
INSERT INTO `log` VALUES (3627, '127.0.0.1', 'maintain', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【维护人员】获取登录用户信息', '执行成功！', '[]', '2024-06-24 23:24:35');
INSERT INTO `log` VALUES (3628, '127.0.0.1', 'maintain', 'http://127.0.0.1:8091/api/user/getUserInfoByUserId', '【维护人员】根据用户ID获取用户信息', '执行成功！', '[\"554c9e86-e577-4bfb-891d-45fd14723e1a\"]', '2024-06-24 23:24:38');
INSERT INTO `log` VALUES (3629, '127.0.0.1', 'maintain', 'http://127.0.0.1:8091/loginOut', '【维护人员】退出登录', '执行失败！', '[]', '2024-06-24 23:24:42');
INSERT INTO `log` VALUES (3630, '127.0.0.1', '非用户调用', 'http://127.0.0.1:8091/login', '【非用户调用】用户登录', '执行成功！', '[{\"passWord\":\"e10adc3949ba59abbe56e057f20f883e\",\"userName\":\"123456\",\"status\":0}]', '2024-06-24 23:24:48');
INSERT INTO `log` VALUES (3631, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/user/getInfoByReact', '【测试新用户】获取登录用户信息', '执行成功！', '[]', '2024-06-24 23:24:48');
INSERT INTO `log` VALUES (3632, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/getRecord/5f274808-7b32-4859-a8b7-9f114f42a923', '【测试新用户】查询个人的实验记录', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"5f274808-7b32-4859-a8b7-9f114f42a923\"]', '2024-06-24 23:24:49');
INSERT INTO `log` VALUES (3633, '127.0.0.1', '123456', 'http://127.0.0.1:8091/api/record/listRecordByUserId/5f274808-7b32-4859-a8b7-9f114f42a923', '【测试新用户】查询用户的的实验记录详情', '执行成功！', '[{\"pageSize\":10,\"currentPage\":1},\"5f274808-7b32-4859-a8b7-9f114f42a923\"]', '2024-06-24 23:24:58');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'AccountManagement', '账号管理', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (2, 'other', '其他', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (3, 'user', '个人中心', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (4, 'MyProject', '我的项目', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (5, 'MyProduct', '供货列表', NULL, NULL, NULL, NULL);
INSERT INTO `permission` VALUES (6, 'Management', '维护权限', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1803358700899889155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '实验记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, '已完成', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', '实验一', '2024-06-17 13:22:27', '2024-05-30 11:01:42', '2024-06-17 13:22:26', 0);
INSERT INTO `record` VALUES (1796162840143466497, '已完成', '1888dee2-c173-48e0-ac2c-e5a043dec7d4', '实验二', '2024-06-17 09:47:33', '2024-05-30 20:52:46', '2024-06-18 16:15:19', 0);
INSERT INTO `record` VALUES (1801488063201726466, '待完成', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', '实验三', NULL, '2024-05-30 11:01:42', '2024-06-24 23:21:58', 0);
INSERT INTO `record` VALUES (1802918888518692865, '已完成', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', '测试', '2024-06-19 11:13:37', '2024-06-18 12:18:54', '2024-06-19 11:13:43', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1802973288905814018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '样本类型表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1803358800799821827 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '土壤样本表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of soil_sample
-- ----------------------------
INSERT INTO `soil_sample` VALUES (1796162840185409538, '土壤样本一', 1797499575100112897, 1, '棕色', '土腥味', '植物根系', '中/较软', 2.39, 7.03, '中', '中', '高', '中', '2024-06-06 15:28:41', '2024-06-07 09:38:07', 0);
INSERT INTO `soil_sample` VALUES (1796162840185409539, '土壤样本二', 1797568827433848833, 1, '棕色', '土腥味', '树根系', '软/低', 4.27, 5.34, '高', '大', '中', '高', '2024-06-06 15:28:41', '2024-06-07 13:19:06', 0);
INSERT INTO `soil_sample` VALUES (1796162840185409540, '土壤样本三', 1797499575100112897, 1796162840143466497, '棕色', '土腥味', '植物根系', '中/较软', 2.39, 7.03, '中', '中', '高', '中', '2024-06-07 16:18:03', '2024-06-07 16:17:20', 0);
INSERT INTO `soil_sample` VALUES (1801496589299011585, '土壤2004', 1797568827433848833, 1801496132535111681, '黑', '无', '昆虫', '松', 5.00, 10.00, '一般', '40', '一般', '高', '2024-06-14 14:07:11', '2024-06-14 14:07:51', 0);
INSERT INTO `soil_sample` VALUES (1803264845621981186, '实验1', 1797499575100112897, 1802918888518692865, '灰', '无色', '树根系', '大', 12.00, 12.00, '大', '中', '小', '高', '2024-06-19 11:13:36', '2024-06-19 11:13:42', 0);

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
  `status` int(4) NULL DEFAULT NULL COMMENT '0禁用 1正常 2备用',
  `created_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1888dee2-c173-48e0-ac2c-e5a043dec7d4', 'admin', '系统管理员', 'e6009df49d3ce361dbc2fa7788c6f0a4', '562eef70-9f78-4736-ae26-8c6b82907241', '12345678', '12345678', 1, '2024-03-06 16:03:25');
INSERT INTO `user_info` VALUES ('554c9e86-e577-4bfb-891d-45fd14723e1a', 'maintain', '维护人员', 'a7fd42edf6465876d0a3411d50393297', 'ddc4ff59-1eb1-4cc0-bf2e-b783dc294d82', '12345678', '123456789', 1, '2024-06-06 12:37:57');
INSERT INTO `user_info` VALUES ('5f274808-7b32-4859-a8b7-9f114f42a923', '123456', '测试新用户', 'c58f4ba022f0a10fa6d2148799ca8d18', '0b12961c-150f-4a6d-9f8f-585e7274eb62', '1', '1', 1, '2024-06-24 23:23:07');
INSERT INTO `user_info` VALUES ('e5fbd029-b4b0-4f12-8679-510ef9695be3', 'user', '用户', '194f31be69b9081bdfdaaeff823c88ad', '093b0de8-9116-418b-a44a-80ba2cfc664a', '12345678', '1111', 1, '2024-06-06 12:38:35');

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
INSERT INTO `user_role` VALUES ('7136c0c5-9d27-49ad-886f-c75e38e8e6d7', '5f274808-7b32-4859-a8b7-9f114f42a923', 2);
INSERT INTO `user_role` VALUES ('cf7fc751-6b29-4932-acfb-942b433b53ef', 'e5fbd029-b4b0-4f12-8679-510ef9695be3', 2);

SET FOREIGN_KEY_CHECKS = 1;
