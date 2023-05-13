DROP DATABASE IF EXISTS db1initial;

CREATE DATABASE db1initial;

USE db1initial;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2023 at 09:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `AddBook` (IN `book_ISBN` VARCHAR(20), IN `title` VARCHAR(255), IN `author_name` VARCHAR(255), IN `publisher_name` VARCHAR(255), IN `year_published` YEAR(4), IN `category_name` VARCHAR(255), IN `school_id` INT(11))   BEGIN
    DECLARE P_ID,C_ID,A_ID,V_COUNT INT DEFAULT 0;
    select count(*) from book where ISBN=book_ISBN INTO V_COUNT;
    
    IF(V_COUNT = 0) THEN
	    select count(*) from publisher where name=publisher_name INTO V_COUNT;
	    IF (V_COUNT=0) THEN
			INSERT  INTO publisher (name) VALUES (publisher_name);
			SET P_ID=LAST_INSERT_ID();
	    ELSE
		select publisher_id from publisher where name=publisher_name INTO P_ID;
	    END IF;

	    select count(*) from category where  name=category_name INTO V_COUNT;
	    IF (V_COUNT=0) THEN
			INSERT  INTO category (name) VALUES (category_name);
			SET C_ID=LAST_INSERT_ID();
	    ELSE
		select category_id from category where name=category_name INTO C_ID;
	    END IF;

	    select count(*)  from author where  name=author_name INTO V_COUNT;
	    IF (V_COUNT=0) THEN
			INSERT  INTO author (name) VALUES (author_name);
			SET A_ID=LAST_INSERT_ID();
	    ELSE
		select author_id from author where name=author_name INTO A_ID;
	    END IF;

	    INSERT INTO book  (ISBN, title, edition, no_pages, publisher_id, summary, image, `language`, `key-words`)
	    VALUES(book_ISBN, title, year_published, 0, P_ID, '', '', 'English', '');

	    INSERT INTO book_to_author (ISBN,author_id) 
	    VALUES(book_ISBN, A_ID);

	    INSERT INTO book_to_category (ISBN, category_id) 
	    VALUES(book_ISBN, C_ID);

	    INSERT INTO book_copy (book_id, dewey_code, school_id)
	    VALUES(book_ISBN, '_', school_id);
    END IF;
END$$

DELIMITER ;




-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(255) NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(30) NULL,
  `phone_number` bigint(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `principal_name` varchar(60) NOT NULL,
  `operator_name` varchar(60) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
-- --------------------------------------------------------

--
-- Table structure for table `book`
-- 

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `edition` varchar(50) NOT NULL DEFAULT 'X.0',
  `no_pages` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `summary` longtext NOT NULL DEFAULT 'Summary of the Book',
  `image` varchar(255) NOT NULL DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeE4BZwuwU8ODTBIrNIoSs4xxVuOU2XSzQTQ&usqp=CAU',
  `language` varchar(40) NOT NULL DEFAULT 'English',
  `key-words` varchar(70) NOT NULL DEFAULT 'Key words of the book',
  `year_published` year(4) NOT NULL,
  PRIMARY KEY (ISBN),
  CONSTRAINT `FK_PUBLISHER_ID` FOREIGN KEY (publisher_id) REFERENCES `publisher` (publisher_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------
--
-- Table structure for table `book_copy`
--

-- --------------------------------------------------------

CREATE TABLE `book_copy` (
  `copy_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(20) NOT NULL,
  `dewey_code` varchar(8) NOT NULL DEFAULT '800.0xxx' COMMENT 'https://en.wikipedia.org/wiki/List_of_Dewey_Decimal_classes ',
  `school_id` int(11) NOT NULL,
  `status` enum('available', 'hold', 'checkout') NOT NULL DEFAULT 'available',
  PRIMARY KEY (`copy_id`),
  CONSTRAINT `FK_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SCHOOL_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book_to_author`
--

-- --------------------------------------------------------

CREATE TABLE `book_to_author` (
  `author_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  CONSTRAINT `FK_AUTHOR_ID` FOREIGN KEY (author_id) REFERENCES `author` (author_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_AUTH_ISBN` FOREIGN KEY (ISBN) REFERENCES `book` (ISBN) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- Table structure for table `book_to_category`
--

-- --------------------------------------------------------

CREATE TABLE `book_to_category` (
  `category_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  CONSTRAINT `FK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_ISBN` FOREIGN KEY (ISBN) REFERENCES `book` (ISBN) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE,
  `pwd` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL,
  `role` enum('admin','operator','teacher','student') NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png',
  `barcode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_SCH_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL AUTO_INCREMENT,
  `checkout_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_time` datetime,
  `is_returned` tinyint(1) NOT NULL,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`checkout_id`),
  CONSTRAINT `FK_C_COPY_ID` FOREIGN KEY (book_copy_id) REFERENCES `book_copy` (copy_id),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (user_id) REFERENCES `user` (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hold`
--

CREATE TABLE `hold` (
  `hold_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hold_status` enum('pending','active') NOT NULL,
  PRIMARY KEY (`hold_id`),
  CONSTRAINT `FK_H_COPY_ID` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`copy_id`),
  CONSTRAINT `FK_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `pwd`
--

-- --------------------------------------------------------

CREATE TABLE `pwd` (
  `pwd_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `failed_attempts` int(11) NOT NULL,
  `password_policy` enum('Weak','Medium','Strong') NOT NULL,
  PRIMARY KEY (`pwd_id`),
  CONSTRAINT `FK_P_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

-- --------------------------------------------------------

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `review_text` longtext NOT NULL,
  `rating` int(5) NOT NULL,
  `book_id` varchar(50) NOT NULL,
  `review_status` enum('rejected','pending','accepted') NOT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `FK_R_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `FK_R_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

-- --------------------------------------------------------

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (keyword_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `book_to_keyword` (
  `keyword_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  CONSTRAINT `FK_KW_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `FK_KW_ID` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

DELIMITER //

CREATE TRIGGER tr_more_than_two
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN
  DECLARE borrow_count INT;
  SELECT COUNT(*) INTO borrow_count FROM checkout WHERE user_id = NEW.user_id;
  IF borrow_count >= 2 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow more than 2 books.';
  END IF;
END //

CREATE TRIGGER tr_check_overdue
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN

  IF (
    SELECT COUNT(*) FROM checkout
    WHERE user_id = NEW.user_id
      AND return_time IS NULL
      AND DATEDIFF(CURDATE(), checkout_time) > 7
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow books, you have an overdue book checkout.';
  END IF;
END //

DELIMITER ;

INSERT INTO school (school_name, address, city, phone_number, email, principal_name, operator_name)
VALUES
('27ο Δημοτικό Σχολείο Ιωαννίνων','Ισαάκ Τάσσου 22','Ιωάννινα',2651068679, '27dimioa@sch.gr','Ζώνιος Σπύρος','Ρόζος Αριστείδης'),
('ΠΡΟΤΥΠΟ ΛΥΚΕΙΟ ΖΩΣΙΜΑΙΑΣ ΣΧΟΛΗΣ ΙΩΑΝΝΙΝΩΝ','Πλατεία Αρχιεπισκόπου Σπυρίδωνος','Ιωάννινα',2651025013, 'mail@lyk-zosim.ioa.sch.gr','Αντωνίου Κωνσταντίνος','Γερογιάννη Χαρίκλεια'),
('Πρότυπο Γενικό Λύκειο Ευαγγελικής Σχολής Σμύρνης','Λέσβου 4','Νέα Σμύρνη, Αττικής',2109333712, 'lykevag@sch.gr','Φανίδης Χρήστος','Χασάπης Σωτήριος'),
('Πρότυπο Λύκειο Αναβρύτων','Λεωφόρος Κηφισίας 184','Αμαρούσιον Αττικής',2106233215, 'mail@lyk-peir-anavr.att.sch.gr','Οτζάκογλου Θεόδωρος','Σωτηρόπουλος Νικόλαος');

INSERT INTO `user` (first_name,surname,username,pwd,birth_date,email,school_id,status,`role`,profile,barcode) VALUES
	 ('Μάριος','Ρόζος','mario_rz','pwd','2002-12-06','mariosrizzler@gmail.com',1,'active','operator','https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp','69421739'),
	 ('Κωστής','Κατσικόπουλος','kkat','password','2002-06-15','kkatgm@gmail.com',2,'active','operator','https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg','69421740'),
	 ('Βασίλης','Μάλος','billydot','password','2002-06-15','billydot@gmail.com',3,'active','operator','https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg','69421741');
INSERT INTO `user` (first_name,surname,username,pwd,birth_date,email,school_id,status,`role`,barcode) VALUES
	 ('Μαρια ','Παπαδοπούλου','maria','bd8Se]H8','1956-01-30','bobu-figane78@yahoo.com',1,'active','teacher','69421742'),
	 ('Ελενη ','Παππά','eleni','nrPED2B-','1957-05-05','yagux_emizu74@hotmail.com',1,'active','teacher','69421743'),
	 ('Γεωργιος ','Καραγιάννης','georgios','}c3DgkzD','1967-03-06','nim_irigaco29@outlook.com',2,'active','teacher','69421744'),
	 ('Αικατερινη ','Βλάχου','aikaterini','X>pHJM73','1969-06-01','suripu-wowa98@hotmail.com',2,'active','teacher','69421745'),
	 ('Βασιλικη ','Ιωαννίδη','basiliki','/X8HjsT}','1970-10-19','genonu-mafi68@hotmail.com',3,'active','teacher','69421746'),
	 ('Δημητριος ','Οικονόμου','dimitrios','L_Skc&8%','1982-05-15','kus_ovaturi80@gmail.com',3,'active','teacher','69421747'),
	 ('Κωνσταντινος ','Παπαγεωργίου','konstantinos','^Gv-3cDA','1983-04-03','rikoru_nohe92@hotmail.com',3,'active','teacher','69421748'),
	 ('Ιωαννης ','Μακρής','ioannis','rrCM3=rw','1988-10-13','dexu-fapeye96@outlook.com',2,'active','teacher','69421749'),
	 ('Νικολαος ','Κωνσταντινίδης','nikolaos','x3/WUeFV','1991-03-26','sut_uyebunu50@aol.com',1,'active','teacher','69421750'),
	 ('Γεωργια ','Δημοπούλου','georgia','{5xXj2%c','1992-09-20','luhece-zako25@aol.com',1,'active','teacher','69421751'),
	 ('Σοφια ','Γεωργιάδη','sofia','puVTbn-5','2005-02-07','vugez-ikuta91@hotmail.com',1,'active','student','69421752'),
	 ('Αναστασια ','Παπαδημητρίου','anastasia','q@x9@UAw','2005-04-15','yumubuy-agi58@gmail.com',1,'active','student','69421753'),
	 ('Ευαγγελια ','Παπαδάκη','eyaggelia','epA[66fw','2006-03-14','wico_yagixo18@aol.com',1,'active','student','69421754'),
	 ('Ιωαννα ','Αντωνίου','ioanna','Xb7WL(48','2007-03-20','jem-utopowa60@hotmail.com',1,'active','student','69421755'),
	 ('Δημητρα ','Παπανικολάου','dimitra','r.9P@GZx','2007-06-07','hom_egexaso82@yahoo.com',1,'active','student','69421756'),
	 ('Ειρηνη ','Παναγιωτοπούλου','eirini','Y?HNr!$7','2009-12-17','paceda-sube63@outlook.com',1,'active','student','69421757'),
	 ('Χρηστος ','Βασιλείου','xristos','t2T%xFD6','2010-01-19','ceh-iwemowa19@hotmail.com',1,'active','student','69421758'),
	 ('Παναγιωτα ','Γιαννοπούλου','panagiota','CmBU}>4(','2010-03-17','gajulap-ure79@gmail.com',1,'active','student','69421759'),
	 ('Χριστινα ','Νικολάου','xristina','vsx3bsH]','2010-07-01','xace-mucano25@gmail.com',1,'active','student','69421760'),
	 ('Παναγιωτης ','Βασιλειάδης','panagiotis','z=s7FCx!','2010-08-14','kecoh-ilapi24@yahoo.com',1,'active','student','69421761'),
	 ('Βασιλειος ','Παπακωνσταντόπουλος','basileios','{F^/8uH9','2010-12-26','gotu-cebuvi32@outlook.com',2,'active','student','69421762'),
	 ('Κωνσταντινα ','Αγγελοπούλου','konstantina','4Ae!WUAC','2011-05-05','decili-zoxo93@mail.com',2,'active','student','69421763'),
	 ('Αννα ','Πετροπούλου','anna','c[3cRJ9r','2012-01-21','dub_ujukuxi28@yahoo.com',2,'active','student','69421764'),
	 ('Αγγελικη ','Καραναστάση','aggeliki','$+2HLPgG','2012-03-03','mehezot_evo38@aol.com',2,'active','student','69421765'),
	 ('Αθανασιος ','Κωνσταντόπουλος','athanasios','S_C/>Ks3','2012-08-26','judune-wota47@gmail.com',2,'active','student','69421766'),
	 ('Δεσποινα ','Κόλλια','despoina','6g(cNJRr','2012-09-15','fibow_acure81@hotmail.com',2,'active','student','69421767'),
	 ('Παρασκευη ','Σπυροπούλου','paraskeyi','9PYQnw^w','2013-05-11','dafuta-vira89@outlook.com',2,'active','student','69421768'),
	 ('Φωτεινη ','Κόντου','foteini','B7&sFy@G','2014-02-10','kuriki-xufu83@hotmail.com',2,'active','student','69421769'),
	 ('Αλεξανδρα ','Νικολοπούλου','alexandra','MX+wG5am','2014-07-09','weweduh-ete4@hotmail.com',2,'active','student','69421770'),
	 ('Ευαγγελος ','Δόβας','eyaggelos','}aq9SzM6','2016-01-01','liwurih_edi12@aol.com',2,'active','student','69421771'),
	 ('Κυριακη ','Μαρκοπούλου','kyriaki','m^Un+rK8','2016-01-05','puyog_acehi75@hotmail.com',3,'active','student','69421772'),
	 ('Θεοδωρα ','Χαραλάμπους','theodora','%_QwL7-4','2016-01-18','zuna_notodu88@aol.com',3,'active','student','69421773'),
	 ('Σταυρουλα ','Γρηγοριάδη','stayroula','Tb3/-Acp','2016-04-10','lur_ofozuju5@aol.com',3,'active','student','69421774'),
	 ('Χρυσουλα ','Ηλιοπούλου','xrysoula','4-mmL*W5','2017-02-01','recad_uferi98@gmail.com',3,'active','student','69421775'),
	 ('Καλλιοπη ','Ξενοπούλου','kalliopi','dqN^^5rV','2017-02-19','wusufo-pife84@gmail.com',3,'active','student','69421776'),
	 ('Αθανασια ','Βασιλοπούλου','athanasia','x3pQTd/U','2005-07-20','tovo-hakido3@aol.com',3,'active','student','69421777'),
	 ('Ελευθερια ','Πάνου','eleytheria','zCx8VE$k','2005-07-29','miwaliz_ega45@outlook.com',3,'active','student','69421778'),
	 ('Αθηνα ','Κοκκινοπούλου','athina','7$^TWC&n','2006-02-26','gujoru-cibu96@yahoo.com',3,'active','student','69421779'),
	 ('Μιχαηλ ','Δημητρακόπουλος','mixail','bkeZL&!5','2006-10-03','mexohol-ere97@hotmail.com',3,'active','student','69421780'),
	 ('Αλεξανδρος ','Βασιλακόπουλος','alexandros','t=u5bRM^','2007-05-11','gunixep_usa50@gmail.com',3,'active','student','69421781');

call AddBook( '9780552149518','Undomestic Goddess,The','Brown, Dan','Corgi Books','2004','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780747532743','Harry Potter and the Philosopher''s Stone#','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Y2.1  Children''s Fiction',1);
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets#','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Y2.1  Children''s Fiction',1);
call AddBook( '9780552150736','Angels and Demons#','Brown, Dan','Corgi Books','2003','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Y2.1  Children''s Fiction',1);
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Y2.1  Children''s Fiction',1);
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Y2.1  Children''s Fiction',1);
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Y2.1  Children''s Fiction',1);
call AddBook( '9781904233657','Twilight#','Meyer, Stephenie','ATOM','2007','Y2.2  Young Adult Fiction',1);
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Y2.1  Children''s Fiction',1);
call AddBook( '9780552151764','Deception Point#','Brown, Dan','Corgi Books','2004','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9781904233886','New Moon#','Meyer, Stephenie','ATOM','2007','Y2.2  Young Adult Fiction',1);
call AddBook( '9780330457729','Lovely Bones,The#','Sebold, Alice','Picador','2009','F1.1  General & Literary Fiction',1);
call AddBook( '9780552151696','Digital Fortress#','Brown, Dan','Corgi Books','2004','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780099450252','Curious Incident of the Dog in the Night-time,The#','Haddon, Mark','Vintage','2004','F1.1  General & Literary Fiction',1);
call AddBook( '9781904233916','Eclipse#','Meyer, Stephenie','ATOM','2008','Y2.2  Young Adult Fiction',1);
call AddBook( '9781847245458','Girl with the Dragon Tattoo,The:Millennium Trilogy#','Larsson, Stieg','Quercus','2008','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780747566533','Kite Runner,The#','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','F1.1  General & Literary Fiction',1);
call AddBook( '9780099464464','Time Traveler''s Wife,The','Niffenegger, Audrey','Vintage','2004','F1.1  General & Literary Fiction',1);
call AddBook( '9780141017891','World According to Clarkson,The','Clarkson, Jeremy','Penguin Books','2005','T13.0  Humour: Collections & General',1);
call AddBook( '9780099429791','Atonement#','McEwan, Ian','Vintage','2002','F1.1  General & Literary Fiction',1);
call AddBook( '9780593054277','Lost Symbol,The','Brown, Dan','Bantam Press','2009','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780552997041','Short History of Nearly Everything,A','Bryson, Bill','Black Swan','2004','T8.0  Popular Science',1);
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Y2.2  Young Adult Fiction',1);
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Y2.1  Children''s Fiction',1);
call AddBook( '9780747591061','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','F2.2  Science Fiction & Fantasy',1);
call AddBook( '9781849163422','Girl Who Played With Fire,The:Millennium Trilogy#','Larsson, Stieg','Quercus Publishing Plc','2010','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780752837505','Child Called It,A','Pelzer, Dave','Orion (an Imprint of The Orion','2001','T4.0A  Autobiography: General',1);
call AddBook( '9780349116754','No.1 Ladies'' Detective Agency,The:No.1 Ladies'' Detective Agency S.','McCall Smith, Alexander','Abacus','2003','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780718147655','You are What You Eat:The Plan That Will Change Your Life','McKeith, Gillian','Michael Joseph','2004','T9.4  Fitness & Diet',1);
call AddBook( '9780006512134','Man and Boy','Parsons, Tony','HarperCollins Publishers','2000','F1.1  General & Literary Fiction',1);
call AddBook( '9780099387916','Birdsong','Faulks, Sebastian','Vintage','1994','F1.1  General & Literary Fiction',1);
call AddBook( '9780752877327','Labyrinth','Mosse, Kate','Orion (an Imprint of The Orion','2006','F1.1  General & Literary Fiction',1);
call AddBook( '9780755309511','Island,The','Hislop, Victoria','Headline Review','2006','F1.1  General & Literary Fiction',1);
call AddBook( '9781841953922','Life of Pi','Martel, Yann','Canongate Books','2003','F1.1  General & Literary Fiction',1);
call AddBook( '9780091889487','Dr. Atkins'' New Diet Revolution:The No-hunger, Luxurious Weight Loss P','Atkins, Robert C.','Vermilion','2003','T9.4  Fitness & Diet',1);
call AddBook( '9780747599876','Tales of Beedle the Bard,The','Rowling, J. K.','Bloomsbury Publishing PLC','2008','Y2.1  Children''s Fiction',1);
call AddBook( '9780749397548','Captain Corelli''s Mandolin','De Bernieres, Louis','Minerva','1995','F1.1  General & Literary Fiction',1);
call AddBook( '9780563384304','Delia''s How to Cook:(Bk.1) ','Smith, Delia','BBC Books (Random House)','1998','T16.0  Food & Drink: General',1);
call AddBook( '9780330507417','Gruffalo,The#','Donaldson, Julia','Macmillan Children''s Books','2009','Y1.3  Picture Books',1);
call AddBook( '9781861976123','Eats, Shoots and Leaves:The Zero Tolerance Approach to Punctuation','Truss, Lynne','Profile Books','2003','T2.1  Usage & Writing Guides',1);
call AddBook( '9780590660549','Northern Lights:His Dark Materials S.','Pullman, Philip','Point','1998','Y2.2  Young Adult Fiction',1);
call AddBook( '9780755331420','Interpretation of Murder,The','Rubenfeld, Jed','Headline Review','2007','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9781849162746','Girl Who Kicked the Hornets'' Nest,The:Millennium Trilogy','Larsson, Stieg','Quercus Publishing Plc','2010','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780330367356','Bridget Jones: The Edge of Reason','Fielding, Helen','Picador','2000','F1.1  General & Literary Fiction',1);
call AddBook( '9780141020525','Short History of Tractors in Ukrainian,A','Lewycka, Marina','Penguin Books','2006','F1.1  General & Literary Fiction',1);
call AddBook( '9780722532935','Alchemist,The:A Fable About Following Your Dream','Coelho, Paulo','Thorsons','1999','F1.1  General & Literary Fiction',1);
call AddBook( '9780552996006','Notes from a Small Island','Bryson, Bill','Black Swan','1996','T8.5  Travel Writing',1);
call AddBook( '9780099487821','Boy in the Striped Pyjamas,The#','Boyne, John','Definitions','2007','Y2.2  Young Adult Fiction',1);
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','T7.5  Current Affairs & Issues',1);
call AddBook( '9780718154776','Jamie''s 30-minute Meals','Oliver, Jamie','Michael Joseph','2010','T16.0  Food & Drink: General',1);
call AddBook( '9780099457169','Broker,The','Grisham, John','Arrow Books','2005','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780330332774','Bridget Jones''s Diary:A Novel','Fielding, Helen','Picador','1997','F1.1  General & Literary Fiction',1);
call AddBook( '9780241003008','Very Hungry Caterpillar,The:The Very Hungry Caterpillar','Carle, Eric','Puffin Books','1994','Y1.1  Pre-school & Early Learning',1);
call AddBook( '9780747582977','Thousand Splendid Suns,A','Hosseini, Khaled','Bloomsbury Publishing PLC','2007','F1.1  General & Literary Fiction',1);
call AddBook( '9781846051616','Sound of Laughter,The','Kay, Peter','Century','2006','T4.0A  Autobiography: General',1);
call AddBook( '9780718147709','Jamie''s Italy','Oliver, Jamie','Michael Joseph','2005','T16.1  National & Regional Cuisine',1);
call AddBook( '9780755307500','Small Island#','Levy, Andrea','Headline Review','2004','F1.1  General & Literary Fiction',1);
call AddBook( '9780141030142','Memory Keeper''s Daughter,The','Edwards, Kim','Penguin Books','2007','F1.1  General & Literary Fiction',1);
call AddBook( '9780007110926','Billy Connolly','Stephenson, Pamela','HarperCollins Publishers','2002','T4.1  Biography: The Arts',1);
call AddBook( '9780330448444','House at Riverton,The','Morton, Kate','Pan Books','2007','F1.1  General & Literary Fiction',1);
call AddBook( '9780747561071','Harry Potter and the Order of the Phoenix#','Rowling, J. K.','Bloomsbury Publishing PLC','2004','Y2.1  Children''s Fiction',1);
call AddBook( '9780701181840','Nigella Express','Lawson, Nigella','Chatto & Windus','2007','T16.0  Food & Drink: General',1);
call AddBook( '9780099771517','Memoirs of a Geisha','Golden, Arthur','Vintage','1998','F1.1  General & Literary Fiction',1);
call AddBook( '9780563384311','Delia''s How to Cook:(Bk.2) ','Smith, Delia','BBC Books (Random House)','1999','T16.0  Food & Drink: General',1);
call AddBook( '9780590112895','Subtle Knife,The:His Dark Materials S.','Pullman, Philip','Point','1998','Y2.2  Young Adult Fiction',1);
call AddBook( '9780718148621','Jamie''s Ministry of Food:Anyone Can Learn to Cook in 24 Hours','Oliver, Jamie','Michael Joseph','2008','T16.0  Food & Drink: General',1);
call AddBook( '9781904994367','Guinness World Records 2009:2009','Guinness World Records','Guinness World Records','2008','T2.0  Encyclopedias & General Reference',1);
call AddBook( '9781861978769','Why Don''t Penguins'' Feet Freeze?:And 114 Other Questions','Profile Books','Profile Books','2006','T8.0  Popular Science',1);
call AddBook( '9780718152437','Jamie at Home:Cook Your Way to the Good Life','Oliver, Jamie','Michael Joseph','2007','T16.0  Food & Drink: General',1);
call AddBook( '9780140276336','White Teeth','Smith, Zadie','Penguin Books','2001','F1.1  General & Literary Fiction',1);
call AddBook( '9780007156108','Devil Wears Prada,The','Weisberger, Lauren','HarperCollins Publishers','2003','F1.1  General & Literary Fiction',1);
call AddBook( '9780593059258','At My Mother''s Knee ...:and Other Low Joints','O''Grady, Paul','Bantam Press','2008','T4.1A  Autobiography:  The Arts',1);
call AddBook( '9780752893686','No Time for Goodbye','Barclay, Linwood','Orion (an Imprint of The Orion','2008','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780007207329','"Times" Su Doku,The:The Utterly Addictive Number-placing Puzzle:(Bk. 1','Times Books','Times Books','2005','T13.4  Puzzles',1);
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','F1.1  General & Literary Fiction',1);
call AddBook( '9780718144395','Return of the Naked Chef,The','Oliver, Jamie','Michael Joseph','2000','T16.0  Food & Drink: General',1);
call AddBook( '9780006498407','Angela''s Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','T4.0A  Autobiography: General',1);
call AddBook( '9780747563204','Schott''s Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','T13.3  Trivia & Quiz Books',1);
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','T4.2A  Autobiography: Historical, Political & Military',1);
call AddBook( '9780007232741','Dangerous Book for Boys,The','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','T11.5  Hobbies, Pastimes & Indoor Games',1);
call AddBook( '9780099419785','To Kill a Mockingbird#','Lee, Harper','Arrow Books','1989','F1.1  General & Literary Fiction',1);
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','F2.2  Science Fiction & Fantasy',1);
call AddBook( '9780099406136','Summons,The','Grisham, John','Arrow Books','2002','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780552149525','Lost Symbol,The','Brown, Dan','Corgi Books','2010','F2.1  Crime, Thriller & Adventure',1);
call AddBook( '9780140237504','Catcher in the Rye,The','Salinger, J.D.','Penguin Books','1994','F1.1  General & Literary Fiction',1);
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','T9.4  Fitness & Diet',1);
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','T16.0  Food & Drink: General',1);
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','F1.1  General & Literary Fiction',1);
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','F1.1  General & Literary Fiction',1);
call AddBook( '9780552772747','Undomestic Goddess,The','Kinsella, Sophie','Black Swan','2006','F1.1  General & Literary Fiction',1);
call AddBook( '9780552773898','Book Thief,The#','Zusak, Markus','Black Swan','2008','F1.1  General & Literary Fiction',1);
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','T12.0  Transport: General',1);
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','T4.1A  Autobiography:  The Arts',1);
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','T2.0  Encyclopedias & General Reference',1);
call AddBook( '9780439993586','Amber Spyglass,The:His Dark Materials S.','Pullman, Philip','Point','2001','Y2.2  Young Adult Fiction',1);
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','F1.1  General & Literary Fiction',1);
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','T8.5  Travel Writing',1);
call AddBook( '9780099506928','Spot of Bother,A','Haddon, Mark','Vintage','2007','F1.1  General & Literary Fiction',1);
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','T4.1A  Autobiography:  The Arts',1);




COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
