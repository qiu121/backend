-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: experiment_admin
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alarm_info`
--

DROP TABLE IF EXISTS `alarm_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm_info` (
  `alarm_id` int NOT NULL COMMENT '报警信息接收配置表',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '报警模块',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人姓名',
  `alarm_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '报警邮箱',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`alarm_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm_info`
--

LOCK TABLES `alarm_info` WRITE;
/*!40000 ALTER TABLE `alarm_info` DISABLE KEYS */;
INSERT INTO `alarm_info` VALUES (1,'ALL','测试人员','503297590@qq.com','START','2024-05-24 12:35:45','2024-05-24 12:35:48');
/*!40000 ALTER TABLE `alarm_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '书籍ID',
  `title` varchar(255) NOT NULL COMMENT '书名',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `publisher` varchar(100) DEFAULT NULL COMMENT '出版社',
  `publish_year` year DEFAULT NULL COMMENT '出版年份',
  `category` varchar(50) DEFAULT NULL COMMENT '分类',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存数量',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图书表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'三体','刘慈欣','重庆出版社',2008,'科幻',10,'2025-03-20 15:24:49'),(2,'流浪地球','刘慈欣','重庆出版社',2000,'科幻',8,'2025-03-20 15:24:49'),(3,'基地','艾萨克·阿西莫夫','上海译文出版社',1951,'科幻',6,'2025-03-20 15:24:49'),(4,'沙丘','弗兰克·赫伯特','重庆出版社',1965,'科幻',7,'2025-03-20 15:24:49'),(5,'海伯利安','丹·西蒙斯','江苏凤凰文艺出版社',1989,'科幻',5,'2025-03-20 15:24:49'),(6,'安德的游戏','奥森·斯科特·卡德','人民邮电出版社',1985,'科幻',6,'2025-03-20 15:24:49'),(7,'环形世界','拉里·尼文','重庆出版社',1970,'科幻',4,'2025-03-20 15:24:49'),(8,'时间回旋','罗伯特·查尔斯·威尔森','四川科学技术出版社',2001,'科幻',3,'2025-03-20 15:24:49'),(9,'活着','余华','作家出版社',1993,'文学',5,'2025-03-20 15:24:49'),(10,'白夜行','东野圭吾','南海出版公司',1999,'文学',6,'2025-03-20 15:24:49'),(11,'解忧杂货店','东野圭吾','南海出版公司',2012,'文学',8,'2025-03-20 15:24:49'),(12,'百年孤独','加西亚·马尔克斯','南海出版公司',1967,'文学',9,'2025-03-20 15:24:49'),(13,'平凡的世界','路遥','人民文学出版社',1986,'文学',7,'2025-03-20 15:24:49'),(14,'嫌疑人X的献身','东野圭吾','南海出版公司',2005,'文学',5,'2025-03-20 15:24:49'),(15,'追风筝的人','卡勒德·胡赛尼','上海人民出版社',2003,'文学',4,'2025-03-20 15:24:49'),(16,'时间简史','史蒂芬·霍金','湖南科技出版社',1988,'科普',7,'2025-03-20 15:24:49'),(17,'宇宙简史','斯蒂芬·霍金','湖南科技出版社',2005,'科普',6,'2025-03-20 15:24:49'),(18,'从一到无穷大','乔治·伽莫夫','湖南科技出版社',1947,'科普',5,'2025-03-20 15:24:49'),(19,'自私的基因','理查德·道金斯','商务印书馆',1976,'科普',7,'2025-03-20 15:24:49'),(20,'物理世界奇遇记','乔治·伽莫夫','科学出版社',1960,'科普',4,'2025-03-20 15:24:49'),(21,'费曼物理学讲义','理查德·费曼','上海科技出版社',1964,'科普',6,'2025-03-20 15:24:49'),(22,'Java核心技术 卷I','Cay S. Horstmann','机械工业出版社',2018,'计算机',10,'2025-03-20 15:24:49'),(23,'Python编程：从入门到实践','Eric Matthes','人民邮电出版社',2016,'计算机',8,'2025-03-20 15:24:49'),(24,'算法导论','Thomas H. Cormen','机械工业出版社',2009,'计算机',7,'2025-03-20 15:24:49'),(25,'代码大全','Steve McConnell','电子工业出版社',2004,'计算机',5,'2025-03-20 15:24:49'),(26,'深入理解计算机系统','Randal E. Bryant','机械工业出版社',2015,'计算机',4,'2025-03-20 15:24:49'),(27,'计算机程序的构造和解释','Harold Abelson','机械工业出版社',1996,'计算机',3,'2025-03-20 15:24:49'),(28,'国富论','亚当·斯密','商务印书馆',1937,'经济',5,'2025-03-20 15:24:49'),(29,'资本主义与自由','米尔顿·弗里德曼','商务印书馆',1962,'经济',4,'2025-03-20 15:24:49'),(30,'穷爸爸富爸爸','罗伯特·清崎','机械工业出版社',1997,'经济',6,'2025-03-20 15:24:49'),(31,'福尔摩斯探案集','阿瑟·柯南·道尔','人民文学出版社',1902,'推理',5,'2025-03-20 15:24:49'),(32,'无人生还','阿加莎·克里斯蒂','人民文学出版社',1939,'推理',6,'2025-03-20 15:24:49'),(33,'人类简史','尤瓦尔·赫拉利','中信出版社',2011,'历史',5,'2025-03-20 15:24:49'),(34,'全球通史','斯塔夫里阿诺斯','北京大学出版社',1970,'历史',4,'2025-03-20 15:24:49'),(35,'乌合之众','古斯塔夫·勒庞','中央编译出版社',1920,'心理学',5,'2025-03-20 15:24:49'),(36,'学会提问','M. Neil Browne','机械工业出版社',2004,'教育',5,'2025-03-20 15:24:49'),(37,'苏菲的世界','乔斯坦·贾德','作家出版社',1991,'哲学',5,'2025-03-20 15:24:49'),(38,'艺术的故事','E.H.贡布里希','广西美术出版社',1950,'艺术',4,'2025-03-20 15:24:49'),(39,'医学的温度','张文宏','上海科技出版社',2021,'医学',5,'2025-03-20 15:24:49'),(40,'高效能人士的七个习惯','史蒂芬·柯维','中国青年出版社',1989,'管理',5,'2025-03-20 15:24:49'),(41,'深度学习','Ian Goodfellow','人民邮电出版社',2016,'技术',5,'2025-03-20 15:24:49');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info` (
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件表',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称',
  `common_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属id',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属模块',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT COMMENT '功能权限表',
  `permission_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能Code',
  `permission_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能名称',
  `permission_ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `action_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'AccountManagement','账号管理',NULL,NULL,NULL,NULL),(2,'other','其他',NULL,NULL,NULL,NULL),(3,'user','个人中心',NULL,NULL,NULL,NULL),(4,'MyProject','我的项目',NULL,NULL,NULL,NULL),(5,'MyProduct','供货列表',NULL,NULL,NULL,NULL),(6,'Management','维护权限',NULL,NULL,NULL,NULL),(7,'Book','图书列表',NULL,NULL,NULL,NULL),(8,'MyBorrow','我的借阅',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_action`
--

DROP TABLE IF EXISTS `permission_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_action` (
  `action_id` int NOT NULL AUTO_INCREMENT COMMENT '功能详情表',
  `permission_id` int NOT NULL COMMENT '功能表id',
  `action_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方法code',
  `default_check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `describes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名字',
  PRIMARY KEY (`action_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_action`
--

LOCK TABLES `permission_action` WRITE;
/*!40000 ALTER TABLE `permission_action` DISABLE KEYS */;
INSERT INTO `permission_action` VALUES (43,1,'add','false','添加'),(44,1,'get','false','详情'),(45,1,'export','false','导出'),(46,1,'del','false','删除'),(47,2,'add','false','添加'),(48,2,'get','false','详情'),(49,2,'export','false','导出'),(50,2,'del','false','删除'),(51,3,'add','false','添加'),(52,3,'add','false','添加'),(53,3,'get','false','详情'),(54,3,'export','false','导出'),(55,3,'del','false','删除'),(56,4,'del','false','删除'),(57,4,'export','false','导出'),(58,4,'get','false','详情'),(59,4,'add','false','添加'),(60,5,'add','false','添加'),(61,5,'get','false','详情'),(62,5,'export','false','导出'),(63,5,'del','false','删除'),(64,6,'add','false','添加'),(65,6,'get','false','详情'),(66,6,'export','false','导出'),(67,6,'del','false','删除');
/*!40000 ALTER TABLE `permission_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '待完成' COMMENT '数据状态(草稿、未提交、已提交)',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `record_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '实验记录名称',
  `submit_time` datetime DEFAULT NULL COMMENT '记录提交时间(初始化为空)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除(0-未删, 1-已删)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1802973639771926530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='实验记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,'已完成','e5fbd029-b4b0-4f12-8679-510ef9695be3','实验一','2024-06-17 13:22:27','2024-05-30 11:01:42','2024-06-17 13:22:26',0),(1796162840143466497,'已完成','1888dee2-c173-48e0-ac2c-e5a043dec7d4','实验二','2024-06-17 09:47:33','2024-05-30 20:52:46','2024-06-18 16:15:19',0),(1801488063201726466,'已完成','e5fbd029-b4b0-4f12-8679-510ef9695be3','实验三','2024-06-17 09:47:12','2024-05-30 11:01:42','2024-06-18 14:48:09',0),(1802918888518692865,'已完成','e5fbd029-b4b0-4f12-8679-510ef9695be3','测试','2024-06-18 16:51:55','2024-06-18 12:18:54','2024-06-18 16:52:08',0);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'admin','系统管理员'),(1,'maintain','维护人员'),(2,'user','用户');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_permission_id` int NOT NULL AUTO_INCREMENT COMMENT '权限功能表',
  `permission_id` int NOT NULL COMMENT '功能ID',
  `role_id` int NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (43,1,0),(44,2,0),(45,3,0),(46,2,1),(47,3,1),(48,6,1),(49,3,2),(50,4,2),(51,5,2),(52,7,2),(53,7,1),(54,7,0),(55,8,2);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_type`
--

DROP TABLE IF EXISTS `sample_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sample_type_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除(0-未删, 1-已删)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_type_name` (`sample_type_name`) USING BTREE COMMENT '唯一样本类型'
) ENGINE=InnoDB AUTO_INCREMENT=1802873775411138562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='样本类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_type`
--

LOCK TABLES `sample_type` WRITE;
/*!40000 ALTER TABLE `sample_type` DISABLE KEYS */;
INSERT INTO `sample_type` VALUES (1797499575100112897,'草地','2024-06-03 13:24:29','2024-06-03 20:36:30',0),(1797568827433848833,'林地','2024-06-03 17:59:40','2024-06-03 20:36:41',0),(1801059724293038082,'砂土','2024-06-13 09:11:15','2024-06-13 09:11:15',0),(1801495063151169537,'空气','2024-06-14 14:01:07','2024-06-14 14:01:40',0);
/*!40000 ALTER TABLE `sample_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soil_sample`
--

DROP TABLE IF EXISTS `soil_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soil_sample` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sample_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '样本名称',
  `sample_type_id` bigint NOT NULL COMMENT '样本类型id',
  `record_id` bigint NOT NULL COMMENT '记录id',
  `color` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '颜色',
  `smell` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '气味',
  `organism` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '生物种类',
  `hardness` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '颗粒硬度',
  `size_gt2mm` decimal(5,2) NOT NULL COMMENT '颗粒大小>2mm',
  `size_lt2mm` decimal(5,2) NOT NULL COMMENT '颗粒大小<2mm',
  `viscosity` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '黏度',
  `humidity` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '湿度',
  `density` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '紧实度',
  `water_retention` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '保水性',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除(0-未删, 1-已删)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_record_id` (`record_id`) USING BTREE COMMENT '实验记录id',
  KEY `idx_sample_type_id` (`sample_type_id`) USING BTREE COMMENT '样本类型id'
) ENGINE=InnoDB AUTO_INCREMENT=1802987592434532354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='土壤样本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil_sample`
--

LOCK TABLES `soil_sample` WRITE;
/*!40000 ALTER TABLE `soil_sample` DISABLE KEYS */;
INSERT INTO `soil_sample` VALUES (1796162840185409538,'土壤样本一',1797499575100112897,1,'棕色','土腥味','植物根系','中/较软',2.39,7.03,'中','中','高','中','2024-06-06 15:28:41','2024-06-07 09:38:07',0),(1796162840185409539,'土壤样本二',1797568827433848833,1,'棕色','土腥味','树根系','软/低',4.27,5.34,'高','大','中','高','2024-06-06 15:28:41','2024-06-07 13:19:06',0),(1796162840185409540,'土壤样本三',1797499575100112897,1796162840143466497,'棕色','土腥味','植物根系','中/较软',2.39,7.03,'中','中','高','中','2024-06-07 16:18:03','2024-06-07 16:17:20',0),(1801496589299011585,'土壤2004',1797568827433848833,1801496132535111681,'黑','无','昆虫','松',5.00,10.00,'一般','40','一般','高','2024-06-14 14:07:11','2024-06-14 14:07:51',0),(1802002236214005762,'909',1801495063151169537,1801488063201726466,'2','2','2','2',0.10,1.00,'11','111','11','22','2024-06-15 23:36:27','2024-06-18 14:48:09',0),(1802987592434532353,'12122222',1797568827433848833,1802918888518692865,'1212','12','12','12',12.00,12.00,'12','12','12','121','2024-06-18 16:51:54','2024-06-18 16:52:08',0);
/*!40000 ALTER TABLE `soil_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('1888dee2-c173-48e0-ac2c-e5a043dec7d4','admin','系统管理员','e6009df49d3ce361dbc2fa7788c6f0a4','562eef70-9f78-4736-ae26-8c6b82907241','12345678','12345678',1,'2024-03-06 16:03:25'),('189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e','shanghai123','123','97446b776d94c3b907c59bbc224e5a30','40f9c810-15a9-40cf-a604-68bd219ac15e','123456','123456',1,'2024-06-14 14:02:48'),('554c9e86-e577-4bfb-891d-45fd14723e1a','maintain','维护人员','ccdf5ef6227ca812583fd8b58e8e29de','450fba82-a565-47f2-a2c5-26d3f6ebb13a','12345678','123456789',1,'2024-06-06 12:37:57'),('e5fbd029-b4b0-4f12-8679-510ef9695be3','user','用户','17d5e423900efcd06d1997eca49642a5','2a874930-a0d0-4fe3-9772-a1e1ebf02656','12345678','1111',1,'2024-06-06 12:38:35');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('1','1888dee2-c173-48e0-ac2c-e5a043dec7d4',0),('2f9684b0-ff99-4c2d-b5b1-631230b9bcaa','554c9e86-e577-4bfb-891d-45fd14723e1a',1),('cf7fc751-6b29-4932-acfb-942b433b53ef','e5fbd029-b4b0-4f12-8679-510ef9695be3',2),('e082fe57-3a53-4c66-9603-fbc3958763bd','189f4fa2-9d1c-456b-83d4-0b4f6c89ba1e',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-21  0:21:31
