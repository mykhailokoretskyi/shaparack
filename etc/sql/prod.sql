-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: shaparack.com    Database: shaparack
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Current Database: `shaparack`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shaparack` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `shaparack`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `heading` varchar(256) DEFAULT NULL,
  `text` longtext,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seo_id` (`seo_id`),
  KEY `language_id` (`language_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`seo_id`) REFERENCES `seo` (`id`),
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
INSERT INTO `breeds` VALUES (5,'Persian','PER');
INSERT INTO `breeds` VALUES (6,'Scottish Fold Shorthair','SFS');
INSERT INTO `breeds` VALUES (7,'Scottish Fold Longhair','SFL');
INSERT INTO `breeds` VALUES (8,'Exotic Shorthair','EXO SH');
INSERT INTO `breeds` VALUES (9,'Exotic Longhair','EXO LH');
INSERT INTO `breeds` VALUES (10,'Persian-Himalayan','PER 33');
INSERT INTO `breeds` VALUES (11,'Scottish Straight Shorthair','SSS');
INSERT INTO `breeds` VALUES (12,'Scottish Straight Longhair','SSL');
INSERT INTO `breeds` VALUES (13,'British Shorthared','BRI SH');
INSERT INTO `breeds` VALUES (14,'British Longhair','BRI LH');
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_titles`
--

DROP TABLE IF EXISTS `cat_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_titles`
--

LOCK TABLES `cat_titles` WRITE;
/*!40000 ALTER TABLE `cat_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_id` int(11) DEFAULT NULL,
  `breed_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `breeder_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `hidden` char(1) NOT NULL,
  `is_for_sale` char(1) DEFAULT NULL,
  `is_my_star` char(1) DEFAULT NULL,
  `video_id` varchar(20) DEFAULT NULL,
  `show_pedigree` enum('Y','N') DEFAULT NULL,
  `is_new_born` char(1) DEFAULT NULL,
  `pedigree_number` varchar(256) NOT NULL DEFAULT 'Listed',
  `my_star_rank` int(11) DEFAULT NULL,
  `for_sale_rank` int(11) DEFAULT NULL,
  `new_born_rank` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `fk_PerColors` (`color_id`),
  KEY `fk_PerBreeds` (`breed_id`),
  KEY `fk_PerMother` (`mother_id`),
  KEY `fk_PerFather` (`father_id`),
  KEY `fk_PerOwner` (`owner_id`),
  KEY `fk_PerBreeder` (`breeder_id`),
  KEY `title_id` (`title_id`),
  CONSTRAINT `cats_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `cat_titles` (`id`),
  CONSTRAINT `fk_PerBreeder` FOREIGN KEY (`breeder_id`) REFERENCES `people` (`id`),
  CONSTRAINT `fk_PerBreeds` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`),
  CONSTRAINT `fk_PerColors` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `fk_PerFather` FOREIGN KEY (`father_id`) REFERENCES `cats` (`id`),
  CONSTRAINT `fk_PerMother` FOREIGN KEY (`mother_id`) REFERENCES `cats` (`id`),
  CONSTRAINT `fk_PerOwner` FOREIGN KEY (`owner_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats`
--

LOCK TABLES `cats` WRITE;
/*!40000 ALTER TABLE `cats` DISABLE KEYS */;
INSERT INTO `cats` VALUES (3,69,10,5,4,'M',2,2,'CH CFA Shaparack Ciao Bambino Sorry','2009-04-27','n','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (4,70,10,10,9,'M',2,3,'GC KittyStone\'s Nice Guy of Shaparack','2006-04-07','y',NULL,'n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (5,71,10,93,88,'F',2,2,'CH CFA Shaparack Santolina','2006-03-01','y','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (6,77,8,7,4,'F',2,2,'CH CFA Shaparack Fortuna','2008-07-18','y','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (7,73,8,112,8,'F',2,2,'Shaparack Lily','2006-06-08','y','n',NULL,'','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (8,76,8,134,133,'M',2,NULL,'Dolly\'s Boy Feri Tau of Shaparack','2000-07-20','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (9,75,10,65,129,'M',3,3,'CH Kittystone\'s Marty',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (10,74,10,63,64,'F',3,NULL,'CH Alomi\'s Disco Fever of Kittystone DM',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (11,32,5,19,16,'M',2,4,'GCH Katabears Buster of Shaparack','2011-09-03','n','n','n','aKxk4kUzfh4','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (12,75,8,13,3,'M',2,2,'Shaparack Zorian','2012-07-02','n','n','n','fb-miZs9UlA','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (13,76,8,6,150,'F',NULL,2,'CH Shaparack Zoryana','2011-07-16','y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (16,90,5,30,29,'M',4,4,'GCH, RW Katabears Slap Jack  ','2008-02-05','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (17,32,5,33,31,'M',3,NULL,'GC,RW Scrimshaw Ace Of Katabears','2004-08-10','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (19,32,5,32,31,'F',NULL,NULL,'GCH Scrimshaw In Cahots Of Katabears','2004-06-18','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (20,45,11,373,372,'M',2,5,'CH RUI Fant Gunnar Geliolend','2013-05-13','n','n','n','','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (22,37,5,89,187,'F',NULL,2,'UW RUI, GICH Shaparack Jein Elpedifora',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (23,77,8,24,25,'F',2,2,'CH CFA Shaparack Hope Forever','2013-11-10','n','n','n','A50hoOT-b6Q','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (24,72,9,6,236,'F',2,2,'CH CFA Shaparack Siren','2010-06-15','n','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (25,76,8,245,248,'M',2,2,'Shaparack Jerob','2012-04-15','y','y','n',NULL,'Y','n','Listed',NULL,0,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (26,79,8,247,25,'F',2,2,'Shaparack Zemfira','2014-11-21','n','n','n','w4x_1Wuztpw','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (27,76,8,244,25,'F',NULL,2,'Shaparack Sophy\'s Rose','2015-05-18','n','n','n',NULL,'Y','n','Listed',NULL,4,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (28,72,8,244,25,'F',7,2,'Shaparak\'s The Dark Lady','2015-05-17','n','n','n','5RBkblhtuX0','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (29,32,5,33,31,'M',NULL,NULL,'GC, RW Scrimshaw Ace of Katabears','2014-09-10','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (30,79,10,39,38,'F',NULL,NULL,'CH Katabears Star Burst','2004-05-03','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (31,32,5,35,40,'M',NULL,NULL,'GC Boberan\'s Midnight Escape DM','2001-04-29','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (32,32,5,37,36,'F',NULL,NULL,'GC, RW Scrimshaw Rumors DM','2000-08-25','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (33,32,5,37,36,'F',NULL,NULL,'Scrimshaw Mystries','2001-06-09','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (35,37,5,48,47,'F',NULL,NULL,'GC, GP, RW Boberan\'s Holiday DM','1999-06-15','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (36,32,5,49,47,'M',NULL,NULL,'GC, RW Boberan Shaq Attack of Scrimshaw','1996-05-26','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (37,32,5,51,50,'F',NULL,NULL,'GC, BW, NW Agonistes Scandals of Scrimshaw','1997-10-10','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (38,75,10,42,41,'M',NULL,NULL,'Callow End Evening Edition','1998-06-05','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (39,79,10,44,43,'F',NULL,NULL,'GC, RW Katabears Moonstruck','2001-09-29','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (40,34,5,53,52,'M',NULL,NULL,'GC, RW Jolee\'s Dune of Boberan DM','1994-08-01','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (41,75,10,NULL,NULL,'M',NULL,NULL,'GC, RW Desert Winds Gone To Extremes',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (42,78,10,NULL,NULL,'F',NULL,NULL,'GC, RW Furrshurr 1st Edition of Callow End',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (43,75,10,NULL,NULL,'M',NULL,NULL,'GC, RW Katabears Mooneyes of Newages',NULL,'y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (44,79,10,NULL,NULL,'F',NULL,NULL,'Callow End\'s Let\'s Go Boogie DM','1998-09-10','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (47,32,5,NULL,NULL,'M',NULL,NULL,'CH Blueskyeyes Falcon of Boberan DM',NULL,'y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (48,33,5,NULL,NULL,'F',NULL,NULL,'Boberan\'s Cherish DM',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (49,80,5,NULL,NULL,'F',NULL,NULL,'GC, RW Boberan\'s Love Attack DM',NULL,'y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (50,32,5,NULL,NULL,'M',NULL,NULL,'GC, BW, NW Agonistes Commotion of Scrimshaw',NULL,'y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (51,80,5,NULL,NULL,'F',NULL,NULL,'Agonistes Ragtime',NULL,'y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (52,32,5,NULL,NULL,'M',NULL,NULL,'GC Dalu\'s Primetime','1990-09-23','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (53,34,5,NULL,NULL,'F',NULL,NULL,'Jolee\'s Eliza of Dalu','1992-06-19','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (55,69,10,NULL,NULL,'F',NULL,NULL,'ICH Keystone Don\'t Tell Me No More',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (56,70,10,NULL,NULL,'M',NULL,NULL,'ICH Keystone Mr Flirt',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (57,74,10,NULL,NULL,'F',NULL,NULL,'GC, RW Teahs Winter Wonderland DM',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (58,82,5,NULL,NULL,'M',NULL,NULL,'GC Teahs Frosty DM',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (59,78,10,NULL,NULL,'F',NULL,NULL,'CH KJs Extra Tempting',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (61,74,10,NULL,NULL,'F',NULL,NULL,'CH Kittystone\'s Lullaby',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (62,75,10,NULL,NULL,'M',NULL,NULL,'CH Kittystone\'s Cliffhanger',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (63,69,10,55,56,'F',NULL,NULL,'Keystone She\'s So Bad ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (64,78,10,57,58,'M',NULL,NULL,'GC/IC Teahs Winter\'s Frost of Alomi',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (65,75,10,59,130,'F',NULL,NULL,'CH Protege\'s Cappuchino of Kittystone',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (69,70,10,233,196,'F',NULL,NULL,'AW SGCH Charlina Super Star',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (71,78,10,235,234,'F',NULL,NULL,'Peppelota Oskar',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (72,85,5,175,174,'M',NULL,NULL,'ICH RUI Barfrusi-Excelsior Dynamit',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (73,38,5,181,72,'F',NULL,NULL,'ICH Unona Monterrey',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (82,85,5,73,72,'M',2,NULL,'GICH,UW Monterrey Grand Man Show',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (84,70,10,69,109,'M',NULL,NULL,'GICH Charlina Snow Panter',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (85,74,10,71,84,'F',NULL,NULL,'Nolly Formula Uspeha',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (86,84,5,178,122,'F',NULL,NULL,'Shaparack Viki-Mitchel',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (87,78,10,85,84,'M',NULL,NULL,'CH CFA Vienu-Paskal Formula Uspeha',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (88,84,5,89,87,'M',NULL,NULL,'Shaparack Darling Boss',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (89,84,5,86,82,'F',NULL,NULL,'CH CFA Shaparack Riviera','1999-10-15','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (90,87,5,86,82,'F',NULL,NULL,'Shaparack Rufina of Gulianor',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (91,75,10,105,101,'M',NULL,NULL,'ICH Hermes Halifax',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (92,73,5,90,91,'F',NULL,NULL,'Gulianor Gabriella',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (93,79,10,92,91,'F',NULL,NULL,'Gulianor Gretta of Shaparack',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (94,88,10,5,4,'F',2,2,'CH CFA Shaparack Fanta','2008-08-20','n','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (95,71,10,5,4,'F',2,2,'CH CFA Shaparack Aurora',NULL,'n','n','y','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (97,32,5,112,91,'M',2,2,'Shaparack Deny De Vito ',NULL,'y',NULL,NULL,'','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (98,76,10,126,97,'F',2,2,'Shaparack Love Me Long','2006-03-14','y',NULL,'n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (99,69,5,NULL,NULL,'M',NULL,NULL,'GC Oakheaven’s Perino of Brigantina',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (100,75,5,NULL,NULL,'F',NULL,NULL,'GC Blueskyeyes Fortuna of Brigantina ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (101,75,10,100,99,'M',NULL,NULL,'GICH Brigantina\'s Wind in Moscow ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (102,35,5,NULL,NULL,'M',NULL,NULL,'GICH Charlina Dhonson Skypoint ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (104,75,10,NULL,NULL,'F',NULL,NULL,'CH RUI Veronessa Bomond ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (105,78,10,104,102,'F',NULL,NULL,'Shat D’Argent Kleo ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (106,89,5,NULL,NULL,'M',NULL,NULL,'ICH Light Air Charlie',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (107,37,5,NULL,NULL,'F',NULL,NULL,'CH CFA Light Air Lina',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (108,89,5,107,106,'M',NULL,NULL,'CH CFA, GCH RUI , UW Moon Best Charlie Brawn',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (109,78,5,232,231,'M',NULL,NULL,'AWGGCH Mountcascade Genteel of Franklina',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (110,NULL,5,NULL,NULL,'F',NULL,NULL,'AW SGC Prancenpaw\'s Simply Angelic',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (111,79,5,110,109,'F',NULL,NULL,'Franklina Francheska ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (112,32,5,111,108,'F',NULL,NULL,'Amadey’s Mjnica of Shaparack ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (122,83,5,180,179,'M',NULL,NULL,'GICH Madarasi Bajazzo',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (126,84,5,89,87,'F',NULL,NULL,'Shaparack White Zefyr ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (129,69,10,61,62,'M',NULL,NULL,'CH Kittystone\'s Crimson Flash ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (130,75,10,NULL,NULL,'M',NULL,NULL,'CH Purringwood\'s A Votre Plaisir ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (133,76,8,147,146,'M',NULL,NULL,'Taisson Viless ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (134,79,5,145,101,'F',NULL,NULL,'CH Nota Feri-Tau ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (135,34,5,NULL,NULL,'M',NULL,NULL,'CH Orange Boy Nightingale ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (136,38,5,137,135,'F',NULL,NULL,'Shaparack Happy Cat ','2001-04-01','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (137,35,5,NULL,NULL,'F',NULL,NULL,'Shaparack Arnela Nafanya ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (138,87,8,136,8,'M',2,2,'CH CFA Shaparack Orange Play Boy ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (139,75,5,NULL,NULL,'M',NULL,NULL,'CH Puffstuff Eugen Future Chance ',NULL,'y','n',NULL,'','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (140,79,5,NULL,NULL,'F',NULL,NULL,'CH Benua Polina Tender Kiss ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (141,79,5,140,139,'F',NULL,NULL,'ECH, UW, CH CFA Benua Rosie Philadelfia ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (142,77,8,141,8,'F',NULL,NULL,'Benua Samela Garden ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (143,77,8,142,138,'F',NULL,NULL,'Shaparack Una Donna ','2006-04-21','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (144,77,8,143,4,'F',2,NULL,'UW RUI , CH CFA Shaparack Angel Kiss','2008-09-24','y','n','y','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (145,37,5,173,172,'F',NULL,NULL,'Una Sandra ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (146,92,8,169,168,'M',NULL,NULL,'GECH Limbo Viless ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (147,79,10,170,171,'F',NULL,NULL,'Alilat ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (148,79,10,92,91,'F',NULL,NULL,'Gulianor Cleopa ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (149,70,10,148,87,'M',NULL,NULL,'CH CFA Gulianor Persey ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (150,76,8,143,149,'M',2,2,'CH CFA Shaparack Dynamite','2007-07-25','y','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (151,91,8,NULL,NULL,'M',NULL,NULL,'GCH Del Adene J’Bustopher ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (152,37,8,NULL,NULL,'F',NULL,NULL,'GCH CFA Becton’s Desert–Daze, DM ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (153,32,8,152,151,'F',NULL,NULL,'CH CFA Becton’s Last Desert Dence ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (154,93,8,NULL,NULL,'F',NULL,NULL,'CH CFA Kikicat Lady Ambassador ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (155,93,8,154,156,'M',NULL,NULL,'GC CFA Massar’s Godfather of Vita-Nova ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (156,91,8,NULL,NULL,'M',NULL,NULL,'GCH CFA Dancecat’s Dancing Dude ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (157,92,8,153,155,'F',NULL,NULL,'CH CFA Vita-Nova’s Irish Cream ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (158,84,8,NULL,NULL,'M',NULL,NULL,'GC CFA Patina Charlie Chan of Vita-Nova ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (159,93,8,NULL,NULL,'F',NULL,NULL,'CH CFA Kikicat Choir Girl of Vita-Nova ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (160,95,8,NULL,NULL,'M',NULL,NULL,'CH CFA Vita-Nova’s Mario of Doll Like ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (161,37,8,NULL,NULL,'F',NULL,NULL,'Ursa Major Velvet Toy ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (162,94,8,161,160,'F',NULL,NULL,'CH CFA Dooll Like’s Golden Peas ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (163,96,8,162,164,'M',NULL,NULL,'CH CFA Doll Like’s Sweet Kaif',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (164,97,8,159,158,'M',NULL,NULL,'CH CFA Vita-Nova’s Silver Tigriss ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (165,91,8,157,163,'M',NULL,NULL,'CH CFA Soft Baby’s Better Bear ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (166,73,8,89,165,'F',2,2,'CH CFA, UW ICH Shaparack Queen Margo','2003-05-12','y','n','y','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (167,84,8,89,8,'F',2,2,'CH CFA Shaparack Viola','2006-06-10','y','n','y','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (168,92,8,NULL,NULL,'M',NULL,NULL,'WCH Verdzin Smaragd ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (169,79,10,NULL,NULL,'F',NULL,NULL,'ICH Stachys Cassiopeia ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (170,79,10,NULL,NULL,'F',NULL,NULL,'Assol ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (171,69,10,NULL,NULL,'M',NULL,NULL,'Vohan Baruh ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (172,84,5,NULL,NULL,'M',NULL,NULL,'CH Xanf-Enrique Glory of Ellen ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (173,79,10,NULL,NULL,'F',NULL,NULL,'CH Felinidad’s Ephraina Bolero ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (174,35,5,NULL,NULL,'M',NULL,NULL,'ICH Mister Marvellous ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (175,38,5,NULL,NULL,'F',NULL,NULL,'CH My Bluecream Early ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (176,34,5,NULL,NULL,'M',NULL,NULL,'CH Berrimor Kolhause ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (177,37,5,NULL,NULL,'F',NULL,NULL,'Elizabeth de Montegue ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (178,37,5,177,176,'F',NULL,NULL,'Ledy Mack Night PER: tortoiseshell',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (179,84,5,NULL,NULL,'M',NULL,NULL,'Eger-Csillaga Apollo ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (180,84,5,NULL,NULL,'F',NULL,NULL,'Naplemente Faxni ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (181,35,5,NULL,NULL,'F',NULL,NULL,'Biatriche Armand Viardo ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (182,37,8,89,8,'F',2,2,'CH CFA, ICH RUI Shaparack Mersedes','2002-02-22','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (183,76,9,NULL,NULL,'F',2,2,'Shaparack Anyuta','2004-08-30','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (184,79,8,182,87,'F',2,2,'CH CFA Shaparack Kapitoshka','2005-09-05','y','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (185,84,5,NULL,NULL,'F',NULL,2,'UW RUI, ICH Shaparack El Bonietta',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (186,83,5,NULL,NULL,'M',NULL,NULL,'UW Shaparack George Maickl',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (187,86,5,NULL,NULL,'M',NULL,2,'UW RUI Shaparack Zerro Cwazimodo',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (188,84,8,89,8,'F',NULL,2,'UW RUI, CH Shaparack Nefertity',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (189,38,5,NULL,NULL,'F',NULL,2,'UW RUI, ECH Shaparack Anabell Laila',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (190,73,5,NULL,NULL,'F',NULL,2,'CH CFA, UW RUI, ECH Shaparack Jasmin',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (191,87,5,136,8,'M',NULL,2,'UW RUI, GICH Shaparack Viking',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (192,123,8,136,8,'F',2,NULL,'UW RUI, ICH Etoile Alf Of Shaparak',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (194,86,5,89,8,'F',NULL,NULL,'ICH, UW RUI Shaparack Naina Of Fancy Tails',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (195,87,8,89,NULL,'M',NULL,NULL,'GCH, BW, UW RUI  Shaparak\'s Tarasik',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (196,69,5,NULL,NULL,'M',NULL,NULL,'AW GGCH Prancenpaw\'s Kiss Me Again ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (197,38,5,NULL,NULL,'F',NULL,NULL,'CH(CFA) Pransenpaws Dolli of Franklina',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (198,74,5,NULL,NULL,'F',NULL,NULL,'GC(CFA) Catley Crue Cuddle Bug of Oakheaven ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (200,74,10,198,99,'F',NULL,NULL,'Brigantina\'s Cuddle Star of Kupava ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (201,94,5,197,196,'M',NULL,NULL,'Franklina Phlegm ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (202,78,10,200,201,'M',NULL,NULL,'CH(WCF) Kupava\'s Playboy ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (203,75,10,211,99,'M',NULL,NULL,'ECH(WCF) Brigantina\'s Flint ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (204,70,10,212,99,'F',NULL,NULL,'GICH(WCF) Brigantina\'s Felicita of Bayun ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (205,34,5,204,203,'M',NULL,NULL,'CH(CFA) Bayun\'s Cheddar PER:cream point',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (206,76,10,214,213,'M',NULL,NULL,'GC(CFA),NW Oakheaven\'s Hook, Line N Sinker ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (207,77,10,215,213,'F',NULL,NULL,'GC(CFA) Oakheaven\'s First Line ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (208,77,10,207,206,'F',NULL,NULL,'CH(CFA) Brigantina\'s Snow Line ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (209,88,10,208,205,'F',NULL,NULL,'CH(CFA) Golden Gate\'s Fortune Line',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (210,70,10,209,202,'M',NULL,NULL,'Lotus Land Vandyke ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (211,78,10,NULL,NULL,'F',NULL,NULL,'GC(CFA) Oakheaven\'s Bam Bam Bina ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (212,74,10,NULL,NULL,'F',NULL,NULL,'CH(CFA) Blueskyeyed Eye In The Sky ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (213,91,5,NULL,NULL,'M',NULL,NULL,'GC(CFA) Oakheaven\'s My Ship Came In ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (214,75,10,NULL,NULL,'F',NULL,NULL,'GC(CFA) Purringwood\'s Born To Please ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (215,79,5,NULL,NULL,'F',NULL,NULL,'CH(CFA) Oakheaven\'s Cotton Blend ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (216,72,5,208,205,'F',NULL,NULL,'Golden Gate\'s Fluffy Line ',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (217,72,10,216,210,'F',2,2,'Valtrof Mashery Of Shaparack','2005-11-10','y','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (218,77,8,NULL,NULL,'F',NULL,NULL,'Shaparack Karlya',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (219,87,9,NULL,NULL,'F',NULL,NULL,'Shaparack Red Rouse','2006-04-10','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (221,121,8,166,NULL,'F',3,2,'Shaparack Love Story of Kittystone','2006-04-10','y','n','y','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (228,75,9,NULL,NULL,NULL,NULL,NULL,'Shaparack Pretty Girl','2005-09-05','y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (229,75,8,182,87,'F',NULL,2,'Shaparack Felichita','2005-09-05','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (231,78,10,NULL,NULL,'M',NULL,NULL,'GCH Careyata Blue of Mountcascade ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (232,74,10,NULL,NULL,'F',NULL,NULL,'TeahsT.L.C. Mountcascade ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (233,79,10,NULL,NULL,'F',NULL,NULL,'ICH Charlina Alisa Jana ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (234,78,10,NULL,NULL,'M',NULL,NULL,'GICH Ciccony Colud ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (235,75,5,NULL,NULL,'F',NULL,NULL,'Vanda Sakura ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (236,88,10,5,4,'M',2,2,' Shaparack Oskar',NULL,'y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (237,71,8,5,251,'F',2,2,'Shaparack Deniz My Dream',NULL,'n','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (238,88,8,245,25,'M',2,2,'CH CFA Shaparack Hope For Miracle','2013-10-02','n','n','n','X-TKxWVcrps','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (239,76,8,244,25,'M',2,2,'CH CFA Shaparack Moving to California','2013-06-03','y','n','y',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (240,37,5,279,278,'F',2,9,'CH CFA Redfire Apple Pie Of Shaparack','2011-07-07','n','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (241,45,6,338,337,'F',2,2,'CH RUI Shaparack Bony',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (243,69,10,5,4,'M',NULL,2,'UW RUI Shaparack Odessa Souvenir',NULL,'y','n','y','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (244,77,8,144,3,'F',2,2,'Shaparack Vasilisa','2011-09-16','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (245,77,8,142,87,'F',2,2,'Shaparack Katrin','2004-09-29','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (246,71,8,142,8,'M',2,2,'Shaparack Lion','2005-03-10','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (247,77,8,143,4,'F',2,2,'Shaparack Catherina','2009-10-11','y','n','n','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (248,94,9,166,4,'M',NULL,2,'CH CFA, GIC RUI Shaparack Dance-of-Fire','2009-12-07','y','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (249,122,8,NULL,NULL,'F',2,NULL,'CH, UW RUI Etoile Andromeda of Shaparack','2002-08-26','y',NULL,'y','',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (250,79,9,237,11,'F',2,2,'Shaparack Domino','2015-07-02','n','n','n','at1r4NBizQA','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (251,71,8,254,3,'M',2,2,'Shaparack Hollywood','2011-08-24','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (252,88,8,144,3,'F',2,2,'CH CFA Shaparack Kiss From Bambino','2012-07-25','n','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (253,71,8,247,25,'M',2,2,'Shaparack Tango','2013-06-08','n','n','n','1pXEasXkTmU','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (254,71,8,247,4,'F',2,2,'Shaparack Martrioshka','2010-08-20','y','n','n','','N',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (255,77,8,256,25,'F',NULL,2,'Shaparack\'s Grace','2015-05-10','y','n','n','dAiARRYB8Fc','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (256,72,8,94,150,'F',2,2,' Shaparack Violet','2012-09-12','y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (257,77,8,256,25,'F',NULL,2,'Shaparack\'s Teasing Georgia','2015-05-12','n','n','n','k3G03XoUf-8','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (258,70,10,NULL,NULL,'M',NULL,2,'Shaparack Mango',NULL,'y','n','y','AQBz9HWOzIk','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (259,75,8,6,150,'F',10,2,'GC CFA Shaparack Zoe Of Laureden  ',NULL,'y','n','y','_xesTyRd1Rk','N','n','Listed',2,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (261,74,8,94,150,'F',NULL,2,'GC CFA Shaparack Milena of Munchland',NULL,'y','n','y',NULL,'Y','n','Listed',3,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (262,77,8,NULL,NULL,'F',NULL,2,'GC CFA Shaparack Rada  of Munchland',NULL,'y','n','y',NULL,'N','n','Listed',2,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (263,71,8,6,12,'M',NULL,2,'Shaparack\'s Narcissus ','2015-04-24','y','n','y','7_EBrlT8YeA','Y','n','Listed',NULL,4,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (264,77,9,NULL,25,'F',2,2,'Shaparack Jubilee Celebration',NULL,'y','n','n','','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (265,70,10,267,266,'M',NULL,NULL,'CH Jeset\'s Willy Wonka Of Alomi',NULL,'y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (266,78,10,268,64,'M',NULL,NULL,'CH  Alomi\'s Ali Baba of Tallin',NULL,'y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (267,74,10,270,269,'F',NULL,NULL,'GC Jetset Partly Cloudy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (268,76,10,275,274,'F',NULL,NULL,'Purrbox Zignature of Alomi',NULL,'y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (269,69,10,277,276,'M',NULL,NULL,'GC Purrpals Victory of Laureden',NULL,'y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (270,74,10,NULL,NULL,'F',NULL,NULL,'GC Jetset Out-Of-The-Blue',NULL,'y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (271,99,10,272,265,'M',NULL,NULL,'CH CFA Alomi\'s Zuper Zonic Of Turmalin',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (272,NULL,10,310,309,'F',NULL,NULL,'Alomi\'s Follow Ur Blizz',NULL,'y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (273,79,10,315,271,'F',2,8,'Turmalin Mirabelle Of Shaparack','2013-04-14','y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (274,32,10,NULL,NULL,'M',NULL,NULL,'Katra\'s Charbon',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (275,99,10,NULL,NULL,'F',NULL,NULL,'Int.Ch. Sandypaws Carol-Line',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (276,70,10,NULL,NULL,'M',NULL,NULL,'CFA GC Purrpals Hercules',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (277,69,10,NULL,NULL,'F',NULL,NULL,'Jetset Miss Texas of Purrpals',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (278,32,5,290,289,'M',NULL,NULL,'CH Canastalion Javanais of Redfire',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (279,37,5,296,295,'F',NULL,NULL,'Maradan Malena of Redfire',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (280,35,5,NULL,NULL,'M',NULL,NULL,'GC Steeplechase Cadbury',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (281,86,5,NULL,NULL,'F',NULL,NULL,'Steeplechase Whiteout',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (282,33,5,281,280,'M',NULL,NULL,'Steeplechase One in a Million of Mushanga',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (283,34,5,285,284,'F',NULL,NULL,'Steeplechase Karamel of Mushanga',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (284,84,5,NULL,NULL,'M',NULL,NULL,'CH Ezluvin Winterfest Of Steeplechase ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (285,84,5,NULL,NULL,'F',NULL,NULL,'Ezluvin Southern Magnolia',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (286,34,5,NULL,NULL,'M',NULL,NULL,'GC Q-T Cats Sandstorm of Barmont D.M.',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (287,38,5,NULL,NULL,'F',NULL,NULL,'GC RW Jlor Bonnie Blue Chip of Barmont',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (288,34,5,287,286,'M',NULL,NULL,'Barmont Sugar Pie Guy of Artemis',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (289,87,5,283,282,'M',NULL,NULL,'Steeplechase Whirlaway OF Canasta',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (290,38,5,291,288,'F',NULL,NULL,'Artemis Blueberry Pie',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (291,32,5,293,292,'F',NULL,NULL,'CH Artemis Tess D.M.',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (292,84,5,NULL,NULL,'M',NULL,NULL,'GC NW Softmagic Justin Time',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (293,32,5,NULL,NULL,'F',NULL,NULL,'Marhei Beauty Marque of Artemis',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (295,32,5,298,297,'M',NULL,NULL,'GC Tehy Big Mac of Maradan D.M.',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (296,33,5,300,299,'F',NULL,NULL,'Maradan Nirvana',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (297,32,5,302,301,'M',NULL,NULL,'GC NW Kelsha Great Bear D.M.',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (298,32,5,304,303,'F',NULL,NULL,'Tehy Aggravation',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (299,33,5,306,305,'M',NULL,NULL,'Boberan Red Ryder of Maradan',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (300,100,5,308,307,'F',NULL,NULL,'Maradan Gurrumina Guaperas',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (301,101,5,NULL,NULL,'M',NULL,NULL,'GC NW Bolo\\\'s Rodeo of Kelsha',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (302,38,5,NULL,NULL,'F',NULL,NULL,'GC GP RW Kelsha Blessing Way D.M.',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (303,32,5,NULL,NULL,'M',NULL,NULL,'GC Bolo\'s Rumor Hasit of Tehy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (304,124,5,NULL,NULL,'F',NULL,NULL,'Bocasana Easy Going of Tehy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (305,32,5,NULL,NULL,'M',NULL,NULL,'GC Boberan Wild Night D.M',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (306,94,5,NULL,NULL,'F',NULL,NULL,'GC Boberan You Sang To Me of Dockside D.M.',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (307,87,5,NULL,NULL,'M',NULL,NULL,'CH GIC Blueskyeyes Fire Line',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (308,125,5,NULL,NULL,'F',NULL,NULL,'GC Boberan Baby Love of Maradan',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (309,76,10,312,311,'M',NULL,NULL,'Keystone Zoogin of Alomi',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (310,79,10,314,313,'F',NULL,NULL,'Keystone Sizzel of Alomi',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (311,76,10,NULL,NULL,'M',NULL,NULL,'Keystone Zoot Suit',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (312,103,5,NULL,NULL,'F',NULL,NULL,'Jazzycats Tillycum',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (313,78,10,NULL,NULL,'M',NULL,NULL,'IC Keystone Goose Bumps',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (314,69,10,NULL,NULL,'F',NULL,NULL,'IC Keystone Don\'t Tell Me No More',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (315,69,10,NULL,NULL,'F',NULL,NULL,'Benua Greta Of Turmalin',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (316,112,11,NULL,NULL,'M',NULL,NULL,'GICh. Klark Kent of Cheshirsky Cat’s','2011-09-03','y','n','n','','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (317,NULL,7,NULL,NULL,'F',NULL,NULL,'CH Mormot-Lensky netJa',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (318,35,13,NULL,NULL,'M',NULL,NULL,'GICH Umfred Diamand Dream',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (319,35,6,NULL,NULL,'F',NULL,NULL,'CH Barcelona Santa-Barbara',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (320,130,13,NULL,NULL,'M',NULL,NULL,'Estrella\'s Button & Bows of Morthlake',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (321,45,5,NULL,NULL,'F',NULL,NULL,'CH Adelina Talion',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (322,113,13,NULL,NULL,'M',NULL,NULL,'ICH Golden Incredibly Mystery\'s Dream of Mormat',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (324,96,6,NULL,NULL,'M',NULL,NULL,'GICH Rumfold Zab Juda',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (325,129,11,NULL,NULL,'F',NULL,NULL,'Rumfold Peppy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (327,128,6,NULL,NULL,'F',NULL,NULL,'Shanell Anry Mormot',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (328,109,6,331,330,'M',NULL,NULL,'ECH Galant Argentum Anri of Lovely Gizmo, DM',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (329,127,11,NULL,NULL,'F',NULL,NULL,'Olesia Mafdet Mint',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (330,35,6,319,318,'M',NULL,NULL,'ECH Barselona Fabricius, DM',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (331,109,13,321,320,'F',NULL,NULL,'CH Anissa Lady Morthlake ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (332,108,11,327,322,'M',NULL,NULL,'GICH Celeron Grande Mormat',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (333,126,6,325,324,'F',NULL,NULL,'ICH Rumfold Viola',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (334,120,6,329,328,'F',NULL,NULL,'Mafdet Mind Chanita',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (335,105,11,333,332,'F',2,NULL,'Mafdet Mint Karma',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (336,107,11,335,328,'M',NULL,NULL,'Shaparack Coco',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (337,45,12,333,332,'M',NULL,NULL,'ICH Mafdet Mint Kupidon of Gold Rainbow',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (338,109,6,334,332,'F',NULL,NULL,'Mafdet Mint Odri of Shaparack',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (339,45,6,338,337,'F',NULL,NULL,'CH Shaparack Bohemia',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (340,45,7,339,336,'F',NULL,2,'CH Shaparack Elea Izabella','2011-09-08','n',NULL,NULL,'','Y',NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (341,108,7,241,336,'M',NULL,NULL,'CH Shaparack Gem Ford Fiesta',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (342,106,11,335,328,'F',NULL,NULL,'Shaparack Carolyn',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (343,105,7,342,341,'F',NULL,NULL,'Shaparack Uma Thurman','2013-12-03','n','n','n','','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (344,45,13,NULL,NULL,'M',NULL,NULL,'Gr.Int.Ch. Silver-Joshua vom Golden Winkel',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (345,45,6,NULL,NULL,'F',NULL,NULL,'Lensky Teresa',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (346,45,6,345,344,'M',NULL,NULL,'Ch. Ultra Lensky Alpachino',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (347,45,13,NULL,NULL,'M',NULL,NULL,'Ch. Gerbert',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (348,116,6,NULL,NULL,'F',NULL,NULL,'Stolansa',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (349,115,13,NULL,NULL,'M',NULL,NULL,'Ch. High Hesket*s Silver O*Connor',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (350,119,13,NULL,NULL,'F',NULL,NULL,'High Hesket*s Golden Sin Sin Sin',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (351,118,6,NULL,NULL,'M',NULL,NULL,'Frank Violit Blue Baby*s',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (352,117,11,NULL,NULL,'F',NULL,NULL,'Hand Made Cassandra',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (353,113,13,NULL,NULL,'M',NULL,NULL,'ECH Sacha Fils Oll\'Josy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (354,114,13,NULL,NULL,'F',NULL,NULL,'Silver Fantasy Von Liza\'s Traum',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (355,113,13,NULL,NULL,'M',NULL,NULL,'Golden Aristoteles Von Grimms Barchen',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (356,45,13,NULL,NULL,'F',NULL,NULL,'Allison Cley Oll\'Josy ',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (357,93,8,NULL,NULL,'M',NULL,NULL,'Prince Vladimir Silver',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (358,76,6,NULL,NULL,'F',NULL,NULL,'Lensky Picasso Exercise',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (359,45,13,NULL,NULL,'M',NULL,NULL,'GICH Fernando V.Vbloske Eksolby',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (360,45,13,NULL,NULL,'F',NULL,NULL,'Ashtaret\'TU Glatissanta',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (361,45,11,348,347,'F',NULL,NULL,'Ch. Ultra Bessy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (362,45,13,350,349,'M',NULL,NULL,'Gr. Euro. Ch. High Hesket*s X-Line of Mormot',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (363,93,6,352,351,'F',NULL,NULL,'Diana Viktoria Grand of Mormot',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (364,115,13,354,353,'M',NULL,NULL,'Capitane Oll\'s Josy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (365,45,13,356,355,'F',NULL,NULL,'Demoiselle Oll\'s Josy',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (366,45,6,358,357,'M',NULL,NULL,'Ch. Lensky Moris Venzel',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (367,45,13,360,359,'F',NULL,NULL,'Ch. Charmain Argeny Blond',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (368,45,11,361,346,'M',NULL,NULL,'Ch. Ultra Romualdo Cutur',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (369,112,6,363,362,'F',NULL,NULL,'Ch. Zefira Silver Mormot',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (370,114,13,365,364,'M',NULL,NULL,'Oll\'s Josy\'s Ellas',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (371,113,6,367,366,'F',NULL,NULL,'Lensky Wonder Tiger',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (372,112,11,369,368,'M',NULL,NULL,'GICH Klark Kent from Cheshircky Cat*s',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (373,111,6,371,370,'F',NULL,NULL,'Ch Mormot-Lensky Janet',NULL,'y',NULL,NULL,'',NULL,NULL,'Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (374,114,11,343,20,'F',NULL,2,'Shaparack Vanetta','2015-05-23','y','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (375,114,6,343,20,'F',NULL,2,'Shaparack Waleria','2015-05-26','y','n',NULL,'','N',NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (376,110,11,343,20,'F',NULL,2,'Shaparack Wilma','2015-05-26','y','n',NULL,'BOHKEtO3qHI','Y',NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (377,45,7,340,20,'M',NULL,2,'Shaparack Xerox','2015-04-30','y','n','n','LIOXVvBrcgo','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (378,45,7,340,20,'M',NULL,NULL,'Shaparack Van Dam',NULL,'y',NULL,'y','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (379,71,10,95,3,'M',NULL,2,'Shaparack Samuel','2015-05-15','y','n',NULL,'dUYFvxukK3s',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (380,88,10,95,3,'F',2,2,'Shaparack Nataly','2015-05-13','n','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (382,71,8,NULL,NULL,'M',NULL,2,'Shaparack Cupid',NULL,'y','n','n','H6LleRPUAOo','N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (383,76,8,386,11,'M',2,2,'Shaparack Buster Shot','2015-09-10','y','n','n','qQ9D47f01Vc','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (384,37,5,NULL,11,'F',NULL,NULL,'Shaparack Persian Doll',NULL,'y','n','n',NULL,'N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (386,77,8,6,4,'F',NULL,NULL,'Shaparack Luane Dolores',NULL,'y',NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (387,88,10,94,3,'F',NULL,2,'Shaparack Camellia','2015-09-09','n','n','n','nH3dIV2ReQ4','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (388,75,5,NULL,11,'M',NULL,2,'Shaparack *',NULL,'y','n','n',NULL,'N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (389,45,7,340,20,'F',NULL,NULL,'Shaparack*** ',NULL,'y','n',NULL,'','N',NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (390,45,11,NULL,NULL,'M',2,NULL,'Shaparack males ','2015-10-01','y',NULL,NULL,'',NULL,'y','',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (391,71,8,NULL,NULL,'M',NULL,NULL,'Shaparack Brad Pitt','2015-09-11','y','n','n',NULL,'N','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (392,131,9,23,11,'F',NULL,2,'Shaparack Lastivka','2015-10-01','n','n','n','fJDQmZIdot8','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (393,89,9,23,11,'M',NULL,2,'Shaparack  Charlie Brawn','2015-09-27','y','n','y',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (395,75,8,273,12,'M',NULL,2,'SHAPARACK ZINEDINE ZIDANE',NULL,'y','n','y','','N',NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (397,45,11,398,20,'M',NULL,2,'Shaparack Yes Lelik','2015-01-09','y','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (398,105,12,335,399,'F',2,2,'Shaparack Tifany','2012-12-24','n',NULL,NULL,'','Y',NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (399,NULL,6,338,336,NULL,NULL,2,'Shaparack Fernan',NULL,'y',NULL,NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (400,45,11,398,20,'M',2,NULL,'Shaparack Yes Bolik','2015-09-30','y','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (401,75,8,NULL,NULL,'F',NULL,2,'Shaparack Komilfo','2015-07-02','y','n',NULL,'',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (402,69,8,252,25,'M',NULL,2,'Shaparack Sweet Peach','2015-07-21','y','n',NULL,'','Y',NULL,'',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (403,76,9,23,11,'M',2,2,'Shaparack A Feeling of Joy','2015-10-01','y','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (404,45,7,340,20,'F',2,2,'Shaparack Amelie','2015-10-12','y','n','y','aOC5D_w3UDw','Y','y','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (405,69,8,406,253,'M',NULL,2,'Shaparack Lemur','2015-06-13','y','n','y','WQcCBVFNTNo','Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (406,77,8,6,150,'F',NULL,2,'Shaparack Fairy',NULL,'y','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (407,78,8,273,12,'F',2,NULL,'Shaparack Constance','2015-10-19','y','n','y','mBtnyw0MrN8','Y','n','Listed',NULL,3,3,NULL,NULL);
INSERT INTO `cats` VALUES (408,78,9,273,12,'F',2,2,'Shaparack Blue Mouse','2015-04-24','n','n','n',NULL,'Y','n','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (418,88,8,6,238,'F',NULL,2,'Shaparack Iris ','2015-10-22','y','y','n','k6Gmy6BpGTw','Y','n','Listed',1,1,1,NULL,1);
INSERT INTO `cats` VALUES (422,79,8,6,12,'F',NULL,2,'Shaparack Dark Lotus','2015-04-27','n','n','n',NULL,'Y','n','Listed',NULL,4,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (427,71,8,256,253,'F',NULL,2,'Shaparack Lambada','2016-04-20','y','y','n',NULL,'Y','y','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (428,99,8,24,253,'M',NULL,2,'Shaparack Jive Boston ','2016-05-25','y','y','n','faiJ4G9s0Wg','Y','y','Listed',NULL,-1,1,NULL,NULL);
INSERT INTO `cats` VALUES (429,76,9,273,253,'M',NULL,2,'Shaparack Mambo','2016-05-15','y','y','n',NULL,'Y','y','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (430,71,8,273,253,'F',NULL,2,'Shaparack Mazurka','2016-05-14','y','y','n','p2sQDCegriE','N','y','Listed',NULL,1,1,NULL,NULL);
INSERT INTO `cats` VALUES (431,79,8,252,11,'F',NULL,2,'Shaparack Baby\'s Kiss ',NULL,'y','y','n','qEQO_F2Yx00','Y','y','Listed',NULL,4,4,NULL,NULL);
INSERT INTO `cats` VALUES (432,72,8,244,253,'F',NULL,2,'Shaparack Macarena','2016-05-25','y','y','n',NULL,'Y','y','Listed',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `cats` VALUES (433,72,8,252,11,'F',NULL,NULL,'Shaparack Kiss From Buster',NULL,'y','y','n','8T1EIreAy2s','Y','y','Listed',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cats_information`
--

DROP TABLE IF EXISTS `cats_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cats_information` (
  `cat_id` int(11) NOT NULL,
  `info_long_text_en` longtext,
  `info_short_text_en` longtext,
  `info_long_text_ua` longtext,
  `info_short_text_ua` longtext,
  KEY `cat_id_index` (`cat_id`),
  CONSTRAINT `cats_information_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `cats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats_information`
--

LOCK TABLES `cats_information` WRITE;
/*!40000 ALTER TABLE `cats_information` DISABLE KEYS */;
INSERT INTO `cats_information` VALUES (4,'2ND BEST of COLOR CLASS Northwest Region 2007.\r\nThank You Lynn so much for this sweet boy!\r\nHe will remain forever in my heart...','2ND BEST of COLOR CLASS Northwest Region 2007',NULL,NULL);
INSERT INTO `cats_information` VALUES (5,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (6,'','Exotic Sh female',NULL,NULL);
INSERT INTO `cats_information` VALUES (12,'3-24 february 2013y. CFA Cat Show, LVIV .\nSHAPARACK ZORIAN made 2 finals :9Best kitten, 9Best kitten and 2Best DIV','3-24 february 2013y. CFA Cat Show, LVIV .\nSHAPARACK ZORIAN made 2 finals :9Best kitten, 9Best kitten and 2Best DIV',NULL,NULL);
INSERT INTO `cats_information` VALUES (13,'Zoryana one of my favorite cats living in Taiwan.\r\n  Zoryana left me offspring boy Zorian','Zoryana one of my favorite cats living in Taiwan.\r\n  Zoryana left me offspring boy Zorian.','','');
INSERT INTO `cats_information` VALUES (3,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (11,'Thank You John and Debbie so much for this sweet treasure !',' Persian  Black (CPC)','','');
INSERT INTO `cats_information` VALUES (17,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (16,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (19,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (18,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (20,'Thank you Anna for Fant!\r\n','10 BEST CAT ring Eugenia Sorochenko, RUI CAT SHOW 5 April 2014 in Odessa ',NULL,NULL);
INSERT INTO `cats_information` VALUES (23,'BEST KITTEN RUI Cat Show, April 5-6, 2014 (Odessa)','BEST KITTEN RUI Cat Show, April, 5-6, 2014, Odessa',NULL,NULL);
INSERT INTO `cats_information` VALUES (24,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (7,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (26,'8 Best Kitten of Scoring\r\nCFA Cat Show, March, 21-22, 2015, Kiev','8 Best Kitten of Scoring\r\nCFA Cat Show, March, 21-22, 2015, Kiev',NULL,NULL);
INSERT INTO `cats_information` VALUES (27,'This Female  For Sale (SHOW potential)','This Female For Sale  (SHOW potential)',NULL,NULL);
INSERT INTO `cats_information` VALUES (28,'For sale Female (BREED  QUALITY) .\nLovely girl with huge eyes looking','For sale Female (BREED  QUALITY) ',NULL,NULL);
INSERT INTO `cats_information` VALUES (29,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (31,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (42,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (37,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (32,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (36,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (35,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (34,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (40,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (44,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (39,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (49,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (38,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (30,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (33,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (63,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (58,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (67,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (9,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (54,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (10,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (64,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (82,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (72,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (87,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (88,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (90,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (91,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (94,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (95,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (104,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (107,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (108,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (97,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (98,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (8,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (136,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (134,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (133,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (126,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (89,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (150,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (156,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (155,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (163,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (166,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (146,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (147,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (145,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (86,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (122,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (73,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (153,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (185,'9 BEST CAT 2002 RUI\r\nCopper eyed white Persian female\r\n\r\nSire:   ICH SEVIR LAVRENTIJ\r\nDam:   CH CFA, GICH RUI SHAPARACK RIVIERA ','9 BEST CAT 2002 RUI\r\nCopper eyed white Persian female\r\n\r\nSire:   ICH SEVIR LAVRENTIJ\r\nDam:   CH CFA, GICH RUI SHAPARACK RIVIERA ',NULL,NULL);
INSERT INTO `cats_information` VALUES (186,'4 BEST KITTEN 2001 RUI\r\nOdd eyed white Persian male','4 BEST KITTEN 2001 RUI\r\nOdd eyed white Persian male',NULL,NULL);
INSERT INTO `cats_information` VALUES (188,'BEST KITTEN 2003 RUI\r\n','BEST KITTEN 2003 RUI\r\n',NULL,NULL);
INSERT INTO `cats_information` VALUES (189,'BEST KITTEN 2001 RUI','BEST KITTEN 2001 RUI',NULL,NULL);
INSERT INTO `cats_information` VALUES (190,'15th Best Cat RUI 2002\r\nBrown patched tabby Persian female\r\n\r\nSire:   UW RUI SHAPARACK ZERRO CWAZIMODO\r\nDam:  CH CFA, GICH RUI SHAPARACK RIVIERA','15th Best Cat RUI 2002\r\nBrown patched tabby Persian female\r\n\r\nSire:   UW RUI SHAPARACK ZERRO CWAZIMODO\r\nDam:  CH CFA, GICH RUI SHAPARACK RIVIERA',NULL,NULL);
INSERT INTO `cats_information` VALUES (22,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (191,'12th Best Cat 2005 RUI','12th Best Cat 2005 RUI',NULL,NULL);
INSERT INTO `cats_information` VALUES (192,'2nd Best Kitten 2003 RUI','2nd Best Kitten 2003 RUI',NULL,NULL);
INSERT INTO `cats_information` VALUES (195,'BEST CAT 2005-2006 seasons','BEST CAT 2005-2006 seasons',NULL,NULL);
INSERT INTO `cats_information` VALUES (138,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (167,'  ','','','');
INSERT INTO `cats_information` VALUES (183,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (184,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (182,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (144,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (203,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (204,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (206,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (207,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (208,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (143,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (84,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (109,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (69,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (71,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (25,'Jerob is very active in the pairing.\nHe produced my best exotic boys and girls, who left in my cattery.\n1)CH CFA ( grandpointed) Shaparack Hope For Miracle\nExotic Shorthair (EXO SH)\nCream lynx point (e21 33)\n2)Shaparack Tango\nExotic Shorthair (EXO SH)\nFlame lynx point (d21 33)\n3)CH CFA Shaparack Moving to California\nExotic Shorthair (EXO SH)\nSeal Lynx Point (n21 33) - Now living in Italia\n3)CH CFA Shaparack Hope Forever\nExotic Shorthair (EXO SH)\nTortie lynx point (f21 33)\n4)Shaparack Zemfira\nExotic Shorthair (EXO SH)\nTortie point (f33)\nand other','FOR SALE PROVEN MALE. He produced my best exotic boys and girls, who left in my cattery.',NULL,NULL);
INSERT INTO `cats_information` VALUES (217,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (237,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (238,'grandpointed','grandpointed',NULL,NULL);
INSERT INTO `cats_information` VALUES (239,'Sold to Italia','Sold to Italia',NULL,NULL);
INSERT INTO `cats_information` VALUES (240,'','(NOT CPC)',NULL,NULL);
INSERT INTO `cats_information` VALUES (241,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (242,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (128,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (213,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (135,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (229,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (194,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (218,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (219,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (221,'Shaparack Love Story of Kittystone is mom  GC, RW Kittystone Nico.\r\n','Special gratitude Lynn for the fine house and care\r\nabout my gentle Love Story.\r\nShaparack Love Story of Kittystone is mom  GC, RW Kittystone Nico.',NULL,NULL);
INSERT INTO `cats_information` VALUES (187,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (243,'BEST KITTEN RUI CAT SHOW 17-18 January 2009. ','BEST KITTEN RUI CAT SHOW 17-18 January 2009. ',NULL,NULL);
INSERT INTO `cats_information` VALUES (245,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (247,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (248,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (149,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (101,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (112,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (105,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (127,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (129,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (130,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (131,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (132,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (137,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (139,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (140,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (196,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (141,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (142,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (181,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (180,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (216,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (215,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (235,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (151,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (197,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (152,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (198,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (200,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (154,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (157,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (231,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (148,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (201,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (168,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (158,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (169,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (159,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (161,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (234,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (214,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (212,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (210,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (160,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (162,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (202,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (233,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (232,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (179,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (170,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (164,'','',NULL,NULL);
INSERT INTO `cats_information` VALUES (165,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (171,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (172,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (173,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (211,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (57,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (60,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (106,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (174,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (175,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (176,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (177,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (209,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (249,'Born: 08.26.2002\r\n10th Best Kitten RUI 2002-2003\r\nBest EXOTIC RUI CAT SHOW \r\nNovember 15-16.2003','CH, UW RUI Etoile Andromeda of Shaparack',NULL,NULL);
INSERT INTO `cats_information` VALUES (220,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (251,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (252,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (254,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (250,'This girl is left in the nursery to work with Exotic Shorthair. She has a very wide and short  undersized body . Beautiful shaped head. Sweet looks','This girl is left in the nursery to work with Exotic Shorthair. She has a very wide and short  undersized body. Beautiful shaped head. Sweet looks','Ця дівчинка залишена в розпліднику для роботи з Екзотичними Короткошерстими. Вона має дуже  широке низькоросле і коротке тілою . Я маю надію, що вона подарує мені в майбутньому чудових кошенят з короткою шерстю .','Ця дівчинка залишена в розпліднику для роботи з Екзотичними Короткошерстими. Вона має дуже  широке низькоросле і коротке тілою . Я маю надію, що вона подарує мені в майбутньому чудових кошенят з короткою шерстю . ');
INSERT INTO `cats_information` VALUES (255,'REZERVED Female (BREED -SHOW QUALITY)',' REZERVED Female (BREED -SHOW QUALITY)',NULL,NULL);
INSERT INTO `cats_information` VALUES (256,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (257,'','','','');
INSERT INTO `cats_information` VALUES (258,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (259,'2013	2ND	BEST of COLOR CLASS	Great Lakes (4)	\nThank you Hope for your love for our girl, and for the work that you spent that would make the title of Grand Champion for Zoe!!! ','  Zoe one of my favorite cats living US.\n2013	2ND	BEST of COLOR CLASS	Great Lakes (4)	\nThank you Hope for your love for our girl, and for the work that you spent that would make the title of Grand Champion for Zoe!!! ',NULL,NULL);
INSERT INTO `cats_information` VALUES (261,'Grand Champion for one show . Thanks Linda and Hilda Naamani , Cattery \"Munchland\" for the wonderful showing my girls!!!','Grand Champion for one show . Thanks Linda and Hilda Naamani , Cattery \"Munchland\" for the wonderful showing my girls!!!',NULL,NULL);
INSERT INTO `cats_information` VALUES (263,'This cute male SOLD to Turkey ','This cute male SOLD to Turkey ',NULL,NULL);
INSERT INTO `cats_information` VALUES (262,'Grand Champion for one show .\nThanks Linda and Hilda  Naamani , Cattery \"Munchland\" for the wonderful showing my girls!!! ','Grand Champion for one show .\nThanks Linda and Hilda  Naamani , Cattery \"Munchland\" for the wonderful showing my girls!!! ',NULL,NULL);
INSERT INTO `cats_information` VALUES (266,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (267,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (272,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (271,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (265,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (268,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (273,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (269,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (282,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (283,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (291,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (278,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (290,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (279,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (296,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (295,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (300,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (301,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (297,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (303,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (304,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (298,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (299,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (312,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (309,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (313,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (314,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (310,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (340,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (328,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (65,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (47,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (50,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (43,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (275,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (343,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (336,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (342,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (341,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (372,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (373,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (371,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (370,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (369,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (368,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (367,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (366,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (365,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (364,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (363,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (362,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (361,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (346,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (347,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (360,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (348,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (359,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (349,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (358,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (357,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (374,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (375,'FEMALE FOR SALE (breed  quality)','FEMALE FOR SALE (breed quality)','','');
INSERT INTO `cats_information` VALUES (376,'FEMALE FOR SALE (breed  quality)','FEMALE FOR SALE (breed  quality)',NULL,NULL);
INSERT INTO `cats_information` VALUES (377,'Male For Sale','Male For Sale',NULL,NULL);
INSERT INTO `cats_information` VALUES (335,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (378,'This male SOLD','This male SOLD',NULL,NULL);
INSERT INTO `cats_information` VALUES (379,'This Male for sale  as SHOW QUALITY. Rezerved as a PET','This Male for sale  as SHOW QUALITY. Rezerved as a PET','Цєй чудовий сонячний котик зарезервований як домашній улюбленець. І скоро поїде в новий дім.','Цєй чудовий сонячний котик зарезервований як домашній улюбленець. І скоро поїде в новий дім.');
INSERT INTO `cats_information` VALUES (380,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (382,'This cute male FOR SALE  as a PET','This cute male FOR SALE  as a PET',NULL,NULL);
INSERT INTO `cats_information` VALUES (383,'This cute male FOR SALE  as a PET','This cute male FOR SALE as a PET','Це чарівне  кошеня доступне для резервування  з подальшим продажом в якості домашнього улюбленця.  ','Це чарівне  кошеня доступне для резервування  з подальшим продажом в якості домашнього улюбленця.  ');
INSERT INTO `cats_information` VALUES (236,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (356,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (355,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (354,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (353,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (352,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (351,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (345,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (350,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (344,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (339,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (337,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (384,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (274,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (276,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (277,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (308,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (316,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (338,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (334,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (333,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (332,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (331,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (330,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (329,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (327,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (325,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (324,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (322,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (321,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (320,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (319,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (318,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (317,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (61,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (62,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (387,'This treasure I\'ve been waiting a long time, for this she will stay with me \n(show quality)','This treasure I\'ve been waiting a long time, for this she will stay with me.\n(show quality)',NULL,NULL);
INSERT INTO `cats_information` VALUES (388,'This Male for sale as a PET  (SHOW QUALITY)\n','This Male for sale as a PET  (SHOW QUALITY)\n',NULL,NULL);
INSERT INTO `cats_information` VALUES (389,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (390,'SOON FOR SALE MALES ','SOON FOR SALE MALES ',NULL,NULL);
INSERT INTO `cats_information` VALUES (391,'FOR SALE as a PET','FOR SALE as a PET','Продаеться в якості домашнього улюбленця','Продаеться в якості домашнього улюбленця');
INSERT INTO `cats_information` VALUES (392,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (393,'Living in Kuwait','Living in Kuwait','Місце проживання Кувейт','Місце проживання Кувейт');
INSERT INTO `cats_information` VALUES (395,'SOLD in Taiwan','SOLD in Taiwan','ПРОДАНИЙ В ТАЙВАНЬ','ПРОДАНИЙ В ТАЙВАНЬ');
INSERT INTO `cats_information` VALUES (397,'NOW FOR REZERVATION .SOON FOR SALE THIS CUTE MALE. ','NOW FOR REZERVATION .SOON FOR SALE THIS CUTE MALE. ',' Цей чудовий котик може буди зарезервованій як домашній улюбленець',' Цей чудовий котик може буди зарезервованій як домашній улюбленець');
INSERT INTO `cats_information` VALUES (398,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (399,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (400,'NOW FOR REZERVATION','NOW FOR REZERVATION ','Цей чудовий котик може буди зарезервованій як домашній улюбленець','Цей чудовий котик може буди зарезервованій як домашній улюбленець');
INSERT INTO `cats_information` VALUES (401,'THIS FEMALE Sold AS A PET','THIS FEMALE Sold AS A PET',' Ця синьоока дівчинка ПРОДАНА як домашня улюблениця ',' Ця синьоока дівчинка Продана як домашня улюблениця ');
INSERT INTO `cats_information` VALUES (402,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (403,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (404,'SOLD','SOLD',NULL,NULL);
INSERT INTO `cats_information` VALUES (405,'SOLD In Canada','SOLD In Canada','Продан в Канаду','Продан в Канаду');
INSERT INTO `cats_information` VALUES (406,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (253,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (407,'Sold In Canada','Sold In Canada','Продан в Канаду','Продан в Канаду');
INSERT INTO `cats_information` VALUES (408,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (418,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (422,'This Female FOR SALE as show - breed quality','This Female FOR SALE as show - breed quality',NULL,NULL);
INSERT INTO `cats_information` VALUES (427,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (428,'AVAILABLE very promising boy. Show potential','AVAILABLE very promising boy . Show potential',NULL,NULL);
INSERT INTO `cats_information` VALUES (429,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (430,'I regret, the girl is not for sale at this time.  If you are interested in this girl, come back later on her personal page','This girl is not for sale at this time.','Не на продаж в цей час. ','Не на продаж в цей час');
INSERT INTO `cats_information` VALUES (432,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (431,NULL,NULL,NULL,NULL);
INSERT INTO `cats_information` VALUES (433,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cats_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (32,'n','Black');
INSERT INTO `colors` VALUES (33,'d','Red');
INSERT INTO `colors` VALUES (34,'e','Cream');
INSERT INTO `colors` VALUES (35,'a','Blue');
INSERT INTO `colors` VALUES (36,'b','Chocolate');
INSERT INTO `colors` VALUES (37,'f','Tortoiseshell');
INSERT INTO `colors` VALUES (38,'g','Blue-cream');
INSERT INTO `colors` VALUES (39,'h','Chocolate-tortie');
INSERT INTO `colors` VALUES (40,'j',' Lilac-tortie');
INSERT INTO `colors` VALUES (42,'s','Smoke');
INSERT INTO `colors` VALUES (43,'w','White');
INSERT INTO `colors` VALUES (45,'ns11','Silver Shaded');
INSERT INTO `colors` VALUES (47,'y11 33','Golden chinchilla-point');
INSERT INTO `colors` VALUES (49,'02','Harlequin');
INSERT INTO `colors` VALUES (50,'03','Bicolour');
INSERT INTO `colors` VALUES (51,'04',' Mitted');
INSERT INTO `colors` VALUES (52,'11','Shaded');
INSERT INTO `colors` VALUES (54,'21','Tabby');
INSERT INTO `colors` VALUES (59,'33','Himalayan ');
INSERT INTO `colors` VALUES (60,'25','Ticked');
INSERT INTO `colors` VALUES (61,'24','Spotted');
INSERT INTO `colors` VALUES (62,'23','Mackerel');
INSERT INTO `colors` VALUES (63,'22','Blotched');
INSERT INTO `colors` VALUES (64,'12','Shell');
INSERT INTO `colors` VALUES (65,'01','Van');
INSERT INTO `colors` VALUES (66,'y','Golden');
INSERT INTO `colors` VALUES (67,'o','Cinnamon');
INSERT INTO `colors` VALUES (68,'ns 11 33','Silver Schinchilla-point');
INSERT INTO `colors` VALUES (69,'d 33','Flame point');
INSERT INTO `colors` VALUES (70,'e 33','Cream point');
INSERT INTO `colors` VALUES (71,'d21 33','Flame lynx point');
INSERT INTO `colors` VALUES (72,'g21 33','Blue-cream lynx point');
INSERT INTO `colors` VALUES (73,'f22','Brown patched tabby');
INSERT INTO `colors` VALUES (74,'g33','Blue-cream Point');
INSERT INTO `colors` VALUES (75,'n33','Seal point');
INSERT INTO `colors` VALUES (76,'n21 33','Seal Lynx Point');
INSERT INTO `colors` VALUES (77,'f21 33','Tortie lynx point');
INSERT INTO `colors` VALUES (78,'a 33','Blue point');
INSERT INTO `colors` VALUES (79,'f33','Tortie point');
INSERT INTO `colors` VALUES (80,'f03','Calico');
INSERT INTO `colors` VALUES (82,'W61',' Blue-eyed White ');
INSERT INTO `colors` VALUES (83,'W63','Odd eyed white');
INSERT INTO `colors` VALUES (84,'W62','White: copper eyed');
INSERT INTO `colors` VALUES (85,'e22',' Cream Tabby');
INSERT INTO `colors` VALUES (86,'w62','White: copper eyed ');
INSERT INTO `colors` VALUES (87,'d22','Red Tabby');
INSERT INTO `colors` VALUES (88,'e21 33','Cream lynx point');
INSERT INTO `colors` VALUES (89,'f23','Brown mackerel tabby');
INSERT INTO `colors` VALUES (90,'d22','Red Tabby (CPC)');
INSERT INTO `colors` VALUES (91,'n22','Brown Tabby');
INSERT INTO `colors` VALUES (92,'n24','Brown Spotted  Tabby');
INSERT INTO `colors` VALUES (93,'ns22','Silver Tabby');
INSERT INTO `colors` VALUES (94,'d23','Red Mackerel Tabby');
INSERT INTO `colors` VALUES (95,'e23','Cream Mackerel Tabby');
INSERT INTO `colors` VALUES (96,'ds22',' Red silver tabby');
INSERT INTO `colors` VALUES (97,'ns23',' Silver Mackerel Tabby');
INSERT INTO `colors` VALUES (98,'d24',' Red Spotted Tabby ');
INSERT INTO `colors` VALUES (99,'a 21 33','Blue Lynx Point');
INSERT INTO `colors` VALUES (100,'d 03','Red-White');
INSERT INTO `colors` VALUES (101,'n 03','Black-White');
INSERT INTO `colors` VALUES (102,'g 03','Dilute Calico');
INSERT INTO `colors` VALUES (103,'n 22','Brown Tabby (CPC)');
INSERT INTO `colors` VALUES (105,'fs11','Shaded Tortoiseshel');
INSERT INTO `colors` VALUES (106,'fs24','Silver Patched Spotted Tabby');
INSERT INTO `colors` VALUES (107,'as24','Blue Silver Spotted Tabby');
INSERT INTO `colors` VALUES (108,'as11','Blue Silver Shaded');
INSERT INTO `colors` VALUES (109,'ns24','Silver Spoted Tabby');
INSERT INTO `colors` VALUES (110,'as11 33','Blue Shaded Point');
INSERT INTO `colors` VALUES (111,'ay 11 33','Blue Golden Shaded Point');
INSERT INTO `colors` VALUES (112,'ns 25','Silver Ticked ');
INSERT INTO `colors` VALUES (113,'ny 11','Golden Shaded ');
INSERT INTO `colors` VALUES (114,'ns 11 33','Silver Shaded Point');
INSERT INTO `colors` VALUES (115,'ns 12','Silver Shinshilla');
INSERT INTO `colors` VALUES (116,'ns 23','Silver Mackerel Tabby');
INSERT INTO `colors` VALUES (117,'bs 22','Chocolate  Silver Classic Tabby');
INSERT INTO `colors` VALUES (118,'ns 22','Black Silver Tabby');
INSERT INTO `colors` VALUES (119,'ny 25','Golden Ticked');
INSERT INTO `colors` VALUES (120,'as 24','Blue Silver Spoted Tabby');
INSERT INTO `colors` VALUES (121,'f 24','Brown Patched Spotted Tabby');
INSERT INTO `colors` VALUES (122,'f 23 ','Brown Patched Mackerel Tabby');
INSERT INTO `colors` VALUES (123,'d 24','Red Spotted Tabby');
INSERT INTO `colors` VALUES (124,'a22 03','Blue Mackerel tabby and White.');
INSERT INTO `colors` VALUES (125,'g 03','Dilute Calico');
INSERT INTO `colors` VALUES (126,'hs 24','Chocolate  Silver SpotedTabby');
INSERT INTO `colors` VALUES (127,'ns','Black Smoke');
INSERT INTO `colors` VALUES (128,'hs 11','Chocolate Silver Shaded');
INSERT INTO `colors` VALUES (129,'h 24','Chocolade patched Spoted Tabby');
INSERT INTO `colors` VALUES (130,'c','Lilack');
INSERT INTO `colors` VALUES (131,'a21 33','Blue lynx point');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_destinations`
--

DROP TABLE IF EXISTS `image_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_destinations`
--

LOCK TABLES `image_destinations` WRITE;
/*!40000 ALTER TABLE `image_destinations` DISABLE KEYS */;
INSERT INTO `image_destinations` VALUES (1,'Home Page Gallery');
INSERT INTO `image_destinations` VALUES (2,'Cat');
INSERT INTO `image_destinations` VALUES (3,'Show');
INSERT INTO `image_destinations` VALUES (4,'Articles');
/*!40000 ALTER TABLE `image_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_mappings`
--

DROP TABLE IF EXISTS `image_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `show_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PerImages` (`image_id`),
  KEY `fk_PerImageDestinations` (`destination_id`),
  KEY `cat_id_index` (`cat_id`),
  KEY `show_id_index` (`show_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `fk_PerImageDestinations` FOREIGN KEY (`destination_id`) REFERENCES `image_destinations` (`id`),
  CONSTRAINT `fk_PerImages` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  CONSTRAINT `image_mappings_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `cats` (`id`),
  CONSTRAINT `image_mappings_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `image_mappings_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=811 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_mappings`
--

LOCK TABLES `image_mappings` WRITE;
/*!40000 ALTER TABLE `image_mappings` DISABLE KEYS */;
INSERT INTO `image_mappings` VALUES (248,117,2,11,NULL,NULL);
INSERT INTO `image_mappings` VALUES (276,124,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (277,118,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (278,130,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (279,121,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (280,132,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (281,122,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (282,123,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (283,131,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (284,129,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (285,128,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (287,133,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (290,135,2,6,NULL,NULL);
INSERT INTO `image_mappings` VALUES (291,124,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (293,130,2,12,NULL,NULL);
INSERT INTO `image_mappings` VALUES (294,126,2,12,NULL,NULL);
INSERT INTO `image_mappings` VALUES (295,136,2,25,NULL,NULL);
INSERT INTO `image_mappings` VALUES (296,137,2,24,NULL,NULL);
INSERT INTO `image_mappings` VALUES (297,138,2,5,NULL,NULL);
INSERT INTO `image_mappings` VALUES (299,140,2,95,NULL,NULL);
INSERT INTO `image_mappings` VALUES (301,142,2,24,NULL,NULL);
INSERT INTO `image_mappings` VALUES (304,146,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (305,134,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (307,147,2,237,NULL,NULL);
INSERT INTO `image_mappings` VALUES (309,148,2,237,NULL,NULL);
INSERT INTO `image_mappings` VALUES (311,151,2,240,NULL,NULL);
INSERT INTO `image_mappings` VALUES (312,152,2,25,NULL,NULL);
INSERT INTO `image_mappings` VALUES (313,153,2,20,NULL,NULL);
INSERT INTO `image_mappings` VALUES (314,121,2,241,NULL,NULL);
INSERT INTO `image_mappings` VALUES (320,157,2,239,NULL,NULL);
INSERT INTO `image_mappings` VALUES (321,128,2,13,NULL,NULL);
INSERT INTO `image_mappings` VALUES (325,162,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (330,163,2,238,NULL,NULL);
INSERT INTO `image_mappings` VALUES (331,164,2,238,NULL,NULL);
INSERT INTO `image_mappings` VALUES (333,167,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (334,174,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (336,175,2,191,NULL,NULL);
INSERT INTO `image_mappings` VALUES (337,172,2,189,NULL,NULL);
INSERT INTO `image_mappings` VALUES (338,174,2,190,NULL,NULL);
INSERT INTO `image_mappings` VALUES (339,173,2,185,NULL,NULL);
INSERT INTO `image_mappings` VALUES (340,176,2,185,NULL,NULL);
INSERT INTO `image_mappings` VALUES (341,178,2,188,NULL,NULL);
INSERT INTO `image_mappings` VALUES (342,167,2,22,NULL,NULL);
INSERT INTO `image_mappings` VALUES (343,122,2,144,NULL,NULL);
INSERT INTO `image_mappings` VALUES (344,171,2,195,NULL,NULL);
INSERT INTO `image_mappings` VALUES (345,162,2,167,NULL,NULL);
INSERT INTO `image_mappings` VALUES (349,181,2,221,NULL,NULL);
INSERT INTO `image_mappings` VALUES (350,182,2,194,NULL,NULL);
INSERT INTO `image_mappings` VALUES (351,184,2,187,NULL,NULL);
INSERT INTO `image_mappings` VALUES (352,185,2,186,NULL,NULL);
INSERT INTO `image_mappings` VALUES (353,183,2,243,NULL,NULL);
INSERT INTO `image_mappings` VALUES (354,186,2,98,NULL,NULL);
INSERT INTO `image_mappings` VALUES (355,187,2,28,NULL,NULL);
INSERT INTO `image_mappings` VALUES (370,168,2,192,NULL,NULL);
INSERT INTO `image_mappings` VALUES (371,179,2,249,NULL,NULL);
INSERT INTO `image_mappings` VALUES (372,190,2,252,NULL,NULL);
INSERT INTO `image_mappings` VALUES (373,191,2,252,NULL,NULL);
INSERT INTO `image_mappings` VALUES (390,203,2,258,NULL,NULL);
INSERT INTO `image_mappings` VALUES (391,132,2,258,NULL,NULL);
INSERT INTO `image_mappings` VALUES (392,204,2,259,NULL,NULL);
INSERT INTO `image_mappings` VALUES (398,207,2,13,NULL,NULL);
INSERT INTO `image_mappings` VALUES (399,208,2,13,NULL,NULL);
INSERT INTO `image_mappings` VALUES (400,209,2,261,NULL,NULL);
INSERT INTO `image_mappings` VALUES (401,211,2,261,NULL,NULL);
INSERT INTO `image_mappings` VALUES (402,210,2,261,NULL,NULL);
INSERT INTO `image_mappings` VALUES (404,225,2,262,NULL,NULL);
INSERT INTO `image_mappings` VALUES (405,226,2,12,NULL,NULL);
INSERT INTO `image_mappings` VALUES (406,227,2,12,NULL,NULL);
INSERT INTO `image_mappings` VALUES (407,221,2,242,NULL,NULL);
INSERT INTO `image_mappings` VALUES (408,222,2,242,NULL,NULL);
INSERT INTO `image_mappings` VALUES (410,238,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (412,240,2,138,NULL,NULL);
INSERT INTO `image_mappings` VALUES (413,213,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (414,214,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (415,216,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (416,215,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (417,220,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (418,217,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (423,242,2,273,NULL,NULL);
INSERT INTO `image_mappings` VALUES (443,254,3,NULL,11,NULL);
INSERT INTO `image_mappings` VALUES (444,251,3,NULL,11,NULL);
INSERT INTO `image_mappings` VALUES (445,249,3,NULL,11,NULL);
INSERT INTO `image_mappings` VALUES (449,244,3,NULL,12,NULL);
INSERT INTO `image_mappings` VALUES (450,253,3,NULL,12,NULL);
INSERT INTO `image_mappings` VALUES (451,252,3,NULL,12,NULL);
INSERT INTO `image_mappings` VALUES (452,257,2,23,NULL,NULL);
INSERT INTO `image_mappings` VALUES (453,154,2,340,NULL,NULL);
INSERT INTO `image_mappings` VALUES (454,280,2,4,NULL,NULL);
INSERT INTO `image_mappings` VALUES (455,281,2,16,NULL,NULL);
INSERT INTO `image_mappings` VALUES (456,224,2,19,NULL,NULL);
INSERT INTO `image_mappings` VALUES (457,282,2,31,NULL,NULL);
INSERT INTO `image_mappings` VALUES (458,283,2,32,NULL,NULL);
INSERT INTO `image_mappings` VALUES (459,276,2,37,NULL,NULL);
INSERT INTO `image_mappings` VALUES (460,284,2,36,NULL,NULL);
INSERT INTO `image_mappings` VALUES (461,285,2,35,NULL,NULL);
INSERT INTO `image_mappings` VALUES (462,287,2,39,NULL,NULL);
INSERT INTO `image_mappings` VALUES (463,286,2,47,NULL,NULL);
INSERT INTO `image_mappings` VALUES (464,288,2,36,NULL,NULL);
INSERT INTO `image_mappings` VALUES (465,258,2,50,NULL,NULL);
INSERT INTO `image_mappings` VALUES (466,289,2,49,NULL,NULL);
INSERT INTO `image_mappings` VALUES (467,290,2,43,NULL,NULL);
INSERT INTO `image_mappings` VALUES (468,293,2,248,NULL,NULL);
INSERT INTO `image_mappings` VALUES (469,294,2,166,NULL,NULL);
INSERT INTO `image_mappings` VALUES (470,295,2,26,NULL,NULL);
INSERT INTO `image_mappings` VALUES (471,296,2,26,NULL,NULL);
INSERT INTO `image_mappings` VALUES (472,303,2,26,NULL,NULL);
INSERT INTO `image_mappings` VALUES (473,304,2,26,NULL,NULL);
INSERT INTO `image_mappings` VALUES (474,305,2,26,NULL,NULL);
INSERT INTO `image_mappings` VALUES (475,307,2,8,NULL,NULL);
INSERT INTO `image_mappings` VALUES (476,292,2,235,NULL,NULL);
INSERT INTO `image_mappings` VALUES (478,278,2,217,NULL,NULL);
INSERT INTO `image_mappings` VALUES (479,310,2,343,NULL,NULL);
INSERT INTO `image_mappings` VALUES (480,311,2,336,NULL,NULL);
INSERT INTO `image_mappings` VALUES (481,310,2,342,NULL,NULL);
INSERT INTO `image_mappings` VALUES (482,312,2,341,NULL,NULL);
INSERT INTO `image_mappings` VALUES (484,301,2,40,NULL,NULL);
INSERT INTO `image_mappings` VALUES (485,269,2,372,NULL,NULL);
INSERT INTO `image_mappings` VALUES (486,325,2,373,NULL,NULL);
INSERT INTO `image_mappings` VALUES (488,378,2,370,NULL,NULL);
INSERT INTO `image_mappings` VALUES (489,265,2,369,NULL,NULL);
INSERT INTO `image_mappings` VALUES (492,264,2,366,NULL,NULL);
INSERT INTO `image_mappings` VALUES (493,260,2,368,NULL,NULL);
INSERT INTO `image_mappings` VALUES (494,379,2,365,NULL,NULL);
INSERT INTO `image_mappings` VALUES (495,268,2,363,NULL,NULL);
INSERT INTO `image_mappings` VALUES (496,380,2,362,NULL,NULL);
INSERT INTO `image_mappings` VALUES (497,266,2,346,NULL,NULL);
INSERT INTO `image_mappings` VALUES (498,263,2,349,NULL,NULL);
INSERT INTO `image_mappings` VALUES (499,381,2,374,NULL,NULL);
INSERT INTO `image_mappings` VALUES (500,382,2,374,NULL,NULL);
INSERT INTO `image_mappings` VALUES (506,118,2,378,NULL,NULL);
INSERT INTO `image_mappings` VALUES (507,123,2,378,NULL,NULL);
INSERT INTO `image_mappings` VALUES (508,386,2,20,NULL,NULL);
INSERT INTO `image_mappings` VALUES (510,366,2,379,NULL,NULL);
INSERT INTO `image_mappings` VALUES (511,363,2,379,NULL,NULL);
INSERT INTO `image_mappings` VALUES (514,388,2,259,NULL,NULL);
INSERT INTO `image_mappings` VALUES (515,369,2,382,NULL,NULL);
INSERT INTO `image_mappings` VALUES (516,389,2,382,NULL,NULL);
INSERT INTO `image_mappings` VALUES (519,392,2,236,NULL,NULL);
INSERT INTO `image_mappings` VALUES (520,393,2,12,NULL,NULL);
INSERT INTO `image_mappings` VALUES (521,362,2,344,NULL,NULL);
INSERT INTO `image_mappings` VALUES (522,394,2,384,NULL,NULL);
INSERT INTO `image_mappings` VALUES (523,361,2,149,NULL,NULL);
INSERT INTO `image_mappings` VALUES (526,395,2,143,NULL,NULL);
INSERT INTO `image_mappings` VALUES (527,398,2,143,NULL,NULL);
INSERT INTO `image_mappings` VALUES (528,396,2,143,NULL,NULL);
INSERT INTO `image_mappings` VALUES (529,397,2,143,NULL,NULL);
INSERT INTO `image_mappings` VALUES (530,399,2,150,NULL,NULL);
INSERT INTO `image_mappings` VALUES (531,400,2,150,NULL,NULL);
INSERT INTO `image_mappings` VALUES (532,246,3,NULL,13,NULL);
INSERT INTO `image_mappings` VALUES (533,129,3,NULL,13,NULL);
INSERT INTO `image_mappings` VALUES (534,247,3,NULL,13,NULL);
INSERT INTO `image_mappings` VALUES (535,405,2,330,NULL,NULL);
INSERT INTO `image_mappings` VALUES (536,406,2,330,NULL,NULL);
INSERT INTO `image_mappings` VALUES (537,402,2,330,NULL,NULL);
INSERT INTO `image_mappings` VALUES (538,403,2,328,NULL,NULL);
INSERT INTO `image_mappings` VALUES (539,401,2,328,NULL,NULL);
INSERT INTO `image_mappings` VALUES (540,404,2,328,NULL,NULL);
INSERT INTO `image_mappings` VALUES (541,325,2,317,NULL,NULL);
INSERT INTO `image_mappings` VALUES (542,411,2,9,NULL,NULL);
INSERT INTO `image_mappings` VALUES (543,407,2,61,NULL,NULL);
INSERT INTO `image_mappings` VALUES (544,414,2,10,NULL,NULL);
INSERT INTO `image_mappings` VALUES (545,412,2,136,NULL,NULL);
INSERT INTO `image_mappings` VALUES (546,413,2,251,NULL,NULL);
INSERT INTO `image_mappings` VALUES (547,418,2,144,NULL,NULL);
INSERT INTO `image_mappings` VALUES (548,415,2,144,NULL,NULL);
INSERT INTO `image_mappings` VALUES (549,417,2,62,NULL,NULL);
INSERT INTO `image_mappings` VALUES (550,416,2,129,NULL,NULL);
INSERT INTO `image_mappings` VALUES (551,419,2,333,NULL,NULL);
INSERT INTO `image_mappings` VALUES (552,420,2,332,NULL,NULL);
INSERT INTO `image_mappings` VALUES (553,410,2,182,NULL,NULL);
INSERT INTO `image_mappings` VALUES (554,421,2,89,NULL,NULL);
INSERT INTO `image_mappings` VALUES (555,422,2,82,NULL,NULL);
INSERT INTO `image_mappings` VALUES (556,423,2,82,NULL,NULL);
INSERT INTO `image_mappings` VALUES (560,429,2,388,NULL,NULL);
INSERT INTO `image_mappings` VALUES (561,430,2,388,NULL,NULL);
INSERT INTO `image_mappings` VALUES (563,425,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (564,424,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (565,381,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (571,310,2,389,NULL,NULL);
INSERT INTO `image_mappings` VALUES (573,391,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (575,460,2,390,NULL,NULL);
INSERT INTO `image_mappings` VALUES (576,461,2,390,NULL,NULL);
INSERT INTO `image_mappings` VALUES (577,465,2,391,NULL,NULL);
INSERT INTO `image_mappings` VALUES (578,462,2,391,NULL,NULL);
INSERT INTO `image_mappings` VALUES (579,463,2,391,NULL,NULL);
INSERT INTO `image_mappings` VALUES (595,489,2,395,NULL,NULL);
INSERT INTO `image_mappings` VALUES (596,487,2,395,NULL,NULL);
INSERT INTO `image_mappings` VALUES (597,488,2,395,NULL,NULL);
INSERT INTO `image_mappings` VALUES (598,485,2,395,NULL,NULL);
INSERT INTO `image_mappings` VALUES (599,486,2,395,NULL,NULL);
INSERT INTO `image_mappings` VALUES (618,504,2,401,NULL,NULL);
INSERT INTO `image_mappings` VALUES (619,505,2,401,NULL,NULL);
INSERT INTO `image_mappings` VALUES (620,506,2,401,NULL,NULL);
INSERT INTO `image_mappings` VALUES (621,507,2,401,NULL,NULL);
INSERT INTO `image_mappings` VALUES (622,508,2,402,NULL,NULL);
INSERT INTO `image_mappings` VALUES (623,509,2,402,NULL,NULL);
INSERT INTO `image_mappings` VALUES (624,510,2,376,NULL,NULL);
INSERT INTO `image_mappings` VALUES (625,511,2,375,NULL,NULL);
INSERT INTO `image_mappings` VALUES (626,512,2,375,NULL,NULL);
INSERT INTO `image_mappings` VALUES (627,513,2,375,NULL,NULL);
INSERT INTO `image_mappings` VALUES (628,514,2,375,NULL,NULL);
INSERT INTO `image_mappings` VALUES (629,515,2,27,NULL,NULL);
INSERT INTO `image_mappings` VALUES (634,516,2,27,NULL,NULL);
INSERT INTO `image_mappings` VALUES (635,517,2,27,NULL,NULL);
INSERT INTO `image_mappings` VALUES (636,160,2,27,NULL,NULL);
INSERT INTO `image_mappings` VALUES (637,161,2,27,NULL,NULL);
INSERT INTO `image_mappings` VALUES (638,518,2,27,NULL,NULL);
INSERT INTO `image_mappings` VALUES (655,529,2,387,NULL,NULL);
INSERT INTO `image_mappings` VALUES (656,527,2,387,NULL,NULL);
INSERT INTO `image_mappings` VALUES (657,528,2,387,NULL,NULL);
INSERT INTO `image_mappings` VALUES (658,531,2,255,NULL,NULL);
INSERT INTO `image_mappings` VALUES (659,530,2,255,NULL,NULL);
INSERT INTO `image_mappings` VALUES (660,197,2,255,NULL,NULL);
INSERT INTO `image_mappings` VALUES (661,198,2,255,NULL,NULL);
INSERT INTO `image_mappings` VALUES (662,532,2,257,NULL,NULL);
INSERT INTO `image_mappings` VALUES (663,308,2,257,NULL,NULL);
INSERT INTO `image_mappings` VALUES (664,533,2,257,NULL,NULL);
INSERT INTO `image_mappings` VALUES (665,534,2,395,NULL,NULL);
INSERT INTO `image_mappings` VALUES (667,535,2,393,NULL,NULL);
INSERT INTO `image_mappings` VALUES (668,536,2,393,NULL,NULL);
INSERT INTO `image_mappings` VALUES (669,537,2,393,NULL,NULL);
INSERT INTO `image_mappings` VALUES (670,538,2,403,NULL,NULL);
INSERT INTO `image_mappings` VALUES (671,539,2,400,NULL,NULL);
INSERT INTO `image_mappings` VALUES (672,502,2,400,NULL,NULL);
INSERT INTO `image_mappings` VALUES (673,503,2,400,NULL,NULL);
INSERT INTO `image_mappings` VALUES (674,540,2,397,NULL,NULL);
INSERT INTO `image_mappings` VALUES (675,541,2,397,NULL,NULL);
INSERT INTO `image_mappings` VALUES (676,497,2,397,NULL,NULL);
INSERT INTO `image_mappings` VALUES (677,499,2,397,NULL,NULL);
INSERT INTO `image_mappings` VALUES (678,501,2,397,NULL,NULL);
INSERT INTO `image_mappings` VALUES (690,551,2,406,NULL,NULL);
INSERT INTO `image_mappings` VALUES (692,553,2,392,NULL,NULL);
INSERT INTO `image_mappings` VALUES (695,552,2,392,NULL,NULL);
INSERT INTO `image_mappings` VALUES (696,554,2,392,NULL,NULL);
INSERT INTO `image_mappings` VALUES (704,555,2,380,NULL,NULL);
INSERT INTO `image_mappings` VALUES (705,558,2,387,NULL,NULL);
INSERT INTO `image_mappings` VALUES (706,557,2,387,NULL,NULL);
INSERT INTO `image_mappings` VALUES (710,562,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (711,559,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (712,561,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (713,560,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (714,484,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (715,480,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (716,457,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (717,434,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (718,563,2,383,NULL,NULL);
INSERT INTO `image_mappings` VALUES (719,556,2,380,NULL,NULL);
INSERT INTO `image_mappings` VALUES (720,564,2,407,NULL,NULL);
INSERT INTO `image_mappings` VALUES (721,566,2,407,NULL,NULL);
INSERT INTO `image_mappings` VALUES (722,565,2,407,NULL,NULL);
INSERT INTO `image_mappings` VALUES (723,567,2,408,NULL,NULL);
INSERT INTO `image_mappings` VALUES (724,568,2,408,NULL,NULL);
INSERT INTO `image_mappings` VALUES (725,569,2,408,NULL,NULL);
INSERT INTO `image_mappings` VALUES (726,570,2,250,NULL,NULL);
INSERT INTO `image_mappings` VALUES (727,571,2,250,NULL,NULL);
INSERT INTO `image_mappings` VALUES (728,572,2,250,NULL,NULL);
INSERT INTO `image_mappings` VALUES (731,115,2,3,NULL,NULL);
INSERT INTO `image_mappings` VALUES (732,139,2,94,NULL,NULL);
INSERT INTO `image_mappings` VALUES (733,141,2,94,NULL,NULL);
INSERT INTO `image_mappings` VALUES (734,576,2,418,NULL,NULL);
INSERT INTO `image_mappings` VALUES (735,577,2,418,NULL,NULL);
INSERT INTO `image_mappings` VALUES (737,579,2,263,NULL,NULL);
INSERT INTO `image_mappings` VALUES (738,580,2,263,NULL,NULL);
INSERT INTO `image_mappings` VALUES (740,582,2,422,NULL,NULL);
INSERT INTO `image_mappings` VALUES (742,583,2,422,NULL,NULL);
INSERT INTO `image_mappings` VALUES (743,581,2,422,NULL,NULL);
INSERT INTO `image_mappings` VALUES (746,150,2,239,NULL,NULL);
INSERT INTO `image_mappings` VALUES (747,584,2,377,NULL,NULL);
INSERT INTO `image_mappings` VALUES (748,585,2,377,NULL,NULL);
INSERT INTO `image_mappings` VALUES (749,586,2,377,NULL,NULL);
INSERT INTO `image_mappings` VALUES (750,587,2,404,NULL,NULL);
INSERT INTO `image_mappings` VALUES (753,591,2,404,NULL,NULL);
INSERT INTO `image_mappings` VALUES (754,590,2,404,NULL,NULL);
INSERT INTO `image_mappings` VALUES (757,592,2,404,NULL,NULL);
INSERT INTO `image_mappings` VALUES (758,588,2,404,NULL,NULL);
INSERT INTO `image_mappings` VALUES (759,593,2,405,NULL,NULL);
INSERT INTO `image_mappings` VALUES (760,594,2,405,NULL,NULL);
INSERT INTO `image_mappings` VALUES (761,595,2,253,NULL,NULL);
INSERT INTO `image_mappings` VALUES (762,597,2,393,NULL,NULL);
INSERT INTO `image_mappings` VALUES (763,596,2,393,NULL,NULL);
INSERT INTO `image_mappings` VALUES (768,600,2,236,NULL,NULL);
INSERT INTO `image_mappings` VALUES (774,608,2,429,NULL,NULL);
INSERT INTO `image_mappings` VALUES (775,609,2,429,NULL,NULL);
INSERT INTO `image_mappings` VALUES (776,610,2,428,NULL,NULL);
INSERT INTO `image_mappings` VALUES (777,611,2,428,NULL,NULL);
INSERT INTO `image_mappings` VALUES (778,612,2,428,NULL,NULL);
INSERT INTO `image_mappings` VALUES (785,615,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (786,115,1,NULL,NULL,NULL);
INSERT INTO `image_mappings` VALUES (787,619,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (788,618,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (789,617,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (790,620,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (791,621,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (792,622,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (793,623,2,427,NULL,NULL);
INSERT INTO `image_mappings` VALUES (794,624,2,427,NULL,NULL);
INSERT INTO `image_mappings` VALUES (795,625,2,427,NULL,NULL);
INSERT INTO `image_mappings` VALUES (796,627,2,432,NULL,NULL);
INSERT INTO `image_mappings` VALUES (797,626,2,432,NULL,NULL);
INSERT INTO `image_mappings` VALUES (798,628,2,430,NULL,NULL);
INSERT INTO `image_mappings` VALUES (799,615,2,430,NULL,NULL);
INSERT INTO `image_mappings` VALUES (800,613,2,430,NULL,NULL);
INSERT INTO `image_mappings` VALUES (801,614,2,430,NULL,NULL);
INSERT INTO `image_mappings` VALUES (802,629,2,263,NULL,NULL);
INSERT INTO `image_mappings` VALUES (803,630,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (804,631,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (805,632,2,431,NULL,NULL);
INSERT INTO `image_mappings` VALUES (806,636,2,433,NULL,NULL);
INSERT INTO `image_mappings` VALUES (807,633,2,433,NULL,NULL);
INSERT INTO `image_mappings` VALUES (808,634,2,433,NULL,NULL);
INSERT INTO `image_mappings` VALUES (809,635,2,433,NULL,NULL);
INSERT INTO `image_mappings` VALUES (810,637,2,433,NULL,NULL);
/*!40000 ALTER TABLE `image_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `path` varchar(50) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (115,'1439445982.jpg','/resources/dbimages',1999,1332);
INSERT INTO `images` VALUES (117,'1439446701.jpg','/resources/dbimages',800,533);
INSERT INTO `images` VALUES (118,'1439447332.jpg','/resources/dbimages',1838,1225);
INSERT INTO `images` VALUES (121,'1439447890.jpg','/resources/dbimages',1899,1265);
INSERT INTO `images` VALUES (122,'1439448048.jpg','/resources/dbimages',900,600);
INSERT INTO `images` VALUES (123,'1439448251.jpg','/resources/dbimages',1767,1178);
INSERT INTO `images` VALUES (124,'1439448395.jpg','/resources/dbimages',1872,1249);
INSERT INTO `images` VALUES (126,'1439448712.jpg','/resources/dbimages',1862,1242);
INSERT INTO `images` VALUES (127,'1439448840.jpg','/resources/dbimages',1820,1214);
INSERT INTO `images` VALUES (128,'1439448977.jpg','/resources/dbimages',1785,1189);
INSERT INTO `images` VALUES (129,'1439449091.jpg','/resources/dbimages',1665,1111);
INSERT INTO `images` VALUES (130,'1439449219.jpg','/resources/dbimages',1775,1184);
INSERT INTO `images` VALUES (131,'1439449487.jpg','/resources/dbimages',600,399);
INSERT INTO `images` VALUES (132,'1439449668.jpg','/resources/dbimages',1854,1236);
INSERT INTO `images` VALUES (133,'1439450361.jpg','/resources/dbimages',1853,1236);
INSERT INTO `images` VALUES (134,'1439450717.jpg','/resources/dbimages',797,532);
INSERT INTO `images` VALUES (135,'1439453104.jpg','/resources/dbimages',531,354);
INSERT INTO `images` VALUES (136,'1439453806.jpg','/resources/dbimages',1786,1191);
INSERT INTO `images` VALUES (137,'1439453814.jpg','/resources/dbimages',1538,1025);
INSERT INTO `images` VALUES (138,'1439454695.jpg','/resources/dbimages',797,531);
INSERT INTO `images` VALUES (139,'1439454894.jpg','/resources/dbimages',632,421);
INSERT INTO `images` VALUES (140,'1439455609.jpg','/resources/dbimages',600,399);
INSERT INTO `images` VALUES (141,'1439457303.jpg','/resources/dbimages',715,476);
INSERT INTO `images` VALUES (142,'1439457679.jpg','/resources/dbimages',1656,1104);
INSERT INTO `images` VALUES (145,'1439458907.jpg','/resources/dbimages',1997,1331);
INSERT INTO `images` VALUES (146,'1439463899.jpg','/resources/dbimages',1646,1097);
INSERT INTO `images` VALUES (147,'1439464653.jpg','/resources/dbimages',1973,1315);
INSERT INTO `images` VALUES (148,'1439464664.jpg','/resources/dbimages',1984,1323);
INSERT INTO `images` VALUES (150,'1439465935.jpg','/resources/dbimages',960,640);
INSERT INTO `images` VALUES (151,'1439466198.jpg','/resources/dbimages',632,421);
INSERT INTO `images` VALUES (152,'1439466973.jpg','/resources/dbimages',1997,1331);
INSERT INTO `images` VALUES (153,'1439467384.jpg','/resources/dbimages',1785,1190);
INSERT INTO `images` VALUES (154,'1439467920.jpg','/resources/dbimages',1084,723);
INSERT INTO `images` VALUES (157,'1439469481.jpg','/resources/dbimages',1816,1211);
INSERT INTO `images` VALUES (158,'1439469641.jpg','/resources/dbimages',865,578);
INSERT INTO `images` VALUES (159,'1439471286.jpg','/resources/dbimages',1908,1274);
INSERT INTO `images` VALUES (160,'1439472072.jpg','/resources/dbimages',1901,1266);
INSERT INTO `images` VALUES (161,'1439472344.jpg','/resources/dbimages',1999,1332);
INSERT INTO `images` VALUES (162,'1439472937.jpg','/resources/dbimages',752,502);
INSERT INTO `images` VALUES (163,'1439477641.jpg','/resources/dbimages',1420,947);
INSERT INTO `images` VALUES (164,'1439477647.jpg','/resources/dbimages',1998,1332);
INSERT INTO `images` VALUES (166,'1439484031.jpg','/resources/dbimages',939,628);
INSERT INTO `images` VALUES (167,'1439484590.jpg','/resources/dbimages',797,531);
INSERT INTO `images` VALUES (168,'1439484595.jpg','/resources/dbimages',760,507);
INSERT INTO `images` VALUES (169,'1439484688.jpg','/resources/dbimages',798,531);
INSERT INTO `images` VALUES (171,'1439484920.jpg','/resources/dbimages',500,332);
INSERT INTO `images` VALUES (172,'1439485133.jpg','/resources/dbimages',799,533);
INSERT INTO `images` VALUES (173,'1439485282.jpg','/resources/dbimages',795,529);
INSERT INTO `images` VALUES (174,'1439485528.jpg','/resources/dbimages',791,527);
INSERT INTO `images` VALUES (175,'1439485873.jpg','/resources/dbimages',800,534);
INSERT INTO `images` VALUES (176,'1439486729.jpg','/resources/dbimages',800,534);
INSERT INTO `images` VALUES (178,'1439487298.jpg','/resources/dbimages',767,511);
INSERT INTO `images` VALUES (179,'1439491639.jpg','/resources/dbimages',800,533);
INSERT INTO `images` VALUES (180,'1439492411.jpg','/resources/dbimages',793,548);
INSERT INTO `images` VALUES (181,'1439494173.jpg','/resources/dbimages',556,371);
INSERT INTO `images` VALUES (182,'1439613926.jpg','/resources/dbimages',475,316);
INSERT INTO `images` VALUES (183,'1439616273.jpg','/resources/dbimages',723,481);
INSERT INTO `images` VALUES (184,'1439616347.jpg','/resources/dbimages',798,532);
INSERT INTO `images` VALUES (185,'1439616693.jpg','/resources/dbimages',796,531);
INSERT INTO `images` VALUES (186,'1439618259.jpg','/resources/dbimages',794,529);
INSERT INTO `images` VALUES (187,'1439974026.jpg','/resources/dbimages',1728,1152);
INSERT INTO `images` VALUES (188,'1440241478.jpg','/resources/dbimages',939,628);
INSERT INTO `images` VALUES (189,'1440241485.jpg','/resources/dbimages',1646,1097);
INSERT INTO `images` VALUES (190,'1440241789.jpg','/resources/dbimages',1744,1161);
INSERT INTO `images` VALUES (191,'1440241795.jpg','/resources/dbimages',1781,1186);
INSERT INTO `images` VALUES (192,'1440302040.jpg','/resources/dbimages',1458,972);
INSERT INTO `images` VALUES (193,'1440302050.jpg','/resources/dbimages',1840,1226);
INSERT INTO `images` VALUES (194,'1440323638.jpg','/resources/dbimages',1712,1141);
INSERT INTO `images` VALUES (195,'1440323644.jpg','/resources/dbimages',1990,1326);
INSERT INTO `images` VALUES (196,'1440323649.jpg','/resources/dbimages',1619,1080);
INSERT INTO `images` VALUES (197,'1440323654.jpg','/resources/dbimages',1707,1137);
INSERT INTO `images` VALUES (198,'1440323665.jpg','/resources/dbimages',1969,1312);
INSERT INTO `images` VALUES (199,'1440323673.jpg','/resources/dbimages',1648,1099);
INSERT INTO `images` VALUES (200,'1440324257.jpg','/resources/dbimages',1685,1123);
INSERT INTO `images` VALUES (201,'1440333814.JPG','/resources/dbimages',1907,1272);
INSERT INTO `images` VALUES (202,'1440335455.jpg','/resources/dbimages',1631,1088);
INSERT INTO `images` VALUES (203,'1440351353.jpg','/resources/dbimages',925,617);
INSERT INTO `images` VALUES (204,'1440352901.jpg','/resources/dbimages',1695,1129);
INSERT INTO `images` VALUES (205,'1440352907.jpg','/resources/dbimages',464,319);
INSERT INTO `images` VALUES (206,'1440352912.jpg','/resources/dbimages',557,581);
INSERT INTO `images` VALUES (207,'1440353809.jpg','/resources/dbimages',884,588);
INSERT INTO `images` VALUES (208,'1440354128.jpg','/resources/dbimages',888,593);
INSERT INTO `images` VALUES (209,'1440354888.jpg','/resources/dbimages',1039,693);
INSERT INTO `images` VALUES (210,'1440354895.jpg','/resources/dbimages',924,616);
INSERT INTO `images` VALUES (211,'1440355057.jpg','/resources/dbimages',1411,941);
INSERT INTO `images` VALUES (212,'1440385146.jpg','/resources/dbimages',1385,924);
INSERT INTO `images` VALUES (213,'1440396062.jpg','/resources/dbimages',1999,1328);
INSERT INTO `images` VALUES (214,'1440396067.jpg','/resources/dbimages',1817,1212);
INSERT INTO `images` VALUES (215,'1440396079.jpg','/resources/dbimages',1898,1266);
INSERT INTO `images` VALUES (216,'1440396085.jpg','/resources/dbimages',1925,1284);
INSERT INTO `images` VALUES (217,'1440396092.jpg','/resources/dbimages',1990,1327);
INSERT INTO `images` VALUES (218,'1440396099.jpg','/resources/dbimages',1248,1927);
INSERT INTO `images` VALUES (219,'1440396106.jpg','/resources/dbimages',1945,1980);
INSERT INTO `images` VALUES (220,'1440396210.jpg','/resources/dbimages',1999,1328);
INSERT INTO `images` VALUES (221,'1440396343.jpg','/resources/dbimages',799,533);
INSERT INTO `images` VALUES (222,'1440396374.jpg','/resources/dbimages',792,528);
INSERT INTO `images` VALUES (223,'1440396414.jpg','/resources/dbimages',1657,1725);
INSERT INTO `images` VALUES (224,'1440396423.jpg','/resources/dbimages',371,275);
INSERT INTO `images` VALUES (225,'1440396432.jpg','/resources/dbimages',772,514);
INSERT INTO `images` VALUES (226,'1440397538.jpg','/resources/dbimages',1857,1238);
INSERT INTO `images` VALUES (227,'1440397544.jpg','/resources/dbimages',1957,1305);
INSERT INTO `images` VALUES (228,'1440399247.jpg','/resources/dbimages',1024,780);
INSERT INTO `images` VALUES (229,'1440399254.jpg','/resources/dbimages',953,715);
INSERT INTO `images` VALUES (230,'1440399258.jpg','/resources/dbimages',800,600);
INSERT INTO `images` VALUES (231,'1440399262.jpg','/resources/dbimages',722,542);
INSERT INTO `images` VALUES (232,'1440399271.jpg','/resources/dbimages',800,566);
INSERT INTO `images` VALUES (233,'1440399382.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (238,'1440400714.jpg','/resources/dbimages',960,640);
INSERT INTO `images` VALUES (239,'1440404317.jpg','/resources/dbimages',800,533);
INSERT INTO `images` VALUES (240,'1440404324.jpg','/resources/dbimages',729,546);
INSERT INTO `images` VALUES (242,'1440584387.jpg','/resources/dbimages',1696,1130);
INSERT INTO `images` VALUES (243,'1440605110.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (244,'1440605122.jpg','/resources/dbimages',767,511);
INSERT INTO `images` VALUES (245,'1440605133.jpg','/resources/dbimages',492,328);
INSERT INTO `images` VALUES (246,'1440605163.jpg','/resources/dbimages',1467,978);
INSERT INTO `images` VALUES (247,'1440605168.jpg','/resources/dbimages',1648,1099);
INSERT INTO `images` VALUES (248,'1440605264.jpg','/resources/dbimages',999,667);
INSERT INTO `images` VALUES (249,'1440605270.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (251,'1440605410.jpg','/resources/dbimages',772,515);
INSERT INTO `images` VALUES (252,'1440605574.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (253,'1440605624.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (254,'1440605801.jpg','/resources/dbimages',638,425);
INSERT INTO `images` VALUES (255,'1440605821.jpg','/resources/dbimages',639,426);
INSERT INTO `images` VALUES (256,'1440605925.jpg','/resources/dbimages',686,458);
INSERT INTO `images` VALUES (257,'1440626525.jpg','/resources/dbimages',1959,1305);
INSERT INTO `images` VALUES (258,'1443923730.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (259,'1443923756.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (260,'1443923785.jpg','/resources/dbimages',648,432);
INSERT INTO `images` VALUES (261,'1443923808.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (262,'1443923836.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (263,'1443923879.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (264,'1443923922.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (265,'1443923951.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (266,'1443923974.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (267,'1443924007.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (268,'1443924038.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (269,'1443924088.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (272,'1443924193.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (273,'1443924215.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (274,'1443924249.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (275,'1443924281.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (276,'1443924311.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (277,'1443924333.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (278,'1443924352.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (279,'1443924370.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (280,'1443933538.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (281,'1443943438.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (282,'1443944054.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (283,'1443944154.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (284,'1443944237.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (285,'1443944299.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (286,'1443944310.jpg','/resources/dbimages',150,100);
INSERT INTO `images` VALUES (287,'1443944326.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (288,'1443944347.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (289,'1443944871.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (290,'1443945020.png','/resources/dbimages',150,100);
INSERT INTO `images` VALUES (291,'1443945768.jpg','/resources/dbimages',799,533);
INSERT INTO `images` VALUES (292,'1443945785.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (293,'1443945817.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (294,'1443946149.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (295,'1443946346.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (296,'1443946532.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (297,'1443946634.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (298,'1443946642.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (299,'1443946650.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (300,'1443946656.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (301,'1443946677.jpg','/resources/dbimages',150,100);
INSERT INTO `images` VALUES (302,'1443946697.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (303,'1443946785.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (304,'1443946906.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (305,'1443947042.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (306,'1443947295.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (307,'1443962092.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (308,'1443963195.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (309,'1443965137.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (310,'1443973905.jpg','/resources/dbimages',1200,799);
INSERT INTO `images` VALUES (311,'1443974392.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (312,'1443975128.jpg','/resources/dbimages',1025,683);
INSERT INTO `images` VALUES (324,'1444026907_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (325,'1444027557_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (344,'1444056268_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (351,'1444056432_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (352,'1444056432_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (353,'1444056432_2.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (354,'1444056433_3.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (355,'1444056433_4.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (356,'1444057383_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (357,'1444057383_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (358,'1444057384_2.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (359,'1444057384_3.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (361,'1444058378_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (362,'1444058403_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (363,'1444058443_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (364,'1444058443_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (365,'1444059297_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (366,'1444059297_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (367,'1444059298_2.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (368,'1444059298_3.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (369,'1444059298_4.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (370,'1444059335_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (371,'1444059335_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (372,'1444059335_2.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (373,'1444059335_3.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (374,'1444059335_4.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (375,'1444059336_5.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (376,'1444059489_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (377,'1444061716_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (378,'1444068750_0.jpg','/resources/dbimages',NULL,NULL);
INSERT INTO `images` VALUES (379,'1444071702_0.jpg','/resources/dbimages',NULL,NULL);
INSERT INTO `images` VALUES (380,'1444072306_0.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (381,'1444110492_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (382,'1444110683_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (383,'1444111143_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (384,'1444111259_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (385,'1444111384_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (386,'1444113773_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (387,'1444114852_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (388,'1444115715_0.jpg','/resources/dbimages',300,200);
INSERT INTO `images` VALUES (389,'1444116581_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (390,'1444117890_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (391,'1444122588_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (392,'1444124376_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (393,'1444124694_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (394,'1444130453_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (395,'1444134399_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (396,'1444134725_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (397,'1444134731_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (398,'1444134855_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (399,'1444134997_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (400,'1444135233_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (401,'1444153384_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (402,'1444153384_1.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (403,'1444153384_2.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (404,'1444153384_3.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (405,'1444153384_4.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (406,'1444153384_5.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (407,'1444155159_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (408,'1444155159_1.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (409,'1444155159_2.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (410,'1444155159_3.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (411,'1444155160_4.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (412,'1444155160_6.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (413,'1444155160_7.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (414,'1444155246_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (415,'1444159936_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (416,'1444159936_2.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (417,'1444159936_3.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (418,'1444159936_5.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (419,'1444225459_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (420,'1444225656_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (421,'1444227119_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (422,'1444227691_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (423,'1444227759_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (424,'1444328104_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (425,'1444371269_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (426,'1444371442_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (427,'1444371448_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (428,'1444384797_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (429,'1444384803_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (430,'1444384898_0.jpg','/resources/dbimages',1200,799);
INSERT INTO `images` VALUES (431,'1444398128_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (434,'1444464474_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (435,'1444464509_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (436,'1444482186_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (437,'1444483020_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (438,'1444509829_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (440,'1444509830_2.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (441,'1444509830_3.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (442,'1444509830_4.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (443,'1444509830_5.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (444,'1444509830_6.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (445,'1444509830_7.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (446,'1444509830_8.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (447,'1444509830_9.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (448,'1444509830_10.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (449,'1444509830_11.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (450,'1444509830_12.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (451,'1444509830_13.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (452,'1444509977_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (456,'1444510580_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (457,'1444510582_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (458,'1444510582_2.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (459,'1444824166_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (460,'1444824186_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (461,'1444824247_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (462,'1444830166_0.jpg','/resources/dbimages',1200,799);
INSERT INTO `images` VALUES (463,'1444830948_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (464,'1444831846_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (465,'1444831866_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (468,'1445018639_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (469,'1445067465_0.jpg','/resources/dbimages',1202,800);
INSERT INTO `images` VALUES (470,'1445067728_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (472,'1445082066_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (474,'1445082334_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (475,'1445082453_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (476,'1445082471_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (477,'1445083410_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (478,'1445256191_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (479,'1445256205_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (480,'1445256222_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (481,'1445256239_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (482,'1445256768_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (483,'1445256783_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (484,'1445259379_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (485,'1445268989_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (486,'1445269004_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (487,'1445269027_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (488,'1445269093_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (489,'1445269308_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (490,'1445326096_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (491,'1445326424_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (492,'1445326641_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (493,'1445421712_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (494,'1445422055_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (495,'1445514006_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (496,'1445514022_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (497,'1445514038_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (498,'1445514078_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (499,'1445514215_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (500,'1445514314_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (501,'1445514392_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (502,'1445517280_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (503,'1445517512_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (504,'1445521432_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (505,'1445521444_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (506,'1445521452_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (507,'1445521475_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (508,'1445525958_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (509,'1445528324_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (510,'1445538748_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (511,'1445574535_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (512,'1445574608_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (513,'1445574645_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (514,'1445574666_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (515,'1445679234_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (516,'1445679245_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (517,'1445679264_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (518,'1445680062_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (519,'1445692254_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (520,'1445692435_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (521,'1445748453_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (522,'1445748466_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (523,'1445751577_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (524,'1445751593_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (525,'1445751613_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (526,'1445751700_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (527,'1445778255_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (528,'1445778967_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (529,'1445780012_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (530,'1445854689_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (531,'1445854898_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (532,'1445868991_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (533,'1445869610_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (534,'1446040228_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (535,'1446129771_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (536,'1446130472_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (537,'1446130914_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (538,'1446216787_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (539,'1446304205_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (540,'1446304235_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (541,'1446304267_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (542,'1447763856_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (543,'1447764289_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (544,'1447764929_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (545,'1448963055_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (546,'1448963060_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (547,'1448963067_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (548,'1448976680_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (549,'1448977220_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (550,'1448977469_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (551,'1448977940_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (552,'1449212907_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (553,'1449213318_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (554,'1449226587_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (555,'1449244708_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (556,'1449244717_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (557,'1449573670_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (558,'1449573677_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (559,'1449684940_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (560,'1449685104_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (561,'1449685209_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (562,'1449685460_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (563,'1449686396_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (564,'1449827180_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (565,'1449827191_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (566,'1449827206_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (567,'1449838796_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (568,'1449838804_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (569,'1449838819_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (570,'1449911099_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (571,'1449911525_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (572,'1449911843_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (576,'1450371226_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (577,'1450371365_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (578,'1450438348_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (579,'1450438824_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (580,'1450439035_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (581,'1450611043_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (582,'1450611454_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (583,'1450612187_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (584,'1452672952_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (585,'1452673159_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (586,'1452673318_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (587,'1453389893_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (588,'1453390126_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (589,'1453390262_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (590,'1453390478_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (591,'1453390797_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (592,'1453391187_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (593,'1458134510_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (594,'1458134523_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (595,'1460037389_0.jpg','/resources/dbimages',600,400);
INSERT INTO `images` VALUES (596,'1463719768_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (597,'1463719776_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (598,'1465138579_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (599,'1466601521_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (600,'1466697171_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (601,'1466697300_0.jpg','/resources/dbimages',960,640);
INSERT INTO `images` VALUES (602,'1466814462_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (603,'1466814583_0.JPG','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (604,'1466814595_0.JPG','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (605,'1466814610_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (606,'1466818099_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (607,'1466818340_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (608,'1467019295_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (609,'1467019866_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (610,'1467020267_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (611,'1467020796_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (612,'1467020951_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (613,'1467022928_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (614,'1467022935_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (615,'1467023661_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (616,'1467296647_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (617,'1467296762_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (618,'1467298445_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (619,'1467298961_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (620,'1467299084_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (621,'1467299199_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (622,'1467299678_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (623,'1467686801_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (624,'1467686806_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (625,'1467686813_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (626,'1467687147_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (627,'1467687301_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (628,'1468222100_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (629,'1469386932_0.jpg','/resources/dbimages',871,580);
INSERT INTO `images` VALUES (630,'1469387255_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (631,'1469387273_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (632,'1469387485_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (633,'1469388624_0.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (634,'1469388624_1.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (635,'1469388625_2.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (636,'1469388625_3.jpg','/resources/dbimages',1200,800);
INSERT INTO `images` VALUES (637,'1469388625_4.jpg','/resources/dbimages',1200,800);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en');
INSERT INTO `languages` VALUES (2,'ua');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'radio.mkor@gmail.com','3b0aae20c53e4c5716d6b861b77f89fa49421f8b','Mykhailo','Koretskyi');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `message` longtext NOT NULL,
  `is_new` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (2,'Koretska','Maria','0931189393','shaparackc@yahoo.com');
INSERT INTO `people` VALUES (3,' Corson Johanson','  Lynn','','');
INSERT INTO `people` VALUES (4,'Webster','John and Debbie  ','','');
INSERT INTO `people` VALUES (5,'Shamaeva','Anna Andreevna','','');
INSERT INTO `people` VALUES (6,'Not',' owner','','');
INSERT INTO `people` VALUES (7,' for the owner','He is looking','','');
INSERT INTO `people` VALUES (8,'Doskoch','Natalia','','');
INSERT INTO `people` VALUES (9,'Pedro','Hugo','','');
INSERT INTO `people` VALUES (10,' Gonano','Hope McKeel ',NULL,NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo`
--

DROP TABLE IF EXISTS `seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `description` longtext,
  `key_words` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo`
--

LOCK TABLES `seo` WRITE;
/*!40000 ALTER TABLE `seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `text` longtext,
  `video` varchar(256) DEFAULT NULL,
  `date_of_show` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (11,'','seven of the eight finals','','2015-03-21');
INSERT INTO `shows` VALUES (12,'Shaparack Zemfira 8 Best Kitten of Scoring ','CFA Cat Show, March, 21-22, 2015, Kiev','','2015-03-22');
INSERT INTO `shows` VALUES (13,'Shaparack Zemfira','','','2015-03-21');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-15 15:15:20
