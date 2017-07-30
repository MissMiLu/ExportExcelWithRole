-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `AREA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域编码',
  `NAME` varchar(200) NOT NULL COMMENT '区域名称',
  `CREATED` date NOT NULL COMMENT '创建时间',
  `LASTMOD` date DEFAULT NULL COMMENT '最后修改时间',
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT '状态',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `PID` int(11) DEFAULT NULL COMMENT '父项区域编码',
  PRIMARY KEY (`AREA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `ATTACHMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件编码',
  `CREATED` date DEFAULT NULL COMMENT '创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '最后修改时间',
  `STATUS` char(1) DEFAULT 'A' COMMENT '状态',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `NAME` varchar(200) DEFAULT NULL COMMENT '附件名称',
  `PATH` varchar(500) DEFAULT NULL COMMENT '路径',
  `SYSNAME` varchar(500) DEFAULT NULL COMMENT '系统修改后的文件名',
  `TYPE` int(2) DEFAULT NULL COMMENT '附件类型',
  PRIMARY KEY (`ATTACHMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `BRAND_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `CREATED` date DEFAULT NULL COMMENT '创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '最后修改时间',
  `STATUS` char(1) DEFAULT 'A' COMMENT '状态',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='品牌资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'类别','2013-06-27','2013-06-27','A',1,1),(2,'123123','2013-06-27','2013-06-27','A',1,1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bug`
--

DROP TABLE IF EXISTS `bug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug` (
  `BUG_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'bugID',
  `STATUS` char(1) DEFAULT NULL,
  `ATTACHMENT_URL` varchar(300) DEFAULT NULL,
  `BUG_NAME` varchar(300) DEFAULT NULL COMMENT 'bug名称',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '描述',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`BUG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='bug表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (7,'A','123123','123123123','<img alt=\"asdfsadf\" src=\"/erp/attached/2013/06/22/a37176fdce2b4f45b8be294981baff5e.png\" />','2013-06-22 21:51:06',NULL,1,1),(8,'A','123123213','123','<a href=\"/erp/attached/2013/06/22/a54b6ce534cd4664aa0bb005da778d4a.zip\">点击打开链接</a>','2013-06-22 21:56:56','2013-06-22 21:56:56',1,1),(9,'A','2312312','123','12312312<a href=\"/erp/attached/2013/06/22/439f299680164588b7015a89ba3c0535.zip\">点击打开链接</a>','2013-06-22 22:04:27','2013-06-22 22:04:27',1,1),(10,'A','123123123','123123123123','<a href=\"/erp/attached/2013/06/22/eb34f1782a3c4c9c986f8b4675dde299.zip\">压缩文件</a>','2013-06-22 22:09:30',NULL,1,1),(11,'I','123123123','123','<a href=\"/erp/attached/2013/06/22/55ae525c62534253a0f6a7842a737e52.zip\">点击打开链接</a>','2013-06-22 22:13:12','2013-06-22 22:42:58',1,1),(12,'I','312312312','12312','12312312312312<img alt=\"123213123\" src=\"/erp/attached/2013/06/22/e33f8437e8a34065bbe5d4b6f3e04407.png\" />123123123123','2013-06-22 22:14:34','2013-06-22 22:41:49',1,1),(13,'I','123123123','123','<div style=\"TEXT-ALIGN: left\"><a href=\"/erp/attached/2013/06/22/aee25c0d0a384146b19d5101f1d81808.zip\"><img alt=\"nq.jpg\" src=\"/erp2/attached/2013/07/05/c103ad4622494fe6853af2e96168030a.jpg\" />点击打开链接</a></div>','2013-06-22 22:52:56','2013-07-05 13:53:47',1,1),(14,'I','123123','123','<a href=\"/erp/attached/2013/06/22/cabeaf7d7cd041289b0c1994e826047b.xls\">点击打开链接</a>','2013-06-22 22:53:42','2013-08-05 10:09:59',1,1),(15,'I','123123','123','<a href=\"/erp/attached/2013/06/23/4d587e42e0a1428995ab82ec387829d4.rar\">点击打开链接</a>','2013-06-23 17:09:11','2013-08-05 10:10:01',1,1),(16,'I','123','123','<a href=\"/erp/attached/2013/06/23/f709c76a984c4659b609a1edc871109a.zip\">点击打开链接</a>','2013-06-23 18:46:32','2013-08-05 10:10:02',1,1),(17,'I','123123','123','','2013-06-23 18:57:43','2013-06-23 18:58:16',1,1),(18,'I','123123','123','<a href=\"/erp/attached/2013/06/23/daedc61a50b047eaa82600d7907ae93b.zip\">点击打开链接</a>','2013-06-23 18:59:15','2013-08-05 10:10:04',1,1),(19,'I','123123','123','<a href=\"/erp/attached/2013/06/23/73ce2a647af1443caaf17534135f4b03.rar\">Json天气.rar</a>','2013-06-23 19:42:25','2013-08-05 10:10:05',1,1),(20,'A','123','123','<a href=\"/erp/attached/2013/06/23/c427030477cb4f26b8ebd7907763270b.rar\">Json天气.rar</a>','2013-06-23 19:53:01','2013-06-23 19:53:01',1,1),(21,'A','123123123','123','<a href=\"/erp/attached/2013/06/24/e605129cc01842c5bb4aa95e4254f515.rar\">Json天气.rar</a>','2013-06-24 08:40:58','2013-06-24 08:40:58',1,1),(22,'A','test','test','tes','2013-06-24 09:02:10',NULL,1,1),(23,'I','12312','123','<a href=\"/erp/attached/2013/06/24/0e7b2ea75eb741a8beeb709db9dee03a.zip\">srca12306.zip</a>3123123<a href=\"/erp/attached/2013/06/24/f6415de04f6e4c9eb0170742c14cb553.docx\">笔试参考题目3.docx</a>','2013-06-24 09:06:01','2013-08-05 10:09:56',1,1),(24,'A','123123','123123','<a href=\"/erp2/attached/2013/08/02/1e97ac03b99d402eabf344eb9f68186f.zip\">bootstrap-master.zip</a>','2013-07-15 15:49:23','2013-08-02 10:50:26',1,1);
/*!40000 ALTER TABLE `bug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `CITY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVINCE_ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`CITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='城市资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'苏州','2013-06-25','2013-06-25','A',1,1),(2,1,'昆山','2013-06-25','2013-06-25','A',1,1),(3,2,'温州','2013-06-25','2013-06-25','A',1,1),(4,1,'123123123','2013-06-26','2013-06-26','A',1,1),(5,2,'绍兴','2013-06-26','2013-06-26','A',1,1),(6,2,'哈哈哈哈','2013-06-26','2013-06-26','A',1,1),(7,1,'123123123','2013-06-26','2013-06-26','A',1,1),(8,1,'tets','2013-06-26','2013-06-26','A',1,1),(9,1,'222','2013-06-26','2013-06-26','A',1,1),(10,2,'www','2013-06-26','2013-06-26','A',1,1),(11,2,'1121','2013-08-05','2013-08-05','A',1,1),(12,1,'T恤','2017-05-08','2017-05-08','A',1,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_info` (
  `COMPANY_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司自动ID',
  `NAME` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `TEL` varchar(50) DEFAULT NULL COMMENT '公司电话',
  `FAX` varchar(50) DEFAULT NULL COMMENT '公司传真',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `ZIP` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '公司邮件地址',
  `CONTACT` varchar(100) DEFAULT NULL COMMENT '公司联络人',
  `STATUS` char(1) NOT NULL COMMENT '状态',
  `CREATED` date NOT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `MANAGER` varchar(100) DEFAULT NULL COMMENT '公司负责人',
  `BANK` varchar(100) DEFAULT NULL COMMENT '开户行',
  `BANKACCOUNT` varchar(100) DEFAULT NULL COMMENT '银行账号',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='公司资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_info`
--

LOCK TABLES `company_info` WRITE;
/*!40000 ALTER TABLE `company_info` DISABLE KEYS */;
INSERT INTO `company_info` VALUES (1,'ttttttt','t','tttt','t',NULL,'tttt@qq.com','t','I','2013-05-09','2013-06-09',NULL,NULL,NULL,'t',NULL,1),(2,'ghghghghghgh','22','22','22',NULL,'3@2.con','111','I','2013-05-09','2013-06-14',NULL,NULL,NULL,'1111',1,1),(3,'11111111','111','2222','111',NULL,'root@qq.com','111','I','2013-05-09','2013-06-22',NULL,NULL,NULL,'sdfsdf',2,1),(4,'aaaa','sdf','sdf','sdf','sdf','admin@qq.com','123','I','2013-05-09','2013-06-18',NULL,NULL,NULL,'123',1,1),(5,'123','123','123','123',NULL,'123','123','I','2013-06-09','2013-06-18',NULL,NULL,NULL,'123123123123123123123123',NULL,1),(6,'ggggg','123','123123','1231123',NULL,'123','123','I','2013-06-09','2013-06-18',NULL,NULL,NULL,'12312',NULL,1),(7,'123oooooo','123','123','123',NULL,'123','123123','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'23423423423423',NULL,NULL),(8,'斤斤计较','123','123','123',NULL,'123','123','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'123123123',NULL,NULL),(9,'123','123','123','123',NULL,'3123123','123','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'123123123',NULL,NULL),(10,'我的公司','我的公司','111111','我的公司',NULL,'我的公司','我的公司','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'ttttttttt',NULL,1),(11,'123','12312','3123123','12313',NULL,'1231','2312','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'312312312',NULL,NULL),(12,'哈哈哈哈','12312123','123','123',NULL,'123','123123123','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'123123123',NULL,NULL),(13,'kkk11','kkk','kk11','kk123123',NULL,'kkk11','kkk123123','I','2013-06-09','2013-06-14',NULL,NULL,NULL,'kkkk111111',NULL,1),(14,'vvvvv22222','123','123','123',NULL,'13','123','I','2013-06-13','2013-06-14',NULL,NULL,NULL,'13123123123',NULL,1),(15,'rrrrrrrr','3123123','1231231','12312',NULL,'123@qq.com3','3123','I','2013-06-13','2013-06-14',NULL,NULL,NULL,'123123123123 sdfdsfsdfsdfsdfsdf',1,1),(16,'123','123','123','123',NULL,'123','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'13231221313231231212312312',1,1),(17,'12312','3123','123','12312',NULL,'3123','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'12312312312312312312312312312312312312312312',1,1),(18,'12312','3123','12312','3123',NULL,'12312','31231','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'23123121312312324234234',1,1),(19,'123','12312','312','3123',NULL,'123','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'12312312312',1,1),(20,'123','12312','312','312',NULL,'312','312','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'312312312312312312312312',1,1),(21,'12','3123','123','1321313',NULL,'11321','32','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'2312332',1,1),(22,'123','123','123','123',NULL,'123','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'123123123123',1,1),(23,'123','31232','123','13132',NULL,'123','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'123132',1,1),(24,'123','123','123','1231',NULL,'23','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'123123',1,1),(25,'123','123','123','123',NULL,'123','123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'123123',1,1),(26,'123','123','123','123123',NULL,'1231231','23123','I','2013-06-18','2013-06-18',NULL,NULL,NULL,'23123123123123123',1,1),(27,'123','1231','23','1231',NULL,'123','123','I','2013-06-18','2013-06-19',NULL,NULL,NULL,'12312312322222',1,2),(28,'12312','3123','123','1231',NULL,'231','2312','I','2013-06-19','2013-06-19',NULL,NULL,NULL,'312312312323423423',2,1),(29,'123','123','123','123',NULL,'132','123','I','2013-06-19','2013-06-19',NULL,NULL,NULL,'132123123',1,1),(30,'123','123','123','123',NULL,'123','123','I','2013-06-22','2013-07-08',NULL,NULL,NULL,'123123',1,1),(31,'123123','123','123','123','123','123123@qq.com','123','I','2013-06-26','2013-07-08',NULL,NULL,NULL,'123123',1,1),(32,'12312','3123123','12312','1231',NULL,'23123','12312','I','2013-07-08','2013-07-09',NULL,NULL,NULL,'231231233',1,1),(33,'123123','123','123','123',NULL,'123','123','A','2013-08-05','2013-08-05',NULL,NULL,NULL,'123213',1,1);
/*!40000 ALTER TABLE `company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(55) NOT NULL,
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `SIGN` varchar(55) DEFAULT NULL,
  `CODE` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'人民币','2013-06-25','2013-06-25',1,1,'1','1'),(2,'美元','2013-06-25','2013-06-25',1,1,'1','$');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL,
  `MYID` varchar(55) DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT 'A:正常,I:删除',
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFIYER` int(10) DEFAULT NULL COMMENT '修改人',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '客户类型',
  `TEL` varchar(55) DEFAULT NULL,
  `FAX` varchar(55) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `AREA_ID` int(11) DEFAULT NULL COMMENT '区域编码',
  `AREA_NAME` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `PROVINCE_ID` int(11) DEFAULT NULL COMMENT '省份编码',
  `PROVINCE_NAME` varchar(55) DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '城市编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '城市名称',
  `ADDRESS` varchar(1000) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `LEVEL_ID` int(11) DEFAULT NULL COMMENT '客户等级编码',
  `LEVEL_NAME` varchar(200) DEFAULT NULL COMMENT '客户等级名称',
  `PRICE_LEVEL` int(11) DEFAULT NULL COMMENT '价格等级',
  `CONTACT_PERIOD` int(11) DEFAULT NULL COMMENT '联系周期',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '客户来源编码',
  `SOURCE_NAME` varchar(200) DEFAULT NULL COMMENT '客户来源名称',
  `NATURE_ID` int(11) DEFAULT NULL COMMENT '客户公司性质编码',
  `NATURE_NAME` varchar(200) DEFAULT NULL COMMENT '客户公司性质名称',
  `INDUSTRY_ID` int(11) DEFAULT NULL COMMENT '行业编码',
  `INDUSTRY_NAME` varchar(200) DEFAULT NULL COMMENT '行业名称',
  `MAIN_BUSINESS` varchar(1000) DEFAULT NULL COMMENT '主业务业',
  `SIZE_ID` int(11) DEFAULT NULL COMMENT '公司规模编码',
  `SIZE_NAME` varchar(200) DEFAULT NULL COMMENT '公司规模',
  `SETUP_DATE` datetime DEFAULT NULL COMMENT '开业年份',
  `CAPITAL` int(11) DEFAULT NULL COMMENT '注册资金',
  `CORPORATION` varchar(55) DEFAULT NULL COMMENT '法人',
  `CREDIT_ID` int(11) DEFAULT NULL COMMENT '信用编码',
  `CREDIT_NAME` varchar(55) DEFAULT NULL COMMENT '信用名称',
  `BANK` varchar(200) DEFAULT NULL,
  `ACCOUNT` varchar(55) DEFAULT NULL,
  `TAXNO` varchar(100) DEFAULT NULL COMMENT '税号',
  `SHARED` varchar(200) DEFAULT NULL COMMENT '共享人(以逗号分隔)',
  `PID` int(11) DEFAULT NULL COMMENT '客户父项(不用)',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '描述',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售编码',
  `SALE_NAME` varchar(55) DEFAULT NULL COMMENT '销售名称',
  `SALE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '销售组织编码',
  `SALE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '销售组织名称',
  `CUSTOMER_STATUS` char(1) DEFAULT NULL COMMENT '客户状态 T:交易中，S:禁用',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '客户类型名称',
  `EMP_COUNT` int(11) DEFAULT NULL,
  `TAX` int(11) DEFAULT NULL COMMENT '税率',
  `SETUP_ACCOUNT` int(11) DEFAULT NULL COMMENT '立帐方式 1:出库立账,2:开票立帐,3:不立账(不用)',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `TOTAL_SALES` varchar(55) DEFAULT NULL,
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='客户资料';
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL,
  `MYID` varchar(55) DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT 'A:正常,I:删除',
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFIYER` int(10) DEFAULT NULL COMMENT '修改人',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '客户类型',
  `TEL` varchar(55) DEFAULT NULL,
  `FAX` varchar(55) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `AREA_ID` int(11) DEFAULT NULL COMMENT '区域编码',
  `AREA_NAME` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `PROVINCE_ID` int(11) DEFAULT NULL COMMENT '省份编码',
  `PROVINCE_NAME` varchar(55) DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '城市编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '城市名称',
  `ADDRESS` varchar(1000) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `LEVEL_ID` int(11) DEFAULT NULL COMMENT '客户等级编码',
  `LEVEL_NAME` varchar(200) DEFAULT NULL COMMENT '客户等级名称',
  `PRICE_LEVEL` int(11) DEFAULT NULL COMMENT '价格等级',
  `CONTACT_PERIOD` int(11) DEFAULT NULL COMMENT '联系周期',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '客户来源编码',
  `SOURCE_NAME` varchar(200) DEFAULT NULL COMMENT '客户来源名称',
  `NATURE_ID` int(11) DEFAULT NULL COMMENT '客户公司性质编码',
  `NATURE_NAME` varchar(200) DEFAULT NULL COMMENT '客户公司性质名称',
  `INDUSTRY_ID` int(11) DEFAULT NULL COMMENT '行业编码',
  `INDUSTRY_NAME` varchar(200) DEFAULT NULL COMMENT '行业名称',
  `MAIN_BUSINESS` varchar(1000) DEFAULT NULL COMMENT '主业务业',
  `SIZE_ID` int(11) DEFAULT NULL COMMENT '公司规模编码',
  `SIZE_NAME` varchar(200) DEFAULT NULL COMMENT '公司规模',
  `SETUP_DATE` datetime DEFAULT NULL COMMENT '开业年份',
  `CAPITAL` int(11) DEFAULT NULL COMMENT '注册资金',
  `CORPORATION` varchar(55) DEFAULT NULL COMMENT '法人',
  `CREDIT_ID` int(11) DEFAULT NULL COMMENT '信用编码',
  `CREDIT_NAME` varchar(55) DEFAULT NULL COMMENT '信用名称',
  `BANK` varchar(200) DEFAULT NULL,
  `ACCOUNT` varchar(55) DEFAULT NULL,
  `TAXNO` varchar(100) DEFAULT NULL COMMENT '税号',
  `SHARED` varchar(200) DEFAULT NULL COMMENT '共享人(以逗号分隔)',
  `PID` int(11) DEFAULT NULL COMMENT '客户父项(不用)',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '描述',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售编码',
  `SALE_NAME` varchar(55) DEFAULT NULL COMMENT '销售名称',
  `SALE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '销售组织编码',
  `SALE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '销售组织名称',
  `CUSTOMER_STATUS` char(1) DEFAULT NULL COMMENT '客户状态 T:交易中，S:禁用',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '客户类型名称',
  `EMP_COUNT` int(11) DEFAULT NULL,
  `TAX` int(11) DEFAULT NULL COMMENT '税率',
  `SETUP_ACCOUNT` int(11) DEFAULT NULL COMMENT '立帐方式 1:出库立账,2:开票立帐,3:不立账(不用)',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `TOTAL_SALES` varchar(55) DEFAULT NULL,
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='客户资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (21,'test','100001','A','2013-06-26','2013-06-26',1,1,10,'051205555','5011111','www.sina.com','www@163.com',NULL,NULL,NULL,NULL,1,'苏州','',NULL,20,'一般客户',NULL,NULL,NULL,NULL,17,'国有企业',NULL,'','',24,'1-50人',NULL,50000000,'',28,'高','','1111111','',NULL,NULL,NULL,'',24,'ee',NULL,NULL,'T','潜在客户',23,5,NULL,1,'人民币','22','Y'),(22,'12312','3123123','A','2013-06-26','2013-06-26',1,1,10,'123','123','','',NULL,NULL,NULL,NULL,2,'昆山','123',NULL,21,'重要客户',NULL,NULL,NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'123123213',NULL,'','','','',NULL,NULL,NULL,'123',NULL,NULL,NULL,NULL,NULL,'潜在客户',NULL,NULL,NULL,NULL,'','','Y'),(23,'123123123','123123','A','2013-06-26','2013-06-26',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','','Y'),(24,'test','1001','A','2013-06-26','2013-06-26',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'','',NULL,20,'一般客户',NULL,NULL,NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',23,'test',NULL,NULL,'T','',NULL,NULL,NULL,NULL,'','','Y'),(25,'12312','3123123','A','2013-06-26','2013-06-26',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',NULL,'',NULL,NULL,'T','',NULL,NULL,NULL,NULL,'','','Y'),(26,'123','123','A','2013-06-27','2013-07-02',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',NULL,'',NULL,NULL,'T','',NULL,NULL,NULL,NULL,'','','Y');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contact`
--

DROP TABLE IF EXISTS `customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contact` (
  `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户联系人编码',
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '客户类型',
  `NAME` varchar(55) NOT NULL COMMENT '联系人',
  `SEX_ID` int(11) DEFAULT NULL COMMENT '性别编码',
  `CLASS_NAME` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `SEX_NAME` varchar(10) DEFAULT NULL COMMENT '性别名称',
  `ORGANIZATION` varchar(255) DEFAULT NULL COMMENT '部门',
  `DUTY` varchar(255) DEFAULT NULL COMMENT '职务',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话 ',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `FAX` varchar(55) DEFAULT NULL COMMENT '传真',
  `QQ` varchar(25) DEFAULT NULL COMMENT 'QQ',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`CONTACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contact`
--

LOCK TABLES `customer_contact` WRITE;
/*!40000 ALTER TABLE `customer_contact` DISABLE KEYS */;
INSERT INTO `customer_contact` VALUES (3,21,NULL,'eee',NULL,NULL,'M',NULL,'eee','2222','111@163.com',NULL,'eeee','A','2013-06-26','2013-06-26',1,1,NULL,'33','2013-06-26'),(4,22,NULL,'123123',NULL,NULL,'F',NULL,'123','123','123@qq.com',NULL,'1','A','2013-06-26','2013-06-26',1,1,NULL,'23',NULL),(5,25,NULL,'123123',NULL,NULL,'F',NULL,'123','123','123@qq.com',NULL,'123123','A','2013-06-26','2013-06-26',1,1,NULL,'123','2013-06-26'),(6,25,NULL,'432423',NULL,NULL,'M',NULL,'23423','4234','234@qq.com',NULL,'123123123','I','2013-06-26','2013-06-26',1,1,NULL,'123','2013-06-12'),(7,26,NULL,'123123',NULL,NULL,'F',NULL,'123','123','123@qq.com',NULL,'123123','A','2013-06-27','2013-06-27',1,1,NULL,'123','2013-06-10');
/*!40000 ALTER TABLE `customer_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_terms`
--

DROP TABLE IF EXISTS `customer_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_terms` (
  `TERM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商交易编码',
  `STATUS` char(255) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `SUPLIER_ID` int(11) NOT NULL COMMENT '供应商编码',
  `SUPLIER_NAME` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `PAY_PERIOD` char(2) DEFAULT NULL COMMENT '结款周期',
  `PAY_METHOD` char(2) DEFAULT NULL COMMENT '结款方式',
  `PERIOD_DAY` int(11) DEFAULT NULL COMMENT '结款基准日',
  `MIN_AMOUNT` float DEFAULT NULL COMMENT '最小订货金额',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL COMMENT '币别名称',
  `INVOICE_TYPE` int(11) DEFAULT NULL COMMENT '发票类型',
  `INVOICE_FOLLOW` char(1) DEFAULT NULL COMMENT '是否随货带发票',
  `DISCOUNT_NO` int(11) DEFAULT NULL COMMENT '折扣',
  `DELIVER_TYPE` int(11) DEFAULT NULL COMMENT '配送方式',
  `FREIGHT_PAYER` int(11) DEFAULT NULL COMMENT '运费支付方式',
  `SALE_TYPE` int(11) DEFAULT NULL COMMENT '销售方式',
  `TERM_STATUS` char(1) DEFAULT NULL COMMENT '交易状态',
  PRIMARY KEY (`TERM_ID`),
  KEY `FK_SUPLIER_TERMS1` (`SUPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_terms`
--

LOCK TABLES `customer_terms` WRITE;
/*!40000 ALTER TABLE `customer_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry_purchase`
--

DROP TABLE IF EXISTS `enquiry_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiry_purchase` (
  `ENQUIRY_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '询价单编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '询价单自编码',
  `SETUP_DATE` date NOT NULL COMMENT '询价日期',
  `PROJECT_ID` int(11) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `EFFECTIVE_DATE` date DEFAULT NULL COMMENT '有效日期',
  `REQUISITION_DESC` varchar(2000) DEFAULT NULL COMMENT '报价要求',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SOURCE_OBJECT` int(11) DEFAULT NULL COMMENT '来源对像 1:请购单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '对象编码',
  `ENQUIRY_UID` int(11) DEFAULT NULL COMMENT '询价人编码',
  `ENQUIRY_NAME` varchar(55) DEFAULT NULL COMMENT '询价人名称',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `ENQUIRY_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '询价人部门',
  `ENQUIRY_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '询价人部门名称',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `CREATED` date NOT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) NOT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`ENQUIRY_ID`),
  KEY `FK_ENQUIRY_PURCHASE7` (`ENTER_ORGANIZATION_ID`),
  KEY `FK_ENQUIRY_PURCHASE1` (`PROJECT_ID`),
  KEY `FK_ENQUIRY_PURCHASE2` (`ATTACHMENT_ID`),
  KEY `FK_ENQUIRY_PURCHASE3` (`ENQUIRY_UID`),
  KEY `FK_ENQUIRY_PURCHASE4` (`ENQUIRY_ORGANIZATION_ID`),
  KEY `FK_ENQUIRY_PURCHASE5` (`ENTER_ID`),
  KEY `FK_ENQUIRY_PURCHASE6` (`AUDITE_ID`),
  KEY `FK_ENQUIRY_PURCHASE8` (`AUDITE_ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry_purchase`
--

LOCK TABLES `enquiry_purchase` WRITE;
/*!40000 ALTER TABLE `enquiry_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry_purchase_line`
--

DROP TABLE IF EXISTS `enquiry_purchase_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiry_purchase_line` (
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `ENQUIRY_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `SALE_ORDER_ID` int(11) DEFAULT NULL COMMENT '销售订单编码',
  `SALE_ORDER_MYID` varchar(55) DEFAULT NULL COMMENT '销售订单自编码',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售单编码',
  `SALE_MYID` varchar(55) DEFAULT NULL COMMENT '销售单自编码',
  `SALE_CONTRACT_ID` int(11) DEFAULT NULL COMMENT '销售合同编码',
  `SALE_CONTRACT_MYID` varchar(55) DEFAULT NULL COMMENT '销售合同自编码',
  `PLAN_ID` int(11) DEFAULT NULL COMMENT '采购计划编码',
  `PLAN_MYID` varchar(55) DEFAULT NULL COMMENT '采购计划自编码',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ENQUIRY_ID` int(11) DEFAULT NULL COMMENT '询价单编码',
  `ENQUIRY_LID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ENQUIRY_LID`),
  KEY `FK_ENQUIRY_PURCHASE_LINE4` (`ENQUIRY_ID`),
  KEY `FK_ENQUIRY_PURCHASE_LINE1` (`ITEM_ID`),
  KEY `FK_ENQUIRY_PURCHASE_LINE2` (`BRAND_ID`),
  KEY `FK_ENQUIRY_PURCHASE_LINE3` (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='询价明细资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry_purchase_line`
--

LOCK TABLES `enquiry_purchase_line` WRITE;
/*!40000 ALTER TABLE `enquiry_purchase_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry_purchase_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '商品分类',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `SPEC` varchar(255) DEFAULT NULL COMMENT '规格',
  `WEIGHT` double(10,2) unsigned DEFAULT NULL,
  `MAUND` varchar(10) DEFAULT NULL COMMENT '重量单位',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `PACKAGE_UNIT` varchar(55) DEFAULT NULL COMMENT '包装单位',
  `CONVERTS` int(11) DEFAULT NULL COMMENT '转换',
  `OLD_MYID` varchar(55) DEFAULT NULL COMMENT '原系统编码',
  `TAX_NO` int(11) DEFAULT NULL COMMENT '税率',
  `IS_BATCH` char(1) DEFAULT NULL COMMENT 'Y:有批次管理，N:无批次管理',
  `IS_VALID` char(1) DEFAULT NULL COMMENT 'Y:有效期管理，N:无有效期管理',
  `COST` double(18,8) unsigned DEFAULT NULL COMMENT '参考成本',
  `RETAIL_PRICE` double(18,8) unsigned DEFAULT NULL COMMENT '零售价',
  `SALE_PRICE` double(18,8) unsigned DEFAULT NULL COMMENT '销售价',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(55) DEFAULT NULL COMMENT '品牌名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '产地编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '产地名称',
  `QUALITY_PERIOD` varchar(55) DEFAULT NULL COMMENT '保质期',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `BARCODE` varchar(55) DEFAULT NULL,
  `IMAGE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'123123','132123',10,'潜在客户',NULL,NULL,'123','123',NULL,NULL,NULL,NULL,'Y','Y',0.00000000,NULL,NULL,123,'',2,'昆山',NULL,'123123','2013-06-27','2013-06-27','A',1,1,NULL,'123',NULL),(2,'TES','EST',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,'Y','Y',NULL,NULL,NULL,NULL,'',NULL,'',NULL,'','2013-06-27','2013-07-09','I',1,1,NULL,'','<img alt=\"485条码.jpg\" src=\"/erp/attached/2013/06/27/ca425cc8c508474ca7f3f4678e5296cf.jpg\" />'),(3,'123123','123123',NULL,'','',NULL,'','','',NULL,NULL,NULL,'Y','Y',123.00000000,123.00000000,NULL,NULL,'',NULL,'',NULL,'','2013-06-27','2013-07-09','I',1,1,NULL,'','<img src=\"/erp/attached/2013/06/27/3430cd0bb657471a880f9397759a4cd5.png\" alt=\"search.png\" />'),(4,'test','test',10,'潜在客户','',NULL,'','','个',NULL,NULL,NULL,'Y','Y',0.00000000,55.00000000,NULL,NULL,'',NULL,'',NULL,'','2013-07-02','2013-07-02','A',1,1,NULL,'',NULL),(5,'001','花生牛奶001',9,'经销商','',NULL,'','个','个',12,NULL,17,'Y','Y',0.00000000,12.00000000,NULL,NULL,'',NULL,'',NULL,'','2013-07-02','2013-07-02','A',1,1,NULL,'',NULL),(6,'002','花生牛奶002',10,'潜在客户','',NULL,'','个','个',12,NULL,17,'Y','Y',0.00000000,12.00000000,NULL,NULL,'',NULL,'',NULL,'','2013-07-02','2013-07-02','A',1,1,NULL,'',NULL),(7,'003','花生牛奶003',10,'潜在客户','',NULL,'','个','个',12,NULL,17,'Y','Y',23.69000000,12.00000000,NULL,NULL,'',NULL,'',NULL,'','2013-07-02','2013-07-02','A',1,1,NULL,'',NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_class`
--

DROP TABLE IF EXISTS `item_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_class` (
  `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '类型名称',
  `PID` int(11) DEFAULT NULL COMMENT '父分类编码',
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`CLASS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_class`
--

LOCK TABLES `item_class` WRITE;
/*!40000 ALTER TABLE `item_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  `WAREHOUSE_NAME` varchar(100) DEFAULT NULL,
  `LOCATION_MYID` varchar(55) DEFAULT NULL,
  `LOCATION_NAME` varchar(100) DEFAULT NULL,
  `CLASS_ID` int(11) DEFAULT NULL,
  `CLASS_NAME` varchar(55) DEFAULT NULL,
  `LOCATION_STATUS` char(1) DEFAULT NULL,
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志自动生成ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '操作用户ID',
  `NAME` varchar(20) DEFAULT NULL COMMENT '操作用户名称',
  `LOG_DATE` datetime DEFAULT NULL COMMENT '日志生成时间',
  `TYPE` int(10) DEFAULT NULL COMMENT '日志类型: 1：安全日志 2：表示操作日志',
  `MAC` varchar(20) DEFAULT NULL COMMENT '物理地址',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `OBJECT_TYPE` int(1) DEFAULT NULL COMMENT '对象类型 ',
  `OBJECT_ID` varchar(100) DEFAULT NULL COMMENT '操作事件写入权限编码，系统事件写入系统编码',
  `EVENT_NAME` varchar(100) DEFAULT NULL COMMENT '事件名称',
  `EVENT_RECORD` varchar(500) DEFAULT NULL COMMENT '详细描述',
  PRIMARY KEY (`LOG_ID`),
  KEY `FK_LOG1` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1271 DEFAULT CHARSET=utf8 COMMENT='日录资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1220,1,'admin','2013-07-11 09:25:48',1,NULL,NULL,NULL,'dbBackUp-20130711092548.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711092548.sql'),(1221,1,'admin','2013-07-11 09:29:28',1,NULL,NULL,NULL,'dbBackUp-20130711092928.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711092928.sql'),(1222,1,'admin','2013-07-11 09:30:13',1,NULL,NULL,NULL,'dbBackUp-20130711093013.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711093013.sql'),(1223,1,'admin','2013-07-11 10:43:16',1,NULL,NULL,NULL,'dbBackUp-20130711104316.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711104316.sql'),(1224,1,'admin','2013-07-11 10:47:22',1,NULL,NULL,NULL,'dbBackUp-20130711104722.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711104722.sql'),(1225,NULL,'system','2013-07-11 10:58:00',1,NULL,NULL,NULL,'dbBackUp-20130711105800.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711105800.sql'),(1226,1,'admin','2013-07-11 11:11:25',1,NULL,NULL,NULL,NULL,'数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711111125.sql'),(1227,1,'admin','2013-07-11 11:23:15',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'94','update:Permission','更新:com.palmelf.erp.model.Permission'),(1228,1,'admin','2013-07-11 11:23:27',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'94','update:Permission','更新:com.palmelf.erp.model.Permission'),(1229,NULL,'system','2013-07-11 11:27:00',1,'**************','**************',NULL,'dbBackUp-20130711112700.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130711112700.sql'),(1230,1,'admin','2013-07-11 14:22:27',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'3','update:Suplier','更新:com.palmelf.erp.model.Suplier'),(1231,1,'admin','2013-07-11 14:22:27',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'3','update:SuplierContact','更新:com.palmelf.erp.model.SuplierContact'),(1232,1,'admin','2013-07-11 14:25:26',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'22','delete:UserRole','删除:com.palmelf.erp.model.UserRole'),(1233,1,'admin','2013-07-11 14:25:26',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'22','update:UserRole','更新:com.palmelf.erp.model.UserRole'),(1234,1,'admin','2013-07-12 12:14:15',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'86','update:Permission','更新:com.palmelf.erp.model.Permission'),(1235,1,'admin','2013-07-12 12:34:07',1,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'dbBackUp-20130712123407.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130712123407.sql'),(1236,1,'admin','2013-07-12 12:37:19',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'1','update:Project','更新:com.palmelf.erp.model.Project'),(1237,1,'admin','2013-07-12 12:37:19',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'1','update:ProjectFollow','更新:com.palmelf.erp.model.ProjectFollow'),(1238,NULL,'system','2013-07-14 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130714020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130714020200.sql'),(1239,NULL,'system','2013-07-15 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130715020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130715020200.sql'),(1240,1,'admin','2013-07-15 15:49:23',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'24','insert:Bug','插入:com.palmelf.erp.model.Bug'),(1241,1,'admin','2013-07-15 15:49:43',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'24','update:Bug','更新:com.palmelf.erp.model.Bug'),(1242,1,'admin','2013-07-15 15:50:10',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'24','update:Bug','更新:com.palmelf.erp.model.Bug'),(1243,1,'admin','2013-07-17 17:00:28',1,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'dbBackUp-20130717170028.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130717170028.sql'),(1244,NULL,'system','2013-07-18 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130718020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130718020200.sql'),(1245,NULL,'system','2013-07-20 02:02:29',1,'**************','**************',NULL,'dbBackUp-20130720020218.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130720020218.sql'),(1246,NULL,'system','2013-07-21 02:02:20',1,'**************','**************',NULL,'dbBackUp-20130721020202.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130721020202.sql'),(1247,NULL,'system','2013-07-22 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130722020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130722020200.sql'),(1248,NULL,'system','2013-07-26 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130726020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130726020200.sql'),(1249,1,'admin','2013-08-02 09:14:25',1,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'dbBackUp-20130802091425.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130802091425.sql'),(1250,1,'admin','2013-08-02 10:50:26',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'24','update:Bug','更新:com.palmelf.erp.model.Bug'),(1251,NULL,'system','2013-08-03 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130803020200.sql','数据备份','D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130803020200.sql'),(1252,NULL,'system','2013-08-03 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130803020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130803020200.sql'),(1253,NULL,'system','2013-08-04 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130804020200.sql','数据备份','D:\\servers\\TOMCAT\\apache-tomcat-6.0.29\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130804020200.sql'),(1254,NULL,'system','2013-08-04 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130804020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130804020200.sql'),(1255,NULL,'system','2013-08-05 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130805020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130805020200.sql'),(1256,1,'admin','2013-08-05 10:09:30',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'6','update:Permission','更新:com.palmelf.erp.model.Permission'),(1257,1,'admin','2013-08-05 10:09:56',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'23','delete:Bug','删除:com.palmelf.erp.model.Bug'),(1258,1,'admin','2013-08-05 10:09:59',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'14','delete:Bug','删除:com.palmelf.erp.model.Bug'),(1259,1,'admin','2013-08-05 10:10:01',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'15','delete:Bug','删除:com.palmelf.erp.model.Bug'),(1260,1,'admin','2013-08-05 10:10:02',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'16','delete:Bug','删除:com.palmelf.erp.model.Bug'),(1261,1,'admin','2013-08-05 10:10:04',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'18','delete:Bug','删除:com.palmelf.erp.model.Bug'),(1262,1,'admin','2013-08-05 10:10:05',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'19','delete:Bug','删除:com.palmelf.erp.model.Bug'),(1263,1,'admin','2013-08-05 10:12:31',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'11','insert:City','插入:com.palmelf.erp.model.City'),(1264,1,'admin','2013-08-05 10:13:17',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'1','update:Project','更新:com.palmelf.erp.model.Project'),(1265,1,'admin','2013-08-05 10:13:17',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'1','update:ProjectFollow','更新:com.palmelf.erp.model.ProjectFollow'),(1266,1,'admin','2013-08-05 10:15:51',2,'10:78:D2:C7:82:DC','192.168.95.20',NULL,'33','insert:CompanyInfo','插入:com.palmelf.erp.model.CompanyInfo'),(1267,NULL,'system','2013-08-06 02:02:00',1,'**************','**************',NULL,'dbBackUp-20130806020200.sql','数据备份','D:\\server\\apache-tomcat-7.0.41\\webapps\\erp2\\attachment\\dbBackUp\\dbBackUp-20130806020200.sql'),(1268,NULL,'system','2017-05-06 02:02:00',1,'**************','**************',NULL,'dbBackUp-20170506020200.sql','数据备份','C:\\Tomcat\\apache-tomcat-9.0.0.M20\\webapps\\ROOT\\attachment\\dbBackUp\\dbBackUp-20170506020200.sql'),(1269,NULL,'system','2017-05-08 09:27:56',1,'**************','**************',NULL,'dbBackUp-20170508092756.sql','数据备份','C:\\Tomcat\\apache-tomcat-9.0.0.M20\\webapps\\ROOT\\attachment\\dbBackUp\\dbBackUp-20170508092756.sql'),(1270,NULL,'system','2017-05-09 09:28:23',1,'**************','**************',NULL,'dbBackUp-20170509092823.sql','数据备份','C:\\Tomcat\\apache-tomcat-9.0.0.M20\\webapps\\ROOT\\attachment\\dbBackUp\\dbBackUp-20170509092823.sql');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_purchase`
--

DROP TABLE IF EXISTS `order_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_purchase` (
  `ORDER_PURCHASE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MYID` varchar(55) DEFAULT NULL,
  `SETUP_DATE` datetime DEFAULT NULL,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  `SUPLIER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `SUPLIER_NAME` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `SUPLIER_MYID` varchar(55) DEFAULT NULL COMMENT '供应商自编码',
  `PROJECT_ID` int(11) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目自编码',
  `SUPLIER_ADDRESS` varchar(200) DEFAULT NULL,
  `SUPLIER_CONTACT` varchar(55) DEFAULT NULL,
  `SUPLIER_TEL` varchar(55) DEFAULT NULL COMMENT '公司电话',
  `CONTACT_MOBILE` varchar(20) DEFAULT NULL COMMENT '联系人手机',
  `CONTACT_TEL` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_FAX` varchar(20) DEFAULT NULL COMMENT '联系人传真',
  `DELIVERY_MODE` int(11) DEFAULT NULL,
  `DELIVERY_MODE_NAME` varchar(55) DEFAULT NULL,
  `ESTIMATED_DELIVERY` datetime DEFAULT NULL COMMENT '预计交货日期',
  `DELIVERY_ADDRESS` varchar(300) DEFAULT NULL,
  `ORDER_DESC` varchar(1000) DEFAULT NULL,
  `PAY_MODE` int(11) DEFAULT NULL,
  `ISINVOICE` int(2) DEFAULT NULL COMMENT '是否开票 1:是，2:否',
  `BUYER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `BUYER_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名称',
  `BUYER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '供应商组织编码',
  `BUYER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '供应商组织名称',
  `WAREHOUSE_NAME` varchar(200) DEFAULT NULL,
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` datetime DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` datetime DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SOURCE_OBJECT` int(11) DEFAULT NULL COMMENT '来源对像 1:请购单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '对象编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '采购类型',
  `CLASS_NAME` varchar(55) DEFAULT NULL COMMENT '采购单类型名称 system_code',
  `BATCH_ID` int(11) DEFAULT NULL COMMENT '暂时不填',
  `BATCH_NO` varchar(255) DEFAULT NULL COMMENT '批号',
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  `SUPLIER_ORDER_NO` varchar(100) DEFAULT NULL,
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TOTAL_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `ADVANCE_PAYMENT` double(18,8) DEFAULT '0.00000000',
  `CREATED` datetime DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` datetime DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ORDER_STATUS` char(1) DEFAULT NULL,
  `CURRENCY_ID` int(11) DEFAULT NULL,
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ORDER_PURCHASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_purchase`
--

LOCK TABLES `order_purchase` WRITE;
/*!40000 ALTER TABLE `order_purchase` DISABLE KEYS */;
INSERT INTO `order_purchase` VALUES (10,'KS-001','2013-07-25 00:00:00',1,2,'teste','testes',4,'123',NULL,'123123','123',NULL,NULL,NULL,65,'物流公司','2013-07-03 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,1,'总经理室','物流仓',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,'普通采购',1,'','Y','001',37506.86000000,6376.16000000,43883.02000000,120.00000000,'2013-07-03 12:22:50','2013-07-03 14:44:58','A',1,1,NULL,1,'人民币');
/*!40000 ALTER TABLE `order_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_purchase_line`
--

DROP TABLE IF EXISTS `order_purchase_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_purchase_line` (
  `ORDER_PURCHASE_LID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_PURCHASE_ID` int(11) DEFAULT NULL COMMENT '询价单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `ORDER_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` datetime DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` datetime DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `PRICE` double(18,8) DEFAULT '0.00000000',
  `TAX` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX` double(18,8) DEFAULT '0.00000000',
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_NO` int(11) DEFAULT '0',
  `FACT_QTY` int(11) DEFAULT '0',
  `DISCOUNT_NO` double(18,8) DEFAULT '0.00000000',
  PRIMARY KEY (`ORDER_PURCHASE_LID`),
  KEY `FK_ORDER_PURCHASE_LINE` (`ORDER_PURCHASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='询价明细资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_purchase_line`
--

LOCK TABLES `order_purchase_line` WRITE;
/*!40000 ALTER TABLE `order_purchase_line` DISABLE KEYS */;
INSERT INTO `order_purchase_line` VALUES (1,2,NULL,'123123123',NULL,NULL,'12',NULL,NULL,1,NULL,'2013-07-01 00:00:00','2013-07-01 00:00:00','I',1,1,0.00000000,0.00000000,0.00000000,1.00000000,1.00000000,0.00000000,0,0,1.00000000),(2,2,NULL,'1231',NULL,NULL,'12',NULL,NULL,123,NULL,'2013-07-01 00:00:00','2013-07-03 12:19:17','I',1,1,0.00000000,0.00000000,0.00000000,12.00000000,12.00000000,0.00000000,0,0,12.00000000),(3,3,NULL,'123123',NULL,NULL,'12',NULL,NULL,12,NULL,'2013-07-02 00:00:00','2013-07-02 00:00:00','I',1,1,0.00000000,0.00000000,0.00000000,1.00000000,1.00000000,0.00000000,0,0,1.00000000),(4,2,NULL,'12',NULL,NULL,'22',NULL,NULL,2,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:17','I',1,1,0.00000000,0.00000000,0.00000000,23.00000000,22.00000000,0.00000000,0,0,22.00000000),(5,4,NULL,'4123213',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,100.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(6,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,100.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(7,4,NULL,'12312312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(8,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(9,4,NULL,'12412312123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,99999.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(10,4,NULL,'1231243123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(11,4,NULL,'12413',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(12,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(13,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(14,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(15,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(16,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(17,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(18,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(19,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(20,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,0,0.00000000),(21,4,NULL,'12312312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(22,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(23,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(24,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(25,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(26,4,NULL,'12312312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(27,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(28,4,NULL,'124123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(29,4,NULL,'12412312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(30,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(31,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(32,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(33,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(34,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(35,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(36,4,NULL,'12123124',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(37,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(38,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(39,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(40,4,NULL,'412123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(41,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(42,4,NULL,'12412312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,100.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(43,4,NULL,'12312312',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(44,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(45,4,NULL,'1214324234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(46,4,NULL,'123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,100.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(47,4,NULL,'124123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(48,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(49,4,NULL,'123124123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(50,4,NULL,'123123213',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(51,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(52,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,100.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(53,4,NULL,'123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,0.00000000,0.00000000,0.00000000,5.00000000,0.00000000,0.00000000,0,0,0.00000000),(54,4,NULL,'124123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 00:00:00','2013-07-03 12:19:16','I',1,1,3620.00000000,0.00000000,0.00000000,100.00000000,0.00000000,0.00000000,0,0,0.00000000),(55,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-01 08:00:00','2013-07-01 08:00:00','A',1,1,100.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,0,0.00000000),(56,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 09:00:00','2013-07-02 09:00:00','A',1,1,300.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,0,0.00000000),(57,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-07-02 10:00:00','2013-07-02 10:00:00','A',1,1,500.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,0,0.00000000),(58,5,NULL,'001','花生牛奶001',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 15:31:04','2013-07-03 12:19:14','I',1,1,0.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(59,5,NULL,'002','花生牛奶002',NULL,'个',NULL,NULL,2,NULL,'2013-07-02 15:31:04','2013-07-03 12:19:14','I',1,1,89.88999939,NULL,NULL,178.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(60,5,NULL,'003','花生牛奶003',NULL,'个',NULL,NULL,1,NULL,'2013-07-02 15:31:04','2013-07-03 12:19:14','I',1,1,56.00000000,NULL,NULL,56.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(61,6,NULL,'001','花生牛奶001',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:04:24','2013-07-03 12:19:12','I',1,1,12312.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(62,6,NULL,'002','花生牛奶002',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:18:19','2013-07-03 12:19:12','I',1,1,0.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(63,6,NULL,'003','花生牛奶003',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:18:19','2013-07-03 12:19:12','I',1,1,123.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(64,7,NULL,'001','花生牛奶001',NULL,'个',NULL,NULL,2,NULL,'2013-07-02 16:33:21','2013-07-03 12:18:18','I',1,1,56.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(65,7,NULL,'002','花生牛奶002',NULL,'个',NULL,NULL,21,NULL,'2013-07-02 16:33:21','2013-07-03 12:18:18','I',1,1,56.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(66,7,NULL,'003','花生牛奶003',NULL,'个',NULL,NULL,85,NULL,'2013-07-02 16:33:21','2013-07-03 12:18:18','I',1,1,89.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(67,8,NULL,'001','花生牛奶001',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:36:07','2013-07-03 12:18:12','I',1,1,89.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(68,8,NULL,'002','花生牛奶002',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:41:09','2013-07-03 12:18:12','I',1,1,56.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(69,8,NULL,'003','花生牛奶003',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:41:09','2013-07-03 12:18:12','I',1,1,89.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(70,8,NULL,'001','花生牛奶001',NULL,'个',NULL,NULL,25,NULL,'2013-07-02 16:41:09','2013-07-03 12:18:12','I',1,1,89.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(71,8,NULL,'003','花生牛奶003',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:41:09','2013-07-03 12:18:12','I',1,1,89.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(72,8,NULL,'002','花生牛奶002',NULL,'个',NULL,NULL,0,NULL,'2013-07-02 16:41:09','2013-07-03 12:18:12','I',1,1,56.00000000,NULL,NULL,0.00000000,0.00000000,NULL,NULL,NULL,0.00000000),(73,9,7,'003','花生牛奶003',NULL,'个',NULL,NULL,77,NULL,'2013-07-02 16:48:17','2013-07-03 12:18:06','I',1,1,89.36000061,NULL,NULL,0.00000000,0.00000000,NULL,17,NULL,0.00000000),(74,9,6,'002','花生牛奶002',NULL,'个',NULL,NULL,89,NULL,'2013-07-02 16:48:17','2013-07-03 10:06:44','I',1,1,56.31999969,NULL,NULL,0.00000000,0.00000000,NULL,17,NULL,0.00000000),(76,9,5,'001.','花生牛奶001',NULL,'个',NULL,NULL,100,NULL,'2013-07-03 10:04:26','2013-07-03 10:06:30','I',1,1,0.33000001,NULL,NULL,0.00000000,0.00000000,NULL,17,NULL,0.00000000),(77,10,5,'001','花生牛奶001',NULL,'个',NULL,NULL,500,NULL,'2013-07-03 12:22:50','2013-07-03 14:44:58','A',1,1,123.00000000,0.00000000,NULL,36900.00000000,6273.00000000,NULL,17,NULL,0.60000000),(78,10,6,'002','花生牛奶002',NULL,'个',NULL,NULL,5,NULL,'2013-07-03 12:22:50','2013-07-03 14:44:58','A',1,1,89.23000000,0.00000000,NULL,223.08000000,37.92000000,NULL,17,NULL,0.50000000),(79,10,7,'003','花生牛奶003',NULL,'个',NULL,NULL,18,NULL,'2013-07-03 12:22:50','2013-07-03 14:44:59','A',1,1,23.69000000,0.00000000,NULL,383.78000000,65.24000000,NULL,17,NULL,0.90000000);
/*!40000 ALTER TABLE `order_purchase_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_sale`
--

DROP TABLE IF EXISTS `order_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_sale` (
  `ORDER_SALE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MYID` varchar(55) DEFAULT NULL,
  `SETUP_DATE` date DEFAULT NULL,
  `SETUP_ACCOUNT` int(11) DEFAULT NULL,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL COMMENT '客户编码',
  `CUSTOMER_NAME` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `CUSTOMER_MYID` varchar(55) DEFAULT NULL COMMENT '客户自编码',
  `PROJECT_ID` int(11) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目自编码',
  `CUSTOMER_ADDRESS` varchar(200) DEFAULT NULL,
  `CUSTOMER_CONTACT` varchar(55) DEFAULT NULL,
  `CUSTOMER_TEL` varchar(55) DEFAULT NULL COMMENT '公司电话',
  `CONTACT_MOBILE` varchar(20) DEFAULT NULL COMMENT '联系人手机',
  `CONTACT_TEL` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_FAX` varchar(20) DEFAULT NULL COMMENT '联系人传真',
  `DELIVERY_MODE` int(11) DEFAULT NULL,
  `DELIVERY_MODE_NAME` varchar(55) DEFAULT NULL,
  `ESTIMATED_DELIVERY` date DEFAULT NULL COMMENT '预计交货日期',
  `DELIVERY_ADDRESS` varchar(300) DEFAULT NULL,
  `ORDER_DESC` varchar(1000) DEFAULT NULL,
  `PAY_MODE` int(11) DEFAULT NULL,
  `ISINVOICE` int(2) DEFAULT NULL COMMENT '是否开票 1:是，2:否',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `SALE_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名称',
  `SALE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '客户组织编码',
  `SALE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '客户组织名称',
  `WAREHOUSE_NAME` varchar(200) DEFAULT NULL,
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SOURCE_OBJECT` int(11) DEFAULT NULL COMMENT '来源对像 1:请购单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '对象编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '采购类型',
  `CLASS_NAME` varchar(55) DEFAULT NULL COMMENT '客户单类型名称 system_code',
  `BATCH_ID` int(11) DEFAULT NULL COMMENT '暂时不填',
  `BATCH_NO` varchar(255) DEFAULT NULL COMMENT '批号',
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  `CUSTOMER_ORDER_NO` varchar(100) DEFAULT NULL,
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TOTAL_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `ADVANCE_PAYMENT` double(18,8) DEFAULT '0.00000000',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ORDER_STATUS` char(1) DEFAULT NULL,
  `CURRENCY_ID` int(11) DEFAULT NULL,
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ORDER_SALE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_sale`
--

LOCK TABLES `order_sale` WRITE;
/*!40000 ALTER TABLE `order_sale` DISABLE KEYS */;
INSERT INTO `order_sale` VALUES (1,'11','2013-07-08',1,1,1,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1111',NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,NULL,'2013-07-09','I',NULL,1,NULL,NULL,NULL),(2,'123123','2013-07-09',NULL,NULL,NULL,'','',NULL,'',NULL,'','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62,'普通采购',12,'','Y',NULL,0.00000000,0.00000000,0.00000000,0.00000000,'2013-07-09','2013-07-09','I',1,1,NULL,NULL,''),(3,'123123','2013-07-30',NULL,1,22,'12312','3123123',5,'123',NULL,'123123','123',NULL,NULL,NULL,66,'客户自提','2013-07-09',NULL,NULL,NULL,NULL,123,'',NULL,'','物流仓',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,63,'紧急采购',123,'','Y','',509.00000000,86.53000000,595.53000000,0.00000000,'2013-07-09','2013-07-09','A',1,1,NULL,1,'人民币');
/*!40000 ALTER TABLE `order_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_sale_line`
--

DROP TABLE IF EXISTS `order_sale_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_sale_line` (
  `ORDER_SALE_LID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_SALE_ID` int(11) DEFAULT NULL COMMENT '询价单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `ORDER_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `PRICE` double(18,8) DEFAULT '0.00000000',
  `TAX` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX` double(18,8) DEFAULT '0.00000000',
  `AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `PRICE_TAX_AMOUNT` double(18,8) DEFAULT '0.00000000',
  `TAX_NO` int(11) DEFAULT '0',
  `FACT_QTY` int(11) DEFAULT '0',
  `DISCOUNT_NO` double(18,8) DEFAULT '0.00000000',
  PRIMARY KEY (`ORDER_SALE_LID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='询价明细资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_sale_line`
--

LOCK TABLES `order_sale_line` WRITE;
/*!40000 ALTER TABLE `order_sale_line` DISABLE KEYS */;
INSERT INTO `order_sale_line` VALUES (1,3,5,'001','花生牛奶001',NULL,'个',NULL,NULL,5,NULL,'2013-07-09','2013-07-09','A',1,1,89.00000000,0.00000000,0.00000000,445.00000000,75.65000000,0.00000000,17,0,0.00000000),(2,3,6,'002','花生牛奶002',NULL,'个',NULL,NULL,8,NULL,'2013-07-09','2013-07-09','A',1,1,8.00000000,0.00000000,0.00000000,64.00000000,10.88000000,0.00000000,17,0,0.00000000);
/*!40000 ALTER TABLE `order_sale_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `ORGANIZATION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织机构自动ID',
  `COMPANY_ID` int(11) DEFAULT NULL COMMENT '从属公司ID',
  `MYID` varchar(25) DEFAULT NULL COMMENT '组织自编码',
  `PID` int(10) DEFAULT NULL COMMENT '父组织ID',
  `FULL_NAME` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `ENAME` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `MANAGER` int(10) DEFAULT NULL COMMENT '主负责人',
  `ICONCLS` varchar(100) DEFAULT NULL COMMENT '图标',
  `STATE` varchar(20) DEFAULT NULL,
  `ASSISTANT_MANAGER` int(10) DEFAULT NULL COMMENT '副负责人',
  `EMP_QTY` int(10) DEFAULT NULL COMMENT '编制人员数',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `SHORT_NAME` varchar(50) DEFAULT NULL COMMENT '简称',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FAX` varchar(50) DEFAULT NULL COMMENT '传真',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ORGANIZATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='组织部门资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,NULL,'1001',NULL,'总经理室','',NULL,'icon-pro','closed',NULL,NULL,'A','2013-05-27','2013-06-14','','50501068','50101068','',1,1),(2,NULL,'100101',1,'MIS','mis',NULL,'icon-undo','closed',NULL,NULL,'A','2013-05-27','2013-06-18','m','','','123123123123123123123',1,1),(3,NULL,'78545',1,'liter','',NULL,'icon-sys','closed',NULL,NULL,'I',NULL,'2013-06-18','','123','123','',1,1),(4,NULL,'werwe',5,'asdfasd','123',NULL,'icon-end','closed',NULL,NULL,'A','2013-05-28','2013-06-19','123','123','123','123123123123234234',1,1),(5,NULL,'123',NULL,'12333','123',NULL,'icon-tip','closed',NULL,NULL,'A','2013-06-14','2013-06-19','123','123','123','1231231',1,1),(6,NULL,'3123123',5,'123','sa',NULL,'icon-edit','closed',NULL,NULL,'I','2013-06-14','2013-06-18','','','','123123',1,2),(7,NULL,'1111',5,'dte','',NULL,'','closed',NULL,NULL,'I','2013-06-14','2013-06-18','','','','',1,2),(8,NULL,'123123',7,'123','123',NULL,'icon-cancel','closed',NULL,NULL,'I','2013-06-14','2013-06-18','123','123','','123123123123123123',1,1),(9,NULL,'123123123',1,'123123','12312312',NULL,'icon-tip','closed',NULL,NULL,'I','2013-06-18','2013-06-18','123123','123123','123123','123123123123',1,1),(10,NULL,'123',2,'123123','123',NULL,'icon-tip','closed',NULL,NULL,'A','2013-06-18','2013-06-18','123','123','123123','1231231233123312321123',1,1),(11,NULL,'312312',5,'12312','312',NULL,'icon-remove','closed',NULL,NULL,'I','2013-06-18','2013-06-18','3123123','123','1231','23123123123123123123',1,1),(12,NULL,'123123',10,'123','1231',NULL,'icon-end','closed',NULL,NULL,'A','2013-06-18','2013-06-19','123123123','123','12312','3123123123',1,1),(13,NULL,'1231231',12,'123123','23',NULL,'icon-remove','closed',NULL,NULL,'I','2013-06-18','2013-06-18','123213','33123123','3123','12312312123123312321',1,2),(14,NULL,'123',NULL,'123','12312',NULL,'icon-back','closed',NULL,NULL,'I','2013-06-18','2013-06-18','3123123123123123','123123','312','3123123',1,1),(15,NULL,'123',NULL,'1231','123',NULL,'icon-tip','closed',NULL,NULL,'I','2013-06-18','2013-06-18','123123','123','123123','12312312312',1,1),(16,NULL,'123',NULL,'123','123',NULL,'','closed',NULL,NULL,'I','2013-06-18','2013-06-18','123','123','123','123312123123234234',1,1),(17,NULL,'123',NULL,'123','123',NULL,'','closed',NULL,NULL,'I','2013-06-18','2013-06-18','123','123','132','132132',1,1),(18,NULL,'123',5,'123','123',NULL,'','closed',NULL,NULL,'I','2013-06-18','2013-06-18','123','123','123123','123123',2,1),(19,NULL,'12312',5,'123','31',NULL,'','closed',NULL,NULL,'I','2013-06-19','2013-06-19','23123','12312','312312','123123',1,1),(20,NULL,'123123',1,'会议室','test',NULL,'','closed',NULL,NULL,'A','2013-06-19','2013-06-19','123','123123123','123123','',23,23),(21,NULL,'QWEQ',1,'QWE','WE',NULL,'','closed',NULL,NULL,'A','2013-06-19','2013-06-19','QWEQWEQ','WEQ','WEQWE','',1,1),(22,NULL,'123',NULL,'123','123',NULL,'','closed',NULL,NULL,'I','2013-06-20','2013-06-21','123','123','123','123123123',1,1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter` (
  `PARAMETER_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '参数自动ID',
  `MYID` varchar(55) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '参数名称',
  `VALUE` varchar(255) DEFAULT NULL COMMENT '参数值',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATE` char(1) DEFAULT NULL COMMENT '是否启用',
  `EDITOR` varchar(100) DEFAULT NULL,
  `EDITOR_TYPE` varchar(100) DEFAULT NULL,
  `GROUP_TYPE` varchar(55) DEFAULT NULL COMMENT '参数类型',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PARAMETER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='参数资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` VALUES (1,'sysQty','商品数量保留位数','2342','123123123123123123','Y','numberbox','numberbox','商品参数','A',NULL,'2013-06-22',0,1),(2,'sysUnit','商品单位保留位数','23','132312312','Y','numberbox','numberbox','商品参数','A',NULL,'2013-06-22',0,1),(3,'sysCount','商品合计保留位数','true','123123','N','{\"options\":{\"off\":false,\"on\":true},\"type\":\"checkbox\"}','checkbox','商品参数','A',NULL,'2013-06-22',0,1),(4,'sysPar','系统参数','123','123123123','Y','numberbox','numberbox','系统设置','A','2013-06-22','2013-06-24',1,1),(5,'autoAudit','是否自动审核','true','123123','Y','{\"options\":{\"off\":false,\"on\":true},\"type\":\"checkbox\"}','checkbox','单据设置','A','2013-07-05','2013-07-05',1,1);
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `PERMISSION_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限代码',
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PNAME` varchar(100) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MYID` varchar(55) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL COMMENT 'F:FUNCTION,O:OPERATION',
  `ISUSED` char(1) DEFAULT NULL COMMENT 'Y,N',
  `STATE` varchar(20) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `ICONCLS` varchar(100) DEFAULT NULL COMMENT '功能模块',
  `STATUS` char(1) NOT NULL COMMENT '状态',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CREATED` datetime NOT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PERMISSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='权限资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,NULL,'系统管理','',0,'sysMgr','F','Y','closed','javascript:void(0);','icon-sys','A','系统管理','2013-05-23 00:00:00','2013-06-18 00:00:00',1,1),(2,1,'程式管理','系统管理',0,'funMgr','F','Y','closed','jsp/function/functionMain.jsp','icon-pro','A','程式管理','2013-05-23 00:00:00','2013-05-27 00:00:00',1,1),(3,NULL,'公司管理','',0,'compMgr','F','Y','closed','javascript:void(0);','icon-comp','A','公司管理','2013-05-23 00:00:00','2013-06-20 15:33:13',1,1),(4,1,'数据库管理','系统管理',2,'1123','F','Y','open','druid/index.html','icon-db','A','123123123123123123','2013-05-23 00:00:00','2013-06-20 15:08:45',1,1),(6,NULL,'物料管理','',1,'itemMgr','F','Y','closed','javascript:void(0);','icon-item','A','','2013-05-23 00:00:00','2013-08-05 10:09:30',1,1),(7,1,'权限分派','系统管理',3,'funOMgr','F','Y','closed','jsp/permission/permissionAssignmentMain.jsp','icon-config','A','菜单功能分派','2013-05-23 00:00:00','2013-06-22 09:15:57',1,1),(8,6,'物料档案录入','物料管理',2,'itemMain','F','Y','closed','jsp/itemManager/itemMain.jsp','icon-item','A','','2013-05-23 00:00:00','2013-06-27 09:18:02',1,1),(10,3,'公司档案录入','公司管理',0,'compMain','F','Y','closed','jsp/company/companyMain.jsp','icon-edit','A','公司维护页面','2013-05-24 00:00:00','2013-06-27 08:46:23',1,1),(11,10,'公司新增','公司管理',1,'compAdd','O','Y','open','javascript:void(0);','icon-adds','A','公司新增','2013-05-24 00:00:00','2013-05-27 00:00:00',1,1),(12,10,'公司编辑','公司管理',2,'compEdit','O','Y','open','javascript:void(0);','icon-edit','A','公司编辑','2013-05-24 00:00:00','2013-05-27 00:00:00',1,1),(13,10,'公司删除','公司管理',3,'compDel','O','Y','open','javascript:void(0);','icon-remove','A','公司删除','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(14,10,'公司结束编辑','公司管理',4,'compEndEdit','O','Y','open','javascript:void(0);','icon-cancel','I','结束编辑','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(15,10,'公司保存','公司管理',5,'compSave','O','Y','open','javascript:void(0);','icon-save','I','保存','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(16,2,'菜单功能新增','系统管理',4,'funAdd','O','Y','open','javascript:void(0);','icon-adds','A','菜单功能新增','2013-05-24 00:00:00','2013-05-27 00:00:00',1,1),(17,2,'菜单功能编辑','系统管理',5,'funEdit','O','Y','open','javascript:void(0);','icon-edit','A','菜单功能编辑','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(18,2,'菜单功能删除','系统管理',6,'funDel','O','Y','open','javascript:void(0);','icon-remove','A','菜单功能删除','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(19,2,'菜单结束编辑','系统管理',7,'funEndEdit','O','Y','open','javascript:void(0);','icon-cancel','I','结束编辑','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(20,2,'菜单保存','系统管理',8,'funSave','O','Y','open','javascript:void(0);','icon-save','I','保存','2013-05-24 00:00:00','2013-06-14 00:00:00',1,1),(21,7,'权限分配保存','系统管理',9,'perConfig','O','Y','open','javascript:void(0);','icon-config','A','权限分配保存','2013-05-24 00:00:00','2013-05-27 00:00:00',1,1),(22,7,'角色新增','系统管理',10,'roleAdd','O','Y','open','javascript:void(0);','icon-role','A','角色新增','2013-05-27 00:00:00','2013-05-27 00:00:00',1,1),(23,7,'角色编辑','系统管理',11,'roleEdit','O','Y','open','javascript:void(0);','icon-edit','A','角色编辑','2013-05-27 00:00:00','2013-05-27 00:00:00',1,1),(24,7,'角色删除','系统管理',12,'roleDel','O','Y','open','javascript:void(0);','icon-remove','A','角色删除','2013-05-27 00:00:00','2013-05-27 00:00:00',1,1),(25,7,'角色结束编辑','系统管理',13,'roleEndEdit','O','Y','open','javascript:void(0);','icon-cancel','I','角色结束编辑','2013-05-27 00:00:00','2013-06-14 00:00:00',1,1),(26,7,'角色保存','系统管理',14,'roleSave','O','Y','open','javascript:void(0);','icon-save','I','角色保存','2013-05-27 00:00:00','2013-06-14 00:00:00',1,1),(27,1,'用户管理','系统管理',15,'userMain','F','Y','closed','jsp/user/userMain.jsp','icon-adds','A','用户管理','2013-05-27 00:00:00','2013-05-27 00:00:00',1,1),(28,1,'用户角色分派','系统管理',16,'userRoleMgr','F','Y','closed','jsp/roleConfig/roleConfigMain.jsp','icon-role','A','用户角色分配','2013-05-27 00:00:00','2013-06-22 09:16:35',1,1),(29,27,'用户新增','用户管理',16,'userAdd','O','Y','open','javascript:void(0);','icon-adds','A','123123123123','2013-05-27 00:00:00','2013-06-18 00:00:00',1,1),(30,27,'用户编辑','系统管理',17,'userEdit','O','Y','open','javascript:void(0);','icon-edit','A','','2013-05-27 00:00:00','2013-05-27 00:00:00',1,1),(31,27,'用户删除','系统管理',18,'userDel','O','Y','open','javascript:void(0);','icon-cancel','A','','2013-05-27 00:00:00','2013-05-27 00:00:00',1,1),(32,27,'用户结束编辑','系统管理',19,'userEndEdit','O','Y','open','javascript:void(0);','icon-end','I','','2013-05-27 00:00:00','2013-06-14 00:00:00',1,1),(33,27,'用户保存','系统管理',20,'userSave','O','Y','open','javascript:void(0);','icon-save','I','','2013-05-27 00:00:00','2013-06-14 00:00:00',1,1),(34,28,'用户角色分派','系统管理',21,'userRoleConfig','O','Y','open','javascript:void(0);','icon-config','A','用户角色分派','2013-05-29 00:00:00','2013-05-29 00:00:00',1,1),(35,2,'123','程式管理',1,'123','O','Y','open','javascript:void(0);','icon-remove','I','123123','2013-06-13 00:00:00','2013-06-13 00:00:00',1,1),(36,27,'用户del','用户管理',1,'123','F','Y','closed','123','icon-cancel','I','123123','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(37,27,'用户delll','用户管理',123,'123','O','Y','open','123','icon-undo','I','123123123','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(38,4,'ttttt','数据库管理',123,'123123123123','F','N','closed','123','icon-undo','I','123123123123123123','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(39,NULL,'1123123','',123,'123123','F','Y','closed','32123','icon-edit','I','123123123123','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(40,1,'组织管理','系统管理',6,'orgzMgr','F','Y','closed','jsp/organization/organizationMain.jsp','icon-tip','A','组织管理','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(41,40,'组织增加','组织管理',0,'orgzAdd','O','Y','open','javascript:void(0);','icon-edit','A','','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(42,40,'组织编辑','组织管理',1,'orgzEdit','O','Y','open','javascript:void(0);','icon-edit','A','','2013-06-17 00:00:00','2013-06-17 00:00:00',1,1),(43,40,'组织删除','组织管理',2,'orgzDel','O','Y','open','javascript:void(0);','icon-remove','A','','2013-06-17 00:00:00','2013-06-17 00:00:00',1,1),(44,1,'日志管理','系统管理',45,'logMgr','F','Y','closed','jsp/logs/logsMain.jsp','icon-pro','A','日志管理','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(45,NULL,'123123','',123,'123','F','Y','closed','123','','I','123123123','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(46,1,'123123','系统管理',123,'2312','F','Y','closed','1231','icon-back','I','3123123123123','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(47,44,'日志新增','日志管理',1,'logAdd','O','Y','open','javascript:void(0);','icon-edit','A','','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(48,44,'日志编辑','日志管理',2,'logEdit','O','Y','open','javascript:void(0);','icon-remove','A','','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(49,44,'日志删除','日志管理',3,'logDel','O','Y','open','javascript:void(0);','icon-cancel','A','','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(50,1,'数据字典','系统管理',5,'dicMgr','F','Y','closed','jsp/systemCode/systemCodeMain.jsp','icon-undo','A','','2013-06-19 00:00:00','2013-06-19 14:12:08',1,1),(51,50,'字典新增','数据字典',0,'dicAdd','O','Y','open','javascript:void(0);','icon-adds','A','','2013-06-19 00:00:00','2013-06-19 00:00:00',1,1),(52,50,'字典编辑','数据字典',1,'dicEdit','O','Y','open','javascript:void(0);','icon-edit','A','','2013-06-19 00:00:00','2013-06-19 00:00:00',1,1),(53,50,'字典删除','数据字典',2,'dicDel','O','Y','open','javascript:void(0);','icon-cancel','A','','2013-06-19 00:00:00','2013-06-19 00:00:00',1,1),(54,4,'123','数据库管理',123,'123','O','Y','open','123','icon-edit','I','123123123123','2013-06-20 15:06:08','2013-06-20 15:13:33',1,1),(55,4,'12312311','数据库管理',123,'123','O','Y','closed','123','','I','123123123123123123123','2013-06-20 15:08:01','2013-06-20 15:10:13',1,1),(56,4,'12312311','数据库管理',123123,'123','O','Y','open','1231','icon-back','I','23123123','2013-06-20 15:10:29','2013-06-20 15:13:35',1,1),(57,NULL,'阿斯蒂芬','',123123,'123','F','Y','closed','123','icon-cancel','I','123123123','2013-06-20 15:19:50','2013-06-20 15:20:42',1,1),(58,57,'123','阿斯蒂芬',123,'123123','F','Y','closed','123','','I','123123','2013-06-20 15:20:06','2013-06-20 15:20:37',1,1),(59,1,'参数设置','系统管理',12,'11','F','Y','closed','jsp/sysParameter/sysParameterMain.jsp','icon-remove','A','111','2013-06-21 12:14:27','2013-06-21 12:21:13',1,1),(60,59,'结束编辑','参数设置',1,'parEndEdit','O','Y','open','javascript:void(0);','icon-end','A','','2013-06-22 09:23:01','2013-06-22 09:23:01',1,1),(61,59,'删除','参数设置',2,'parDel','O','Y','open','javascript:void(0);','icon-remove','A','','2013-06-22 09:23:47','2013-06-22 09:24:23',1,1),(62,59,'保存','参数设置',3,'parSave','O','Y','open','javascript:void(0);','icon-save','A','','2013-06-22 09:25:11','2013-06-22 09:25:57',1,1),(63,1,'Bug管理','系统管理',9,'bugMgr','F','Y','closed','jsp/bugManager/bugMain.jsp','icon-bug','A','','2013-06-22 09:45:45','2013-06-22 14:37:19',1,1),(64,63,'Bug新增','Bug管理',9,'bugAdd','O','Y','open','javascript:void(0);','icon-badd','A','123123','2013-06-22 10:04:54','2013-06-22 10:43:51',1,1),(65,63,'Bug编辑','Bug管理',10,'bugEdit','O','Y','open','javascript:void(0);','icon-bedit','A','','2013-06-22 10:05:34','2013-06-22 10:05:34',1,1),(66,63,'Bug删除','Bug管理',11,'bugDel','O','Y','open','javascript:void(0);','icon-bdel','A','','2013-06-22 10:06:12','2013-06-22 10:06:12',1,1),(67,1,'test','系统管理',1,'123','F','Y','closed','jsp/bugManager/MyJsp.jsp','icon-bdel','I','','2013-06-22 15:54:10','2013-06-22 22:31:02',1,1),(68,NULL,'客户管理','',3,'cstMgr','F','Y','closed','javascript:void(0);','icon-role','A','','2013-06-24 09:45:45','2013-06-24 09:45:45',1,1),(69,68,'客户档案录入','客户管理',1,'cstMain','F','Y','closed','jsp/cstManager/cstMain.jsp','icon-edit','A','123123123123','2013-06-24 09:46:49','2013-06-26 16:27:56',1,1),(70,69,'客户新增','客户管理',1,'cstAdd','O','Y','open','javascript:void(0);','icon-adds','A','','2013-06-26 12:20:09','2013-06-26 12:20:09',1,1),(71,69,'客户编辑','客户管理',2,'cstEdit','O','Y','open','javascript:void(0);','icon-ok','A','','2013-06-26 12:20:46','2013-06-26 12:21:22',1,1),(72,69,'客户删除','客户管理',3,'cstDel','O','Y','open','javascript:void(0);','icon-remove','A','','2013-06-26 12:22:05','2013-06-26 12:22:05',1,1),(73,69,'客户联系人编辑','客户管理',4,'cstConEdit','O','Y','open','javascript:void(0);','icon-config','A','','2013-06-26 12:23:15','2013-06-26 12:23:15',1,1),(74,NULL,'供应商管理','',5,'supMgr','F','Y','closed','javascript:void(0);','icon-role','A','','2013-06-26 12:27:50','2013-06-26 12:29:22',1,1),(75,74,'供应商档案录入','供应商管理',1,'supMain','F','Y','closed','jsp/supManager/supMain.jsp','icon-tip','A','','2013-06-26 12:28:55','2013-06-26 16:28:17',1,1),(76,75,'供应商新增','供应商管理',1,'supAdd','O','Y','open','javascript:void(0);','icon-adds','A','','2013-06-26 12:30:25','2013-06-26 12:30:25',1,1),(77,75,'供应商编辑','供应商管理',2,'supEdit','O','Y','open','javascript:void(0);','icon-ok','A','','2013-06-26 12:31:10','2013-06-26 12:31:10',1,1),(78,75,'供应商删除','供应商管理',3,'supDel','O','Y','open','javascript:void(0);','icon-remove','A','','2013-06-26 12:31:59','2013-06-26 14:05:55',1,1),(79,75,'供应商联系人编辑','供应商管理',4,'supConEdit','O','Y','open','javascript:void(0);','icon-config','A','','2013-06-26 14:06:44','2013-06-26 15:45:59',1,1),(80,8,'商品新增','商品管理',1,'itemAdd','O','Y','open','javascript:void(0);','icon-adds','A','','2013-06-26 15:37:38','2013-06-26 15:37:38',1,1),(81,8,'商品编辑','商品管理',2,'itemEdit','O','Y','open','javascript:void(0);','icon-ok','A','','2013-06-26 15:38:10','2013-06-26 15:38:21',1,1),(82,8,'商品删除','商品管理',3,'itemDel','O','Y','open','javascript:void(0);','icon-cancel','A','','2013-06-26 15:38:59','2013-06-26 15:39:18',1,1),(83,8,'商品导入','商品管理',4,'itemImport','O','Y','open','javascript:void(0);','icon-excel','I','','2013-06-26 15:41:54','2013-06-26 16:30:12',1,1),(84,68,'客户档案导入','客户管理',2,'cstImport','F','Y','closed','sdf','icon-excel','A','','2013-06-26 16:27:14','2013-06-26 16:27:14',1,1),(85,74,'供应商档案导入','供应商管理',2,'supImport','F','Y','closed','sdf','icon-excel','A','','2013-06-26 16:29:04','2013-06-26 16:29:04',1,1),(86,6,'物料档案导入','物料管理',2,'itemImport','F','Y','closed','jsp/docView/view.jsp','icon-excel','A','','2013-06-26 16:31:43','2013-07-12 12:14:15',1,1),(87,NULL,'项目管理','',5,'projectMgr','F','Y','closed','javascript:void(0);','icon-sys','A','','2013-06-27 12:02:43','2013-06-27 12:02:43',1,1),(88,87,'项目档案录入','项目管理',1,'projectMain','F','Y','closed','jsp/project/projectMain.jsp','icon-adds','A','','2013-06-27 12:03:59','2013-06-27 12:03:59',1,1),(89,88,'项目新增','项目档案录入',1,'projectAdd','O','Y','open','javascript:void(0);','icon-adds','A','','2013-06-27 12:04:39','2013-06-27 12:04:53',1,1),(90,88,'项目编辑','项目档案录入',2,'projectEdit','O','Y','open','javascript:void(0);','icon-edit','A','','2013-06-27 12:05:28','2013-06-27 12:05:28',1,1),(91,88,'项目删除','项目档案录入',3,'projectDel','O','Y','open','javascript:void(0);','icon-ok','A','','2013-06-27 12:06:08','2013-07-01 10:59:53',1,1),(92,NULL,'数据备份','',7,'dbBackUp','F','Y','closed','javascript:void(0);','icon-db','A','','2013-06-28 13:32:09','2013-06-28 13:32:22',1,1),(93,92,'数据备份','数据备份',1,'dbBackUpMain','F','Y','closed','jsp/dbBackUp/dbBackUpMain.jsp','icon-end','A','','2013-06-28 13:34:21','2013-06-28 13:50:29',1,1),(94,93,'手动备份','数据备份',1,'dbBackUpHand','O','Y','open','javascript:void(0);','icon-pro','A','','2013-06-28 13:37:27','2013-07-11 11:23:27',1,1),(95,93,'定时备份','数据备份',2,'dbBackUpTime','O','Y','open','javascript:void(0);','icon-config','A','','2013-06-28 13:38:19','2013-06-28 13:38:19',1,1),(96,74,'采购单录入','供应商管理',3,'ordPurMgr','F','Y','closed','jsp/orderPurchase/orderPurchaseMain.jsp','icon-adds','A','','2013-07-01 10:58:03','2013-07-01 10:58:03',1,1),(97,NULL,'sku管理','',0,'skuMgr','F','Y','closed','javascript:void(0);','icon-sys','A','sku管理','2013-05-23 00:00:00','2013-06-18 00:00:00',1,1),(98,97,'sku编辑','sku管理',0,'skuEdit','F','Y','closed','jsp/skuManager/skuMain.jsp','icon-excel','A','sku编辑','2013-05-23 00:00:00','2013-06-18 00:00:00',1,1),(99,96,'采购单删除','采购单录入',3,'ordPurDel','O','Y','open','javascript:void(0);','icon-remove','A','','2013-07-01 11:00:44','2013-07-01 11:00:44',1,1),(100,68,'客户订单录入','客户管理',3,'cstOrderMgr','F','Y','closed','jsp/orderSale/orderSaleMain.jsp','icon-end','A','','2013-07-08 15:20:54','2013-07-08 15:23:53',1,1),(101,98,'sku新增','sku管理',1,'skuAdd','O','Y','open','javascript:void(0);','icon-adds','A','','2013-06-26 12:20:09','2013-06-26 12:20:09',1,1),(102,98,'sku编辑','sku管理',2,'skuEdit','O','Y','open','javascript:void(0);','icon-ok','A','','2013-06-26 12:20:46','2013-06-26 12:21:22',1,1),(103,98,'sku删除','sku管理',3,'skuDel','O','Y','open','javascript:void(0);','icon-remove','A','','2013-06-26 12:22:05','2013-06-26 12:22:05',1,1),(104,98,'sku导出','sku管理',4,'skuExport','O','Y','open','javascript:void(0);','icon-save','A','','2013-06-26 12:22:05','2013-06-26 12:22:05',1,1);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_purchase`
--

DROP TABLE IF EXISTS `plan_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_purchase` (
  `PLAN_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购计划编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '采购单自编码',
  `DATE` date DEFAULT NULL COMMENT '计划单日期',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '计划类型编码',
  `CLASS_NAME` varchar(55) DEFAULT NULL COMMENT '计划类型名称',
  `PROJECT_ID` int(11) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `AMOUNT` float DEFAULT NULL COMMENT '计划未税总价',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '项目描述',
  `SOURCE_OBJECT` varchar(55) DEFAULT NULL COMMENT '来源对象',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '来源对象编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `AMOUNT_TAX` double(18,8) DEFAULT NULL COMMENT '含税总价',
  PRIMARY KEY (`PLAN_ID`),
  KEY `FK_PLAN_PURCHASE1` (`CLASS_ID`),
  KEY `FK_PLAN_PURCHASE2` (`PROJECT_ID`),
  KEY `FK_PLAN_PURCHASE3` (`ATTACHMENT_ID`),
  KEY `FK_PLAN_PURCHASE4` (`ENTER_ORGANIZATION_ID`),
  KEY `FK_PLAN_PURCHASE5` (`AUDITE_ID`),
  KEY `FK_PLAN_PURCHASE6` (`ENTER_ID`),
  KEY `FK_PLAN_PURCHASE7` (`AUDITE_ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_purchase`
--

LOCK TABLES `plan_purchase` WRITE;
/*!40000 ALTER TABLE `plan_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_purchase_line`
--

DROP TABLE IF EXISTS `plan_purchase_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_purchase_line` (
  `PLAN_LID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位编码',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `PLAN_QTY` int(11) DEFAULT NULL COMMENT '计划数量',
  `PRICE_TAX` double(18,8) DEFAULT NULL COMMENT '含税价格',
  `AMOUNT` double(18,8) DEFAULT NULL COMMENT '未税总价',
  `PRICE` double(18,8) DEFAULT NULL COMMENT '未税单价',
  `AMOUNT_TAX` double(18,8) DEFAULT NULL COMMENT '含税总价',
  `TAX` double(18,8) DEFAULT NULL COMMENT '税金',
  `PLAN_ID` int(11) DEFAULT NULL COMMENT '计划编码',
  `TAX_RATE` int(11) DEFAULT NULL COMMENT '税率',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  PRIMARY KEY (`PLAN_LID`),
  KEY `PLAN_PURCHASE_LINE1` (`ITEM_ID`),
  KEY `PLAN_PURCHASE_LINE2` (`BRAND_ID`),
  KEY `PLAN_PURCHASE_LINE3` (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_purchase_line`
--

LOCK TABLES `plan_purchase_line` WRITE;
/*!40000 ALTER TABLE `plan_purchase_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_purchase_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `PROJECT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目编码',
  `MYID` varchar(55) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `SETUP_DATE` date DEFAULT NULL COMMENT '立项日期',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '项目类型编码',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '项目类型名称',
  `CUSTOMER_ID` int(11) DEFAULT NULL COMMENT '客户编码',
  `CUSTOMER_MYID` varchar(55) DEFAULT NULL COMMENT '客户自编码',
  `TEL_NO` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `CONTACTS` varchar(20) DEFAULT NULL COMMENT '联系人',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '项目来源编码',
  `SOURCE_NAME` varchar(200) DEFAULT NULL COMMENT '项目来源名称',
  `BUDGET` varchar(55) DEFAULT NULL COMMENT '预算',
  `START_TIME` date DEFAULT NULL COMMENT '开始时间',
  `END_TIME` date DEFAULT NULL COMMENT '完成时间',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '项目描述',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SHARED` varchar(200) DEFAULT NULL COMMENT '共享人(以逗号分隔)',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT '项目负责人编码',
  `MANAGER_NAME` varchar(55) DEFAULT NULL COMMENT '项目负责人名称',
  `MANAGER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '项目负责人组织编码',
  `MANAGER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '项目负责人组织名称',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL,
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='项目资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'123','123',NULL,3,'中型项目',22,'12312','','','',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,23,'test',NULL,NULL,'2013-06-27','2013-08-05','A',1,1),(2,'123123','123',NULL,NULL,'',NULL,NULL,'','',NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-06-27','2013-06-27','I',1,1),(3,'3123','12312','2013-06-20',123,'',22,'','123','123',NULL,123,'','123','2013-07-04','2013-06-27','123123',NULL,NULL,NULL,123,'',NULL,NULL,'2013-06-27','2013-06-27','A',1,1),(4,'123','123',NULL,123,'',NULL,'','','',NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-06-27','2013-06-27','A',1,1),(5,'123','123',NULL,NULL,'',NULL,'','','','123123',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-06-27','2013-06-27','A',1,1),(6,'123','123',NULL,NULL,'',23,'123123123','','','123123',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,2,'root',NULL,NULL,'2013-06-27','2013-07-02','I',1,1),(7,'123123','123','2013-06-27',3,'中型项目',26,'123','123','123123123','123123',7,'熟人介绍','123','2013-06-27','2013-06-27','123123',NULL,NULL,NULL,24,'ee',NULL,NULL,'2013-06-27','2013-06-27','A',1,1),(8,'123','123',NULL,NULL,'',NULL,'','','','',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-06-27','2013-07-08','A',1,1),(9,'123123','123123',NULL,NULL,'',NULL,'','','','',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-06-27','2013-07-08','A',1,1),(10,'23123123','1231',NULL,NULL,'',NULL,'','','','',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-06-27','2013-07-02','I',1,1),(11,'12323123','123123',NULL,NULL,'',NULL,'','','','',NULL,'','',NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,'2013-07-01','2013-07-02','I',1,1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_follow`
--

DROP TABLE IF EXISTS `project_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_follow` (
  `FOLLOW_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目跟踪编码',
  `PROJECT_ID` int(11) DEFAULT NULL,
  `PROJECT_NAME` varchar(100) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `CUSTOMER_NAME` varchar(200) DEFAULT NULL,
  `CONTCAT_DATE` date DEFAULT NULL,
  `CONTCAT` varchar(55) DEFAULT NULL,
  `FOLLOW_CLASS` int(11) DEFAULT NULL COMMENT '跟踪类型  followClass',
  `CLASS_NAME` varchar(55) DEFAULT NULL,
  `FOLLOW_STATUS` int(1) DEFAULT NULL COMMENT '跟踪状态  followStatus',
  `STATUS_NAME` varchar(55) DEFAULT NULL,
  `PROGRESS` int(3) DEFAULT NULL COMMENT '进度',
  `CONTENT` varchar(2000) DEFAULT NULL COMMENT '内容',
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  PRIMARY KEY (`FOLLOW_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_follow`
--

LOCK TABLES `project_follow` WRITE;
/*!40000 ALTER TABLE `project_follow` DISABLE KEYS */;
INSERT INTO `project_follow` VALUES (1,1,NULL,NULL,NULL,'2013-06-03','',75,'一般跟踪',79,'已签约',15,'123','123',NULL,NULL,'2013-06-27','2013-08-05','A',1,1,NULL,NULL,NULL,NULL),(2,2,NULL,NULL,NULL,'2013-06-27','123123',NULL,'12',NULL,'312',12,'23','123',NULL,NULL,'2013-06-27','2013-06-27','I',1,1,NULL,NULL,NULL,NULL),(3,7,NULL,NULL,NULL,'2013-06-20','123',76,'重点跟踪',NULL,'123',123,'123','123',NULL,NULL,'2013-06-27','2013-06-27','A',1,1,NULL,NULL,NULL,NULL),(4,8,NULL,NULL,NULL,'2013-06-20','123123',75,'一般跟踪',NULL,'123',123,'123','123',NULL,NULL,'2013-06-27','2013-06-27','A',1,1,NULL,NULL,NULL,NULL),(5,8,NULL,NULL,NULL,'2013-06-20','123',75,'一般跟踪',NULL,'123',123,'123','123',NULL,NULL,'2013-06-27','2013-06-27','A',1,1,NULL,NULL,NULL,NULL),(6,8,NULL,NULL,NULL,'2013-06-27','123',76,'重点跟踪',80,'已下单',1,'123','123',NULL,NULL,'2013-06-27','2013-07-08','A',1,1,NULL,NULL,NULL,NULL),(7,9,NULL,NULL,NULL,'2013-06-20','123',76,'重点跟踪',NULL,'123',123,'123','123',NULL,NULL,'2013-06-27','2013-06-27','A',1,1,NULL,NULL,NULL,NULL),(8,9,NULL,NULL,NULL,'2013-06-12','123123',75,'一般跟踪',NULL,'123',123,'123','3123',NULL,NULL,'2013-06-27','2013-06-27','A',1,1,NULL,NULL,NULL,NULL),(9,9,NULL,NULL,NULL,'2013-06-18','123',75,'一般跟踪',79,'已签约',74,'123','123',NULL,NULL,'2013-06-27','2013-07-08','A',1,1,NULL,NULL,NULL,NULL),(10,10,NULL,NULL,NULL,'2013-06-20','123123',76,'重点跟踪',79,'已签约',123,'123','123',NULL,NULL,'2013-06-27','2013-06-27','I',1,1,NULL,NULL,NULL,NULL),(11,10,NULL,NULL,NULL,'2013-06-12','123123',76,'重点跟踪',80,'已下单',75,'123','123',NULL,NULL,'2013-06-27','2013-07-02','I',1,1,NULL,NULL,NULL,NULL),(12,10,NULL,NULL,NULL,'2013-06-28','123',75,'一般跟踪',79,'已签约',100,'123','123',NULL,NULL,'2013-06-27','2013-07-02','I',1,1,NULL,NULL,NULL,NULL),(13,11,NULL,NULL,NULL,'2013-07-10','3123',76,'重点跟踪',79,'已签约',44,'123','123',NULL,NULL,'2013-07-01','2013-07-02','I',1,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `project_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `PROVINCE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '省份',
  `AREA_ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `CREATED` date NOT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PROVINCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='省份资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,0,'江苏','2013-06-25','2013-06-25','A',1,1),(2,0,'浙江','2013-06-25','2013-06-25','A',1,1);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_purchase`
--

DROP TABLE IF EXISTS `quote_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_purchase` (
  `QUOTE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '报价编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '报价自编码',
  `DATE` date DEFAULT NULL COMMENT '报价日期',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '报价类型  暂时不用',
  `CLASS_NAME` varchar(55) DEFAULT NULL,
  `ENQUIRY_ID` int(11) DEFAULT NULL COMMENT '询价编码',
  `ENQUIRY_MYID` varchar(55) DEFAULT NULL COMMENT '询价自编码',
  `PROJECT_ID` int(11) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目自编码',
  `SUPLIER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `SUPLIER_NAME` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `SUPLIER_MYID` varchar(55) DEFAULT NULL COMMENT '供应商自编码',
  `CONTACT_NAME` varchar(55) DEFAULT NULL COMMENT '联系人名称',
  `SUPLIER_TEL` varchar(55) DEFAULT NULL COMMENT '公司电话',
  `CONTACT_MOBILE` varchar(20) DEFAULT NULL COMMENT '联系人手机',
  `CONTACT_TEL` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_FAX` varchar(20) DEFAULT NULL COMMENT '联系人传真',
  `START_DATE` date DEFAULT NULL COMMENT '生效日期',
  `END_DATE` date DEFAULT NULL COMMENT '截止日期',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `AMOUNT` float DEFAULT NULL COMMENT '总价未税',
  `AMOUNT_TAX` float DEFAULT NULL COMMENT '总价含税',
  `QUOTE_DESC` varchar(2000) DEFAULT NULL COMMENT '报价说明',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `SOURCE_OBJECT` int(11) DEFAULT NULL COMMENT '来源对像 1:询价单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '对象编码',
  `QUOTE_UID` int(11) DEFAULT NULL COMMENT '询价人编码',
  `QUOTE_NAME` varchar(55) DEFAULT NULL COMMENT '询价人名称',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `QUOTE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '询价人部门',
  `QUOTE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '询价人部门名称',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  PRIMARY KEY (`QUOTE_ID`),
  KEY `FK_QUOTE_PURCHASE1` (`CLASS_ID`),
  KEY `FK_QUOTE_PURCHASE2` (`ENQUIRY_ID`),
  KEY `FK_QUOTE_PURCHASE3` (`PROJECT_ID`),
  KEY `FK_QUOTE_PURCHASE4` (`SUPLIER_ID`),
  KEY `FK_QUOTE_PURCHASE5` (`ATTACHMENT_ID`),
  KEY `FK_QUOTE_PURCHASE6` (`QUOTE_UID`),
  KEY `FK_QUOTE_PURCHASE7` (`QUOTE_ORGANIZATION_ID`),
  KEY `FK_QUOTE_PURCHASE8` (`ENTER_ID`),
  KEY `FK_QUOTE_PURCHASE9` (`ENTER_ORGANIZATION_ID`),
  KEY `FK_QUOTE_PURCHASE10` (`AUDITE_ID`),
  KEY `FK_QUOTE_PURCHASE11` (`AUDITE_ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_purchase`
--

LOCK TABLES `quote_purchase` WRITE;
/*!40000 ALTER TABLE `quote_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_purchase_line`
--

DROP TABLE IF EXISTS `quote_purchase_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_purchase_line` (
  `QUOTE_LID` int(11) NOT NULL AUTO_INCREMENT,
  `QUOTE_ID` int(11) DEFAULT NULL COMMENT '请购单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `PRICE_TAX` float DEFAULT NULL COMMENT '含税价格',
  `AMOUNT` float DEFAULT NULL COMMENT '未税总价',
  `PRICE` float DEFAULT NULL COMMENT '未税单价',
  `AMOUNT_TAX` float DEFAULT NULL COMMENT '含税总价',
  `TAX` float DEFAULT NULL COMMENT '税金',
  `SALE_ORDER_ID` int(11) DEFAULT NULL COMMENT '销售订单编码',
  `SALE_ORDER_MYID` varchar(55) DEFAULT NULL COMMENT '销售订单自编码',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售单编码',
  `SALE_MYID` varchar(55) DEFAULT NULL COMMENT '销售单自编码',
  `SALE_CONTRACT_ID` int(11) DEFAULT NULL COMMENT '销售合同编码',
  `SALE_CONTRACT_MYID` varchar(55) DEFAULT NULL COMMENT '销售合同自编码',
  `PLAN_ID` int(11) DEFAULT NULL COMMENT '采购计划编码',
  `PLAN_MYID` varchar(55) DEFAULT NULL COMMENT '采购计划自编码',
  `HAVE_ORDER` int(1) DEFAULT NULL COMMENT '是否下单 1:已下单，2:未下单',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  PRIMARY KEY (`QUOTE_LID`),
  KEY `FK_REQUISITION_PURCHASE_LINE1` (`ITEM_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE2` (`BRAND_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE3` (`PLAN_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE4` (`QUOTE_ID`),
  CONSTRAINT `fk_qlt` FOREIGN KEY (`QUOTE_ID`) REFERENCES `quote_purchase` (`QUOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_purchase_line`
--

LOCK TABLES `quote_purchase_line` WRITE;
/*!40000 ALTER TABLE `quote_purchase_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_purchase_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisition_purchase`
--

DROP TABLE IF EXISTS `requisition_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisition_purchase` (
  `REQ_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '请购单编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '请购单自编码',
  `DATE` date DEFAULT NULL COMMENT '请购日期',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '采购类型',
  `CLASS_NAME` varchar(55) DEFAULT NULL COMMENT '采购类型名称',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `WAREHOUSE_ID` int(11) DEFAULT NULL COMMENT '仓库编码',
  `SOURCE_OBJECT` char(2) DEFAULT NULL COMMENT 'P:采购计划，SO:表示销售订单',
  `OBJECT_ID` int(11) DEFAULT NULL COMMENT '来源单据编码',
  `CUSTOMER_ID` int(11) DEFAULT NULL COMMENT '客户编码',
  `CUSTOMER_NAME` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `AMOUNT` double DEFAULT NULL COMMENT '未税总价',
  `AMOUNT_TAX` double DEFAULT NULL COMMENT '含税总价',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `PRINT_COUNT` int(11) DEFAULT NULL COMMENT '打印次数',
  `REQUISITION_ID` int(11) DEFAULT NULL COMMENT '请购人编码',
  `REQUISITION_NAME` varchar(55) DEFAULT NULL COMMENT '请购人名称',
  `REQUISITION_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '请购组织编码',
  `REQUISITION_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '请购组织名称',
  `ENTER_ID` int(11) DEFAULT NULL COMMENT '录入人编码',
  `ENTER_NAME` varchar(55) DEFAULT NULL COMMENT '录入人名称',
  `ENTER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '录入人组织编码',
  `ENTER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '录入人组织名称',
  `ENTER_DATE` date DEFAULT NULL COMMENT '录入日期',
  `AUDITE_ID` int(11) DEFAULT NULL COMMENT '审核人编码',
  `AUDITE_NAME` varchar(55) DEFAULT NULL COMMENT '审核人名称',
  `AUDITE_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '审核人组织编码',
  `AUDITE_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '审核人组织名称',
  `AUDITE_DATE` date DEFAULT NULL COMMENT '审核日期',
  `AUDITE_STATUS` char(1) DEFAULT NULL COMMENT '审核状态',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  `WAREHOUSE_NAME` varchar(55) DEFAULT NULL COMMENT '仓库名称',
  PRIMARY KEY (`REQ_ID`),
  KEY `FK_REQUISITION_PURCHASE1` (`CLASS_ID`),
  KEY `FK_REQUISITION_PURCHASE2` (`WAREHOUSE_ID`),
  KEY `FK_REQUISITION_PURCHASE3` (`CUSTOMER_ID`),
  KEY `FK_REQUISITION_PURCHASE4` (`ATTACHMENT_ID`),
  KEY `FK_REQUISITION_PURCHASE5` (`REQUISITION_ID`),
  KEY `FK_REQUISITION_PURCHASE6` (`REQUISITION_ORGANIZATION_ID`),
  KEY `FK_REQUISITION_PURCHASE7` (`ENTER_ID`),
  KEY `FK_REQUISITION_PURCHASE8` (`ENTER_ORGANIZATION_ID`),
  KEY `FK_REQUISITION_PURCHASE9` (`AUDITE_ID`),
  KEY `FK_REQUISITION_PURCHASE10` (`AUDITE_ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisition_purchase`
--

LOCK TABLES `requisition_purchase` WRITE;
/*!40000 ALTER TABLE `requisition_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisition_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisition_purchase_line`
--

DROP TABLE IF EXISTS `requisition_purchase_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisition_purchase_line` (
  `REQUISITION_LID` int(11) NOT NULL AUTO_INCREMENT,
  `REQUISITION_ID` int(11) DEFAULT NULL COMMENT '请购单编码',
  `ITEM_ID` int(11) DEFAULT NULL COMMENT '商品编码',
  `MYID` varchar(55) DEFAULT NULL COMMENT '商品自编码',
  `ITEM_NAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `SPEC` varchar(200) DEFAULT NULL COMMENT '规格',
  `UNIT` varchar(55) DEFAULT NULL COMMENT '单位',
  `BRAND_ID` int(11) DEFAULT NULL COMMENT '品牌编码',
  `BRAND_NAME` varchar(200) DEFAULT NULL COMMENT '品牌名称',
  `REQUISITION_QTY` int(11) DEFAULT NULL COMMENT '请购数量',
  `PRICE_TAX` float DEFAULT '0' COMMENT '含税价格',
  `AMOUNT` float DEFAULT '0' COMMENT '未税总价',
  `PRICE` float DEFAULT '0' COMMENT '未税单价',
  `AMOUNT_TAX` float DEFAULT '0' COMMENT '含税总价',
  `TAX` float DEFAULT '0' COMMENT '税金',
  `DELIVERY_PERIOD` date DEFAULT NULL COMMENT '交货期限',
  `HAVEORDER_QTY` int(11) DEFAULT NULL COMMENT '已下订单数量',
  `SALE_ORDER_ID` int(11) DEFAULT NULL COMMENT '销售订单编码',
  `SALE_ORDER_MYID` varchar(55) DEFAULT NULL COMMENT '销售订单自编码',
  `NEVERORDER_QTY` int(11) DEFAULT NULL COMMENT '未下单数量',
  `SALE_ID` int(11) DEFAULT NULL COMMENT '销售单编码',
  `SALE_MYID` varchar(55) DEFAULT NULL COMMENT '销售单自编码',
  `SALE_CONTRACT_ID` int(11) DEFAULT NULL COMMENT '销售合同编码',
  `SALE_CONTRACT_MYID` varchar(55) DEFAULT NULL COMMENT '销售合同自编码',
  `PLAN_ID` int(11) DEFAULT NULL COMMENT '采购计划编码',
  `PLAN_MYID` varchar(55) DEFAULT NULL COMMENT '采购计划自编码',
  `HAVE_ENQUIRY` int(1) DEFAULT NULL COMMENT '是否询价 1:已询价，2:未询价',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATED` date DEFAULT NULL COMMENT '记录创造时间',
  `LASTMOD` date DEFAULT NULL COMMENT '记录修改时间',
  `STATUS` char(1) DEFAULT NULL COMMENT '记录状态',
  `CREATER` int(11) DEFAULT NULL COMMENT '创造人编码',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改编码',
  PRIMARY KEY (`REQUISITION_LID`),
  KEY `FK_REQUISITION_PURCHASE_LINE1` (`ITEM_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE2` (`BRAND_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE3` (`PLAN_ID`),
  KEY `FK_REQUISITION_PURCHASE_LINE4` (`REQUISITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisition_purchase_line`
--

LOCK TABLES `requisition_purchase_line` WRITE;
/*!40000 ALTER TABLE `requisition_purchase_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisition_purchase_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编码',
  `NAME` varchar(55) DEFAULT NULL COMMENT '角色名称',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `STATUS` char(1) DEFAULT NULL COMMENT '角色状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造时间',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改时间',
  `SORT` int(10) DEFAULT NULL COMMENT '排序',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统角色资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'系统管理角色','管理角色','A','2013-05-20 00:00:00','2013-06-14 00:00:00',1,1,1),(2,'角色2','角色2','A','2013-05-20 00:00:00','2013-06-14 00:00:00',1,1,1),(3,'角色311','角色311','A','2013-05-23 00:00:00','2013-06-14 00:00:00',22,1,1),(4,'1111','11111','A','2013-05-27 00:00:00','2013-06-14 00:00:00',3,1,1),(5,'akkeiei','eeee22222222222222','I','2013-05-27 00:00:00','2013-06-20 19:46:58',4,1,1),(6,'ee','ee','I','2013-05-27 00:00:00','2013-06-14 00:00:00',5,1,1),(7,'11122ss','123123','I','2013-06-04 00:00:00','2013-06-14 00:00:00',6,1,1),(8,'rtyreyerrty123','asdasd','I','2013-06-14 00:00:00','2013-06-14 00:00:00',123,1,1),(10,'test','测试角色','A','2013-06-19 00:00:00','2013-06-19 00:00:00',3,1,1),(11,'elecbusi','电商使用','A','2013-06-19 00:00:00','2013-06-19 00:00:00',2,1,1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色代码',
  `PERMISSION_ID` int(11) NOT NULL COMMENT '权限代码',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PERMISSION1` (`ROLE_ID`),
  KEY `FK_ROLE_PERMISSION2` (`PERMISSION_ID`),
  CONSTRAINT `FK_ROLE_PERMISSION1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_PERMISSION2` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`PERMISSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='角色权限资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (165,2,1,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(166,2,2,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(167,2,16,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(168,2,17,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(169,2,18,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(170,2,19,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(171,2,20,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(172,2,4,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(173,4,1,'I','2013-06-14 00:00:00','2013-06-19 00:00:00',1,1),(174,4,4,'I','2013-06-14 00:00:00','2013-06-19 00:00:00',1,1),(175,5,1,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(176,5,2,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(177,5,16,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(178,5,17,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(179,5,18,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(180,5,4,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(181,5,7,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(182,5,21,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(183,5,22,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(184,5,23,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(185,5,24,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(186,5,27,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(187,5,29,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(188,5,30,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(189,5,31,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(190,5,28,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(191,5,34,'I','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(192,1,1,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(193,1,2,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(194,1,16,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(195,1,17,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(196,1,18,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(197,1,7,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(198,1,21,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(199,1,22,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(200,1,23,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(201,1,24,'A','2013-06-17 00:00:00','2013-06-18 00:00:00',1,1),(202,1,27,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(203,1,29,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(204,1,30,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(205,1,31,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(206,1,28,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(207,1,34,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(208,1,40,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(209,1,41,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(210,1,42,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(211,1,43,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(212,4,2,'I','2013-06-18 00:00:00','2013-06-19 00:00:00',1,1),(213,4,16,'I','2013-06-18 00:00:00','2013-06-19 00:00:00',1,1),(214,4,17,'I','2013-06-18 00:00:00','2013-06-19 00:00:00',1,1),(215,4,18,'I','2013-06-18 00:00:00','2013-06-19 00:00:00',1,1),(216,2,7,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(217,2,21,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(218,2,22,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(219,2,23,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(220,2,24,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(221,3,1,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(222,3,2,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(223,3,16,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(224,3,17,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(225,3,18,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(226,3,4,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(227,3,7,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(228,3,21,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(229,3,22,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(230,3,23,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(231,3,24,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(232,1,4,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(233,1,44,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(234,1,3,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(235,1,10,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(236,1,11,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(237,1,12,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(238,1,13,'A','2013-06-18 00:00:00','2013-06-18 00:00:00',1,1),(239,10,1,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(240,10,2,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(241,10,16,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(242,10,17,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(243,10,18,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(244,10,4,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(245,10,7,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(246,10,21,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(247,10,22,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(248,10,23,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(249,10,24,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(250,10,27,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(251,10,29,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(252,10,30,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(253,10,31,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(254,10,28,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(255,10,34,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(256,10,40,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(257,10,41,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(258,10,42,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(259,10,43,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(260,10,44,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(261,10,47,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(262,10,48,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(263,10,49,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(264,10,3,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(265,10,10,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(266,10,11,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(267,10,12,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(268,10,13,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(269,10,6,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(270,10,8,'A','2013-06-19 00:00:00','2013-06-20 15:57:48',1,1),(271,10,50,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(272,10,51,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(273,10,52,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(274,10,53,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(275,10,97,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(276,11,97,'A','2013-06-14 00:00:00','2013-06-18 00:00:00',1,1),(277,11,98,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(278,11,101,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(279,11,102,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(280,11,103,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1),(281,11,104,'A','2013-06-20 15:57:48','2013-06-20 15:57:48',1,1);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spu`
--

DROP TABLE IF EXISTS `spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spu` (
  `SPU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'spu编码',
  `LASTMOD` datetime DEFAULT NULL COMMENT '最后修改时间',
  `NAME` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `MYID` varchar(100) DEFAULT NULL COMMENT 'spu标识码',
  `DISTCHNAME` varchar(200) DEFAULT NULL COMMENT '中文配货名称',
  `DISTENNAME` varchar(200) DEFAULT NULL COMMENT '英文配货名称',
  `COLORS` varchar(400) DEFAULT NULL COMMENT '颜色列表',
  `SIZE` varchar(400) DEFAULT NULL COMMENT '尺码列表',
  `LATESTCOST` double DEFAULT NULL COMMENT '最新报价',
  `WEIGHT` double DEFAULT NULL COMMENT '重量',
  `DEVELOPER` varchar(100) DEFAULT NULL COMMENT '业务开发员',
  `ENQUIRER` varchar(100) DEFAULT NULL COMMENT '询价员',
  `BUYER` varchar(100) DEFAULT NULL COMMENT '采购员',
  PRIMARY KEY (`SPU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='spu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spu`
--

LOCK TABLES `spu` WRITE;
/*!40000 ALTER TABLE `spu` DISABLE KEYS */;
INSERT INTO `spu` VALUES (1,'2017-05-08 18:27:00','test',1,25,'T8001','白色T','bluetooth air phone black','黑色,红色,白色,灰色','L,XXL,4XL',2.1,0.3,'业务员01','询价员02','采购员01'),(2,'2017-05-08 18:13:42','数据线',1,1,'T8003','数据线蓝','bluetooth air phone black','红色,白色,黄色','XS,S,XL,4XL',23.1,0.3,'业务员01','询价员01','采购员01');
/*!40000 ALTER TABLE `spu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_count`
--

DROP TABLE IF EXISTS `stock_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_count` (
  `STKCNT_ID` int(11) NOT NULL,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  `WAREHOUSE_NAME` varchar(100) DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_MYID` varchar(55) DEFAULT NULL,
  `ITEM_NAME` varchar(200) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `BATCH_NO` varchar(55) DEFAULT NULL,
  `ITEM_SPEC` varchar(255) DEFAULT NULL,
  `MANUFACTURE_DATE` date DEFAULT NULL,
  `EXPIRE_DATE` date DEFAULT NULL,
  `ITEM_QTY` double(19,2) DEFAULT NULL,
  `GRADE_ID` int(11) DEFAULT NULL,
  `GRADE_NAME` varchar(55) DEFAULT NULL,
  `COST_PRICE` double(19,8) DEFAULT NULL,
  `COST_AMOUNT` double(19,8) DEFAULT NULL,
  `SOURCE_OBJECT` varchar(100) DEFAULT NULL,
  `OBJECT_ID` int(11) DEFAULT '0',
  `LOCATION_ID` int(11) DEFAULT NULL,
  `LOCATION_NAME` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`STKCNT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_count`
--

LOCK TABLES `stock_count` WRITE;
/*!40000 ALTER TABLE `stock_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suplier`
--

DROP TABLE IF EXISTS `suplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suplier` (
  `SUPLIER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商编码',
  `NAME` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `MYID` varchar(55) DEFAULT NULL COMMENT '供应商自编码',
  `STATUS` char(1) DEFAULT NULL,
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFIYER` int(10) DEFAULT NULL COMMENT '修改人',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '供应商类型',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话',
  `FAX` varchar(55) DEFAULT NULL COMMENT '传真',
  `URL` varchar(200) DEFAULT NULL COMMENT '网站',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '邮件',
  `AREA_ID` int(11) DEFAULT NULL COMMENT '区域编码',
  `AREA_NAME` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `PROVINCE_ID` int(11) DEFAULT NULL COMMENT '省份编码',
  `PROVINCE_NAME` varchar(55) DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '城市编码',
  `CITY_NAME` varchar(55) DEFAULT NULL COMMENT '城市名称',
  `ADDRESS` varchar(1000) DEFAULT NULL COMMENT '地址',
  `ZIP` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `LEVEL_ID` int(11) DEFAULT NULL COMMENT '供应商等级编码',
  `LEVEL_NAME` varchar(200) DEFAULT NULL COMMENT '供应商等级名称',
  `SOURCE_ID` int(11) DEFAULT NULL COMMENT '供应商来源编码',
  `SOURCE_NAME` varchar(200) DEFAULT NULL COMMENT '供应商来源名称',
  `NATURE_ID` int(11) DEFAULT NULL COMMENT '供应商公司性质编码',
  `NATURE_NAME` varchar(200) DEFAULT NULL COMMENT '供应商公司性质名称',
  `INDUSTRY_ID` int(11) DEFAULT NULL COMMENT '行业编码',
  `INDUSTRY_NAME` varchar(200) DEFAULT NULL COMMENT '行业名称',
  `MAIN_BUSINESS` varchar(1000) DEFAULT NULL COMMENT '主业务业',
  `SIZE_ID` int(11) DEFAULT NULL COMMENT '公司规模编码',
  `SIZE_NAME` varchar(200) DEFAULT NULL COMMENT '公司规模',
  `SETUP_DATE` date DEFAULT NULL COMMENT '注册时间',
  `CAPITAL` int(11) DEFAULT NULL COMMENT '注册资金',
  `CORPORATION` varchar(55) DEFAULT NULL COMMENT '法人',
  `CREDIT_ID` int(11) DEFAULT NULL COMMENT '信用编码',
  `CREDIT_NAME` varchar(55) DEFAULT NULL COMMENT '信用名称',
  `BANK` varchar(200) DEFAULT NULL COMMENT '开户银行',
  `ACCOUNT` varchar(55) DEFAULT NULL COMMENT '账号',
  `TAXNO` varchar(100) DEFAULT NULL COMMENT '税号',
  `SHARED` varchar(200) DEFAULT NULL COMMENT '共享人(以逗号分隔)',
  `PID` int(11) DEFAULT NULL COMMENT '供应商父项',
  `ATTACHMENT_ID` int(11) DEFAULT NULL COMMENT '附件编码',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '描述',
  `BUYER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `BUYER_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名称',
  `BUYER_ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '供应商组织编码',
  `BUYER_ORGANIZATION_NAME` varchar(55) DEFAULT NULL COMMENT '供应商组织名称',
  `SUPLIER_STATUS` char(1) DEFAULT NULL COMMENT '客户状态 T:交易中，S:禁用',
  `CLASS_NAME` varchar(200) DEFAULT NULL COMMENT '供应商类型名称',
  `EMP_COUNT` int(11) DEFAULT NULL,
  `TOTAL_SALES` varchar(55) DEFAULT NULL COMMENT '销售额',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL,
  `DEDUCTION_TAX` char(1) DEFAULT NULL COMMENT '1:不含税，2:含税',
  `TAX` int(11) DEFAULT NULL COMMENT '税率',
  PRIMARY KEY (`SUPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suplier`
--

LOCK TABLES `suplier` WRITE;
/*!40000 ALTER TABLE `suplier` DISABLE KEYS */;
INSERT INTO `suplier` VALUES (1,'12312','3123123','I','2013-06-26','2013-06-26',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',NULL,'',NULL,NULL,'T','',NULL,'',NULL,'','Y',NULL),(2,'teste','testes','A','2013-06-26','2013-06-26',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,4,'123123123','',NULL,NULL,'',NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',NULL,'',NULL,NULL,'T','',NULL,'',NULL,'','Y',NULL),(3,'123123','123123','A','2013-07-01','2013-07-11',1,1,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'',NULL,NULL,NULL,'',NULL,'','',NULL,'',NULL,NULL,'',NULL,'','','','',NULL,NULL,NULL,'',NULL,'',NULL,NULL,'T','',NULL,'',1,'人民币','Y',NULL);
/*!40000 ALTER TABLE `suplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suplier_contact`
--

DROP TABLE IF EXISTS `suplier_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suplier_contact` (
  `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商联系人编码',
  `SUPLIER_ID` int(11) DEFAULT NULL COMMENT '供应商编码',
  `CLASS_ID` int(11) DEFAULT NULL COMMENT '联系人类型编码',
  `NAME` varchar(55) DEFAULT NULL COMMENT '联系人名称',
  `SEX_ID` int(11) DEFAULT NULL COMMENT '性别编码',
  `CLASS_NAME` varchar(255) DEFAULT NULL COMMENT '联系人类型名称',
  `SEX_NAME` varchar(10) DEFAULT NULL COMMENT '性别名称',
  `ORGANIZATION` varchar(255) DEFAULT NULL COMMENT '部门',
  `DUTY` varchar(255) DEFAULT NULL COMMENT '职务',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `QQ` varchar(25) DEFAULT NULL COMMENT 'QQ',
  PRIMARY KEY (`CONTACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suplier_contact`
--

LOCK TABLES `suplier_contact` WRITE;
/*!40000 ALTER TABLE `suplier_contact` DISABLE KEYS */;
INSERT INTO `suplier_contact` VALUES (2,2,NULL,'123123',NULL,NULL,'F',NULL,'123','123','qwe@qq.com',NULL,'123','A','2013-06-26','2013-06-26',1,1,'123'),(3,3,NULL,'12312',NULL,NULL,'M',NULL,'123','123','123@q.com',NULL,'123','A','2013-07-01','2013-07-11',1,1,'123');
/*!40000 ALTER TABLE `suplier_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suplier_terms`
--

DROP TABLE IF EXISTS `suplier_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suplier_terms` (
  `TERM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商交易编码',
  `STATUS` char(255) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `SUPLIER_ID` int(11) NOT NULL COMMENT '供应商编码',
  `SUPLIER_NAME` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `PAY_PERIOD` char(2) DEFAULT NULL COMMENT '结款周期',
  `PAY_METHOD` char(2) DEFAULT NULL COMMENT '结款方式',
  `PERIOD_DAY` int(11) DEFAULT NULL COMMENT '结款基准日',
  `MIN_AMOUNT` float DEFAULT NULL COMMENT '最小订货金额',
  `CURRENCY_ID` int(11) DEFAULT NULL COMMENT '币别编码',
  `CURRENCY_NAME` varchar(55) DEFAULT NULL COMMENT '币别名称',
  `INVOICE_TYPE` int(11) DEFAULT NULL COMMENT '发票类型',
  `INVOICE_FOLLOW` char(1) DEFAULT NULL COMMENT '是否随货带发票',
  `DISCOUNT_NO` int(11) DEFAULT NULL COMMENT '折扣',
  `DELIVER_TYPE` int(11) DEFAULT NULL COMMENT '配送方式',
  `FREIGHT_PAYER` int(11) DEFAULT NULL COMMENT '运费支付方式',
  `SALE_TYPE` int(11) DEFAULT NULL COMMENT '销售方式',
  `TERM_STATUS` char(1) DEFAULT NULL COMMENT '交易状态',
  PRIMARY KEY (`TERM_ID`),
  KEY `FK_SUPLIER_TERMS1` (`SUPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suplier_terms`
--

LOCK TABLES `suplier_terms` WRITE;
/*!40000 ALTER TABLE `suplier_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `suplier_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_code`
--

DROP TABLE IF EXISTS `system_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_code` (
  `CODE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统代码自动ID',
  `CODE_MYID` varchar(100) DEFAULT NULL COMMENT '系统代码编码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '系统代码名称',
  `SORT` int(10) DEFAULT NULL COMMENT '系统代码排序',
  `TYPE` char(1) DEFAULT NULL COMMENT 'M模块 D词典',
  `ICONCLS` varchar(100) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `PERMISSIONID` int(11) DEFAULT NULL COMMENT '父项模块ID',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '系统代码父项ID',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='系统代码资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_code`
--

LOCK TABLES `system_code` WRITE;
/*!40000 ALTER TABLE `system_code` DISABLE KEYS */;
INSERT INTO `system_code` VALUES (1,'projectClass','项目类型',NULL,'D','icon-edit','closed',1,87,'234234234','A','2013-04-19 00:00:00','2013-06-20 14:27:20',NULL,1),(2,NULL,'大型项目',1,'D','icon-edit','open',1,1,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(3,NULL,'中型项目',2,'D','icon-edit','open',1,1,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(4,'','小型项目',3,'D','icon-edit','open',1,1,'','A','2013-04-19 00:00:00','2013-06-19 16:51:38',NULL,1),(5,'projectSource','项目来源',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(6,NULL,'企业招标',1,'D','icon-edit','open',1,5,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(7,NULL,'熟人介绍',2,'D','icon-edit','open',1,5,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(8,'customerClass','客户类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(9,NULL,'经销商',1,'D','icon-edit','open',1,8,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(10,NULL,'潜在客户',3,'D','icon-edit','open',1,8,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(11,NULL,'合作伙伴',2,'D','icon-edit','open',1,8,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(12,'customerSource','客户来源',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(13,NULL,'电话来访',1,'D','icon-edit','open',1,12,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(14,NULL,'客户介绍',2,'D','icon-edit','open',1,12,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(15,NULL,'公开招标',3,'D','icon-edit','open',1,12,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(16,'customerNature','客户性质',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(17,NULL,'国有企业',1,'D','icon-edit','open',1,16,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(18,NULL,'私营企业',2,'D','icon-edit','open',1,16,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(19,'customerLevel','客户级别',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(20,NULL,'一般客户',1,'D','icon-edit','open',1,19,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(21,NULL,'重要客户',2,'D','icon-edit','open',1,19,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(22,NULL,'VIP客户',3,'D','icon-edit','open',1,19,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(23,'companySize','公司规模',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(24,NULL,'1-50人',1,'D','icon-edit','open',1,23,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(25,NULL,'51-100人',2,'D','icon-edit','open',1,23,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(26,NULL,'101-200人',3,'D','icon-edit','open',1,23,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(27,'credit','信用',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(28,NULL,'高',1,'D','icon-edit','open',1,27,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(29,NULL,'中',2,'D','icon-edit','open',1,27,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(30,NULL,'低',3,'D','icon-edit','open',1,27,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(31,'industry','行业',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(32,NULL,'食品',1,'D','icon-edit','open',1,31,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(33,'position','职位',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(34,NULL,'销售',1,'D','icon-edit','open',1,33,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(35,NULL,'采购',2,'D','icon-edit','open',1,33,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(36,NULL,'仓库管理员',3,'D','icon-edit','open',1,33,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(37,'title','职等',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(38,NULL,'060',1,'D','icon-edit','open',1,37,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(39,NULL,'070',2,'D','icon-edit','open',1,37,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(40,NULL,'080',3,'D','icon-edit','open',1,37,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(41,'sex','性别',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(42,NULL,'男',1,'D','icon-edit','open',1,41,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(43,NULL,'女',2,'D','icon-edit','open',1,41,NULL,'A','2013-04-19 00:00:00',NULL,NULL,NULL),(45,'planClass','计划类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-03 00:00:00',NULL,NULL,NULL),(46,NULL,'月计划',1,'D','icon-edit','open',1,45,NULL,'A','2013-05-03 00:00:00',NULL,NULL,NULL),(47,NULL,'季度计划',2,'D','icon-edit','open',1,45,NULL,'A','2013-05-03 00:00:00',NULL,NULL,NULL),(48,NULL,'年计划',3,'D','icon-edit','open',1,45,NULL,'A','2013-05-03 00:00:00',NULL,NULL,NULL),(50,'suplierClass','供应商类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(51,NULL,'食品供应商',1,'D','icon-edit','open',1,50,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(52,NULL,'百货供应商',2,'D','icon-edit','open',1,50,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(53,'suplierContactClass','供应商联系人类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(54,NULL,'业务员',1,'D','icon-edit','open',1,53,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(55,NULL,'业务经理',2,'D','icon-edit','open',1,53,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(56,NULL,'公司老总',3,'D','icon-edit','open',1,53,NULL,'A','2013-05-09 00:00:00',NULL,NULL,NULL),(57,'unit','单位',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(58,NULL,'个',1,'D','icon-edit','open',1,57,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(59,NULL,'件',2,'D','icon-edit','open',1,57,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(60,NULL,'套',3,'D','icon-edit','open',1,57,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(61,'purchaseClass','采购类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(62,NULL,'普通采购',1,'D','icon-edit','open',1,61,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(63,NULL,'紧急采购',2,'D','icon-edit','open',1,61,NULL,'A','2013-05-10 00:00:00',NULL,NULL,NULL),(64,'deliveryMode','交货方式',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(65,NULL,'物流公司',1,'D','icon-edit','open',1,64,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(66,NULL,'客户自提',2,'D','icon-edit','open',1,64,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(67,'payMode','支付方式',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(68,NULL,'现金',1,'D','icon-edit','open',1,67,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(69,NULL,'支票',2,'D','icon-edit','open',1,67,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(70,NULL,'转账',3,'D','icon-edit','open',1,67,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(71,'invoiceClass','发票类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(72,NULL,'增值税发票',1,'D','icon-edit','open',1,71,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(73,NULL,'普通发票',2,'D','icon-edit','open',1,71,NULL,'A','2013-05-11 00:00:00',NULL,NULL,NULL),(74,'followClass','跟踪类型',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(75,NULL,'一般跟踪',1,'D','icon-edit','open',1,74,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(76,NULL,'重点跟踪',2,'D','icon-edit','open',1,74,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(77,'followStatus','跟踪状态',NULL,'D','icon-edit','closed',1,87,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(78,NULL,'已立项',1,'D','icon-edit','open',1,77,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(79,NULL,'已签约',2,'D','icon-edit','open',1,77,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(80,NULL,'已下单',3,'D','icon-edit','open',1,77,NULL,'A','2013-05-30 00:00:00',NULL,NULL,NULL),(87,'','系统管理',NULL,'M','icon-pro','closed',1,NULL,'','A','2013-06-19 15:33:37','2013-06-20 14:08:11',1,1),(89,'123','123123',123,'D','icon-back',NULL,1,4,'123123123','A','2013-06-20 10:52:10','2013-06-20 10:52:27',1,1),(94,'','参数管理',NULL,'M','icon-edit','closed',6,NULL,'','A','2013-06-20 13:32:55','2013-06-20 14:23:33',1,1),(105,'','tttttt',111,'D','icon-edit','closed',6,94,'111111','A','2013-06-20 14:04:52','2013-06-20 15:48:46',1,1),(106,'123','123',123,'D','icon-back','open',6,105,'123123','A','2013-06-20 14:05:12','2013-06-20 14:21:05',1,1),(112,'123','123',123,'D','icon-bug','closed',6,94,'132123123123123','A','2013-06-22 13:45:28','2013-06-22 13:45:46',1,1),(113,'123','123',123123,'D','icon-remove','open',6,105,'123123123','A','2013-06-22 13:46:06','2013-06-22 13:46:06',1,1),(114,'123','123',123,'D','icon-adds','open',6,112,'123123','A','2013-06-22 13:46:21','2013-06-22 13:46:37',1,1),(115,NULL,'公司管理',NULL,'M','icon-comp','closed',3,NULL,NULL,'I','2013-06-24 08:45:34','2013-06-24 09:39:14',1,1),(116,'eerte','testee',1,'D','','closed',3,115,'','I','2013-06-24 08:45:34','2013-06-24 09:38:25',1,1),(121,'11','eeeee',2,'D','','open',6,NULL,'','A','2013-06-24 08:52:33','2013-06-24 08:52:33',1,1),(123,'123','123',123,'D','','open',1,87,'123123','A','2013-06-24 08:53:26','2013-06-24 08:53:26',1,1),(124,'123','123',123,'D','','open',6,121,'123132132','A','2013-06-24 08:53:37','2013-06-24 08:53:37',1,1),(125,'123','123',123,'D','','open',6,121,'132123132','A','2013-06-24 08:53:58','2013-06-24 08:53:58',1,1),(126,'123123','123123',12312,'D','','closed',3,115,'3123123123','I','2013-06-24 09:24:12','2013-06-24 09:38:12',1,1),(127,'123','123',123,'D','','closed',3,115,'123123123123','I','2013-06-24 09:24:34','2013-06-24 09:38:10',1,1),(128,'123','123',123,'D','','open',3,115,'123123123','I','2013-06-24 09:24:53','2013-06-24 09:38:09',1,1),(129,'123','dadaad',123,'D','','open',3,115,'dadad','I','2013-06-24 09:25:41','2013-06-24 09:38:07',1,1),(130,'123','123',123,'D','','open',3,116,'123123','I','2013-06-24 09:37:57','2013-06-24 09:38:22',1,1),(131,'123','123123',123,'D','','closed',3,115,'123123123','I','2013-06-24 09:38:39','2013-06-24 09:39:13',1,1),(132,'132','1231',13123,'D','','open',3,131,'12312312313213213223','I','2013-06-24 09:38:52','2013-06-24 09:39:11',1,1),(133,NULL,'公司管理',NULL,'M','icon-comp','closed',3,NULL,NULL,'A','2013-06-24 09:39:30','2013-06-24 09:39:30',1,1),(134,'123','123123',123123,'D','','closed',3,133,'123123123','A','2013-06-24 09:39:30','2013-06-24 09:39:30',1,1),(135,'123','123',NULL,'D','','open',3,134,'123213132123','A','2013-06-24 09:39:44','2013-06-24 09:39:44',1,1),(136,'123','123',123,'D','','open',3,134,'123123123123','A','2013-06-24 09:39:57','2013-06-24 09:39:57',1,1),(137,'','201-500人',NULL,'D','icon-tip','open',1,23,'','A','2013-06-24 16:58:30','2013-06-24 16:58:30',1,1);
/*!40000 ALTER TABLE `system_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_info` (
  `SYSTEM_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '系统代码',
  `NAME` varchar(50) DEFAULT NULL COMMENT '系统名称',
  `VERSION` varchar(50) DEFAULT NULL COMMENT '系统版本',
  `CODE` varchar(50) DEFAULT NULL COMMENT '服务器代码',
  `LICENSED` varchar(50) DEFAULT NULL COMMENT '许可',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_info`
--

LOCK TABLES `system_info` WRITE;
/*!40000 ALTER TABLE `system_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `TERM_ID` int(11) NOT NULL,
  `STATUS` char(255) DEFAULT NULL,
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_copy`
--

DROP TABLE IF EXISTS `terms_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms_copy` (
  `TERM_ID` int(11) NOT NULL,
  `STATUS` char(255) DEFAULT NULL,
  `CREATED` date DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` date DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_copy`
--

LOCK TABLES `terms_copy` WRITE;
/*!40000 ALTER TABLE `terms_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `USERPWD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `sdfsf` (`PID`),
  CONSTRAINT `sdfsf` FOREIGN KEY (`PID`) REFERENCES `test` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,NULL,'13123','123123');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '用户代码',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色代码',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROLE1` (`USER_ID`),
  KEY `FK_USER_ROLE2` (`ROLE_ID`),
  CONSTRAINT `FK_USER_ROLE1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FK_USER_ROLE2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='用户角色资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,2,2,'I','2013-05-24 00:00:00','2013-06-22 13:43:22',1,1),(3,2,3,'I','2013-05-29 00:00:00','2013-06-22 13:43:22',1,1),(4,2,4,'I','2013-05-29 00:00:00','2013-06-22 13:43:22',1,1),(5,2,5,'I','2013-05-29 00:00:00','2013-06-22 13:43:22',1,1),(6,2,6,'I','2013-05-29 00:00:00','2013-06-22 13:43:22',1,1),(10,1,1,'A','2013-05-29 00:00:00','2013-06-14 00:00:00',1,1),(11,1,2,'I','2013-05-29 00:00:00','2013-06-14 00:00:00',1,1),(12,1,3,'I','2013-05-29 00:00:00','2013-06-14 00:00:00',1,1),(13,1,4,'I','2013-05-29 00:00:00','2013-06-14 00:00:00',1,1),(14,1,5,'I','2013-05-29 00:00:00','2013-06-14 00:00:00',1,1),(15,1,6,'I','2013-05-29 00:00:00','2013-06-14 00:00:00',1,1),(16,2,1,'I','2013-05-29 00:00:00','2013-06-22 13:43:22',1,1),(17,2,7,'I','2013-06-04 00:00:00','2013-06-22 13:43:22',1,1),(18,13,2,'A','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(19,13,3,'A','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(20,13,4,'A','2013-06-14 00:00:00','2013-06-14 00:00:00',1,1),(21,23,10,'I','2013-06-19 00:00:00','2017-05-05 18:37:09',1,1),(22,24,10,'A','2013-06-21 09:21:45','2013-07-11 14:25:26',1,1),(23,23,4,'A','2013-06-22 13:42:32','2017-05-05 18:37:09',1,1),(24,23,3,'A','2013-06-22 13:42:32','2017-05-05 18:37:09',1,1),(25,25,11,'A','2013-05-24 00:00:00','2013-06-22 13:43:22',1,1),(26,23,2,'A','2017-05-05 18:37:09','2017-05-05 18:37:09',1,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户代码',
  `MYID` varchar(50) DEFAULT NULL COMMENT '用户自编码',
  `ACCOUNT` varchar(50) DEFAULT NULL COMMENT '账号',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `ORGANIZE_ID` int(11) DEFAULT NULL COMMENT '组织代码',
  `ORGANIZE_NAME` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `DUTY_ID` int(11) DEFAULT NULL COMMENT '称位代码 表:SYSTEM_CODE  position',
  `TITLE_ID` int(11) DEFAULT NULL COMMENT '职等代码 表:SYSTEM_CODE  title',
  `PASSWORD` varchar(128) DEFAULT NULL COMMENT '密码',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `LANG` varchar(20) DEFAULT NULL COMMENT '语言',
  `THEME` varchar(20) DEFAULT NULL COMMENT '样式',
  `FIRST_VISIT` datetime DEFAULT NULL COMMENT '第一次登录',
  `PREVIOUS_VISIT` datetime DEFAULT NULL COMMENT '上一次登录',
  `LAST_VISITS` datetime DEFAULT NULL COMMENT '最后一次登录',
  `LOGIN_COUNT` int(10) DEFAULT NULL COMMENT '登录资数',
  `ISEMPLOYEE` int(1) DEFAULT NULL COMMENT '是否是职工',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
  `QUESTION_ID` int(10) DEFAULT NULL COMMENT '问题代码',
  `ANSWER` varchar(100) DEFAULT NULL COMMENT '回复',
  `ISONLINE` int(1) DEFAULT NULL COMMENT '是否在线',
  `CREATED` datetime DEFAULT NULL COMMENT '创造日期',
  `LASTMOD` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  `TEL` varchar(30) DEFAULT NULL COMMENT '用户电话',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='用户资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin',2,'MIS',NULL,NULL,'admin','12@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'111111',NULL,NULL,NULL,NULL,'2013-06-14 00:00:00',1,1,'1111111'),(2,'root','root','root',2,'MIS',NULL,NULL,'root','123@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'12312312323',NULL,NULL,NULL,NULL,'2013-06-19 00:00:00',1,1,'123'),(13,'gsdgsgdsgdg','123','twerywrt',4,'asdfasd',NULL,NULL,'ert','ewrtewrt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123',NULL,NULL,NULL,'2013-06-14 00:00:00','2013-06-14 00:00:00',1,1,'ert'),(14,'ttt','ttt','ttttttt',2,'MIS',NULL,NULL,'tt','ttt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'',NULL,NULL,NULL,'2013-06-14 00:00:00','2013-06-14 00:00:00',1,1,'tt'),(15,'234','234','234',1,'总经理室',NULL,NULL,'234','234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'234234234',NULL,NULL,NULL,'2013-06-14 00:00:00','2013-06-14 00:00:00',1,1,'342'),(16,'123','123','123',2,'MIS',NULL,NULL,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123',NULL,NULL,NULL,'2013-06-14 00:00:00','2013-06-14 00:00:00',1,1,'123'),(17,'12312','31231','2312',5,'12333',NULL,NULL,'312','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123123123123123324234',NULL,NULL,NULL,'2013-06-18 00:00:00','2013-06-18 00:00:00',1,1,'3123'),(18,'123','123','3123',4,'asdfasd',NULL,NULL,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123123123',NULL,NULL,NULL,'2013-06-18 00:00:00','2013-06-18 00:00:00',1,1,'132'),(19,'123','124','123',2,'MIS',NULL,NULL,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123',NULL,NULL,NULL,'2013-06-18 00:00:00','2013-06-18 00:00:00',1,1,'123'),(20,'123','3123','123',12,'123',NULL,NULL,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123123123',NULL,NULL,NULL,'2013-06-18 00:00:00','2013-06-19 00:00:00',1,1,'123'),(21,'test','test','test',2,'MIS',NULL,NULL,'test','test@163.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'',NULL,NULL,NULL,'2013-06-19 00:00:00','2013-06-19 00:00:00',1,1,'111'),(22,'123','123','123',NULL,'',NULL,NULL,'123','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',NULL,'123123123',NULL,NULL,NULL,'2013-06-19 00:00:00','2013-06-19 00:00:00',1,1,'123'),(23,'test','test','test',1,'总经理室',NULL,NULL,'test','atest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'测试账号',NULL,NULL,NULL,'2013-06-19 00:00:00','2013-06-19 00:00:00',1,1,'123123'),(24,'hy','ww','ee',1,'总经理室',NULL,NULL,'ee','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'123',NULL,NULL,NULL,'2013-06-21 09:19:56','2013-06-24 15:00:14',1,1,'123'),(25,'tianyi','tianyi','tianyi',2,'MIS',NULL,NULL,'tianyi2017','2881693650@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'111111',NULL,NULL,NULL,NULL,'2013-06-14 00:00:00',1,1,'1111111');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `WAREHOUSE_ID` int(11) NOT NULL COMMENT '仓库编码',
  `NAME` varchar(55) DEFAULT NULL COMMENT '仓库名称',
  `MYID` varchar(55) DEFAULT NULL COMMENT '仓库自编码',
  `ORGANIZATION_ID` int(11) DEFAULT NULL COMMENT '部门编码',
  `ORGANIZATION_NAME` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT '管理人编码',
  `MANAGER_NAME` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `TEL` varchar(55) DEFAULT NULL COMMENT '电话',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '地址',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '描述',
  `CREATED` date DEFAULT NULL,
  `LASTMOD` date DEFAULT NULL,
  `STATUS` char(1) DEFAULT 'A',
  `CREATER` int(10) DEFAULT NULL COMMENT '创建人',
  `MODIFYER` int(10) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`WAREHOUSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'物流仓','12',1,'1',1,'1','1','1','1','2013-07-01','2013-07-01','A',1,1);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-09  9:38:07
