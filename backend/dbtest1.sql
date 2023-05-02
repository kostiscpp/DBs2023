-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 02 Μάη 2023 στις 16:09:37
-- Έκδοση διακομιστή: 10.4.27-MariaDB
-- Έκδοση PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `dbtest1`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `edition` varchar(50) NOT NULL,
  `author1` int(11) NOT NULL,
  `author2` int(11) NOT NULL,
  `author3` int(11) NOT NULL,
  `no_pages` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `summary` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `category1` int(11) NOT NULL,
  `category2` int(11) NOT NULL,
  `category3` int(11) NOT NULL,
  `language` varchar(40) NOT NULL,
  `key-words` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_copy`
--

CREATE TABLE `book_copy` (
  `copy_id` int(11) NOT NULL,
  `year_published` year(4) NOT NULL,
  `book_id` varchar(20) NOT NULL,
  `dewey_code` varchar(8) NOT NULL,
  `school_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` datetime NOT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `hold`
--

CREATE TABLE `hold` (
  `hold_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pwd`
--

CREATE TABLE `pwd` (
  `pwd_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `failed_attempts` int(11) NOT NULL,
  `password_policy` enum('Weak','Medium','Strong') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_text` longtext NOT NULL,
  `rating` int(5) NOT NULL,
  `book_id` varchar(50) NOT NULL,
  `status` enum('rejected','pending','accepted') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `school`
--

CREATE TABLE `school` (
  `school_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `principal_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `school_admin_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `school`
--

INSERT INTO `school` (`school_id`, `address`, `city`, `phone_number`, `email`, `principal_name`, `school_admin_name`) VALUES
('27ο Δημοτικό Σχολείο Ιωαννίνων', 'Ισαάκ Τάσσου 22', 'Ιωάννινα', 2651068679, '27dimioa@sch.gr', 'Σπύρος Ζώνιος', 'Αριστείδης Ρόζος');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `school_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL,
  `role` enum('admin','school-admin','teacher','student') NOT NULL,
  `profile` varchar(255) NOT NULL,
  `barcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `profile`, `barcode`) VALUES
(1, 'Μάριος', 'Ρόζος', 'mario_rz', 'pwd', '2002-12-06', 'mariosrizzler@gmail.com', '27ο Δημοτικό Σχολείο Ιωαννίνων', 'active', 'school-admin', 'https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp', ''),
(42, 'Κωστής', 'Κατσικόπουλος', 'kkat', 'password', '2002-06-15', 'kkatgm@gmail.com', '27ο Δημοτικό Σχολείο Ιωαννίνων', 'active', 'teacher', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', '69421739');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `FK_AUTHOR1` (`author1`),
  ADD KEY `FK_AUTHOR2` (`author2`),
  ADD KEY `FK_AUTHOR3` (`author3`),
  ADD KEY `FK_PUBLISHER` (`publisher_id`),
  ADD KEY `FK_CATEGORY1` (`category1`),
  ADD KEY `FK_CATEGORY2` (`category2`),
  ADD KEY `FK_CATEGORY3` (`category3`);

--
-- Ευρετήρια για πίνακα `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `FK_SCHOOL_ID` (`school_id`),
  ADD KEY `FK_ISBN` (`book_id`);

--
-- Ευρετήρια για πίνακα `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`),
  ADD KEY `FK_CHECKOUT_BID` (`book_copy_id`),
  ADD KEY `FK_CHECKOUT_USR_ID` (`user_id`);

--
-- Ευρετήρια για πίνακα `hold`
--
ALTER TABLE `hold`
  ADD PRIMARY KEY (`hold_id`),
  ADD KEY `FK_HOLD_BID` (`book_id`),
  ADD KEY `FK_UID` (`user_id`);

--
-- Ευρετήρια για πίνακα `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Ευρετήρια για πίνακα `pwd`
--
ALTER TABLE `pwd`
  ADD PRIMARY KEY (`pwd_id`),
  ADD KEY `FK_PWD_USER_ID` (`user_id`);

--
-- Ευρετήρια για πίνακα `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FK_REVIEW_USER` (`user_id`),
  ADD KEY `FK_REVIEW_BOOK` (`book_id`);

--
-- Ευρετήρια για πίνακα `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`school_id`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_SCH_ID` (`school_id`);

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_AUTHOR1` FOREIGN KEY (`author1`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `FK_AUTHOR2` FOREIGN KEY (`author2`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `FK_AUTHOR3` FOREIGN KEY (`author3`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `FK_CATEGORY1` FOREIGN KEY (`category1`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_CATEGORY2` FOREIGN KEY (`category2`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_CATEGORY3` FOREIGN KEY (`category3`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_PUBLISHER` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Περιορισμοί για πίνακα `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `FK_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `FK_SCHOOL_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`);

--
-- Περιορισμοί για πίνακα `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `FK_CHECKOUT_BID` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`copy_id`),
  ADD CONSTRAINT `FK_CHECKOUT_USR_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `hold`
--
ALTER TABLE `hold`
  ADD CONSTRAINT `FK_HOLD_BID` FOREIGN KEY (`book_id`) REFERENCES `book_copy` (`copy_id`),
  ADD CONSTRAINT `FK_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `pwd`
--
ALTER TABLE `pwd`
  ADD CONSTRAINT `FK_PWD_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_SCH_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
