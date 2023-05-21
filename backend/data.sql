INSERT INTO school (school_name, address, city, phone_number, email, principal_name, operator_name)
VALUES
('27ο Δημοτικό Σχολείο Ιωαννίνων','Ισαάκ Τάσσου 22','Ιωάννινα',2651068679, '27dimioa@sch.gr','Ζώνιος Σπύρος','Ρόζος Αριστείδης'),
('ΠΡΟΤΥΠΟ ΛΥΚΕΙΟ ΖΩΣΙΜΑΙΑΣ ΣΧΟΛΗΣ ΙΩΑΝΝΙΝΩΝ','Πλατεία Αρχιεπισκόπου Σπυρίδωνος','Ιωάννινα',2651025013, 'mail@lyk-zosim.ioa.sch.gr','Αντωνίου Κωνσταντίνος','Γερογιάννη Χαρίκλεια'),
('Πρότυπο Γενικό Λύκειο Ευαγγελικής Σχολής Σμύρνης','Λέσβου 4','Νέα Σμύρνη, Αττικής',2109333712, 'lykevag@sch.gr','Φανίδης Χρήστος','Χασάπης Σωτήριος'),
('Πρότυπο Λύκειο Αναβρύτων','Λεωφόρος Κηφισίας 184','Αμαρούσιον Αττικής',2106233215, 'mail@lyk-peir-anavr.att.sch.gr','Οτζάκογλου Θεόδωρος','Σωτηρόπουλος Νικόλαος');
INSERT INTO school (school_id,school_name, address, city, phone_number, email, principal_name, operator_name)
VALUES
(0,'Δίκτυο Σχολικών Βιβλιοθηκών','Λεωφόρος Αλεξάνδρας 42','Αθήνα',26510682323, 'genlib@sch.gr','Στέφανος Καραναστάσης','Αδμίνος Α.');

UPDATE `school` SET `school_id` = '0' WHERE `school`.`school_id` = 5; 

INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `profile`, `barcode`) VALUES
('Μάριος', 'Ρόζος', 'mario_rz', 'mario_rz', '2002-12-06', 'mariosrizzler@gmail.com', 1, 'active', 'operator', 'https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωστής', 'Κατσικόπουλος', 'kkat', 'kkat', '2002-06-15', 'kkatgm@gmail.com', 2, 'active', 'operator', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασίλης', 'Μάλος', 'billydot', 'billydot', '2002-06-15', 'billydot@gmail.com', 3, 'active', 'operator', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μητσος', 'Κονιαρης', 'mitsigun', 'mitsigun', '1900-06-13', 'mitskon@hotmail.gr', 4, 'active', 'operator', 'https://pyxis.nymag.com/v1/imgs/dd9/a1a/06a5117322a7b2cf158e0dc9d5f7df918e-complex.rsquare.w330.png', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `barcode`) VALUES
('Μαρια ', 'Παπαδοπούλου', 'maria', 'maria', '1956-01-30', 'bobu-figane78@yahoo.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελενη ', 'Παππά', 'eleni', 'eleni', '1957-05-05', 'yagux_emizu74@hotmail.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεωργιος ', 'Καραγιάννης', 'georgios', 'georgios', '1967-03-06', 'nim_irigaco29@outlook.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αικατερινη ', 'Βλάχου', 'aikaterini', 'aikaterini', '1969-06-01', 'suripu-wowa98@hotmail.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασιλικη ', 'Ιωαννίδη', 'basiliki', 'basiliki', '1970-10-19', 'genonu-mafi68@hotmail.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημητριος ', 'Οικονόμου', 'dimitrios', 'dimitrios', '1982-05-15', 'kus_ovaturi80@gmail.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωνσταντινος ', 'Παπαγεωργίου', 'konstantinos', 'konstantinos', '1983-04-03', 'rikoru_nohe92@hotmail.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ιωαννης ', 'Μακρής', 'ioannis', 'ioannis', '1988-10-13', 'dexu-fapeye96@outlook.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικολαος ', 'Κωνσταντινίδης', 'nikolaos', 'nikolaos', '1991-03-26', 'sut_uyebunu50@aol.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεωργια ', 'Δημοπούλου', 'georgia', 'georgia', '1992-09-20', 'luhece-zako25@aol.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σοφια ', 'Γεωργιάδη', 'sofia', 'sofia', '2005-02-07', 'vugez-ikuta91@hotmail.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασια ', 'Παπαδημητρίου', 'anastasia', 'anastasia', '2005-04-15', 'yumubuy-agi58@gmail.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελια ', 'Παπαδάκη', 'eyaggelia', 'eyaggelia', '2006-03-14', 'wico_yagixo18@aol.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Δημητρίου', 'george91', 'george91', '2012-03-15', 'george.dimitriou@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξάνδρα', 'Μαρκοπούλου', 'alexandra79', 'alexandra79', '2013-09-05', 'alexandra.markopoulou@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτριος', 'Πετρίδης', 'dimitrios27', 'dimitrios27', '2014-06-18', 'dimitrios.petridis@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελένη', 'Γεωργίου', 'eleni88', 'eleni88', '2015-01-22', 'eleni.georgiou@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σταύρος', 'Κοντογιάννης', 'stavros17', 'stavros17', '2016-07-10', 'stavros.kontogiannis@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`,`barcode`) VALUES
('Ελένη', 'Παπαδοπούλου', 'elena01', 'elena01', '2006-11-05', 'elena.papadopoulou@example.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος', 'Πατεράκης', 'nikos88', 'nikos88', '2011-12-10', 'nikos.paterakis@example.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασία', 'Παπαναστασίου', 'anastasia78', 'anastasia78', '2008-03-28', 'anastasia.papanastasiou@example.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ιωαννα ', 'Αντωνίου', 'ioanna', 'ioanna', '2007-03-20', 'jem-utopowa60@hotmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημητρα ', 'Παπανικολάου', 'dimitra', 'dimitra', '2007-06-07', 'hom_egexaso82@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ειρηνη ', 'Παναγιωτοπούλου', 'eirini', 'eirini', '2009-12-17', 'paceda-sube63@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρηστος ', 'Βασιλείου', 'xristos', 'xristos', '2010-01-19', 'ceh-iwemowa19@hotmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτα ', 'Γιαννοπούλου', 'panagiota', 'panagiota', '2010-03-17', 'gajulap-ure79@gmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χριστινα ', 'Νικολάου', 'xristina', 'xristina', '2010-07-01', 'xace-mucano25@gmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτης ', 'Βασιλειάδης', 'panagiotis', 'panagiotis', '2010-08-14', 'kecoh-ilapi24@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασιλειος ', 'Παπακωνσταντόπουλος', 'basileios', 'basileios', '2010-12-26', 'gotu-cebuvi32@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωνσταντινα ', 'Αγγελοπούλου', 'konstantina', 'konstantina', '2011-05-05', 'decili-zoxo93@mail.com', 1, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αννα ', 'Πετροπούλου', 'anna', 'anna', '2012-01-21', 'dub_ujukuxi28@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αγγελικη ', 'Καραναστάση', 'aggeliki', 'aggeliki', '2012-03-03', 'mehezot_evo38@aol.com', 2, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλέξανδρος', 'Δημητρίου', 'alex123', 'alex123', '2005-08-12', 'alex.dimitriou@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθανασιος ', 'Κωνσταντόπουλος', 'athanasios', 'athanasios', '2012-08-26', 'judune-wota47@gmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δεσποινα ', 'Κόλλια', 'despoina', 'despoina', '2012-09-15', 'fibow_acure81@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παρασκευη ', 'Σπυροπούλου', 'paraskeyi', 'paraskeyi', '2013-05-11', 'dafuta-vira89@outlook.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Φωτεινη ', 'Κόντου', 'foteini', 'foteini', '2014-02-10', 'kuriki-xufu83@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρα ', 'Νικολοπούλου', 'alexandra', 'alexandra', '2014-07-09', 'weweduh-ete4@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελος ', 'Δόβας', 'eyaggelos', 'eyaggelos', '2016-01-01', 'liwurih_edi12@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτριος', 'Κωνσταντίνου', 'dimitris99', 'dimitris99', '2009-09-15', 'dimitris.konstantinou@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κυριακη ', 'Μαρκοπούλου', 'kyriaki', 'kyriaki', '2016-01-05', 'puyog_acehi75@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Σπυροπούλου', 'evaggelia27', 'evaggelia27', '2012-06-25', 'evaggelia.spyropoulou@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Θεοδωρα ', 'Χαραλάμπους', 'theodora', 'theodora', '2016-01-18', 'zuna_notodu88@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σταυρουλα ', 'Γρηγοριάδη', 'stayroula', 'stayroula', '2016-04-10', 'lur_ofozuju5@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρυσουλα ', 'Ηλιοπούλου', 'xrysoula', 'xrysoula', '2017-02-01', 'recad_uferi98@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Μιχαηλίδης', 'george22', 'george22', '2007-07-19', 'george.michailidis@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μαρία', 'Ανδρέου', 'maria45', 'maria45', '2010-04-02', 'maria.andreou@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιώτης', 'Μαυρίδης', 'panos13', 'panos13', '2013-02-14', 'panos.mavridis@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Καλλιοπη ', 'Ξενοπούλου', 'kalliopi', 'kalliopi', '2017-02-19', 'wusufo-pife84@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθανασια ', 'Βασιλοπούλου', 'athanasia', 'athanasia', '2005-07-20', 'tovo-hakido3@aol.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερια ', 'Πάνου', 'eleytheria', 'eleytheria', '2005-07-29', 'miwaliz_ega45@outlook.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθηνα ', 'Κοκκινοπούλου', 'athina', 'athina', '2006-02-26', 'gujoru-cibu96@yahoo.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μιχαηλ ', 'Δημητρακόπουλος', 'mixail', 'mixail', '2006-10-03', 'mexohol-ere97@hotmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρος ', 'Βασιλακόπουλος', 'alexandros', 'alexandros', '2007-05-11', 'gunixep_usa50@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Αθανασίου', 'george_a', 'george_a', '1975-09-18', 'george@example.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Καραδήμου', 'evangelia', 'evangelia', '1988-03-12', 'evangelia@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος', 'Μαρκόπουλος', 'nikolas_m', 'nikolas_m', '1994-07-30', 'nikolas@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σοφία', 'Αντωνίου', 'sofia_a', 'sofia_a', '1982-05-23', 'sofia@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτρης', 'Παπανικολάου', 'dimitris_p', 'dimitris_p', '1979-11-06', 'dimitris@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασία', 'Κούρτη', 'anastasia2', 'anastasia2', '1993-02-28', 'anastasia@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλέξανδρα', 'Δημητρίου', 'alexandra2', 'alexandra2', '1991-06-14', 'alexandra@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιώτης', 'Γεωργίου', 'panagiotis2', 'panagiotis2', '1984-09-25', 'panagiotis@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερία', 'Παναγιώτου', 'eleftheria', 'eleftheria', '1987-12-08', 'eleftheria@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ανδρέας', 'Νικολάου', 'andreas', 'andreas', '1997-04-03', 'andreas@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Ανδρέου', 'evangelia_a', 'evangelia_a', '1989-08-17', 'evangelia@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Στέλιος', 'Γεωργίου', 'stelios', 'stelios', '1986-01-02', 'stelios@example.com', 4, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αικατερίνη', 'Σταματίου', 'katerina', 'katerina', '1990-03-19', 'katerina@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Θεόδωρος', 'Σωτηρίου', 'theodoros', 'theodoros', '1983-07-22', 'theodoros@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερία', 'Γεωργιάδου', 'eleftheria61', 'eleftheria61', '2014-08-27', 'eleftheria.georgiadou@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));

call Addbook('9780140449266', 'Pride and Prejudice', 'Jane Austen', 'Penguin Classics', 1813, 'Fiction, Romance', 'love, society, marriage', 1, 5, '823.7', 400);
call Addbook('9780061122415', 'To Kill a Mockingbird', 'Harper Lee', 'Harper Perennial Modern Classics', 1960, 'Fiction, Classics', 'race, justice, family', 2, 3, '813.54', 336);
call Addbook('9780141439563', 'Great Expectations', 'Charles Dickens', 'Penguin Classics', 1861, 'Fiction, Classics', 'ambition, social class, identity', 1, 4, '823.8', 544);
call Addbook('9780060850524', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, 'Fiction, Classics', 'adolescence, alienation, identity', 3, 2, '813.54', 224);
call Addbook('9780062315007', '1984', 'George Orwell', 'Signet Classics', 1949, 'Fiction, Dystopian', 'surveillance, totalitarianism, thought control', 2, 1, '823.91', 328);
call Addbook('9780061120084', 'The Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 1937, 'Fantasy, Adventure', 'quest, dragons, Middle-earth', 4, 5, '823.91', 320);
call Addbook('9780547928227', 'Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury Publishing', 1997, 'Fantasy, Adventure', 'magic, friendship, coming of age', 1, 3, '823.91', 336);
call Addbook('9780140188592', 'Moby-Dick', 'Herman Melville', 'Penguin Classics', 1851, 'Fiction, Classics', 'whaling, obsession, revenge', 3, 2, '813.3', 720);
call Addbook('9780451524935', 'The Scarlet Letter', 'Nathaniel Hawthorne', 'Signet Classics', 1850, 'Fiction, Classics', 'sin, guilt, redemption', 2, 4, '813.3', 238);
call Addbook('9780061122416', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 'Fiction, Classics', 'wealth, love, American Dream', 1, 2, '813.52', 180);
call Addbook('9780486280615', 'Pride and Prejudice', 'Jane Austen', 'Dover Publications', 1813, 'Fiction, Romance', 'love, society, marriage', 4, 3, '823.7', 352);
call Addbook('9780140449181', 'Crime and Punishment', 'Fyodor Dostoevsky', 'Penguin Classics', 1866, 'Fiction, Classics', 'guilt, redemption, morality', 3, 2, '891.73',

 671);
call Addbook('9780060935467', 'The Alchemist', 'Paulo Coelho', 'HarperOne', 1988, 'Fiction, Inspirational', 'dreams, destiny, self-discovery', 2, 4, '869.3', 208);
call Addbook('9780679732761', 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Harper Perennial Modern Classics', 1967, 'Fiction, Magical Realism', 'family, time, solitude', 1, 1, '863.64', 417);
call Addbook('9780060913076', 'Slaughterhouse-Five', 'Kurt Vonnegut', 'Dell Publishing', 1969, 'Fiction, Science Fiction', 'war, time travel, absurdity', 4, 3, '813.54', 275);
call Addbook('9780060913077', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt', 1954, 'Fantasy, Adventure', 'epic, fellowship, Middle-earth', 3, 2, '823.91', 1178);
call Addbook('9780060951395', 'Brave New World', 'Aldous Huxley', 'Harper Perennial Modern Classics', 1932, 'Fiction, Dystopian', 'technology, control, happiness', 1, 4, '823.91', 288);
call Addbook('9780385721790', 'The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', 2003, 'Fiction, Historical', 'friendship, guilt, redemption', 2, 2, '813.6', 371);
call Addbook('9780451524936', 'Frankenstein', 'Mary Shelley', 'Signet Classics', 1818, 'Fiction, Horror', 'science, creation, morality', 3, 3, '823.7', 352);
call Addbook('9780060562496', 'The Odyssey', 'Homer', 'Harper Perennial Modern Classics', 8, 'Poetry, Epic', 'heroism, adventure, homecoming', 4, 1, '883', 541);

