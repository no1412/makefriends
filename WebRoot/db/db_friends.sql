/*
SQLyog Job Agent v11.24 (32 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 6.0.11-alpha-community : Database - friends
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Database structure for database `friends` */

CREATE DATABASE /*!32312 IF NOT EXISTS*/`friends` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `friends`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `admin` */

/*Table structure for table `interest` */

DROP TABLE IF EXISTS `interest`;

CREATE TABLE `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interestName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gbk;

/*Data for the table `interest` */

insert  into `interest`(`id`,`interestName`) values (1,'游戏'),(2,'地区'),(3,'生活'),(4,'明星'),(5,'情感'),(6,'爱好'),(7,'星座'),(8,'娱乐'),(9,'动漫'),(10,'体育'),(11,'运动健身'),(12,'旅行'),(13,'宠物'),(14,'饮食'),(15,'小说'),(16,'女性'),(17,'文艺'),(18,'综艺'),(19,'电视'),(20,'电影'),(21,'互联网'),(22,'学习');

/*Table structure for table `interestgroup` */

DROP TABLE IF EXISTS `interestgroup`;

CREATE TABLE `interestgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL,
  `groupBg` varchar(255) DEFAULT NULL,
  `groupDesc` varchar(255) DEFAULT NULL,
  `applyReason` varchar(255) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8C3D39951C2BBB45` (`interest_id`),
  CONSTRAINT `FK8C3D39951C2BBB45` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

/*Data for the table `interestgroup` */

insert   into `interestgroup`(`id`,`groupName`,`groupBg`,`groupDesc`,`applyReason`,`interest_id`) values (1,'Java小组开发讨论','img/head.jpg','专注java开发讨30年','本开发小组以java讨论为主',22),(2,'电影梦工产','img/6.jpg','专注movie30年','本开发小组电影为主',20);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `head_pic` varchar(255) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `registerTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

/*Data for the table `user` */

insert   into `user`(`id`,`userName`,`password`,`sex`,`email`,`signature`,`head_pic`,`experience`,`level`,`nickName`,`phoneNum`,`birth`,`idCard`,`registerTime`) values (1,'lilei','lilei','123','112088@qq.com','就想变成一只喵','img/head.jpg',0,'魔法','一只喵','1325566778','1995-03-22','410115567890','2016-05-22'),(2,'zhangsan','llasd',NULL,NULL,NULL,'img/head.jpg',0,NULL,'阿萨德会卡机收到',NULL,NULL,NULL,'2016-05-22'),(5,'kaige','kaige',NULL,NULL,NULL,'img/head.jpg',0,NULL,'开心',NULL,NULL,NULL,'2016-05-27');

/*Table structure for table `user_interestgroup` */

DROP TABLE IF EXISTS `user_interestgroup`;

CREATE TABLE `user_interestgroup` (
  `user_id` int(11) NOT NULL,
  `interestGroup_id` int(11) NOT NULL,
  PRIMARY KEY (`interestGroup_id`,`user_id`),
  KEY `FK71050801270D0925` (`user_id`),
  KEY `FK710508018F59728F` (`interestGroup_id`),
  CONSTRAINT `FK71050801270D0925` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK710508018F59728F` FOREIGN KEY (`interestGroup_id`) REFERENCES `interestgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `user_interestgroup` */

/*Table structure for table `userdynamic` */

DROP TABLE IF EXISTS `userdynamic`;

CREATE TABLE `userdynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6CA741F4270D0925` (`user_id`),
  CONSTRAINT `FK6CA741F4270D0925` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `userdynamic` */

/*Table structure for table `userdynamic_userdynamicpics` */

DROP TABLE IF EXISTS `userdynamic_userdynamicpics`;

CREATE TABLE `userdynamic_userdynamicpics` (
  `userDynamic_id` int(11) NOT NULL,
  `userDynamicPic_id` int(11) NOT NULL,
  PRIMARY KEY (`userDynamicPic_id`,`userDynamic_id`),
  KEY `FK59C14BF2F404F76F` (`userDynamic_id`),
  KEY `FK59C14BF2EAFAB785` (`userDynamicPic_id`),
  CONSTRAINT `FK59C14BF2EAFAB785` FOREIGN KEY (`userDynamicPic_id`) REFERENCES `userdynamicpic` (`id`),
  CONSTRAINT `FK59C14BF2F404F76F` FOREIGN KEY (`userDynamic_id`) REFERENCES `userdynamic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `userdynamic_userdynamicpics` */

/*Table structure for table `userdynamicpic` */

DROP TABLE IF EXISTS `userdynamicpic`;

CREATE TABLE `userdynamicpic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `userdynamicpic` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
