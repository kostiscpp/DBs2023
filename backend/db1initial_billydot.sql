-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 16 Μάη 2023 στις 12:16:24
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `db1initial`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBook` (IN `book_ISBN` VARCHAR(20), IN `title` VARCHAR(255), IN `author_name` VARCHAR(255), IN `publisher_name` VARCHAR(255), IN `year_published` YEAR(4), IN `category_name` VARCHAR(255), IN `school_id` INT(11))   BEGIN
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
-- Δομή πίνακα για τον πίνακα `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `author`
--

INSERT INTO `author` (`author_id`, `name`) VALUES
(1, 'Brown, Dan'),
(2, 'Rowling, J. K.'),
(3, 'Meyer, Stephenie'),
(4, 'Sebold, Alice'),
(5, 'Haddon, Mark'),
(6, 'Larsson, Stieg'),
(7, 'Hosseini, Khaled'),
(8, 'Niffenegger, Audrey'),
(9, 'Clarkson, Jeremy'),
(10, 'McEwan, Ian'),
(11, 'Bryson, Bill'),
(12, 'Pelzer, Dave'),
(13, 'McCall Smith, Alexander'),
(14, 'McKeith, Gillian'),
(15, 'Parsons, Tony'),
(16, 'Faulks, Sebastian'),
(17, 'Mosse, Kate'),
(18, 'Hislop, Victoria'),
(19, 'Martel, Yann'),
(20, 'Atkins, Robert C.'),
(21, 'De Bernieres, Louis'),
(22, 'Smith, Delia'),
(23, 'Donaldson, Julia'),
(24, 'Truss, Lynne'),
(25, 'Pullman, Philip'),
(26, 'Rubenfeld, Jed'),
(27, 'Fielding, Helen'),
(28, 'Lewycka, Marina'),
(29, 'Coelho, Paulo'),
(30, 'Boyne, John'),
(31, 'Moore, Michael'),
(32, 'Oliver, Jamie'),
(33, 'Grisham, John'),
(34, 'Carle, Eric'),
(35, 'Kay, Peter'),
(36, 'Levy, Andrea'),
(37, 'Edwards, Kim'),
(38, 'Stephenson, Pamela'),
(39, 'Morton, Kate'),
(40, 'Lawson, Nigella'),
(41, 'Golden, Arthur'),
(42, 'Guinness World Records'),
(43, 'Profile Books'),
(44, 'Smith, Zadie'),
(45, 'Weisberger, Lauren'),
(46, 'O\'Grady, Paul'),
(47, 'Barclay, Linwood'),
(48, 'Times Books'),
(49, 'Harris, Joanne'),
(50, 'McCourt, Frank'),
(51, 'Schott, Ben'),
(52, 'Obama, Barack'),
(53, 'Iggulden, Conn & Iggulden, Hal'),
(54, 'Lee, Harper'),
(55, 'Salinger, J.D.'),
(56, 'McKenna, Paul'),
(57, 'Ali, Monica'),
(58, 'Keyes, Marian'),
(59, 'Kinsella, Sophie'),
(60, 'Zusak, Markus'),
(61, 'Osbourne, Sharon'),
(62, 'French, Dawn');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book`
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
  `year_published` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `book`
--

INSERT INTO `book` (`ISBN`, `title`, `edition`, `no_pages`, `publisher_id`, `summary`, `image`, `language`, `key-words`, `year_published`) VALUES
('9780006498407', 'Angela\'s Ashes:A Memoir of a Childhood', '1997', 0, 32, '', '', 'English', '', '0000'),
('9780006512134', 'Man and Boy', '2000', 0, 14, '', '', 'English', '', '0000'),
('9780007110926', 'Billy Connolly', '2002', 0, 14, '', '', 'English', '', '0000'),
('9780007156108', 'Devil Wears Prada,The', '2003', 0, 14, '', '', 'English', '', '0000'),
('9780007207329', '\"Times\" Su Doku,The:The Utterly Addictive Number-placing Puzzle:(Bk. 1', '2005', 0, 31, '', '', 'English', '', '0000'),
('9780007232741', 'Dangerous Book for Boys,The', '2006', 0, 14, '', '', 'English', '', '0000'),
('9780091889487', 'Dr. Atkins\' New Diet Revolution:The No-hunger, Luxurious Weight Loss P', '2003', 0, 17, '', '', 'English', '', '0000'),
('9780099387916', 'Birdsong', '1994', 0, 5, '', '', 'English', '', '0000'),
('9780099406136', 'Summons,The', '2002', 0, 25, '', '', 'English', '', '0000'),
('9780099419785', 'To Kill a Mockingbird#', '1989', 0, 25, '', '', 'English', '', '0000'),
('9780099429791', 'Atonement#', '2002', 0, 5, '', '', 'English', '', '0000'),
('9780099450252', 'Curious Incident of the Dog in the Night-time,The#', '2004', 0, 5, '', '', 'English', '', '0000'),
('9780099457169', 'Broker,The', '2005', 0, 25, '', '', 'English', '', '0000'),
('9780099464464', 'Time Traveler\'s Wife,The', '2004', 0, 5, '', '', 'English', '', '0000'),
('9780099487821', 'Boy in the Striped Pyjamas,The#', '2007', 0, 24, '', '', 'English', '', '0000'),
('9780099506928', 'Spot of Bother,A', '2007', 0, 5, '', '', 'English', '', '0000'),
('9780099771517', 'Memoirs of a Geisha', '1998', 0, 5, '', '', 'English', '', '0000'),
('9780140237504', 'Catcher in the Rye,The', '1994', 0, 7, '', '', 'English', '', '0000'),
('9780140276336', 'White Teeth', '2001', 0, 7, '', '', 'English', '', '0000'),
('9780141011905', 'Stupid White Men:...and Other Sorry Excuses for the State of the Natio', '2002', 0, 7, '', '', 'English', '', '0000'),
('9780141017891', 'World According to Clarkson,The', '2005', 0, 7, '', '', 'English', '', '0000'),
('9780141019376', 'Anybody Out There?', '2007', 0, 7, '', '', 'English', '', '0000'),
('9780141020525', 'Short History of Tractors in Ukrainian,A', '2006', 0, 7, '', '', 'English', '', '0000'),
('9780141022925', 'I Know You Got Soul', '2006', 0, 7, '', '', 'English', '', '0000'),
('9780141030142', 'Memory Keeper\'s Daughter,The', '2007', 0, 7, '', '', 'English', '', '0000'),
('9780241003008', 'Very Hungry Caterpillar,The:The Very Hungry Caterpillar', '1994', 0, 26, '', '', 'English', '', '0000'),
('9780316731317', 'Sharon Osbourne Extreme:My Autobiography', '2005', 0, 33, '', '', 'English', '', '0000'),
('9780330332774', 'Bridget Jones\'s Diary:A Novel', '1997', 0, 4, '', '', 'English', '', '0000'),
('9780330367356', 'Bridget Jones: The Edge of Reason', '2000', 0, 4, '', '', 'English', '', '0000'),
('9780330448444', 'House at Riverton,The', '2007', 0, 28, '', '', 'English', '', '0000'),
('9780330457729', 'Lovely Bones,The#', '2009', 0, 4, '', '', 'English', '', '0000'),
('9780330507417', 'Gruffalo,The#', '2009', 0, 20, '', '', 'English', '', '0000'),
('9780349116754', 'No.1 Ladies\' Detective Agency,The:No.1 Ladies\' Detective Agency S.', '2003', 0, 12, '', '', 'English', '', '0000'),
('9780439993586', 'Amber Spyglass,The:His Dark Materials S.', '2001', 0, 22, '', '', 'English', '', '0000'),
('9780552149518', 'Undomestic Goddess,The', '2004', 0, 1, '', '', 'English', '', '0000'),
('9780552149525', 'Lost Symbol,The', '2010', 0, 1, '', '', 'English', '', '0000'),
('9780552150736', 'Angels and Demons#', '2003', 0, 1, '', '', 'English', '', '0000'),
('9780552151696', 'Digital Fortress#', '2004', 0, 1, '', '', 'English', '', '0000'),
('9780552151764', 'Deception Point#', '2004', 0, 1, '', '', 'English', '', '0000'),
('9780552771108', 'Can You Keep a Secret?', '2003', 0, 9, '', '', 'English', '', '0000'),
('9780552771153', 'Brick Lane', '2004', 0, 9, '', '', 'English', '', '0000'),
('9780552772747', 'Undomestic Goddess,The', '2006', 0, 9, '', '', 'English', '', '0000'),
('9780552773898', 'Book Thief,The#', '2008', 0, 9, '', '', 'English', '', '0000'),
('9780552996006', 'Notes from a Small Island', '1996', 0, 9, '', '', 'English', '', '0000'),
('9780552997034', 'Down Under', '2001', 0, 9, '', '', 'English', '', '0000'),
('9780552997041', 'Short History of Nearly Everything,A', '2004', 0, 9, '', '', 'English', '', '0000'),
('9780552998482', 'Chocolat', '2000', 0, 9, '', '', 'English', '', '0000'),
('9780563384304', 'Delia\'s How to Cook:(Bk.1) ', '1998', 0, 19, '', '', 'English', '', '0000'),
('9780563384311', 'Delia\'s How to Cook:(Bk.2) ', '1999', 0, 19, '', '', 'English', '', '0000'),
('9780590112895', 'Subtle Knife,The:His Dark Materials S.', '1998', 0, 22, '', '', 'English', '', '0000'),
('9780590660549', 'Northern Lights:His Dark Materials S.', '1998', 0, 22, '', '', 'English', '', '0000'),
('9780593050545', 'I Can Make You Thin', '2005', 0, 8, '', '', 'English', '', '0000'),
('9780593054277', 'Lost Symbol,The', '2009', 0, 8, '', '', 'English', '', '0000'),
('9780593059258', 'At My Mother\'s Knee ...:and Other Low Joints', '2008', 0, 8, '', '', 'English', '', '0000'),
('9780701181840', 'Nigella Express', '2007', 0, 29, '', '', 'English', '', '0000'),
('9780718144395', 'Return of the Naked Chef,The', '2000', 0, 13, '', '', 'English', '', '0000'),
('9780718144845', 'Happy Days with the Naked Chef', '2001', 0, 13, '', '', 'English', '', '0000'),
('9780718147655', 'You are What You Eat:The Plan That Will Change Your Life', '2004', 0, 13, '', '', 'English', '', '0000'),
('9780718147709', 'Jamie\'s Italy', '2005', 0, 13, '', '', 'English', '', '0000'),
('9780718148621', 'Jamie\'s Ministry of Food:Anyone Can Learn to Cook in 24 Hours', '2008', 0, 13, '', '', 'English', '', '0000'),
('9780718152437', 'Jamie at Home:Cook Your Way to the Good Life', '2007', 0, 13, '', '', 'English', '', '0000'),
('9780718154776', 'Jamie\'s 30-minute Meals', '2010', 0, 13, '', '', 'English', '', '0000'),
('9780722532935', 'Alchemist,The:A Fable About Following Your Dream', '1999', 0, 23, '', '', 'English', '', '0000'),
('9780747532743', 'Harry Potter and the Philosopher\'s Stone#', '1997', 0, 2, '', '', 'English', '', '0000'),
('9780747538486', 'Harry Potter and the Chamber of Secrets#', '1999', 0, 2, '', '', 'English', '', '0000'),
('9780747546245', 'Harry Potter and the Goblet of Fire', '2000', 0, 2, '', '', 'English', '', '0000'),
('9780747546290', 'Harry Potter and the Prisoner of Azkaban#', '2000', 0, 2, '', '', 'English', '', '0000'),
('9780747550990', 'Harry Potter and the Goblet of Fire', '2001', 0, 2, '', '', 'English', '', '0000'),
('9780747551003', 'Harry Potter and the Order of the Phoenix', '2003', 0, 2, '', '', 'English', '', '0000'),
('9780747561071', 'Harry Potter and the Order of the Phoenix#', '2004', 0, 2, '', '', 'English', '', '0000'),
('9780747563204', 'Schott\'s Original Miscellany', '2002', 0, 2, '', '', 'English', '', '0000'),
('9780747566533', 'Kite Runner,The#', '2004', 0, 2, '', '', 'English', '', '0000'),
('9780747581086', 'Harry Potter and the Half-blood Prince:Children\'s Edition', '2005', 0, 2, '', '', 'English', '', '0000'),
('9780747581109', 'Harry Potter and the Half-blood Prince', '2005', 0, 2, '', '', 'English', '', '0000'),
('9780747582977', 'Thousand Splendid Suns,A', '2007', 0, 2, '', '', 'English', '', '0000'),
('9780747591054', 'Harry Potter and the Deathly Hallows', '2007', 0, 2, '', '', 'English', '', '0000'),
('9780747591061', 'Harry Potter and the Deathly Hallows', '2007', 0, 2, '', '', 'English', '', '0000'),
('9780747599876', 'Tales of Beedle the Bard,The', '2008', 0, 2, '', '', 'English', '', '0000'),
('9780749397548', 'Captain Corelli\'s Mandolin', '1995', 0, 18, '', '', 'English', '', '0000'),
('9780752837505', 'Child Called It,A', '2001', 0, 11, '', '', 'English', '', '0000'),
('9780752877327', 'Labyrinth', '2006', 0, 11, '', '', 'English', '', '0000'),
('9780752893686', 'No Time for Goodbye', '2008', 0, 11, '', '', 'English', '', '0000'),
('9780755307500', 'Small Island#', '2004', 0, 15, '', '', 'English', '', '0000'),
('9780755309511', 'Island,The', '2006', 0, 15, '', '', 'English', '', '0000'),
('9780755331420', 'Interpretation of Murder,The', '2007', 0, 15, '', '', 'English', '', '0000'),
('9781841953922', 'Life of Pi', '2003', 0, 16, '', '', 'English', '', '0000'),
('9781846051616', 'Sound of Laughter,The', '2006', 0, 27, '', '', 'English', '', '0000'),
('9781846053443', 'Dear Fatty', '2008', 0, 27, '', '', 'English', '', '0000'),
('9781847245458', 'Girl with the Dragon Tattoo,The:Millennium Trilogy#', '2008', 0, 6, '', '', 'English', '', '0000'),
('9781847670946', 'Dreams from My Father:A Story of Race and Inheritance', '2008', 0, 16, '', '', 'English', '', '0000'),
('9781849162746', 'Girl Who Kicked the Hornets\' Nest,The:Millennium Trilogy', '2010', 0, 10, '', '', 'English', '', '0000'),
('9781849163422', 'Girl Who Played With Fire,The:Millennium Trilogy#', '2010', 0, 10, '', '', 'English', '', '0000'),
('9781861976123', 'Eats, Shoots and Leaves:The Zero Tolerance Approach to Punctuation', '2003', 0, 21, '', '', 'English', '', '0000'),
('9781861978769', 'Why Don\'t Penguins\' Feet Freeze?:And 114 Other Questions', '2006', 0, 21, '', '', 'English', '', '0000'),
('9781904233657', 'Twilight#', '2007', 0, 3, '', '', 'English', '', '0000'),
('9781904233886', 'New Moon#', '2007', 0, 3, '', '', 'English', '', '0000'),
('9781904233916', 'Eclipse#', '2008', 0, 3, '', '', 'English', '', '0000'),
('9781904994367', 'Guinness World Records 2009:2009', '2008', 0, 30, '', '', 'English', '', '0000'),
('9781904994497', 'Guinness World Records 2010', '2009', 0, 30, '', '', 'English', '', '0000'),
('9781905654284', 'Breaking Dawn', '2008', 0, 3, '', '', 'English', '', '0000');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_copy`
--

CREATE TABLE `book_copy` (
  `copy_id` int(11) NOT NULL,
  `book_id` varchar(20) NOT NULL,
  `dewey_code` varchar(8) NOT NULL DEFAULT '800.0xxx' COMMENT 'https://en.wikipedia.org/wiki/List_of_Dewey_Decimal_classes ',
  `school_id` int(11) NOT NULL,
  `status` enum('available','hold','checkout') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `book_copy`
--

INSERT INTO `book_copy` (`copy_id`, `book_id`, `dewey_code`, `school_id`, `status`) VALUES
(1, '9780552149518', '_', 1, 'available'),
(2, '9780747532743', '_', 1, 'available'),
(3, '9780747538486', '_', 1, 'available'),
(4, '9780552150736', '_', 1, 'available'),
(5, '9780747551003', '_', 1, 'available'),
(6, '9780747581086', '_', 1, 'available'),
(7, '9780747591054', '_', 1, 'available'),
(8, '9780747546290', '_', 1, 'available'),
(9, '9781904233657', '_', 1, 'available'),
(10, '9780747550990', '_', 1, 'available'),
(11, '9780552151764', '_', 1, 'available'),
(12, '9781904233886', '_', 1, 'available'),
(13, '9780330457729', '_', 1, 'available'),
(14, '9780552151696', '_', 1, 'available'),
(15, '9780099450252', '_', 1, 'available'),
(16, '9781904233916', '_', 1, 'available'),
(17, '9781847245458', '_', 1, 'available'),
(18, '9780747566533', '_', 1, 'available'),
(19, '9780099464464', '_', 1, 'available'),
(20, '9780141017891', '_', 1, 'available'),
(21, '9780099429791', '_', 1, 'available'),
(22, '9780593054277', '_', 1, 'available'),
(23, '9780552997041', '_', 1, 'available'),
(24, '9781905654284', '_', 1, 'available'),
(25, '9780747546245', '_', 1, 'available'),
(26, '9780747591061', '_', 1, 'available'),
(27, '9781849163422', '_', 1, 'available'),
(28, '9780752837505', '_', 1, 'available'),
(29, '9780349116754', '_', 1, 'available'),
(30, '9780718147655', '_', 1, 'available'),
(31, '9780006512134', '_', 1, 'available'),
(32, '9780099387916', '_', 1, 'available'),
(33, '9780752877327', '_', 1, 'available'),
(34, '9780755309511', '_', 1, 'available'),
(35, '9781841953922', '_', 1, 'available'),
(36, '9780091889487', '_', 1, 'available'),
(37, '9780747599876', '_', 1, 'available'),
(38, '9780749397548', '_', 1, 'available'),
(39, '9780563384304', '_', 1, 'available'),
(40, '9780330507417', '_', 1, 'available'),
(41, '9781861976123', '_', 1, 'available'),
(42, '9780590660549', '_', 1, 'available'),
(43, '9780755331420', '_', 1, 'available'),
(44, '9781849162746', '_', 1, 'available'),
(45, '9780330367356', '_', 1, 'available'),
(46, '9780141020525', '_', 1, 'available'),
(47, '9780722532935', '_', 1, 'available'),
(48, '9780552996006', '_', 1, 'available'),
(49, '9780099487821', '_', 1, 'available'),
(50, '9780141011905', '_', 1, 'available'),
(51, '9780718154776', '_', 1, 'available'),
(52, '9780099457169', '_', 1, 'available'),
(53, '9780330332774', '_', 1, 'available'),
(54, '9780241003008', '_', 1, 'available'),
(55, '9780747582977', '_', 1, 'available'),
(56, '9781846051616', '_', 1, 'available'),
(57, '9780718147709', '_', 1, 'available'),
(58, '9780755307500', '_', 1, 'available'),
(59, '9780141030142', '_', 1, 'available'),
(60, '9780007110926', '_', 1, 'available'),
(61, '9780330448444', '_', 1, 'available'),
(62, '9780747561071', '_', 1, 'available'),
(63, '9780701181840', '_', 1, 'available'),
(64, '9780099771517', '_', 1, 'available'),
(65, '9780563384311', '_', 1, 'available'),
(66, '9780590112895', '_', 1, 'available'),
(67, '9780718148621', '_', 1, 'available'),
(68, '9781904994367', '_', 1, 'available'),
(69, '9781861978769', '_', 1, 'available'),
(70, '9780718152437', '_', 1, 'available'),
(71, '9780140276336', '_', 1, 'available'),
(72, '9780007156108', '_', 1, 'available'),
(73, '9780593059258', '_', 1, 'available'),
(74, '9780752893686', '_', 1, 'available'),
(75, '9780007207329', '_', 1, 'available'),
(76, '9780552998482', '_', 1, 'available'),
(77, '9780718144395', '_', 1, 'available'),
(78, '9780006498407', '_', 1, 'available'),
(79, '9780747563204', '_', 1, 'available'),
(80, '9781847670946', '_', 1, 'available'),
(81, '9780007232741', '_', 1, 'available'),
(82, '9780099419785', '_', 1, 'available'),
(83, '9780747581109', '_', 1, 'available'),
(84, '9780099406136', '_', 1, 'available'),
(85, '9780552149525', '_', 1, 'available'),
(86, '9780140237504', '_', 1, 'available'),
(87, '9780593050545', '_', 1, 'available'),
(88, '9780718144845', '_', 1, 'available'),
(89, '9780552771153', '_', 1, 'available'),
(90, '9780141019376', '_', 1, 'available'),
(91, '9780552772747', '_', 1, 'available'),
(92, '9780552773898', '_', 1, 'available'),
(93, '9780141022925', '_', 1, 'available'),
(94, '9780316731317', '_', 1, 'available'),
(95, '9781904994497', '_', 1, 'available'),
(96, '9780439993586', '_', 1, 'available'),
(97, '9780552771108', '_', 1, 'available'),
(98, '9780552997034', '_', 1, 'available'),
(99, '9780099506928', '_', 1, 'available'),
(100, '9781846053443', '_', 1, 'available');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_to_author`
--

CREATE TABLE `book_to_author` (
  `author_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `book_to_author`
--

INSERT INTO `book_to_author` (`author_id`, `ISBN`) VALUES
(1, '9780552149518'),
(2, '9780747532743'),
(2, '9780747538486'),
(1, '9780552150736'),
(2, '9780747551003'),
(2, '9780747581086'),
(2, '9780747591054'),
(2, '9780747546290'),
(3, '9781904233657'),
(2, '9780747550990'),
(1, '9780552151764'),
(3, '9781904233886'),
(4, '9780330457729'),
(1, '9780552151696'),
(5, '9780099450252'),
(3, '9781904233916'),
(6, '9781847245458'),
(7, '9780747566533'),
(8, '9780099464464'),
(9, '9780141017891'),
(10, '9780099429791'),
(1, '9780593054277'),
(11, '9780552997041'),
(3, '9781905654284'),
(2, '9780747546245'),
(2, '9780747591061'),
(6, '9781849163422'),
(12, '9780752837505'),
(13, '9780349116754'),
(14, '9780718147655'),
(15, '9780006512134'),
(16, '9780099387916'),
(17, '9780752877327'),
(18, '9780755309511'),
(19, '9781841953922'),
(20, '9780091889487'),
(2, '9780747599876'),
(21, '9780749397548'),
(22, '9780563384304'),
(23, '9780330507417'),
(24, '9781861976123'),
(25, '9780590660549'),
(26, '9780755331420'),
(6, '9781849162746'),
(27, '9780330367356'),
(28, '9780141020525'),
(29, '9780722532935'),
(11, '9780552996006'),
(30, '9780099487821'),
(31, '9780141011905'),
(32, '9780718154776'),
(33, '9780099457169'),
(27, '9780330332774'),
(34, '9780241003008'),
(7, '9780747582977'),
(35, '9781846051616'),
(32, '9780718147709'),
(36, '9780755307500'),
(37, '9780141030142'),
(38, '9780007110926'),
(39, '9780330448444'),
(2, '9780747561071'),
(40, '9780701181840'),
(41, '9780099771517'),
(22, '9780563384311'),
(25, '9780590112895'),
(32, '9780718148621'),
(42, '9781904994367'),
(43, '9781861978769'),
(32, '9780718152437'),
(44, '9780140276336'),
(45, '9780007156108'),
(46, '9780593059258'),
(47, '9780752893686'),
(48, '9780007207329'),
(49, '9780552998482'),
(32, '9780718144395'),
(50, '9780006498407'),
(51, '9780747563204'),
(52, '9781847670946'),
(53, '9780007232741'),
(54, '9780099419785'),
(2, '9780747581109'),
(33, '9780099406136'),
(1, '9780552149525'),
(55, '9780140237504'),
(56, '9780593050545'),
(32, '9780718144845'),
(57, '9780552771153'),
(58, '9780141019376'),
(59, '9780552772747'),
(60, '9780552773898'),
(9, '9780141022925'),
(61, '9780316731317'),
(42, '9781904994497'),
(25, '9780439993586'),
(59, '9780552771108'),
(11, '9780552997034'),
(5, '9780099506928'),
(62, '9781846053443');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_to_category`
--

CREATE TABLE `book_to_category` (
  `category_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `book_to_category`
--

INSERT INTO `book_to_category` (`category_id`, `ISBN`) VALUES
(1, '9780552149518'),
(2, '9780747532743'),
(2, '9780747538486'),
(1, '9780552150736'),
(2, '9780747551003'),
(2, '9780747581086'),
(2, '9780747591054'),
(2, '9780747546290'),
(3, '9781904233657'),
(2, '9780747550990'),
(1, '9780552151764'),
(3, '9781904233886'),
(4, '9780330457729'),
(1, '9780552151696'),
(4, '9780099450252'),
(3, '9781904233916'),
(1, '9781847245458'),
(4, '9780747566533'),
(4, '9780099464464'),
(5, '9780141017891'),
(4, '9780099429791'),
(1, '9780593054277'),
(6, '9780552997041'),
(3, '9781905654284'),
(2, '9780747546245'),
(7, '9780747591061'),
(1, '9781849163422'),
(8, '9780752837505'),
(1, '9780349116754'),
(9, '9780718147655'),
(4, '9780006512134'),
(4, '9780099387916'),
(4, '9780752877327'),
(4, '9780755309511'),
(4, '9781841953922'),
(9, '9780091889487'),
(2, '9780747599876'),
(4, '9780749397548'),
(10, '9780563384304'),
(11, '9780330507417'),
(12, '9781861976123'),
(3, '9780590660549'),
(1, '9780755331420'),
(1, '9781849162746'),
(4, '9780330367356'),
(4, '9780141020525'),
(4, '9780722532935'),
(13, '9780552996006'),
(3, '9780099487821'),
(14, '9780141011905'),
(10, '9780718154776'),
(1, '9780099457169'),
(4, '9780330332774'),
(15, '9780241003008'),
(4, '9780747582977'),
(8, '9781846051616'),
(16, '9780718147709'),
(4, '9780755307500'),
(4, '9780141030142'),
(17, '9780007110926'),
(4, '9780330448444'),
(2, '9780747561071'),
(10, '9780701181840'),
(4, '9780099771517'),
(10, '9780563384311'),
(3, '9780590112895'),
(10, '9780718148621'),
(18, '9781904994367'),
(6, '9781861978769'),
(10, '9780718152437'),
(4, '9780140276336'),
(4, '9780007156108'),
(19, '9780593059258'),
(1, '9780752893686'),
(20, '9780007207329'),
(4, '9780552998482'),
(10, '9780718144395'),
(8, '9780006498407'),
(21, '9780747563204'),
(22, '9781847670946'),
(23, '9780007232741'),
(4, '9780099419785'),
(7, '9780747581109'),
(1, '9780099406136'),
(1, '9780552149525'),
(4, '9780140237504'),
(9, '9780593050545'),
(10, '9780718144845'),
(4, '9780552771153'),
(4, '9780141019376'),
(4, '9780552772747'),
(4, '9780552773898'),
(24, '9780141022925'),
(19, '9780316731317'),
(18, '9781904994497'),
(3, '9780439993586'),
(4, '9780552771108'),
(13, '9780552997034'),
(4, '9780099506928'),
(19, '9781846053443');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `book_to_keyword`
--

CREATE TABLE `book_to_keyword` (
  `keyword_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'F2.1  Crime, Thriller & Adventure'),
(2, 'Y2.1  Children\'s Fiction'),
(3, 'Y2.2  Young Adult Fiction'),
(4, 'F1.1  General & Literary Fiction'),
(5, 'T13.0  Humour: Collections & General'),
(6, 'T8.0  Popular Science'),
(7, 'F2.2  Science Fiction & Fantasy'),
(8, 'T4.0A  Autobiography: General'),
(9, 'T9.4  Fitness & Diet'),
(10, 'T16.0  Food & Drink: General'),
(11, 'Y1.3  Picture Books'),
(12, 'T2.1  Usage & Writing Guides'),
(13, 'T8.5  Travel Writing'),
(14, 'T7.5  Current Affairs & Issues'),
(15, 'Y1.1  Pre-school & Early Learning'),
(16, 'T16.1  National & Regional Cuisine'),
(17, 'T4.1  Biography: The Arts'),
(18, 'T2.0  Encyclopedias & General Reference'),
(19, 'T4.1A  Autobiography:  The Arts'),
(20, 'T13.4  Puzzles'),
(21, 'T13.3  Trivia & Quiz Books'),
(22, 'T4.2A  Autobiography: Historical, Political & Military'),
(23, 'T11.5  Hobbies, Pastimes & Indoor Games'),
(24, 'T12.0  Transport: General');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL,
  `checkout_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_time` datetime DEFAULT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `checkout`
--

INSERT INTO `checkout` (`checkout_id`, `checkout_time`, `return_time`, `is_returned`, `book_copy_id`, `user_id`) VALUES
(52, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 1, 1),
(53, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 2, 2),
(54, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 3, 3),
(55, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 4, 4),
(56, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 5, 5),
(57, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 6, 6),
(58, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 7, 7),
(59, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 8, 8),
(60, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 9, 9),
(61, '2023-05-11 00:00:00', '2023-05-18 00:00:00', 1, 10, 10),
(62, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 11, 11),
(63, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 12, 12),
(64, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 13, 13),
(65, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 14, 14),
(66, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 15, 15),
(67, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 16, 16),
(68, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 17, 17),
(69, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 18, 18),
(70, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 19, 19),
(71, '2023-05-12 00:00:00', '2023-05-19 00:00:00', 1, 20, 20),
(72, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 21, 21),
(73, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 22, 22),
(74, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 23, 23),
(75, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 24, 24),
(76, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 25, 25),
(77, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 26, 26),
(78, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 27, 27),
(79, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 28, 28),
(80, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 29, 29),
(81, '2023-05-13 00:00:00', '2023-05-20 00:00:00', 1, 30, 30),
(82, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 31, 31),
(83, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 32, 32),
(84, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 33, 33),
(85, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 34, 34),
(86, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 35, 35),
(87, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 36, 36),
(88, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 37, 37),
(89, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 38, 38),
(90, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 39, 39),
(91, '2023-05-14 00:00:00', '2023-05-21 00:00:00', 1, 40, 40),
(92, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 41, 41),
(93, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 42, 42),
(94, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 43, 43),
(95, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 44, 1),
(96, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 45, 11),
(97, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 46, 3),
(98, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 47, 4),
(99, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 48, 5),
(100, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 49, 6),
(101, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 50, 7),
(102, '2023-05-15 00:00:00', '2023-05-22 00:00:00', 1, 51, 8);

--
-- Δείκτες `checkout`
--
DELIMITER $$
CREATE TRIGGER `tr_check_overdue` BEFORE INSERT ON `checkout` FOR EACH ROW BEGIN

  IF (
    SELECT COUNT(*) FROM checkout
    WHERE user_id = NEW.user_id
      AND return_time IS NULL
      AND DATEDIFF(CURDATE(), checkout_time) > 7
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow books, you have an overdue book checkout.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_check_overdue_ch` BEFORE INSERT ON `checkout` FOR EACH ROW BEGIN

  IF (
    SELECT COUNT(*) FROM checkout
    WHERE user_id = NEW.user_id
      AND return_time IS NULL
      AND DATEDIFF(CURDATE(), checkout_time) > 7
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow books, you have an overdue book checkout.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_more_than_two` BEFORE INSERT ON `checkout` FOR EACH ROW BEGIN
  DECLARE borrow_count INT;
  SELECT COUNT(*) INTO borrow_count FROM checkout WHERE user_id = NEW.user_id;
  IF borrow_count >= 2 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow more than 2 books.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_more_than_two_ch` BEFORE INSERT ON `checkout` FOR EACH ROW BEGIN
  DECLARE borrow_count INT;
  SELECT COUNT(*) INTO borrow_count FROM checkout WHERE user_id = NEW.user_id;
  IF borrow_count >= 2 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow more than 2 books.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_same_book_ch` BEFORE INSERT ON `checkout` FOR EACH ROW BEGIN

  IF (
    SELECT COUNT(*) FROM checkout c
    WHERE c.user_id = NEW.user_id
      AND c.return_time IS NULL
      AND ((SELECT book_id FROM book_copy WHERE NEW.book_copy_id = copy_id) = (SELECT book_id FROM book_copy WHERE c.book_copy_id = copy_id)) 
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow 2 copies of the same book.';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_count` AFTER INSERT ON `checkout` FOR EACH ROW BEGIN
    -- Check if an entry exists for the user in checkout_history
    DECLARE count1 INT;
    SET count1 = (SELECT total_count FROM checkout_history WHERE user_id = NEW.user_id);
    
    -- If no entry exists, insert a new row with a count of 1
    IF count1 IS NULL THEN
        INSERT INTO checkout_history (user_id, total_count)
        VALUES (NEW.user_id, 1);
    
    -- If an entry exists, increment the total borrowings count
    ELSE
        UPDATE checkout_history
        SET total_count = total_count + 1
        WHERE user_id = NEW.user_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `checkout_history`
--

CREATE TABLE `checkout_history` (
  `total_checkouts_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `count1` int(11) NOT NULL,
  `total_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `checkout_history`
--

INSERT INTO `checkout_history` (`total_checkouts_id`, `user_id`, `count1`, `total_count`) VALUES
(1, 1, 0, 2),
(2, 2, 0, 1),
(3, 3, 0, 2),
(4, 4, 0, 2),
(5, 5, 0, 2),
(6, 6, 0, 2),
(7, 7, 0, 2),
(8, 8, 0, 2),
(9, 9, 0, 1),
(10, 10, 0, 1),
(11, 11, 0, 2),
(12, 12, 0, 1),
(13, 13, 0, 1),
(14, 14, 0, 1),
(15, 15, 0, 1),
(16, 16, 0, 1),
(17, 17, 0, 1),
(18, 18, 0, 1),
(19, 19, 0, 1),
(20, 20, 0, 1),
(21, 21, 0, 1),
(22, 22, 0, 1),
(23, 23, 0, 1),
(24, 24, 0, 1),
(25, 25, 0, 1),
(26, 26, 0, 1),
(27, 27, 0, 1),
(28, 28, 0, 1),
(29, 29, 0, 1),
(30, 30, 0, 1),
(31, 31, 0, 1),
(32, 32, 0, 1),
(33, 33, 0, 1),
(34, 34, 0, 1),
(35, 35, 0, 1),
(36, 36, 0, 1),
(37, 37, 0, 1),
(38, 38, 0, 1),
(39, 39, 0, 1),
(40, 40, 0, 1),
(41, 41, 0, 1),
(42, 42, 0, 1),
(43, 43, 0, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `hold`
--

CREATE TABLE `hold` (
  `hold_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hold_status` enum('pending','active') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`) VALUES
(1, 'Corgi Books'),
(2, 'Bloomsbury Publishing PLC'),
(3, 'ATOM'),
(4, 'Picador'),
(5, 'Vintage'),
(6, 'Quercus'),
(7, 'Penguin Books'),
(8, 'Bantam Press'),
(9, 'Black Swan'),
(10, 'Quercus Publishing Plc'),
(11, 'Orion (an Imprint of The Orion'),
(12, 'Abacus'),
(13, 'Michael Joseph'),
(14, 'HarperCollins Publishers'),
(15, 'Headline Review'),
(16, 'Canongate Books'),
(17, 'Vermilion'),
(18, 'Minerva'),
(19, 'BBC Books (Random House)'),
(20, 'Macmillan Children\'s Books'),
(21, 'Profile Books'),
(22, 'Point'),
(23, 'Thorsons'),
(24, 'Definitions'),
(25, 'Arrow Books'),
(26, 'Puffin Books'),
(27, 'Century'),
(28, 'Pan Books'),
(29, 'Chatto & Windus'),
(30, 'Guinness World Records'),
(31, 'Times Books'),
(32, 'Flamingo'),
(33, 'Time Warner Books');

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
  `review_status` enum('rejected','pending','accepted') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `school`
--

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `phone_number` bigint(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `principal_name` varchar(60) NOT NULL,
  `operator_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `school`
--

INSERT INTO `school` (`school_id`, `school_name`, `address`, `city`, `phone_number`, `email`, `principal_name`, `operator_name`) VALUES
(1, '27ο Δημοτικό Σχολείο Ιωαννίνων', 'Ισαάκ Τάσσου 22', 'Ιωάννινα', 2651068679, '27dimioa@sch.gr', 'Ζώνιος Σπύρος', 'Ρόζος Αριστείδης'),
(2, 'ΠΡΟΤΥΠΟ ΛΥΚΕΙΟ ΖΩΣΙΜΑΙΑΣ ΣΧΟΛΗΣ ΙΩΑΝΝΙΝΩΝ', 'Πλατεία Αρχιεπισκόπου Σπυρίδωνος', 'Ιωάννινα', 2651025013, 'mail@lyk-zosim.ioa.sch.gr', 'Αντωνίου Κωνσταντίνος', 'Γερογιάννη Χαρίκλεια'),
(3, 'Πρότυπο Γενικό Λύκειο Ευαγγελικής Σχολής Σμύρνης', 'Λέσβου 4', 'Νέα Σμύρνη, Αττικής', 2109333712, 'lykevag@sch.gr', 'Φανίδης Χρήστος', 'Χασάπης Σωτήριος'),
(4, 'Πρότυπο Λύκειο Αναβρύτων', 'Λεωφόρος Κηφισίας 184', 'Αμαρούσιον Αττικής', 2106233215, 'mail@lyk-peir-anavr.att.sch.gr', 'Οτζάκογλου Θεόδωρος', 'Σωτηρόπουλος Νικόλαος');

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
  `school_id` int(11) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL,
  `role` enum('admin','operator','teacher','student') NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png',
  `barcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `profile`, `barcode`) VALUES
(1, 'Μάριος', 'Ρόζος', 'mario_rz', 'pwd', '2002-12-06', 'mariosrizzler@gmail.com', 1, 'active', 'operator', 'https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp', '69421739'),
(2, 'Κωστής', 'Κατσικόπουλος', 'kkat', 'password', '2002-06-15', 'kkatgm@gmail.com', 2, 'active', 'operator', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', '69421740'),
(3, 'Βασίλης', 'Μάλος', 'billydot', 'password', '2002-06-15', 'billydot@gmail.com', 3, 'active', 'operator', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', '69421741'),
(4, 'Μαρια ', 'Παπαδοπούλου', 'maria', 'bd8Se]H8', '1956-01-30', 'bobu-figane78@yahoo.com', 1, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421742'),
(5, 'Ελενη ', 'Παππά', 'eleni', 'nrPED2B-', '1957-05-05', 'yagux_emizu74@hotmail.com', 1, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421743'),
(6, 'Γεωργιος ', 'Καραγιάννης', 'georgios', '}c3DgkzD', '1967-03-06', 'nim_irigaco29@outlook.com', 2, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421744'),
(7, 'Αικατερινη ', 'Βλάχου', 'aikaterini', 'X>pHJM73', '1969-06-01', 'suripu-wowa98@hotmail.com', 2, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421745'),
(8, 'Βασιλικη ', 'Ιωαννίδη', 'basiliki', '/X8HjsT}', '1970-10-19', 'genonu-mafi68@hotmail.com', 3, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421746'),
(9, 'Δημητριος ', 'Οικονόμου', 'dimitrios', 'L_Skc&8%', '1982-05-15', 'kus_ovaturi80@gmail.com', 3, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421747'),
(10, 'Κωνσταντινος ', 'Παπαγεωργίου', 'konstantinos', '^Gv-3cDA', '1983-04-03', 'rikoru_nohe92@hotmail.com', 3, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421748'),
(11, 'Ιωαννης ', 'Μακρής', 'ioannis', 'rrCM3=rw', '1988-10-13', 'dexu-fapeye96@outlook.com', 2, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421749'),
(12, 'Νικολαος ', 'Κωνσταντινίδης', 'nikolaos', 'x3/WUeFV', '1991-03-26', 'sut_uyebunu50@aol.com', 1, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421750'),
(13, 'Γεωργια ', 'Δημοπούλου', 'georgia', '{5xXj2%c', '1992-09-20', 'luhece-zako25@aol.com', 1, 'active', 'teacher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421751'),
(14, 'Σοφια ', 'Γεωργιάδη', 'sofia', 'puVTbn-5', '2005-02-07', 'vugez-ikuta91@hotmail.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421752'),
(15, 'Αναστασια ', 'Παπαδημητρίου', 'anastasia', 'q@x9@UAw', '2005-04-15', 'yumubuy-agi58@gmail.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421753'),
(16, 'Ευαγγελια ', 'Παπαδάκη', 'eyaggelia', 'epA[66fw', '2006-03-14', 'wico_yagixo18@aol.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421754'),
(17, 'Ιωαννα ', 'Αντωνίου', 'ioanna', 'Xb7WL(48', '2007-03-20', 'jem-utopowa60@hotmail.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421755'),
(18, 'Δημητρα ', 'Παπανικολάου', 'dimitra', 'r.9P@GZx', '2007-06-07', 'hom_egexaso82@yahoo.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421756'),
(19, 'Ειρηνη ', 'Παναγιωτοπούλου', 'eirini', 'Y?HNr!$7', '2009-12-17', 'paceda-sube63@outlook.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421757'),
(20, 'Χρηστος ', 'Βασιλείου', 'xristos', 't2T%xFD6', '2010-01-19', 'ceh-iwemowa19@hotmail.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421758'),
(21, 'Παναγιωτα ', 'Γιαννοπούλου', 'panagiota', 'CmBU}>4(', '2010-03-17', 'gajulap-ure79@gmail.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421759'),
(22, 'Χριστινα ', 'Νικολάου', 'xristina', 'vsx3bsH]', '2010-07-01', 'xace-mucano25@gmail.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421760'),
(23, 'Παναγιωτης ', 'Βασιλειάδης', 'panagiotis', 'z=s7FCx!', '2010-08-14', 'kecoh-ilapi24@yahoo.com', 1, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421761'),
(24, 'Βασιλειος ', 'Παπακωνσταντόπουλος', 'basileios', '{F^/8uH9', '2010-12-26', 'gotu-cebuvi32@outlook.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421762'),
(25, 'Κωνσταντινα ', 'Αγγελοπούλου', 'konstantina', '4Ae!WUAC', '2011-05-05', 'decili-zoxo93@mail.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421763'),
(26, 'Αννα ', 'Πετροπούλου', 'anna', 'c[3cRJ9r', '2012-01-21', 'dub_ujukuxi28@yahoo.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421764'),
(27, 'Αγγελικη ', 'Καραναστάση', 'aggeliki', '$+2HLPgG', '2012-03-03', 'mehezot_evo38@aol.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421765'),
(28, 'Αθανασιος ', 'Κωνσταντόπουλος', 'athanasios', 'S_C/>Ks3', '2012-08-26', 'judune-wota47@gmail.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421766'),
(29, 'Δεσποινα ', 'Κόλλια', 'despoina', '6g(cNJRr', '2012-09-15', 'fibow_acure81@hotmail.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421767'),
(30, 'Παρασκευη ', 'Σπυροπούλου', 'paraskeyi', '9PYQnw^w', '2013-05-11', 'dafuta-vira89@outlook.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421768'),
(31, 'Φωτεινη ', 'Κόντου', 'foteini', 'B7&sFy@G', '2014-02-10', 'kuriki-xufu83@hotmail.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421769'),
(32, 'Αλεξανδρα ', 'Νικολοπούλου', 'alexandra', 'MX+wG5am', '2014-07-09', 'weweduh-ete4@hotmail.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421770'),
(33, 'Ευαγγελος ', 'Δόβας', 'eyaggelos', '}aq9SzM6', '2016-01-01', 'liwurih_edi12@aol.com', 2, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421771'),
(34, 'Κυριακη ', 'Μαρκοπούλου', 'kyriaki', 'm^Un+rK8', '2016-01-05', 'puyog_acehi75@hotmail.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421772'),
(35, 'Θεοδωρα ', 'Χαραλάμπους', 'theodora', '%_QwL7-4', '2016-01-18', 'zuna_notodu88@aol.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421773'),
(36, 'Σταυρουλα ', 'Γρηγοριάδη', 'stayroula', 'Tb3/-Acp', '2016-04-10', 'lur_ofozuju5@aol.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421774'),
(37, 'Χρυσουλα ', 'Ηλιοπούλου', 'xrysoula', '4-mmL*W5', '2017-02-01', 'recad_uferi98@gmail.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421775'),
(38, 'Καλλιοπη ', 'Ξενοπούλου', 'kalliopi', 'dqN^^5rV', '2017-02-19', 'wusufo-pife84@gmail.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421776'),
(39, 'Αθανασια ', 'Βασιλοπούλου', 'athanasia', 'x3pQTd/U', '2005-07-20', 'tovo-hakido3@aol.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421777'),
(40, 'Ελευθερια ', 'Πάνου', 'eleytheria', 'zCx8VE$k', '2005-07-29', 'miwaliz_ega45@outlook.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421778'),
(41, 'Αθηνα ', 'Κοκκινοπούλου', 'athina', '7$^TWC&n', '2006-02-26', 'gujoru-cibu96@yahoo.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421779'),
(42, 'Μιχαηλ ', 'Δημητρακόπουλος', 'mixail', 'bkeZL&!5', '2006-10-03', 'mexohol-ere97@hotmail.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421780'),
(43, 'Αλεξανδρος ', 'Βασιλακόπουλος', 'alexandros', 't=u5bRM^', '2007-05-11', 'gunixep_usa50@gmail.com', 3, 'active', 'student', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png', '69421781');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Ευρετήρια για πίνακα `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `FK_PUBLISHER_ID` (`publisher_id`);

--
-- Ευρετήρια για πίνακα `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `FK_ISBN` (`book_id`),
  ADD KEY `FK_SCHOOL_ID` (`school_id`);

--
-- Ευρετήρια για πίνακα `book_to_author`
--
ALTER TABLE `book_to_author`
  ADD KEY `FK_AUTHOR_ID` (`author_id`),
  ADD KEY `FK_AUTH_ISBN` (`ISBN`);

--
-- Ευρετήρια για πίνακα `book_to_category`
--
ALTER TABLE `book_to_category`
  ADD KEY `FK_CATEGORY_ID` (`category_id`),
  ADD KEY `FK_CAT_ISBN` (`ISBN`);

--
-- Ευρετήρια για πίνακα `book_to_keyword`
--
ALTER TABLE `book_to_keyword`
  ADD KEY `FK_KW_ISBN` (`ISBN`),
  ADD KEY `FK_KW_ID` (`keyword_id`);

--
-- Ευρετήρια για πίνακα `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Ευρετήρια για πίνακα `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`),
  ADD KEY `FK_C_COPY_ID` (`book_copy_id`),
  ADD KEY `FK_USER_ID` (`user_id`);

--
-- Ευρετήρια για πίνακα `checkout_history`
--
ALTER TABLE `checkout_history`
  ADD PRIMARY KEY (`total_checkouts_id`),
  ADD KEY `FK_COUT_USR_ID` (`user_id`);

--
-- Ευρετήρια για πίνακα `hold`
--
ALTER TABLE `hold`
  ADD PRIMARY KEY (`hold_id`),
  ADD KEY `FK_H_COPY_ID` (`book_copy_id`),
  ADD KEY `FK_UID` (`user_id`);

--
-- Ευρετήρια για πίνακα `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`);

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
  ADD KEY `FK_P_UID` (`user_id`);

--
-- Ευρετήρια για πίνακα `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FK_R_ISBN` (`book_id`),
  ADD KEY `FK_R_USER_ID` (`user_id`);

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
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `FK_SCH_ID` (`school_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT για πίνακα `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `copy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT για πίνακα `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT για πίνακα `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT για πίνακα `checkout_history`
--
ALTER TABLE `checkout_history`
  MODIFY `total_checkouts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT για πίνακα `hold`
--
ALTER TABLE `hold`
  MODIFY `hold_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keyword_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT για πίνακα `pwd`
--
ALTER TABLE `pwd`
  MODIFY `pwd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `school`
--
ALTER TABLE `school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_PUBLISHER_ID` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Περιορισμοί για πίνακα `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `FK_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SCHOOL_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `book_to_author`
--
ALTER TABLE `book_to_author`
  ADD CONSTRAINT `FK_AUTHOR_ID` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUTH_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `book_to_category`
--
ALTER TABLE `book_to_category`
  ADD CONSTRAINT `FK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `book_to_keyword`
--
ALTER TABLE `book_to_keyword`
  ADD CONSTRAINT `FK_KW_ID` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`),
  ADD CONSTRAINT `FK_KW_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Περιορισμοί για πίνακα `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `FK_C_COPY_ID` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`copy_id`),
  ADD CONSTRAINT `FK_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `checkout_history`
--
ALTER TABLE `checkout_history`
  ADD CONSTRAINT `FK_COUT_USR_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `hold`
--
ALTER TABLE `hold`
  ADD CONSTRAINT `FK_H_COPY_ID` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`copy_id`),
  ADD CONSTRAINT `FK_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `pwd`
--
ALTER TABLE `pwd`
  ADD CONSTRAINT `FK_P_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_R_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `FK_R_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Περιορισμοί για πίνακα `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_SCH_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
