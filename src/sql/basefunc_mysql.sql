-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: basefunc
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group` (
  `GROUP_ID` varchar(32) NOT NULL COMMENT '组ID',
  `GROUP_NAME` varchar(100) NOT NULL COMMENT '组名',
  `GROUP_NO` varchar(10) DEFAULT NULL COMMENT '组编号',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group`
--

LOCK TABLES `sys_group` WRITE;
/*!40000 ALTER TABLE `sys_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `MENU_ID` varchar(32) NOT NULL COMMENT 'ID、主键',
  `MENU_NAME` varchar(100) NOT NULL COMMENT '菜单名',
  `MENU_URL` varchar(100) DEFAULT NULL COMMENT '菜单对应的URL',
  `PARENT_MENU_ID` varchar(32) DEFAULT NULL COMMENT '父菜单',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('21E4F72B9D274510AB219C33D792A4C4','用户管理','/page/sysuser','65E16E3E1EFC484A8CBD2AD77D8D3F92',NULL),('3D7C1106526F457BBB8B15E72478E983','角色管理','/page/sysrole','65E16E3E1EFC484A8CBD2AD77D8D3F92',NULL),('65E16E3E1EFC484A8CBD2AD77D8D3F92','系统管理','','',NULL),('6E62020D770346F08A4287FF205EEB8F','机构管理','/page/sysgroup','65E16E3E1EFC484A8CBD2AD77D8D3F92',NULL),('8C95B11FF4C042DDB3AF2C467B593295','修改密码','/page/syspasswd','65E16E3E1EFC484A8CBD2AD77D8D3F92',NULL),('A57EF00DD8934819AE2311DC88B622C1','菜单管理','/page/sysmenu','65E16E3E1EFC484A8CBD2AD77D8D3F92',NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT 'ID、主键',
  `ROLE_NAME` varchar(50) DEFAULT NULL COMMENT '角色名',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('root','超级管理员','具有全部权限',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `ID` varchar(32) NOT NULL COMMENT '主键',
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '角色ID，对应角色表',
  `MENU_ID` varchar(32) DEFAULT NULL COMMENT '菜单ID，对应菜单表',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('1C95B11FF4C042ADB3AF2C467B593296','root','A57EF00DD8934819AE2311DC88B622C1'),('2C95B11FF4C042BDB3AF2C467B593297','root','3D7C1106526F457BBB8B15E72478E983'),('3C95B11FF4C042CDB3AF2C467B593298','root','21E4F72B9D274510AB219C33D792A4C4'),('4C95B11FF4C042EDB3AF2C467B593299','root','6E62020D770346F08A4287FF205EEB8F'),('5C95B11FF4C042FDB3AF2C467B593290','root','8C95B11FF4C042DDB3AF2C467B593295'),('6C95B11F4C042FDB3AF2C467B5932913','root','65E16E3E1EFC484A8CBD2AD77D8D3F92');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(32) NOT NULL COMMENT 'ID、主键',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '用户名、登录名',
  `PASSWORD` varchar(40) DEFAULT NULL COMMENT '密码（MD5存储）',
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `ROLE_ID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `GROUP_ID` varchar(32) DEFAULT NULL COMMENT '组ID（可作为部门标识）',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('21E4F72B9D274510AB219C33D792B4C5','admin','202cb962ac59075b964b07152d234b70','admin','root',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'basefunc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-13 17:17:14
