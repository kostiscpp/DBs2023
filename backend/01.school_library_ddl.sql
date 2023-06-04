DROP DATABASE IF EXISTS school_library;

CREATE DATABASE school_library;

USE school_library;

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
SET GLOBAL event_scheduler="ON";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_library`
--

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

ALTER TABLE `school` AUTO_INCREMENT = 0;

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
  `dewey_code` varchar(8) NOT NULL DEFAULT  CONCAT(LPAD(FLOOR(RAND() * 999) , 3, '0'), '.', FLOOR(RAND() * 99)) COMMENT 'https://en.wikipedia.org/wiki/List_of_Dewey_Decimal_classes ',
  `no_pages` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `summary` longtext NOT NULL DEFAULT 'Summary of the Book',
  `image` varchar(255) NOT NULL DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeE4BZwuwU8ODTBIrNIoSs4xxVuOU2XSzQTQ&usqp=CAU',
  `language` varchar(40) NOT NULL DEFAULT 'English',
  `keywords` varchar(255) NOT NULL DEFAULT 'Key words of the book',
  `year_published` INT(4) NOT NULL,
  `average_rating` decimal(3,2) NOT NULL DEFAULT 0.00,
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
  `school_id` int(11) NOT NULL,
  `book_copies_number` int(11) NOT NULL DEFAULT 0,
  `available_copies_number` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`copy_id`),
  CONSTRAINT `FK_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SCHOOL_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_copies` CHECK (book_copies_number >= 0 AND available_copies_number >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book_to_author`
--

-- --------------------------------------------------------

CREATE TABLE `book_to_author` (
  `author_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  PRIMARY KEY(`author_id`,`ISBN`),
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
  PRIMARY KEY(`category_id`,`ISBN`),
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
  `email` varchar(255) NOT NULL UNIQUE,
  `school_id` int(11) NOT NULL,
  `status` enum('active','inactive','deleted', 'pending', 'rejected') NOT NULL DEFAULT 'pending',
  `role` enum('admin','operator','teacher','student') NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png',
  `barcode` varchar(20) DEFAULT NULL UNIQUE,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_SCH_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL AUTO_INCREMENT,
  `checkout_time` datetime NOT NULL DEFAULT current_timestamp(),
  `return_time` datetime,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkout_status` enum('active','returned','overdue','overdue-returned') NOT NULL DEFAULT 'active',
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
  `hold_time` datetime NOT NULL DEFAULT current_timestamp(),
  `expiration_time` datetime NOT NULL DEFAULT DATE_ADD(current_timestamp(), INTERVAL 1 WEEK),
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hold_status` enum('completed','active', 'cancelled', 'pending') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`hold_id`),
  CONSTRAINT `FK_H_COPY_ID` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`copy_id`),
  CONSTRAINT `FK_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
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
  `review_status` enum('rejected','pending','accepted') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`review_id`),
  CONSTRAINT `FK_R_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `FK_R_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



CREATE OR REPLACE VIEW view_school AS
SELECT b.*, bc.*
FROM book b
JOIN book_copy bc ON b.ISBN = bc.book_id;

CREATE OR REPLACE VIEW view_school_users AS
SELECT u.* FROM user u WHERE u.role = 'student' OR u.role = 'teacher';



COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;