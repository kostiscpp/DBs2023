
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

	    INSERT IGNORE INTO book_to_author (ISBN,author_id) 
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
  `school_admin_name` varchar(60) NOT NULL,
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
  `role` enum('admin','school-admin','teacher','student') NOT NULL,
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
  `start_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` datetime NOT NULL,
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

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
