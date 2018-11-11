-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: boighor
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Rakib Hasan',NULL),(2,'Sir Arthur Conan Doyle',NULL),(3,'Sayem Solaiman',NULL),(4,'Henry Ryder Haggard',NULL),(5,'Saiful Alaifin Apu',NULL),(6,'Kazi Anwar Hossain',NULL),(7,'Laura Ingalls Wylder',NULL),(8,'Bram Stoker',NULL),(9,'Ismail Arman',NULL),(20,'Abul Hasan',NULL),(21,'Abdul Mannan Syed',NULL),(22,'Binoy Majumder',NULL),(23,'Shakti Chattopadhyay',NULL),(24,'Rudra Muhammad Shahidullah',NULL),(25,'Nirmalendu Gun',NULL),(26,'Helal Hafez',NULL),(27,'Rahat Rasti',NULL),(28,'Colonel Sarwar Hossain Molla (Ret.)',NULL),(29,'Colonel Shafayet Jamil (Ret.)',NULL),(30,'Ahmad Rafiq',NULL),(31,'Tirthankar Roy',NULL),(32,'AK Khandaker',NULL),(33,'Anu Muhammad',NULL),(34,'Jesse Marie Cuiya',NULL),(35,'Major General Amin Ahmed Chowdhury',NULL),(36,'A\'m fazlur Rashid',NULL),(37,'Samaresh Majumder',NULL),(38,'Sirsendu Mukherjee',NULL),(39,'Sunil Gangopadhyay',NULL),(40,'Anisul Haque',NULL),(41,'Jahanara Imam',NULL),(42,'Humayun Ahmed',NULL),(43,'Moinul Ahsan Saber',NULL),(44,'Muhammad Zafar Iqbal',NULL),(45,'Akbar Ali Khan',NULL),(46,'Ragib Hasan',NULL),(47,'Justice Muhammad Habibur Rahman',NULL),(48,'Ahmed Musa',NULL),(49,'Dr. Pinakki Bhattacharya',NULL),(50,'Tarapod ray',NULL),(51,'Mohammad Amin',NULL),(52,'Ahsan Kabir',NULL),(53,'Kazi Mohammad Shajahan',NULL),(54,'Iftekhar Rasul George',NULL),(55,'Mohammad Nasir Ali',NULL),(56,'Rabindranath Tagore',NULL),(57,'Amartya Sen',NULL),(58,'Md. Sabur Khan',NULL),(59,'Kaushik Basu',NULL),(60,'Bazlur Rahman',NULL),(61,'Shawkat Hossain',NULL),(62,'Mostaq Ahmad',NULL),(63,'Khondakar Ibrahim Khaled',NULL),(64,'Syed Ashraf Ali',NULL),(65,'Barbara E Kahn',NULL),(66,'Iftekhar Amin',NULL),(67,'Sohrab Suman',NULL),(68,'Swapan Delwar',NULL),(69,'Chinmay Pal',NULL),(70,'Dr. Md. Shafiqur Rahman',NULL),(71,'Akhlakur Rahman Rahi',NULL),(72,'Abdullah Abu Sayeed',NULL),(73,'Syed Mujtaba Ali',NULL),(74,'Major General K. M. Safiullah',NULL),(75,'Mofizul Islam',NULL),(76,'Golam Murshid',NULL),(77,'Anwar ul Alam',NULL),(78,'Mueedul Hasan',NULL),(79,'Rafiqul Islam Bir Uttam',NULL),(80,'MR Akhtar Mukul',NULL),(81,'Ronagone Muktijuddhara',NULL),(82,'Sufia Kamal',NULL),(83,'Jhonkar Mahbub',NULL),(84,'Arif Azad',NULL),(85,'Tanzina Hossain',NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author_id` int(11) NOT NULL,
  `trans_author_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `author_id` (`author_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `trans_author_id` (`trans_author_id`),
  KEY `catagory_id` (`catagory_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  CONSTRAINT `book_ibfk_4` FOREIGN KEY (`trans_author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `book_ibfk_5` FOREIGN KEY (`catagory_id`) REFERENCES `catagory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (4,'Queen of the Dawn (Paperback)',4,3,1,4,129,'Queen of the Dawn.PNG'),(5,'Poyjon Belt',2,1,2,4,220,'Poyjon Belt.PNG'),(6,'The Ghost Kings (Paperback)',4,5,2,4,220,'The Ghost Kings .PNG'),(7,'Nada the Lily',4,9,2,4,270,'Nada the Lily.PNG'),(8,'Mary',4,3,2,4,200,'Mary.PNG'),(9,'Montejumer Meye',4,6,2,4,200,'Montejumer Meye.PNG'),(12,'Swallow (paperback)',4,3,2,4,150,'Swallow.PNG'),(13,'Cleopatra',4,3,2,4,180,'Cleopatra.PNG'),(14,'Firm\'s Boy Little House on the Priory',7,6,2,4,230,'Firm\'s Boy Little House on the Priory.PNG'),(15,'Dracula(1+2)',8,1,2,4,300,'Dracula(1+2).PNG'),(30,'Kagojer aeroplan',27,NULL,9,2,220,'Kagojer aeroplan.PNG'),(31,'Kobita ekator',26,NULL,10,2,300,'Kobita ekator.PNG'),(32,'Nirbachito 100 kobita',25,NULL,10,2,340,'Nirbachito 100 kobita'),(33,'Premer Kobita',25,NULL,11,2,250,'Premer Kobita.PNG'),(34,'Kobitashomogro',24,NULL,12,2,300,'Kobitashomogro.PNG'),(35,'Ek glass ondhokar',24,NULL,12,2,210,'Ek glass ondhokar.PNG'),(36,'Shakti Chattopadhyay\'s srehsto kobita',23,NULL,13,2,290,'Shakti Chattopadhyay\'s srehsto kobita.PNG'),(37,'Binoy Majumder\'s srehsto kobita',22,NULL,13,2,265,'Binoy Majumder\'s srehsto kobita.PNG'),(38,'Abdul Mannan Syed\'s srehsto kobita',21,NULL,14,2,270,'Abdul Mannan Syed\'s srehsto kobita.PNG'),(39,'Abul Hasaner oprokashito kobita',20,NULL,10,2,360,'Abul Hasaner oprokashito kobita.PNG'),(40,'The Art of War (Hardcover)',36,NULL,23,5,380,'The Art of War (Hardcover).PNG'),(43,'The Mayan Secrets (Hardcover)',34,NULL,21,5,300,'The Mayan Secrets (Hardcover).PNG'),(44,'Bangladesh muktijuddho shomrajjobad o India proshno (Hardcover)',33,NULL,20,5,240,'Bangladesh muktijuddho shomrajjobad o India proshno (Hardcover).PNG'),(45,'East India Company and India\'s Economic History (Hardcover)',31,NULL,18,5,310,'East India Company and India\'s Economic History (Hardcover).PNG'),(46,'Vetore Bahire 1971 (hardcover)',32,NULL,2,5,320,'Vetore Bahire 1971 (hardcover).PNG'),(47,'1971 o amar shamorik jibon (hardcover)',35,NULL,2,5,300,'1971 o amar shamorik jibon (hardcover).PNG'),(48,'Deshbivag Fire dekha (Hardcover)',30,NULL,17,5,290,'Deshbivag Fire dekha (Hardcover).PNG'),(49,'Ekatorer muktijuddho,roktakto moddho August o jontronamoy November (hardcover)',29,NULL,16,5,280,'Ekatorer muktijuddho,roktakto moddho August o jontronamoy November (hardcover).PNG'),(50,'Rokkhi bahinir ojana odhay (hardcover)',28,NULL,15,5,275,'Rokkhi bahinir ojana odhay (hardcover).PNG'),(53,'At kuthori noy dorjar',37,NULL,18,3,140,'At kuthori noy dorjar.PNG'),(54,'Musalkal (hardcover)',37,NULL,18,3,250,'Musalkal (hardcover).PNG'),(55,'Durbin',38,NULL,18,3,120,'Durbin'),(56,'Manobjomin',38,NULL,18,3,130,'Manobjomin.PNG'),(57,'Prothom alo (integrated)',39,NULL,18,3,200,'Prothom alo (integrated).PNG'),(58,'Ma',40,NULL,24,3,130,'Ma.PNG'),(59,'Ekatorer dingulo',41,NULL,25,3,170,'Ekatorer dingulo.PNG'),(60,'Deyal',42,NULL,26,3,140,'Deyal.PNG'),(61,'Evabe lekha hote pare arekti golpo',43,NULL,27,3,110,'Evabe lekha hote pare arekti golpo.PNG'),(62,'Jokhon jagibe tumi',44,NULL,28,3,140,'Jokhon jagibe tumi.PNG'),(63,'Prathoprotar orthoniti',45,NULL,29,1,170,'Prathoprotar orthoniti.PNG'),(64,'Gobeshonar hathekhori',46,NULL,30,1,140,'Gobeshonar hathekhori.PNG'),(65,'Rokkha bahinir ojana odhay',28,NULL,15,1,140,'Rokkha bahinir ojana odhay.PNG'),(66,'Ekjon shadasidhe ma ebong onanno',44,NULL,28,1,130,'Ekjon shadasidhe ma ebong onanno.PNG'),(67,'Hotel Graver In',42,NULL,11,1,150,'Hotel Graver In.PNG'),(68,'Nagorikder jana valo',47,NULL,2,1,100,'Nagorikder jana valo.PNG'),(69,'Ajob o jobor-ajob orthoniti',45,NULL,2,1,160,'Ajob o jobor-ajob orthoniti.PNG'),(70,'Amar chotobela',42,NULL,11,1,150,'Amar chotobela.PNG'),(71,'Jemon dekhechi one eleven',48,NULL,31,1,135,'Jemon dekhechi one eleven.PNG'),(72,'Nana ronger Rabindranath (Hardcover)',49,NULL,32,1,180,'Nana ronger Rabindranath (Hardcover).PNG'),(73,'Bhagabhagi(hardcover)',50,NULL,18,7,260,'Bhagabhagi(hardcover).PNG'),(74,'Sorbonash (hardcover)',50,NULL,18,7,230,'Sorbonash (hardcover).PNG'),(75,'Dui mataler golpo o onnanno (hardcover)',50,NULL,18,7,280,'Dui mataler golpo o onnanno (hardcover).PNG'),(76,'Ulto dekshe nondo ghosh (hardcover)',51,NULL,9,7,300,'Ulto dekshe nondo ghosh (hardcover).PNG'),(77,'Manusher cheye chair boro (hardcover)',52,NULL,9,7,270,'Manusher cheye chair boro (hardcover).PNG'),(78,'Vabacaka',53,NULL,33,7,120,'Vabacaka.PNG'),(79,'Sreshtho rommorochona',50,NULL,34,7,160,'Sreshtho rommorochona.PNG'),(80,'Mullah Nasiruddiner golpo',54,NULL,35,7,130,'Mullah Nasiruddiner golpo.PNG'),(81,'Birbaler khosh golpo',55,NULL,35,7,190,'Birbaler khosh golpo.PNG'),(82,'Chotobela (hardcover)',56,NULL,36,7,220,'Chotobela (hardcover).PNG'),(83,'Life and Economics (Hardcover)',57,NULL,18,11,200,'Life and Economics (Hardcover).PNG'),(84,'Uddokta unnoyon nirdeshika',58,NULL,37,11,170,'Uddokta unnoyon nirdeshika.PNG'),(85,'Orthonitir jukti torko o golpo (hardcover)',59,NULL,18,11,230,'Orthonitir jukti torko o golpo (hardcover).PNG'),(86,'Bangladesher orthonitic halchal (1974-1987) (Hardcover)',60,NULL,38,11,100,'Bangladesher orthonitic halchal (1974-1987) (Hardcover).PNG'),(87,'Uddogtake ha bolun',61,NULL,39,11,120,'Uddogtake ha bolun.PNG'),(88,'Buddhi o biniyog share bebshar shera shafollow',62,NULL,40,11,130,'Buddhi o biniyog share bebshar shera shafollow.PNG'),(89,'Banking Shogoskar o Bebosthapona',63,NULL,41,11,140,'Banking Shogoskar o Bebosthapona.PNG'),(90,'Foreign exchange and international banijjo orthayon',64,NULL,41,11,150,'Foreign exchange and international banijjo orthayon.PNG'),(91,'Unnoyon o sh-khomota (hardcover)',57,NULL,18,11,200,'Unnoyon o sh-khomota (hardcover).PNG'),(92,'Global Brand Power(Paperback)',65,NULL,42,11,110,'Global Brand Power(Paperback).PNG'),(93,'Vromonshompgro (Hardcover)',42,NULL,26,9,300,'Vromonshompgro (Hardcover).PNG'),(94,'Deshe bideshe (hardcover)',73,NULL,36,9,160,'Deshe bideshe (hardcover).PNG'),(95,'Oraurirdin Volume-1 (Hardcover)',72,NULL,24,9,140,'Oraurirdin Volume-1 (Hardcover).PNG'),(96,'Shuru hok Himalaya (hardcover)',71,NULL,46,9,320,'Shuru hok Himalaya (hardcover).PNG'),(97,'Ginsberger shonge',25,NULL,10,9,170,'Ginsberger shonge.PNG'),(98,'Bangladesh vromon-darshoniyo sthan',70,NULL,45,9,180,'Bangladesh vromon-darshoniyo sthan.PNG'),(99,'30 dine Bangladesh vromon',69,NULL,44,9,130,'30 dine Bangladesh vromon.PNG'),(100,'Uttor shagor tirre (Hardcover)',68,NULL,9,9,220,'Uttor shagor tirre (Hardcover).PNG'),(101,'Travels of Marco Polo (Hardcover)',67,NULL,27,9,280,'Travels of Marco Polo (Hardcover).PNG'),(102,'Travels of Ibn Battuta (Hardcover)',66,NULL,43,9,300,'Travels of Ibn Battuta (Hardcover).PNG'),(104,'Bangladesh At War (Hardcover)',74,NULL,47,6,450,'Bangladesh At War (Hardcover).PNG'),(105,'Gourobmoy muktijudho Shoriyatpurer judhokahini (Hardcover)',75,NULL,48,6,400,'Gourobmoy muktijudho Shoriyatpurer judhokahini (Hardcover).PNG'),(106,'Ekatorer diary',82,NULL,50,6,270,'Ekatorer diary.PNG'),(108,'Ekatorer Chithi',81,NULL,2,6,230,'Ekatorer Chithi.PNG'),(109,'Ami bijoy dekhechi',80,NULL,49,6,240,'Ami bijoy dekhechi.PNG'),(110,'Lokkho praner binimoye',79,NULL,49,6,260,'Lokkho praner binimoye.PNG'),(111,'Muldhara\' 71 (Hardcover)',78,NULL,29,6,380,'Muldhara\' 71 (Hardcover).PNG'),(112,'Muktijudher purbapor kothopokothon (Hardcover)',32,NULL,2,6,400,'Muktijudher purbapor kothopokothon (Hardcover).PNG'),(113,'Rokkhabahinir shotto-mittha',77,NULL,2,6,290,'Rokkhabahinir shotto-mittha.PNG'),(114,'Muktijudho o tarpor ekti nirdolio etihash',76,NULL,2,6,265,'Muktijudho o tarpor ekti nirdolio etihash.PNG'),(115,'Lak holer baccha (Hardcover)',44,NULL,24,8,370,'Lak holer baccha (Hardcover).PNG'),(116,'Estishon',44,NULL,53,8,210,'Estishon.PNG'),(117,'Science Fiction Shomogro (Hardcover)',42,NULL,15,8,420,'Science Fiction Shomogro (Hardcover).PNG'),(118,'Priyo ei prithibi chere (hardcover)',40,NULL,2,8,400,'Priyo ei prithibi chere (hardcover).PNG'),(119,'Alina (hardcover)',85,NULL,2,8,430,'Alina (hardcover).PNG'),(120,'Ritin (hardcover)',44,NULL,53,8,410,'Ritin (hardcover).PNG'),(121,'Iccha puron (Hardcover)',44,NULL,49,8,350,'Iccha puron (Hardcover).PNG'),(122,'Prodigy (Hardcover)',44,NULL,52,8,380,'Prodigy (Hardcover).PNG'),(123,'Paradoxical Sajid (Hardcover)',84,NULL,51,8,390,'Paradoxical Sajid (Hardcover).PNG'),(124,'Programminger bolod to boss (Hardcover)',83,NULL,30,8,340,'Programminger bolod to boss (Hardcover).PNG');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catagory`
--

DROP TABLE IF EXISTS `catagory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catagory`
--

LOCK TABLES `catagory` WRITE;
/*!40000 ALTER TABLE `catagory` DISABLE KEYS */;
INSERT INTO `catagory` VALUES (1,'Articles'),(11,'Business, Investment and Economy'),(5,'History and Heritage'),(6,'Liberation war'),(3,'Novel'),(2,'Poem'),(7,'Satire and Amusement'),(8,'Science Fiction'),(4,'Translation'),(9,'Travel and Exile');
/*!40000 ALTER TABLE `catagory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `house` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Sheba Prokashoni',NULL,NULL,NULL,NULL),(2,'Prothoma Prokashon',NULL,NULL,NULL,NULL),(9,'Jagroti prokashoni','','','',''),(10,'Bivash','','','',''),(11,'Kakali Prakashani','','','',''),(12,'Okkhor prokashoni','','','',''),(13,'De\'j Publishing','','','',''),(14,'Muktodhara','','','',''),(15,'Onnesha Prokashon','','','',''),(16,'Shahitto prokash','','','',''),(17,'Onindo prokash','','','',''),(18,'Anand Publishers','','','',''),(20,'Noborag Prakashani','','','',''),(21,'Rodela Prakashani','','','',''),(23,'Adorn Publication','','','',''),(24,'Shomoy prokashon','','','',''),(25,'Sondhani prokashoni','','','',''),(26,'Onno prokash','','','',''),(27,'Dibbo Prokash','','','',''),(28,'Afsar Brothers','','','',''),(29,'The University Press Limited (UPL)','','','',''),(30,'Adarsha','','','',''),(31,'Shuchipotro','','','',''),(32,'Palalic Sourav','','','',''),(33,'Shoilpishi','','','',''),(34,'Mitro and Ghosh Publishers Pvt. Ltd.','','','',''),(35,'Nowrooz shahitto somvar','','','',''),(36,'Bissho shahitto kendro','','','',''),(37,'Daffodil International University Press','','','',''),(38,'Jatio Shahitto Prokash','','','',''),(39,'Student Wage','','','',''),(40,'Shomachar','','','',''),(41,'Mawla Brothers','','','',''),(42,'Penguin group','','','',''),(43,'Oitijho','','','',''),(44,'Ajk-kal Prokashoni','','','',''),(45,'Hatekhori','','','',''),(46,'Chayabithi','','','',''),(47,'Academic Press & Publishers Library','','','',''),(48,'Kalikolom prokashona','','','',''),(49,'Ananya','','','',''),(50,'Howlader Prokashoni','','','',''),(51,'Guardian Publications','','','',''),(52,'Gyanokosh Prakashani','','','',''),(53,'Tamralipi','','','','');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `house` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `police_station` varchar(100) NOT NULL,
  `post_office` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `zip_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-23  2:12:40
