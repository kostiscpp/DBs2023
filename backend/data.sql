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
call AddBook( '9780552149518','Undomestic Goddess,The','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747532743','Harry Potter and the Philosopher''s Stone#','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets#','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780552150736','Angels and Demons#','Brown, Dan','Corgi Books','2003','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9781904233657','Twilight#','Meyer, Stephenie','ATOM','2007','Adult Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Children''s Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780552151764','Deception Point#','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,10,'800.xx',150);
call AddBook( '9781904233886','New Moon#','Meyer, Stephenie','ATOM','2007','Adult Fiction','κονιαρημικροτσουσουνε',1,11,'800.xx',150);
call AddBook( '9780330457729','Lovely Bones,The#','Sebold, Alice','Picador','2009','General & Literary Fiction','κονιαρημικροτσουσουνε',1,12,'800.xx',150);
call AddBook( '9780552151696','Digital Fortress#','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,13,'800.xx',150);
call AddBook( '9780099450252','Curious Incident of the Dog in the Night-time,The#','Haddon, Mark','Vintage','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',1,14,'800.xx',150);
call AddBook( '9781904233916','Eclipse#','Meyer, Stephenie','ATOM','2008','Adult Fiction','κονιαρημικροτσουσουνε',1,15,'800.xx',150);
call AddBook( '9781847245458','Girl with the Dragon Tattoo,The:Millennium Trilogy#','Larsson, Stieg','Quercus','2008','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,16,'800.xx',150);
call AddBook( '9780747566533','Kite Runner,The#','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',1,17,'800.xx',150);
call AddBook( '9780099464464','Time Traveler''s Wife,The','Niffenegger, Audrey','Vintage','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',1,18,'800.xx',150);
call AddBook( '9780141017891','World According to Clarkson,The','Clarkson, Jeremy','Penguin Books','2005','General & Literary Fiction','κονιαρημικροτσουσουνε',1,19,'800.xx',150);
call AddBook( '9780099429791','Atonement#','McEwan, Ian','Vintage','2002','General & Literary Fiction','κονιαρημικροτσουσουνε',1,20,'800.xx',150);
call AddBook( '9780593054277','Lost Symbol,The','Brown, Dan','Bantam Press','2009','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,21,'800.xx',150);
call AddBook( '9780552997041','Short History of Nearly Everything,A','Bryson, Bill','Black Swan','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',1,22,'800.xx',150);
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Adult Fiction','κονιαρημικροτσουσουνε',1,23,'800.xx',150);
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','κονιαρημικροτσουσουνε',1,24,'800.xx',150);
call AddBook( '9780747591061','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Science Fiction','κονιαρημικροτσουσουνε',1,25,'800.xx',150);
call AddBook( '9781849163422','Girl Who Played With Fire,The:Millennium Trilogy#','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,26,'800.xx',150);
call AddBook( '9780752837505','Child Called It,A','Pelzer, Dave','Orion (an Imprint of The Orion','2001','Autobiography','κονιαρημικροτσουσουνε',1,27,'800.xx',150);
call AddBook( '9780349116754','No. Detective Agency,The:No. Ladies'' Detective Agency S.','McCall Smith, Alexander','Abacus','2003','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,28,'800.xx',150);
call AddBook( '9780718147655','You are What You Eat:The Plan That Will Change Your Life','McKeith, Gillian','Michael Joseph','2004','Fitness & Diet','κονιαρημικροτσουσουνε',1,29,'800.xx',150);
call AddBook( '9780006512134','Man and Boy','Parsons, Tony','HarperCollins Publishers','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',1,30,'800.xx',150);
call AddBook( '9780099387916','Birdsong','Faulks, Sebastian','Vintage','1994','General & Literary Fiction','κονιαρημικροτσουσουνε',1,31,'800.xx',150);
call AddBook( '9780752877327','Labyrinth','Mosse, Kate','Orion (an Imprint of The Orion','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',1,32,'800.xx',150);
call AddBook( '9780755309511','Island,The','Hislop, Victoria','Headline Review','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',1,33,'800.xx',150);
call AddBook( '9781841953922','Life of Pi','Martel, Yann','Canongate Books','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',1,34,'800.xx',150);
call AddBook( '9780091889487','Dr. Atkins'' New Diet Revolution:The No-hunger, Luxurious Weight Loss P','Atkins, Robert C.','Vermilion','2003','Fitness & Diet','κονιαρημικροτσουσουνε',1,35,'800.xx',150);
call AddBook( '9780747599876','Tales of Beedle the Bard,The','Rowling, J. K.','Bloomsbury Publishing PLC','2008','Children''s Fiction','κονιαρημικροτσουσουνε',1,36,'800.xx',150);
call AddBook( '9780749397548','Captain Corelli''s Mandolin','De Bernieres, Louis','Minerva','1995','General & Literary Fiction','κονιαρημικροτσουσουνε',1,37,'800.xx',150);
call AddBook( '9780563384304','Delia''s How to Cook:(Bk.) ','Smith, Delia','BBC Books (Random House)','1998','Fitness & Diet','κονιαρημικροτσουσουνε',1,38,'800.xx',150);
call AddBook( '9780330507417','Gruffalo,The#','Donaldson, Julia','Macmillan Children''s Books','2009','Picture Books','κονιαρημικροτσουσουνε',1,39,'800.xx',150);
call AddBook( '9781861976123','Eats, Shoots and Leaves:The Zero Tolerance Approach to Punctuation','Truss, Lynne','Profile Books','2003','Picture Books','κονιαρημικροτσουσουνε',1,40,'800.xx',150);
call AddBook( '9780590660549','Northern Lights:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','κονιαρημικροτσουσουνε',1,41,'800.xx',150);
call AddBook( '9780755331420','Interpretation of Murder,The','Rubenfeld, Jed','Headline Review','2007','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,42,'800.xx',150);
call AddBook( '9781849162746','Girl Who Kicked the Hornets'' Nest,The:Millennium Trilogy','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,43,'800.xx',150);
call AddBook( '9780330367356','Bridget Jones: The Edge of Reason','Fielding, Helen','Picador','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',1,44,'800.xx',150);
call AddBook( '9780141020525','Short History of Tractors in Ukrainian,A','Lewycka, Marina','Penguin Books','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',1,45,'800.xx',150);
call AddBook( '9780722532935','Alchemist,The:A Fable About Following Your Dream','Coelho, Paulo','Thorsons','1999','General & Literary Fiction','κονιαρημικροτσουσουνε',1,46,'800.xx',150);
call AddBook( '9780552996006','Notes from a Small Island','Bryson, Bill','Black Swan','1996','General & Literary Fiction','κονιαρημικροτσουσουνε',1,47,'800.xx',150);
call AddBook( '9780099487821','Boy in the Striped Pyjamas,The#','Boyne, John','Definitions','2007','Adult Fiction','κονιαρημικροτσουσουνε',1,48,'800.xx',150);
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','Picture Books','κονιαρημικροτσουσουνε',1,49,'800.xx',150);
call AddBook( '9780718154776','Jamie''s 30-minute Meals','Oliver, Jamie','Michael Joseph','2010','Fitness & Diet','κονιαρημικροτσουσουνε',1,50,'800.xx',150);
call AddBook( '9780099457169','Broker,The','Grisham, John','Arrow Books','2005','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,51,'800.xx',150);
call AddBook( '9780330332774','Bridget Jones''s Diary:A Novel','Fielding, Helen','Picador','1997','General & Literary Fiction','κονιαρημικροτσουσουνε',1,52,'800.xx',150);
call AddBook( '9780241003008','Very Hungry Caterpillar,The:The Very Hungry Caterpillar','Carle, Eric','Puffin Books','1994','Picture Books','κονιαρημικροτσουσουνε',1,53,'800.xx',150);
call AddBook( '9780747582977','Thousand Splendid Suns,A','Hosseini, Khaled','Bloomsbury Publishing PLC','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',1,54,'800.xx',150);
call AddBook( '9781846051616','Sound of Laughter,The','Kay, Peter','Century','2006','Autobiography','κονιαρημικροτσουσουνε',1,55,'800.xx',150);
call AddBook( '9780718147709','Jamie''s Italy','Oliver, Jamie','Michael Joseph','2005','Picture Books','κονιαρημικροτσουσουνε',1,56,'800.xx',150);
call AddBook( '9780755307500','Small Island#','Levy, Andrea','Headline Review','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',1,57,'800.xx',150);
call AddBook( '9780141030142','Memory Keeper''s Daughter,The','Edwards, Kim','Penguin Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',1,58,'800.xx',150);
call AddBook( '9780007110926','Billy Connolly','Stephenson, Pamela','HarperCollins Publishers','2002','Picture Books','κονιαρημικροτσουσουνε',1,59,'800.xx',150);
call AddBook( '9780330448444','House at Riverton,The','Morton, Kate','Pan Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',1,60,'800.xx',150);
call AddBook( '9780747561071','Harry Potter and the Order of the Phoenix#','Rowling, J. K.','Bloomsbury Publishing PLC','2004','Children''s Fiction','κονιαρημικροτσουσουνε',1,61,'800.xx',150);
call AddBook( '9780701181840','Nigella Express','Lawson, Nigella','Chatto & Windus','2007','Fitness & Diet','κονιαρημικροτσουσουνε',1,62,'800.xx',150);
call AddBook( '9780099771517','Memoirs of a Geisha','Golden, Arthur','Vintage','1998','General & Literary Fiction','κονιαρημικροτσουσουνε',1,63,'800.xx',150);
call AddBook( '9780563384311','Delia''s How to Cook:(Bk.1) ','Smith, Delia','BBC Books (Random House)','1999','Fitness & Diet','κονιαρημικροτσουσουνε',1,64,'800.xx',150);
call AddBook( '9780590112895','Subtle Knife,The:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','κονιαρημικροτσουσουνε',1,65,'800.xx',150);
call AddBook( '9780718148621','Jamie''s Ministry of Food:Anyone Can Learn to Cook in 24 Hours','Oliver, Jamie','Michael Joseph','2008','Fitness & Diet','κονιαρημικροτσουσουνε',1,66,'800.xx',150);
call AddBook( '9781904994367','Guinness World Records 2009:2009','Guinness World Records','Guinness World Records','2008','Picture Books','κονιαρημικροτσουσουνε',1,67,'800.xx',150);
call AddBook( '9781861978769','Why Don''t Penguins'' Feet Freeze?:And 114 Other Questions','Profile Books','Profile Books','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',1,68,'800.xx',150);
call AddBook( '9780718152437','Jamie at Home:Cook Your Way to the Good Life','Oliver, Jamie','Michael Joseph','2007','Fitness & Diet','κονιαρημικροτσουσουνε',1,69,'800.xx',150);
call AddBook( '9780140276336','White Teeth','Smith, Zadie','Penguin Books','2001','General & Literary Fiction','κονιαρημικροτσουσουνε',1,70,'800.xx',150);
call AddBook( '9780007156108','Devil Wears Prada,The','Weisberger, Lauren','HarperCollins Publishers','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',1,71,'800.xx',150);
call AddBook( '9780593059258','At My Mother''s Knee ...:and Other Low Joints','O''Grady, Paul','Bantam Press','2008','Autobiography','κονιαρημικροτσουσουνε',1,72,'800.xx',150);
call AddBook( '9780752893686','No Time for Goodbye','Barclay, Linwood','Orion (an Imprint of The Orion','2008','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,73,'800.xx',150);
call AddBook( '9780007207329','"Times" Su Doku,The:The Utterly Addictive Number-placing Puzzle:(Bk. ','Times Books','Times Books','2005','Puzzles','κονιαρημικροτσουσουνε',1,74,'800.xx',150);
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',1,75,'800.xx',150);
call AddBook( '9780718144395','Return of the Naked Chef,The','Oliver, Jamie','Michael Joseph','2000','Fitness & Diet','κονιαρημικροτσουσουνε',1,76,'800.xx',150);
call AddBook( '9780006498407','Angela''s Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','Autobiography','κονιαρημικροτσουσουνε',1,77,'800.xx',150);
call AddBook( '9780747563204','Schott''s Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','Puzzles','κονιαρημικροτσουσουνε',1,78,'800.xx',150);
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','Puzzles','κονιαρημικροτσουσουνε',1,79,'800.xx',150);
call AddBook( '9780007232741','Dangerous Book for Boys,The','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','Puzzles','κονιαρημικροτσουσουνε',1,80,'800.xx',150);
call AddBook( '9780099419785','To Kill a Mockingbird#','Lee, Harper','Arrow Books','1989','General & Literary Fiction','κονιαρημικροτσουσουνε',1,81,'800.xx',150);
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Science Fiction','κονιαρημικροτσουσουνε',1,1,'800.xx',150);
call AddBook( '9780099406136','Summons,The','Grisham, John','Arrow Books','2002','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,82,'800.xx',150);
call AddBook( '9780552149525','Lost Symbol,The','Brown, Dan','Corgi Books','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',1,83,'800.xx',150);
call AddBook( '9780140237504','Catcher in the Rye,The','Salinger, J.D.','Penguin Books','1994','General & Literary Fiction','κονιαρημικροτσουσουνε',1,84,'800.xx',150);
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','Fitness & Diet','κονιαρημικροτσουσουνε',1,85,'800.xx',150);
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','Fitness & Diet','κονιαρημικροτσουσουνε',1,86,'800.xx',150);
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',1,87,'800.xx',150);
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',1,88,'800.xx',150);
call AddBook( '9780552772747','Undomestic Goddess,The','Kinsella, Sophie','Black Swan','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',1,89,'800.xx',150);
call AddBook( '9780552773898','Book Thief,The#','Zusak, Markus','Black Swan','2008','General & Literary Fiction','κονιαρημικροτσουσουνε',1,90,'800.xx',150);
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','Autobiography','κονιαρημικροτσουσουνε',1,91,'800.xx',150);
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','Autobiography','κονιαρημικροτσουσουνε',1,92,'800.xx',150);
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','Picture Books','κονιαρημικροτσουσουνε',1,93,'800.xx',150);
call AddBook( '9780439993586','Amber Spyglass,The:His Dark Materials S.','Pullman, Philip','Point','2001','Adult Fiction','κονιαρημικροτσουσουνε',1,94,'800.xx',150);
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',1,95,'800.xx',150);
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','General & Literary Fiction','κονιαρημικροτσουσουνε',1,96,'800.xx',150);
call AddBook( '9780099506928','Spot of Bother,A','Haddon, Mark','Vintage','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',1,97,'800.xx',150);
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','Autobiography','κονιαρημικροτσουσουνε',1,98,'800.xx',150);
-- Create random no_pages per book
-- lpad(rand() * 1000000, 1, '0') -- Random 3digits
-- insert to school_id = 2
call AddBook( '9780552149518','Undomestic Goddess,The','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747532743','Harry Potter and the Philosopher''s Stone#','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets#','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780552150736','Angels and Demons#','Brown, Dan','Corgi Books','2003','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9781904233657','Twilight#','Meyer, Stephenie','ATOM','2007','Adult Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Children''s Fiction','κονιαρημικροτσουσουνε',2,1,'800.xx',150);
call AddBook( '9780552151764','Deception Point#','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,10,'800.xx',150);
call AddBook( '9781904233886','New Moon#','Meyer, Stephenie','ATOM','2007','Adult Fiction','κονιαρημικροτσουσουνε',2,11,'800.xx',150);
call AddBook( '9780330457729','Lovely Bones,The#','Sebold, Alice','Picador','2009','General & Literary Fiction','κονιαρημικροτσουσουνε',2,12,'800.xx',150);
call AddBook( '9780552151696','Digital Fortress#','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,13,'800.xx',150);
call AddBook( '9780099450252','Curious Incident of the Dog in the Night-time,The#','Haddon, Mark','Vintage','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',2,14,'800.xx',150);
call AddBook( '9781904233916','Eclipse#','Meyer, Stephenie','ATOM','2008','Adult Fiction','κονιαρημικροτσουσουνε',2,15,'800.xx',150);
call AddBook( '9781847245458','Girl with the Dragon Tattoo,The:Millennium Trilogy#','Larsson, Stieg','Quercus','2008','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,16,'800.xx',150);
call AddBook( '9780747566533','Kite Runner,The#','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',2,17,'800.xx',150);
call AddBook( '9780099464464','Time Traveler''s Wife,The','Niffenegger, Audrey','Vintage','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',2,18,'800.xx',150);
call AddBook( '9780141017891','World According to Clarkson,The','Clarkson, Jeremy','Penguin Books','2005','General & Literary Fiction','κονιαρημικροτσουσουνε',2,19,'800.xx',150);
call AddBook( '9780099429791','Atonement#','McEwan, Ian','Vintage','2002','General & Literary Fiction','κονιαρημικροτσουσουνε',2,20,'800.xx',150);
call AddBook( '9780593054277','Lost Symbol,The','Brown, Dan','Bantam Press','2009','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,21,'800.xx',150);
call AddBook( '9780552997041','Short History of Nearly Everything,A','Bryson, Bill','Black Swan','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',2,22,'800.xx',150);
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Adult Fiction','κονιαρημικροτσουσουνε',2,23,'800.xx',150);
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','κονιαρημικροτσουσουνε',2,24,'800.xx',150);
call AddBook( '9780747591061','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Science Fiction','κονιαρημικροτσουσουνε',2,25,'800.xx',150);
call AddBook( '9781849163422','Girl Who Played With Fire,The:Millennium Trilogy#','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,26,'800.xx',150);
call AddBook( '9780752837505','Child Called It,A','Pelzer, Dave','Orion (an Imprint of The Orion','2001','Autobiography','κονιαρημικροτσουσουνε',2,27,'800.xx',150);
call AddBook( '9780349116754','No. Detective Agency,The:No. Ladies'' Detective Agency S.','McCall Smith, Alexander','Abacus','2003','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,28,'800.xx',150);
call AddBook( '9780718147655','You are What You Eat:The Plan That Will Change Your Life','McKeith, Gillian','Michael Joseph','2004','Fitness & Diet','κονιαρημικροτσουσουνε',2,29,'800.xx',150);
call AddBook( '9780006512134','Man and Boy','Parsons, Tony','HarperCollins Publishers','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',2,30,'800.xx',150);
call AddBook( '9780099387916','Birdsong','Faulks, Sebastian','Vintage','1994','General & Literary Fiction','κονιαρημικροτσουσουνε',2,31,'800.xx',150);
call AddBook( '9780752877327','Labyrinth','Mosse, Kate','Orion (an Imprint of The Orion','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',2,32,'800.xx',150);
call AddBook( '9780755309511','Island,The','Hislop, Victoria','Headline Review','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',2,33,'800.xx',150);
call AddBook( '9781841953922','Life of Pi','Martel, Yann','Canongate Books','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',2,34,'800.xx',150);
call AddBook( '9780091889487','Dr. Atkins'' New Diet Revolution:The No-hunger, Luxurious Weight Loss P','Atkins, Robert C.','Vermilion','2003','Fitness & Diet','κονιαρημικροτσουσουνε',2,35,'800.xx',150);
call AddBook( '9780747599876','Tales of Beedle the Bard,The','Rowling, J. K.','Bloomsbury Publishing PLC','2008','Children''s Fiction','κονιαρημικροτσουσουνε',2,36,'800.xx',150);
call AddBook( '9780749397548','Captain Corelli''s Mandolin','De Bernieres, Louis','Minerva','1995','General & Literary Fiction','κονιαρημικροτσουσουνε',2,37,'800.xx',150);
call AddBook( '9780563384304','Delia''s How to Cook:(Bk.) ','Smith, Delia','BBC Books (Random House)','1998','Fitness & Diet','κονιαρημικροτσουσουνε',2,38,'800.xx',150);
call AddBook( '9780330507417','Gruffalo,The#','Donaldson, Julia','Macmillan Children''s Books','2009','Picture Books','κονιαρημικροτσουσουνε',2,39,'800.xx',150);
call AddBook( '9781861976123','Eats, Shoots and Leaves:The Zero Tolerance Approach to Punctuation','Truss, Lynne','Profile Books','2003','Picture Books','κονιαρημικροτσουσουνε',2,40,'800.xx',150);
call AddBook( '9780590660549','Northern Lights:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','κονιαρημικροτσουσουνε',2,41,'800.xx',150);
call AddBook( '9780755331420','Interpretation of Murder,The','Rubenfeld, Jed','Headline Review','2007','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,42,'800.xx',150);
call AddBook( '9781849162746','Girl Who Kicked the Hornets'' Nest,The:Millennium Trilogy','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',2,43,'800.xx',150);
call AddBook( '9780330367356','Bridget Jones: The Edge of Reason','Fielding, Helen','Picador','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',2,44,'800.xx',150);
call AddBook( '9780141020525','Short History of Tractors in Ukrainian,A','Lewycka, Marina','Penguin Books','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',2,45,'800.xx',150);
call AddBook( '9780722532935','Alchemist,The:A Fable About Following Your Dream','Coelho, Paulo','Thorsons','1999','General & Literary Fiction','κονιαρημικροτσουσουνε',2,46,'800.xx',150);
call AddBook( '9780552996006','Notes from a Small Island','Bryson, Bill','Black Swan','1996','General & Literary Fiction','κονιαρημικροτσουσουνε',2,47,'800.xx',150);
call AddBook( '9780099487821','Boy in the Striped Pyjamas,The#','Boyne, John','Definitions','2007','Adult Fiction','κονιαρημικροτσουσουνε',2,48,'800.xx',150);
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','Picture Books','κονιαρημικροτσουσουνε',2,49,'800.xx',150);
-- school_id = 3
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','Picture Books','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780718154776','Jamie''s 30-minute Meals','Oliver, Jamie','Michael Joseph','2010','Fitness & Diet','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780099457169','Broker,The','Grisham, John','Arrow Books','2005','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780330332774','Bridget Jones''s Diary:A Novel','Fielding, Helen','Picador','1997','General & Literary Fiction','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780241003008','Very Hungry Caterpillar,The:The Very Hungry Caterpillar','Carle, Eric','Puffin Books','1994','Picture Books','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780747582977','Thousand Splendid Suns,A','Hosseini, Khaled','Bloomsbury Publishing PLC','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9781846051616','Sound of Laughter,The','Kay, Peter','Century','2006','Autobiography','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780718147709','Jamie''s Italy','Oliver, Jamie','Michael Joseph','2005','Picture Books','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780755307500','Small Island#','Levy, Andrea','Headline Review','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780141030142','Memory Keeper''s Daughter,The','Edwards, Kim','Penguin Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',3,1,'800.xx',150);
call AddBook( '9780007110926','Billy Connolly','Stephenson, Pamela','HarperCollins Publishers','2002','Picture Books','κονιαρημικροτσουσουνε',3,59,'800.xx',150);
call AddBook( '9780330448444','House at Riverton,The','Morton, Kate','Pan Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',3,60,'800.xx',150);
call AddBook( '9780747561071','Harry Potter and the Order of the Phoenix#','Rowling, J. K.','Bloomsbury Publishing PLC','2004','Children''s Fiction','κονιαρημικροτσουσουνε',3,61,'800.xx',150);
call AddBook( '9780701181840','Nigella Express','Lawson, Nigella','Chatto & Windus','2007','Fitness & Diet','κονιαρημικροτσουσουνε',3,62,'800.xx',150);
call AddBook( '9780099771517','Memoirs of a Geisha','Golden, Arthur','Vintage','1998','General & Literary Fiction','κονιαρημικροτσουσουνε',3,63,'800.xx',150);
call AddBook( '9780563384311','Delia''s How to Cook:(Bk.3) ','Smith, Delia','BBC Books (Random House)','1999','Fitness & Diet','κονιαρημικροτσουσουνε',3,64,'800.xx',150);
call AddBook( '9780590112895','Subtle Knife,The:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','κονιαρημικροτσουσουνε',3,65,'800.xx',150);
call AddBook( '9780718148621','Jamie''s Ministry of Food:Anyone Can Learn to Cook in 24 Hours','Oliver, Jamie','Michael Joseph','2008','Fitness & Diet','κονιαρημικροτσουσουνε',3,66,'800.xx',150);
call AddBook( '9781904994367','Guinness World Records 2009:2009','Guinness World Records','Guinness World Records','2008','Picture Books','κονιαρημικροτσουσουνε',3,67,'800.xx',150);
call AddBook( '9781861978769','Why Don''t Penguins'' Feet Freeze?:And 114 Other Questions','Profile Books','Profile Books','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',3,68,'800.xx',150);
call AddBook( '9780718152437','Jamie at Home:Cook Your Way to the Good Life','Oliver, Jamie','Michael Joseph','2007','Fitness & Diet','κονιαρημικροτσουσουνε',3,69,'800.xx',150);
call AddBook( '9780140276336','White Teeth','Smith, Zadie','Penguin Books','2001','General & Literary Fiction','κονιαρημικροτσουσουνε',3,70,'800.xx',150);
call AddBook( '9780007156108','Devil Wears Prada,The','Weisberger, Lauren','HarperCollins Publishers','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',3,71,'800.xx',150);
call AddBook( '9780593059258','At My Mother''s Knee ...:and Other Low Joints','O''Grady, Paul','Bantam Press','2008','Autobiography','κονιαρημικροτσουσουνε',3,72,'800.xx',150);
call AddBook( '9780752893686','No Time for Goodbye','Barclay, Linwood','Orion (an Imprint of The Orion','2008','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',3,73,'800.xx',150);
call AddBook( '9780007207329','"Times" Su Doku,The:The Utterly Addictive Number-placing Puzzle:(Bk. ','Times Books','Times Books','2005','Puzzles','κονιαρημικροτσουσουνε',3,74,'800.xx',150);
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',3,75,'800.xx',150);
call AddBook( '9780718144395','Return of the Naked Chef,The','Oliver, Jamie','Michael Joseph','2000','Fitness & Diet','κονιαρημικροτσουσουνε',3,76,'800.xx',150);
call AddBook( '9780006498407','Angela''s Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','Autobiography','κονιαρημικροτσουσουνε',3,77,'800.xx',150);
call AddBook( '9780747563204','Schott''s Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','Puzzles','κονιαρημικροτσουσουνε',3,78,'800.xx',150);
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','Puzzles','κονιαρημικροτσουσουνε',3,79,'800.xx',150);
call AddBook( '9780007232741','Dangerous Book for Boys,The','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','Puzzles','κονιαρημικροτσουσουνε',3,80,'800.xx',150);
call AddBook( '9780099419785','To Kill a Mockingbird#','Lee, Harper','Arrow Books','1989','General & Literary Fiction','κονιαρημικροτσουσουνε',3,81,'800.xx',150);
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Science Fiction','κονιαρημικροτσουσουνε',3,3,'800.xx',150);
call AddBook( '9780099406136','Summons,The','Grisham, John','Arrow Books','2002','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',3,82,'800.xx',150);
call AddBook( '9780552149525','Lost Symbol,The','Brown, Dan','Corgi Books','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',3,83,'800.xx',150);
call AddBook( '9780140237504','Catcher in the Rye,The','Salinger, J.D.','Penguin Books','1994','General & Literary Fiction','κονιαρημικροτσουσουνε',3,84,'800.xx',150);
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','Fitness & Diet','κονιαρημικροτσουσουνε',3,85,'800.xx',150);
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','Fitness & Diet','κονιαρημικροτσουσουνε',3,86,'800.xx',150);
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',3,87,'800.xx',150);
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',3,88,'800.xx',150);
call AddBook( '9780552772747','Undomestic Goddess,The','Kinsella, Sophie','Black Swan','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',3,89,'800.xx',150);
call AddBook( '9780552773898','Book Thief,The#','Zusak, Markus','Black Swan','2008','General & Literary Fiction','κονιαρημικροτσουσουνε',3,90,'800.xx',150);
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','Autobiography','κονιαρημικροτσουσουνε',3,91,'800.xx',150);
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','Autobiography','κονιαρημικροτσουσουνε',3,92,'800.xx',150);
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','Picture Books','κονιαρημικροτσουσουνε',3,93,'800.xx',150);
call AddBook( '9780439993586','Amber Spyglass,The:His Dark Materials S.','Pullman, Philip','Point','2001','Adult Fiction','κονιαρημικροτσουσουνε',3,94,'800.xx',150);
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',3,95,'800.xx',150);
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','General & Literary Fiction','κονιαρημικροτσουσουνε',3,96,'800.xx',150);
call AddBook( '9780099506928','Spot of Bother,A','Haddon, Mark','Vintage','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',3,97,'800.xx',150);
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','Autobiography','κονιαρημικροτσουσουνε',3,98,'800.xx',150);
-- school_id = 4
call AddBook( '9780552149518','Undomestic Goddess,The','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747532743','Harry Potter and the Philosopher''s Stone#','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets#','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780552150736','Angels and Demons#','Brown, Dan','Corgi Books','2003','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9781904233657','Twilight#','Meyer, Stephenie','ATOM','2007','Adult Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Children''s Fiction','κονιαρημικροτσουσουνε',4,1,'800.xx',150);
call AddBook( '9780552151764','Deception Point#','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,10,'800.xx',150);
call AddBook( '9781904233886','New Moon#','Meyer, Stephenie','ATOM','2007','Adult Fiction','κονιαρημικροτσουσουνε',4,11,'800.xx',150);
call AddBook( '9780330457729','Lovely Bones,The#','Sebold, Alice','Picador','2009','General & Literary Fiction','κονιαρημικροτσουσουνε',4,12,'800.xx',150);
call AddBook( '9780552151696','Digital Fortress#','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,13,'800.xx',150);
call AddBook( '9780099450252','Curious Incident of the Dog in the Night-time,The#','Haddon, Mark','Vintage','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',4,14,'800.xx',150);
call AddBook( '9781904233916','Eclipse#','Meyer, Stephenie','ATOM','2008','Adult Fiction','κονιαρημικροτσουσουνε',4,15,'800.xx',150);
call AddBook( '9781847245458','Girl with the Dragon Tattoo,The:Millennium Trilogy#','Larsson, Stieg','Quercus','2008','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,16,'800.xx',150);
call AddBook( '9780747566533','Kite Runner,The#','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',4,17,'800.xx',150);
call AddBook( '9780099464464','Time Traveler''s Wife,The','Niffenegger, Audrey','Vintage','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',4,18,'800.xx',150);
call AddBook( '9780141017891','World According to Clarkson,The','Clarkson, Jeremy','Penguin Books','2005','General & Literary Fiction','κονιαρημικροτσουσουνε',4,19,'800.xx',150);
call AddBook( '9780099429791','Atonement#','McEwan, Ian','Vintage','2002','General & Literary Fiction','κονιαρημικροτσουσουνε',4,20,'800.xx',150);
call AddBook( '9780593054277','Lost Symbol,The','Brown, Dan','Bantam Press','2009','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,21,'800.xx',150);
call AddBook( '9780552997041','Short History of Nearly Everything,A','Bryson, Bill','Black Swan','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',4,22,'800.xx',150);
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Adult Fiction','κονιαρημικροτσουσουνε',4,23,'800.xx',150);
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','κονιαρημικροτσουσουνε',4,24,'800.xx',150);
call AddBook( '9780007207329','"Times" Su Doku,The:The Utterly Addictive Number-placing Puzzle:(Bk. ','Times Books','Times Books','2005','Puzzles','κονιαρημικροτσουσουνε',4,74,'800.xx',150);
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','General & Literary Fiction','κονιαρημικροτσουσουνε',4,75,'800.xx',150);
call AddBook( '9780718144395','Return of the Naked Chef,The','Oliver, Jamie','Michael Joseph','2000','Fitness & Diet','κονιαρημικροτσουσουνε',4,76,'800.xx',150);
call AddBook( '9780006498407','Angela''s Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','Autobiography','κονιαρημικροτσουσουνε',4,77,'800.xx',150);
call AddBook( '9780747563204','Schott''s Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','Puzzles','κονιαρημικροτσουσουνε',4,78,'800.xx',150);
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','Puzzles','κονιαρημικροτσουσουνε',4,79,'800.xx',150);
call AddBook( '9780007232741','Dangerous Book for Boys,The','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','Puzzles','κονιαρημικροτσουσουνε',4,80,'800.xx',150);
call AddBook( '9780099419785','To Kill a Mockingbird#','Lee, Harper','Arrow Books','1989','General & Literary Fiction','κονιαρημικροτσουσουνε',4,81,'800.xx',150);
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Science Fiction','κονιαρημικροτσουσουνε',4,4,'800.xx',150);
call AddBook( '9780099406136','Summons,The','Grisham, John','Arrow Books','2002','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,82,'800.xx',150);
call AddBook( '9780552149525','Lost Symbol,The','Brown, Dan','Corgi Books','2010','Crime, Thriller & Adventure','κονιαρημικροτσουσουνε',4,83,'800.xx',150);
call AddBook( '9780140237504','Catcher in the Rye,The','Salinger, J.D.','Penguin Books','1994','General & Literary Fiction','κονιαρημικροτσουσουνε',4,84,'800.xx',150);
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','Fitness & Diet','κονιαρημικροτσουσουνε',4,85,'800.xx',150);
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','Fitness & Diet','κονιαρημικροτσουσουνε',4,86,'800.xx',150);
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','General & Literary Fiction','κονιαρημικροτσουσουνε',4,87,'800.xx',150);
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',4,88,'800.xx',150);
call AddBook( '9780552772747','Undomestic Goddess,The','Kinsella, Sophie','Black Swan','2006','General & Literary Fiction','κονιαρημικροτσουσουνε',4,89,'800.xx',150);
call AddBook( '9780552773898','Book Thief,The#','Zusak, Markus','Black Swan','2008','General & Literary Fiction','κονιαρημικροτσουσουνε',4,90,'800.xx',150);
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','Autobiography','κονιαρημικροτσουσουνε',4,91,'800.xx',150);
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','Autobiography','κονιαρημικροτσουσουνε',4,92,'800.xx',150);
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','Picture Books','κονιαρημικροτσουσουνε',4,93,'800.xx',150);
call AddBook( '9780439993586','Amber Spyglass,The:His Dark Materials S.','Pullman, Philip','Point','2001','Adult Fiction','κονιαρημικροτσουσουνε',4,94,'800.xx',150);
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','General & Literary Fiction','κονιαρημικροτσουσουνε',4,95,'800.xx',150);
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','General & Literary Fiction','κονιαρημικροτσουσουνε',4,96,'800.xx',150);
call AddBook( '9780099506928','Spot of Bother,A','Haddon, Mark','Vintage','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',4,97,'800.xx',150);
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','Autobiography','κονιαρημικροτσουσουνε',4,98,'800.xx',150);
-- apo katw einai apo chat gpt tou mariou
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
call Addbook('9780140449181', 'Crime and Punishment', 'Fyodor Dostoevsky', 'Penguin Classics', 1866, 'Fiction, Classics', 'guilt, redemption, morality', 3, 2, '891.73',671);
call Addbook('9780060935467', 'The Alchemist', 'Paulo Coelho', 'HarperOne', 1988, 'Fiction, Inspirational', 'dreams, destiny, self-discovery', 2, 4, '869.3', 208);
call Addbook('9780679732761', 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'Harper Perennial Modern Classics', 1967, 'Fiction, Magical Realism', 'family, time, solitude', 1, 1, '863.64', 417);
call Addbook('9780060913076', 'Slaughterhouse-Five', 'Kurt Vonnegut', 'Dell Publishing', 1969, 'Fiction, Science Fiction', 'war, time travel, absurdity', 4, 3, '813.54', 275);
call Addbook('9780060913077', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt', 1954, 'Fantasy, Adventure', 'epic, fellowship, Middle-earth', 3, 2, '823.91', 1178);
call Addbook('9780060951395', 'Brave New World', 'Aldous Huxley', 'Harper Perennial Modern Classics', 1932, 'Fiction, Dystopian', 'technology, control, happiness', 1, 4, '823.91', 288);
call Addbook('9780385721790', 'The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', 2003, 'Fiction, Historical', 'friendship, guilt, redemption', 2, 2, '813.6', 371);
call Addbook('9780451524936', 'Frankenstein', 'Mary Shelley', 'Signet Classics', 1818, 'Fiction, Horror', 'science, creation, morality', 3, 3, '823.7', 352);
call Addbook('9780060562496', 'The Odyssey', 'Homer', 'Harper Perennial Modern Classics', 8, 'Poetry, Epic', 'heroism, adventure, homecoming', 4, 1, '883', 541);

