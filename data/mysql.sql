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
  `book_id` tinyint NOT NULL AUTO_INCREMENT COMMENT '书籍ID',
  `title` varchar(255) NOT NULL COMMENT '书名',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `publisher` varchar(100) DEFAULT NULL COMMENT '出版社',
  `publish_date` date DEFAULT NULL COMMENT '出版日期',
  `category` varchar(50) DEFAULT NULL COMMENT '分类',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存数量',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `uk_book_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图书表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (73,'红楼梦','曹雪芹','中华书局','1791-01-01','文学',29,'2025-03-25 16:28:12'),(74,'三国演义','罗贯中','人民文学出版社','1522-01-01','文学',23,'2025-03-25 16:28:12'),(75,'西游记','吴承恩','中华书局','1592-01-01','文学',20,'2025-03-25 16:28:12'),(76,'水浒传','施耐庵','人民文学出版社','1589-01-01','文学',18,'2025-03-25 16:28:12'),(77,'百年孤独','加西亚·马尔克斯','南海出版公司','1967-06-01','文学',15,'2025-03-25 16:28:12'),(78,'追风筝的人','卡勒德·胡赛尼','上海人民出版社','2003-05-01','文学',22,'2025-03-25 16:28:12'),(79,'小王子','安托万·德·圣-埃克苏佩里','人民文学出版社','1943-04-01','文学',35,'2025-03-25 16:28:12'),(80,'哈利·波特与魔法石','J.K. 罗琳','人民文学出版社','1997-06-01','文学',28,'2025-03-25 16:28:12'),(81,'傲慢与偏见','简·奥斯汀','译林出版社','1813-01-01','文学',12,'2025-03-25 16:28:12'),(82,'悲惨世界','维克多·雨果','译林出版社','1862-04-01','文学',10,'2025-03-25 16:28:12'),(83,'全球通史','斯塔夫里阿诺斯','北京大学出版社','2006-05-01','历史',15,'2025-03-25 16:28:12'),(84,'人类简史','尤瓦尔·赫拉利','中信出版社','2014-10-01','历史',18,'2025-03-25 16:28:12'),(85,'明朝那些事儿','当年明月','中国友谊出版公司','2006-01-01','历史',20,'2025-03-25 16:28:12'),(86,'万历十五年','黄仁宇','中华书局','1982-06-01','历史',13,'2025-03-25 16:28:12'),(87,'大秦帝国','孙皓晖','作家出版社','2001-08-01','历史',11,'2025-03-25 16:28:12'),(88,'资本论','卡尔·马克思','人民出版社','1867-09-01','经济',10,'2025-03-25 16:28:12'),(89,'国富论','亚当·斯密','商务印书馆','1776-01-01','经济',8,'2025-03-25 16:28:12'),(90,'穷爸爸富爸爸','罗伯特·清崎','四川人民出版社','1997-04-01','经济',30,'2025-03-25 16:28:12'),(91,'经济学原理','曼昆','机械工业出版社','1998-07-01','经济',22,'2025-03-25 16:28:12'),(92,'苏菲的世界','乔斯坦·贾德','作家出版社','1991-12-01','哲学',12,'2025-03-25 16:28:12'),(93,'沉思录','马可·奥勒留','中华书局','0180-01-01','哲学',14,'2025-03-25 16:28:12'),(94,'道德经','老子','中华书局',NULL,'哲学',25,'2025-03-25 16:28:12'),(95,'存在与时间','马丁·海德格尔','商务印书馆','1927-01-01','哲学',10,'2025-03-25 16:28:12'),(96,'时间简史','史蒂芬·霍金','湖南科学技术出版社','1988-04-01','科学',19,'2025-03-25 16:28:12'),(97,'宇宙的结构','布赖恩·格林','湖南科学技术出版社','2003-07-01','科学',15,'2025-03-25 16:28:12'),(98,'万物简史','比尔·布莱森','接力出版社','2003-05-01','科学',17,'2025-03-25 16:28:12'),(99,'自私的基因','理查德·道金斯','译林出版社','1976-01-01','科学',13,'2025-03-25 16:28:12'),(100,'乌合之众','古斯塔夫·勒庞','中央编译出版社','1895-01-01','心理学',12,'2025-03-25 16:28:12'),(101,'影响力','罗伯特·西奥迪尼','中国财政经济出版社','1984-01-01','心理学',20,'2025-03-25 16:28:12'),(102,'社会性动物','艾略特·阿伦森','华东师范大学出版社','1972-01-01','心理学',18,'2025-03-25 16:28:12'),(103,'乔布斯传','沃尔特·艾萨克森','中信出版社','2011-10-01','传记',25,'2025-03-25 16:28:12'),(104,'巴菲特之道','罗伯特·哈格斯特朗','机械工业出版社','1994-07-01','传记',20,'2025-03-25 16:28:12'),(105,'拿破仑传','埃米尔·路德维希','译林出版社','1927-01-01','传记',12,'2025-03-25 16:28:12'),(106,'艺术的故事','贡布里希','广西美术出版社','1950-07-01','艺术',10,'2025-03-25 16:28:12'),(107,'西方美学史','朱光潜','商务印书馆','1985-01-01','艺术',15,'2025-03-25 16:28:12'),(108,'摄影的艺术','安塞尔·亚当斯','人民美术出版社','1983-06-01','艺术',18,'2025-03-25 16:28:12');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_record`
--

DROP TABLE IF EXISTS `borrow_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '借阅用户ID',
  `book_id` bigint NOT NULL COMMENT '图书ID',
  `borrow_time` datetime NOT NULL COMMENT '借阅时间',
  `expect_return_time` datetime NOT NULL COMMENT '应归还时间',
  `actual_return_time` datetime DEFAULT NULL COMMENT '实际归还时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '借阅状态(1:进行中 2:已归还 3:逾期)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记(0:正常 1:删除)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图书借阅记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_record`
--

LOCK TABLES `borrow_record` WRITE;
/*!40000 ALTER TABLE `borrow_record` DISABLE KEYS */;
INSERT INTO `borrow_record` VALUES (1,'e5fbd029-b4b0-4f12-8679-510ef9695be3',74,'2025-03-24 00:00:00','2025-03-27 00:00:00',NULL,1,'2025-03-26 00:33:13','2025-03-26 00:33:13',0),(2,'e5fbd029-b4b0-4f12-8679-510ef9695be3',73,'2025-03-26 00:00:00','2025-03-30 00:00:00',NULL,1,'2025-03-26 00:34:17','2025-03-26 00:34:17',0);
/*!40000 ALTER TABLE `borrow_record` ENABLE KEYS */;
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

-- Dump completed on 2025-03-26  0:37:22
