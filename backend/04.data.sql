INSERT INTO school (school_name, address, city, phone_number, email, principal_name, operator_name)
VALUES
('27ο Δημοτικό Σχολείο Ιωαννίνων','Ισαάκ Τάσσου 22','Ιωάννινα',2651068679, '27dimioa@sch.gr','Ζώνιος Σπύρος','Ρόζος Μάριος'),
('ΠΡΟΤΥΠΟ ΛΥΚΕΙΟ ΖΩΣΙΜΑΙΑΣ ΣΧΟΛΗΣ ΙΩΑΝΝΙΝΩΝ','Πλατεία Αρχιεπισκόπου Σπυρίδωνος','Ιωάννινα',2651025013, 'mail@lyk-zosim.ioa.sch.gr','Αντωνίου Κωνσταντίνος','Κατσικόπουλος Κωστής'),
('Πρότυπο Γενικό Λύκειο Ευαγγελικής Σχολής Σμύρνης','Λέσβου 4','Νέα Σμύρνη, Αττικής',2109333712, 'lykevag@sch.gr','Φανίδης Χρήστος','Μάλος Βασίλης'),
('Πρότυπο Λύκειο Αναβρύτων','Λεωφόρος Κηφισίας 184','Αμαρούσιον Αττικής',2106233215, 'mail@lyk-peir-anavr.att.sch.gr','Οτζάκογλου Θεόδωρος','Σωτηρόπουλος Νικόλαος'),
('Πρότυπο ΕΠΑΛ Ηγουμενίτσας','Οδος αληθειαc 13','Ηγουμενίτσα',2665023521,'1epal-igoum.thesp.sch.gr','Τζάνης Νικόλαος','Οπερέιτορας 1'),
('2ο Γενικό Λύκειο Ηγουμενίτσας','Οδος αληθειαc 666','Ηγουμενίτσα',2665025644,'mail@2lyk-igoum.thesp.sch.gr','Νάκος Καλαμάρης','Οπερέιτορας 2');
INSERT INTO school (school_id,school_name, address, city, phone_number, email, principal_name, operator_name)
VALUES
(0,'Δίκτυο Σχολικών Βιβλιοθηκών','Λεωφόρος Αλεξάνδρας 42','Αθήνα',26510682323, 'genlib@sch.gr','Στέφανος Καραναστάσης','Αδμίνος Α.');

UPDATE `school` SET `school_id` = '0' WHERE `school`.`school_id` = 7; 

INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `profile`, `barcode`) VALUES
('Αδμίνος','Α.','admin','admin','500-12-07','adminos@gmail.com',0,'active','admin','https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp','-42'),
('Μάριος', 'Ρόζος', 'mario_rz', 'mario_rz', '2002-12-06', 'mariosrizzler@gmail.com', 1, 'active', 'operator', 'https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωστής', 'Κατσικόπουλος', 'kkat', 'kkat', '2002-06-15', 'kkatgm@gmail.com', 2, 'active', 'operator', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασίλης', 'Μάλος', 'billydot', 'billydot', '2002-06-15', 'billydot@gmail.com', 3, 'active', 'operator', 'https://i.pinimg.com/236x/fb/d8/b5/fbd8b5d1c92c46e94e092ecc284a41da.jpg', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος','Σωτηρόπουλος', 'nicksotos','nicksotos','1999-08-07','nicksoto@gmail.com',4,'active','operator','https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `barcode`) VALUES
('Γεωργιος ', 'Καραγιάννης', 'georgios', 'georgios', '1967-03-06', 'nim_irigaco29@outlook.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αικατερινη ', 'Βλάχου', 'aikaterini', 'aikaterini', '1969-06-01', 'suripu-wowa98@hotmail.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωνσταντινος ', 'Παπαγεωργίου', 'konstantinos', 'konstantinos', '1983-04-03', 'rikoru_nohe92@hotmail.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ιωαννης ', 'Μακρής', 'ioannis', 'ioannis', '1988-10-13', 'dexu-fapeye96@outlook.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικολαος ', 'Κωνσταντινίδης', 'nikolaos', 'nikolaos', '1991-03-26', 'sut_uyebunu50@aol.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεωργια ', 'Δημοπούλου', 'georgia', 'georgia', '1992-09-20', 'luhece-zako25@aol.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σοφια ', 'Γεωργιάδη', 'sofia', 'sofia', '2005-02-07', 'vugez-ikuta91@hotmail.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Δημητρίου', 'george91', 'george91', '2012-03-15', 'george.dimitriou@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξάνδρα', 'Μαρκοπούλου', 'alexandra79', 'alexandra79', '2013-09-05', 'alexandra.markopoulou@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτριος', 'Πετρίδης', 'dimitrios27', 'dimitrios27', '2014-06-18', 'dimitrios.petridis@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελένη', 'Παπαδοπούλου', 'elena012', 'elena012', '2006-6-05', 'elena.papadopoulou1313@example.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρήστος', 'Ξεπατεράκης', 'xrhstaras13', 'xrhstaras13', '1998-5-10', 'nikos.ksepaterakis13@example.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστάσιος', 'Παπαναστασίου', 'anastasios783', 'anastasios783', '2000-08-28', 'anastasios.papanastasiou13@example.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ιωαννης ', 'Αντωνίου', 'ioannhs13', 'ioannhs13', '2000-03-23', 'jem-utopowa6001313@hotmail.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημητρης ', 'Παπανικολάου', 'dimitrhss13', 'dimitrhss13', '1999-06-07', 'dimitrhss1313@yahoo.com', 1, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αγαμεμνωνας ', 'Παναγιωτόπουλος', 'hackerman', 'hackerman', '2000-5-17', 'paceda13-sube6313@outlook.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρηστος ', 'Χρηστου', 'xristos1313', 'xristos1313', '2000-12-19', 'ceh-iwemowa191313@hotmail.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτης ', 'Γιαννοπουλος', 'panagioths1333', 'panagiota1333', '1999-03-17', 'gajulap-ure791313@gmail.com', 2, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Πελοπιδας ', 'Νικολάου', 'pelopidas133', 'pelopidas133', '1997-07-01', 'xace-mucano251313@gmail.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Λεωνιδας ', 'Νικολαου', 'lewn_spartiaths', 'lewn_spartiaths', '1000-08-04', 'kecoh-ilapi241313@yahoo.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασιλειος ', 'Ντοτης', 'basileiosomegas13', 'basileiosomegas13', '1987-12-26', 'gotu-cebuvi321313@outlook.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωνσταντινος ', 'Αγγελοπουλος', 'konstantinos7', 'konstantinos7', '1996-05-05', 'decili-zoxo937@mail.com', 4, 'active', 'teacher',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασης ', 'Πετροπουλος', 'annastashs13', 'annastashs13', '1997-01-21', 'dub_ujukuxi28137@yahoo.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αγγελος ', 'Καραναστάσης', 'aggelos1313', 'aggelos1313', '1999-03-03', 'mehezot_evo381313@aol.com', 4, 'active', 'teacher',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`,`barcode`) VALUES
('Ειρηνη ', 'Παναγιωτοπούλου', 'eirini', 'eirini', '2009-12-17', 'paceda-sube63@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασία', 'Παπαναστασίου', 'anastasia78', 'anastasia78', '2008-03-28', 'anastasia.papanastasiou@example.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ιωαννα ', 'Αντωνίου', 'ioanna', 'ioanna', '2007-03-20', 'jem-utopowa60@hotmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημητρα ', 'Παπανικολάου', 'dimitra', 'dimitra', '2007-06-07', 'hom_egexaso82@yahoo.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αγγελικη ', 'Καραναστάση', 'aggeliki', 'aggeliki', '2012-03-03', 'mehezot_evo38@aol.com', 2, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλέξανδρος', 'Δημητρίου', 'alex123', 'alex123', '2005-08-12', 'alex.dimitriou@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθανασιος ', 'Κωνσταντόπουλος', 'athanasios', 'athanasios', '2012-08-26', 'judune-wota47@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δεσποινα ', 'Κόλλια', 'despoina', 'despoina', '2012-09-15', 'fibow_acure81@hotmail.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παρασκευη ', 'Σπυροπούλου', 'paraskeyi', 'paraskeyi', '2013-05-11', 'dafuta-vira89@outlook.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Μιχαηλίδης', 'george22', 'george22', '2007-07-19', 'george.michailidis@example.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μαρία', 'Ανδρέου', 'maria45', 'maria45', '2010-04-02', 'maria.andreou@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιώτης', 'Μαυρίδης', 'panos133', 'panos133', '2013-02-14', 'panos.mavridis13@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρηστος ', 'Βασιλείου', 'xristos', 'xristos', '2010-01-19', 'ceh-iwemowa19@hotmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτα ', 'Γιαννοπούλου', 'panagiota', 'panagiota', '2010-03-17', 'gajulap-ure79@gmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χριστινα ', 'Νικολάου', 'xristina', 'xristina', '2010-07-01', 'xace-mucano25@gmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτης ', 'Βασιλειάδης', 'panagiotis', 'panagiotis', '2010-08-14', 'kecoh-ilapi24@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασιλειος ', 'Παπακωνσταντόπουλος', 'basileios', 'basileios', '2010-12-26', 'gotu-cebuvi32@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωνσταντινα ', 'Αγγελοπούλου', 'konstantina', 'konstantina', '2011-05-05', 'decili-zoxo93@mail.com', 1, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αννα ', 'Πετροπούλου', 'anna', 'anna', '2012-01-21', 'dub_ujukuxi28@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Φωτεινη ', 'Κόντου', 'foteini', 'foteini', '2014-02-10', 'kuriki-xufu83@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρα ', 'Νικολοπούλου', 'alexandra', 'alexandra', '2014-07-09', 'weweduh-ete4@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελος ', 'Δόβας', 'eyaggelos', 'eyaggelos', '2016-01-01', 'liwurih_edi12@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτριος', 'Κωνσταντίνου', 'dimitris99', 'dimitris99', '2009-09-15', 'dimitris.konstantinou@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κυριακη ', 'Μαρκοπούλου', 'kyriaki', 'kyriaki', '2016-01-05', 'puyog_acehi75@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Σπυροπούλου', 'evaggelia27', 'evaggelia27', '2012-06-25', 'evaggelia.spyropoulou@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Θεοδωρα ', 'Χαραλάμπους', 'theodora', 'theodora', '2016-01-18', 'zuna_notodu88@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σταυρουλα ', 'Γρηγοριάδη', 'stayroula', 'stayroula', '2016-04-10', 'lur_ofozuju5@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρυσουλα ', 'Ηλιοπούλου', 'xrysoula', 'xrysoula', '2017-02-01', 'recad_uferi98@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερια ', 'Πάνου', 'eleytheria', 'eleytheria', '2005-07-29', 'miwaliz_ega45@outlook.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθηνα ', 'Κοκκινοπούλου', 'athina', 'athina', '2006-02-26', 'gujoru-cibu96@yahoo.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μιχαηλ ', 'Δημητρακόπουλος', 'mixail', 'mixail', '2006-10-03', 'mexohol-ere97@hotmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρος ', 'Βασιλακόπουλος', 'alexandros', 'alexandros', '2007-05-11', 'gunixep_usa50@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Αθανασίου', 'george_a', 'george_a', '1975-09-18', 'george@example.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Καραδήμου', 'evangelia', 'evangelia', '1988-03-12', 'evangelia133333@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος', 'Μαρκόπουλος', 'nikolas_m', 'nikolas_m', '1994-07-30', 'nikolas@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σοφία', 'Αντωνίου', 'sofia_a', 'sofia_a', '1982-05-23', 'sofia@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ανδρέας', 'Νικολάου', 'andreas', 'andreas', '1997-04-03', 'andreas@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Ανδρέου', 'evangelia_a', 'evangelia_a', '1989-08-17', 'evangelia@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Στέλιος', 'Γεωργίου', 'stelios', 'stelios', '1986-01-02', 'stelios@example.com', 4, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αικατερίνη', 'Σταματίου', 'katerina', 'katerina', '1990-03-19', 'katerina@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Θεόδωρος', 'Σωτηρίου', 'theodoros', 'theodoros', '1983-07-22', 'theodoros@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερία', 'Γεωργιάδου', 'eleftheria61', 'eleftheria61', '2014-08-27', 'eleftheria.georgiadou@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`,`barcode`) VALUES
('Ειρηνη ', 'Παναγιωτοπούλου', 'eirini13', 'eirini13', '2009-5-17', 'paceda-sube6313@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρηστος ', 'Βασιλείου', 'xristos13', 'xristos13', '2010-12-19', 'ceh-iwemowa1913@hotmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτα ', 'Γιαννοπούλου', 'panagiota133', 'panagiota133', '2010-03-17', 'gajulap-ure7913@gmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χριστινα ', 'Νικολάου', 'xristina133', 'xristina133', '2012-07-01', 'xace-mucano2513@gmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιωτης ', 'Βασιλειάδης', 'panagiotis133', 'panagiotis133', '2010-08-04', 'kecoh-ilapi2413@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασιλειος ', 'Παπακωνσταντόπουλος', 'basileios13', 'basileios13', '2015-12-26', 'gotu-cebuvi3213@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κωνσταντινα ', 'Αγγελοπούλου', 'konstantina13', 'konstantina13', '2011-05-05', 'decili-zoxo9313@mail.com', 1, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αννα ', 'Πετροπούλου', 'anna13', 'anna13', '2012-01-21', 'dub_ujukuxi2813@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Φωτεινη ', 'Κόντου', 'foteini13', 'foteini13', '2014-08-28', 'kuriki-xufu8313@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρα ', 'Νικολοπούλου', 'alexandra13', 'alexandra13', '2013-07-09', 'weweduh-ete413@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελος ', 'Δόβας', 'eyaggelos13', 'eyaggelos13', '2013-01-01', 'liwurih_edi1213@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτριος', 'Κωνσταντίνου', 'dimitris999', 'dimitris999', '2013-09-15', 'dimitris.konstantinou13@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Κυριακη ', 'Μαρκοπούλου', 'kyriaki13', 'kyriaki13', '2015-01-05', 'puyog_acehi753@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Σπυροπούλου', 'evaggelia13', 'evaggelia13', '2012-06-25', 'evaggelia.spyropoulou3@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Θεοδωρα ', 'Χαραλάμπους', 'theodora13', 'theodora13', '2011-01-18', 'zuna_notodu883@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σταυρουλα ', 'Γρηγοριάδη', 'stayroula13', 'stayroula13', '2011-04-10', 'lur_ofozuju53@aol.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Χρυσουλα ', 'Ηλιοπούλου', 'xrysoula13', 'xrysoula13', '2016-02-01', 'recad_uferi982@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Μιχαηλίδης', 'george222', 'george222', '2017-07-19', 'george.michailidis13@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μαρία', 'Ανδρέου', 'maria455', 'maria455', '2010-04-02', 'maria.andreou13@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιώτης', 'Μαυρίδης', 'panos13', 'panos13', '2013-02-14', 'panos.mavridis@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Καλλιοπη ', 'Ξενοπούλου', 'kalliopi13', 'kalliopi13', '2014-05-17', 'wusufo-pife8413@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθανασια ', 'Βασιλοπούλου', 'athanasia13', 'athanasia13', '2005-07-20', 'tovo-hakido313@aol.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερια ', 'Πάνου', 'eleytheria13', 'eleytheria13', '2008-07-29', 'miwaliz_ega4513@outlook.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθηνα ', 'Κοκκινοπούλου', 'athina133', 'athina133', '2007-02-20', 'gujoru-cibu9613@yahoo.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μιχαηλ ', 'Δημητρακόπουλος', 'mixail13', 'mixail13', '2008-10-03', 'mexohol-ere9713@hotmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρος ', 'Βασιλακόπουλος', 'alexandros1334', 'alexandros1334', '2010-05-11', 'gunixep_usa50134@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Αθανασίου', 'george_a13', 'george_a13', '1985-09-18', 'george13@example.com', 3, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Καραδήμου', 'evangelia133', 'evangelia133', '1988-03-22', 'evangelia134@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Καραδήμου', 'evangelia13333', 'evangelia13333', '1988-03-22', 'evangelia13@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτρης', 'Παπανικολάου', 'dimitris_p13', 'dimitris_p13', '1980-11-06', 'dimitris13@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασία', 'Κούρτη', 'anastasia213', 'anastasia213', '1999-02-28', 'anastasia133@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλέξανδρα', 'Δημητρίου', 'alexandra213', 'alexandra213', '1999-06-14', 'alexandra313@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιώτης', 'Γεωργίου', 'panagiotis13', 'panagiotis13', '1999-09-25', 'panagiotis13@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος', 'Μαρκόπουλος', 'nikolas_m133', 'nikolas_m133', '1999-07-30', 'nikolas13@example.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σοφία', 'Αντωνίου', 'sofia_a13', 'sofia_a13', '1982-07-13', 'sofia13@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερία', 'Παναγιώτου', 'eleftheria1333', 'eleftheria1333', '1987-12-08', 'eleftheria13@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ανδρέας', 'Νικολάου', 'andreas13', 'andreas13', '1999-04-03', 'andreas13@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελία', 'Ανδρέου', 'evangelia_a1333', 'evangelia_a1333', '2000-08-17', 'evangelia1333@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Στέλιος', 'Γεωργίου', 'stelios13', 'stelios13', '1999-01-02', 'stelios13@example.com', 4, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αικατερίνη', 'Σταματίου', 'katerina666', 'katerina666', '1990-03-19', 'katerina13@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Θεόδωρος', 'Σωτηρίου', 'theodoros1333', 'theodoros1333', '1989-07-22', 'theodoros133@example.com', 4, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασία', 'Παπαναστασίου', 'anastasia783', 'anastasia783', '2008-08-28', 'anastasia.papanastasiou1313@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ιωαννα ', 'Αντωνίου', 'ioanna13', 'ioanna13', '2007-03-23', 'jem-utopowa60013@hotmail.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημητρα ', 'Παπανικολάου', 'dimitra13', 'dimitra13', '2007-06-07', 'dimitra1313@yahoo.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αγγελικη ', 'Καραναστάση', 'aggeliki13', 'aggeliki13', '2002-03-03', 'mehezot_evo3813@aol.com', 3, 'active', 'student',LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλέξανδρος', 'Δημητρίου', 'alex1233', 'alex1233', '2005-08-19', 'alex.dimitriou13@example.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθανασιος ', 'Κωνσταντόπουλος', 'athanasios13', 'athanasios13', '2010-08-26', 'judune-wota4713@gmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δεσποινα ', 'Κόλλια', 'despoina13', 'despoina13', '2012-09-23', 'fibow_acure8113@hotmail.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παρασκευη ', 'Σπυροπούλου', 'paraskeyi13', 'paraskeyi13', '2013-05-11', 'dafuta-vira8913@outlook.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθηνα ', 'Κοκκινοπούλου', 'athina13', 'athina13', '2007-02-20', 'gujoru-cibu961333@yahoo.com', 1, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Μιχαηλ ', 'Δημητρακόπουλος', 'mixail134', 'mixail134', '2008-10-03', 'mexohol-ere97134@hotmail.com', 2, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλεξανδρος ', 'Βασιλακόπουλος', 'alexandros133', 'alexandros133', '2010-05-11', 'gunixep_usa5013@gmail.com', 3, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερία', 'Γεωργιάδου', 'eleftheria63', 'eleftheria63', '2016-08-27', 'eleftheria.georgiadou13@example.com', 4, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
-- 5-6 sxoleio
INSERT INTO `user` (`first_name`, `surname`, `username`, `pwd`, `birth_date`, `email`, `school_id`, `status`, `role`, `barcode`) 
VALUES
('Μαρια ', 'Παπαδοπούλου', 'maria', 'maria', '1956-01-30', 'bobu-figane78@yahoo.com', 5, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελενη ', 'Παππά', 'eleni', 'eleni', '1957-05-05', 'yagux_emizu74@hotmail.com', 5, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Βασιλικη ', 'Ιωαννίδη', 'basiliki', 'basiliki', '1970-10-19', 'genonu-mafi68@hotmail.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημητριος ', 'Οικονόμου', 'dimitrios', 'dimitrios', '1982-05-15', 'kus_ovaturi80@gmail.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασια ', 'Παπαδημητρίου', 'anastasia', 'anastasia', '2005-04-15', 'yumubuy-agi58@gmail.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ευαγγελια ', 'Παπαδάκη', 'eyaggelia', 'eyaggelia', '2006-03-14', 'wico_yagixo18@aol.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελένη', 'Γεωργίου', 'eleni88', 'eleni88', '2015-01-22', 'eleni.georgiou@example.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Σταύρος', 'Κοντογιάννης', 'stavros17', 'stavros17', '2016-07-10', 'stavros.kontogiannis@example.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελένη', 'Παπαδοπούλου', 'elena01', 'elena01', '2006-11-05', 'elena.papadopoulou@example.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος', 'Πατεράκης', 'nikos88', 'nikos88', '2011-12-10', 'nikos.paterakis@example.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Καλλιοπη ', 'Ξενοπούλου', 'kalliopi', 'kalliopi', '2017-02-19', 'wusufo-pife84@gmail.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αθανασια ', 'Βασιλοπούλου', 'athanasia', 'athanasia', '2005-07-20', 'tovo-hakido3@aol.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Δημήτρης', 'Παπανικολάου', 'dimitris_p', 'dimitris_p', '1979-11-06', 'dimitris@example.com', 5, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αναστασία', 'Κούρτη', 'anastasia2', 'anastasia2', '1993-02-28', 'anastasia@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αλέξανδρα', 'Δημητρίου', 'alexandra2', 'alexandra2', '1991-06-14', 'alexandra@example.com', 6, 'active', 'teacher', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Παναγιώτης', 'Γεωργίου', 'panagiotis2', 'panagiotis2', '1984-09-25', 'panagiotis@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελευθερία', 'Παναγιώτου', 'eleftheria', 'eleftheria', '1987-12-08', 'eleftheria@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ελένη', 'Παπαδοπούλου', 'elena01213', 'elena01213', '2006-6-05', 'elena.papadopoulou13@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Επαμεινωνδας', 'Πατεράκης', 'epam13', 'epam13', '2009-09-15', 'ifantis13@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Ξερξης', 'Ευθυμιου', 'nikos13', 'nikos13', '2011-05-2', 'nitsiakos13@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Αγαθοκλης', 'Πατεράκης', 'trelonikoslis13', 'trelonikoslis13', '2010-06-10', 'nitsakos13@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Φιλιππος', 'Πατεράκης', 'trelonikoslis134', 'trelonikoslis134', '2010-08-10', 'nitsakos133@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Νικόλαος', 'Πατεράκης', 'nikolis13', 'nikolis13', '2013-03-10', 'nitsaras13@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0')),
('Γεώργιος', 'Αθανασίου', 'george_a134', 'george_a134', '1985-09-18', 'george134@example.com', 6, 'active', 'student', LPAD(FLOOR(RAND() * 999999) + 1, 8, '0'));
call AddBook( '9780552772747','Undomestic Goddess','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Chick lit, Legal career,Domestic staff,Transformation',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747532743','Harry Potter and the Philosophers Stone#','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets#','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552150736','Angels and Demons','Brown, Dan','Corgi Books','2003','Crime, Thriller & Adventure','Angels, Demons, Vatican, Thriller',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233657','Twilight','Meyer, Stephenie','ATOM','2007','Adult Fiction','Vampires, Romance, Fantasy, Teenagers',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552151764','Deception Point','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Thriller, Conspiracy, Science, Government',1,10,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233886','New Moon','Meyer, Stephenie','ATOM','2007','Adult Fiction','Romance, Fantasy, Vampires, Werewolves',1,11,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330457729','Lovely Bones','Sebold, Alice','Picador','2009','General & Literary Fiction','Mystery, Supernatural, Grief, Afterlife',1,12,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552151696','Digital Fortress','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Cryptography, Thriller, Technology, Espionage',1,13,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099450252','The Curious Incident of the Dog in the Night-time','Haddon, Mark','Vintage','2004','General & Literary Fiction','Mystery, Autism, Perspective, Mathematics',1,14,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233916','Eclipse','Meyer, Stephenie','ATOM','2008','Adult Fiction','Vampires, Love Triangle, Supernatural, Eclipse',1,15,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781847245458','Millennium Trilogy:The Girl with the Dragon Tattoo','Larsson, Stieg','Quercus','2008','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',1,16,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747566533','Kite Runner','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','General & Literary Fiction','Friendship, Redemption, Betrayal, Afghanistan',1,17,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099464464','The Time Travelers Wife','Niffenegger, Audrey','Vintage','2004','General & Literary Fiction','Time travel, Love, Destiny, Relationship',1,18,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141017891','The World According to Clarkson','Clarkson, Jeremy','Penguin Books','2005','General & Literary Fiction','Opinions, Humor, Observations, Controversial',1,19,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099429791','Atonement','McEwan, Ian','Vintage','2002','General & Literary Fiction','Guilt, Love, Betrayal, Redemption',1,20,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593054277','The Lost Symbol','Brown, Dan','Bantam Press','2009','Crime, Thriller & Adventure','Mystery, Symbols, Washington D.C., Secret societies',1,21,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552997041','A Short History of Nearly Everything','Bryson, Bill','Black Swan','2004','General & Literary Fiction','Science, History, Universe, Exploration',1,22,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Adult Fiction','Vampires, Romance, Supernatural, Transformation',1,23,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,24,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747591061','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Science Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,25,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781849163422','Millennium Trilogy: The Girl Who Played With Fire','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',1,26,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780752837505','A Child Called It','Pelzer, Dave','Orion (an Imprint of The Orion','2001','Autobiography','Abuse, Survival, Memoir, Resilience',1,27,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780349116754','The No. 1 Ladies Detective Agency','McCall Smith, Alexander','Abacus','2003','Crime, Thriller & Adventure','Mystery, Botswana, Female detective, Cultural exploration',1,28,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718147655','You are What You Eat:The Plan That Will Change Your Life','McKeith, Gillian','Michael Joseph','2004','Fitness & Diet','Diet, Nutrition, Health, Lifestyle',1,29,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780006512134','Man and Boy','Parsons, Tony','HarperCollins Publishers','2000','General & Literary Fiction','Fatherhood, Relationships, Coming of Age, Identity',1,30,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099387916','Birdsong','Faulks, Sebastian','Vintage','1994','General & Literary Fiction','War, Love, Tragedy, Survival',1,31,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780752877327','Labyrinth','Mosse, Kate','Orion (an Imprint of The Orion','2006','General & Literary Fiction','Mystery, Historical, Quest, Secrets',1,32,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780755309511','The Island','Hislop, Victoria','Headline Review','2006','General & Literary Fiction','Isolation, Survival, Identity, Redemption',1,33,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781841953922','Life of Pi','Martel, Yann','Canongate Books','2003','General & Literary Fiction','Adventure, Survival, Faith, Storytelling',1,34,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780091889487','Dr. Atkins New Diet Revolution:The No-hunger, Luxurious Weight Loss P','Atkins, Robert C.','Vermilion','2003','Fitness & Diet','Low-carb, Weight loss, Health, Diet plan',1,35,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747599876','The Tales of Beedle the Bard','Rowling, J. K.','Bloomsbury Publishing PLC','2008','Children''s Fiction','Wizarding world, Folklore, Magical stories, J.K. Rowling',1,36,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780749397548','Captain Corellis Mandolin','De Bernieres, Louis','Minerva','1995','General & Literary Fiction','World War II, Romance, Greek island, Music',1,37,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780563384304','Delias How to Cook:(Bk.) ','Smith, Delia','BBC Books (Random House)','1998','Fitness & Diet','Cooking, Recipes, Instructional, Delia Smith',1,38,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330507417','The Gruffalo','Donaldson, Julia','Macmillan Children''s Books','2009','Picture Books','Childrens book, Rhyme, Adventure, Friendship',1,39,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781861976123','Eats, Shoots and Leaves:The Zero Tolerance Approach to Punctuation','Truss, Lynne','Profile Books','2003','Picture Books','Grammar, Punctuation, Humor, Writing',1,40,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780590660549','Northern Lights:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','Fantasy, Adventure, Multiverse, Coming-of-age',1,41,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780755331420','The Interpretation of Murder','Rubenfeld, Jed','Headline Review','2007','Crime, Thriller & Adventure','Psychological thriller, Historical fiction, Sigmund Freud, New York City',1,42,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781849162746','Millennium Trilogy: The Girl Who Kicked the Hornets Nest','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',1,43,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330367356','Bridget Jones: The Edge of Reason','Fielding, Helen','Picador','2000','General & Literary Fiction','Romantic comedy, Diary, Relationships, London',1,44,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141020525','A Short History of Tractors in Ukrainian','Lewycka, Marina','Penguin Books','2006','General & Literary Fiction','Family dynamics, Immigration, Humor, Cultural clash',1,45,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780722532935','The Alchemist:A Fable About Following Your Dream','Coelho, Paulo','Thorsons','1999','General & Literary Fiction','Alchemy, Personal legend, Dreams, Destiny',1,46,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552996006','Notes from a Small Island','Bryson, Bill','Black Swan','1996','General & Literary Fiction','Travel, Humor, Britain, Observations',1,47,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099487821','The Boy in the Striped Pyjamas','Boyne, John','Definitions','2007','Adult Fiction','Holocaust, Friendship, Innocence, Historical fiction',1,48,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','Picture Books','Politics, Satire, Criticism, Current affairs',1,49,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718154776','Jamies 30-minute Meals','Oliver, Jamie','Michael Joseph','2010','Fitness & Diet','Cooking, Quick meals, Recipes, Jamie Oliver',1,50,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099457169','The Broker','Grisham, John','Arrow Books','2005','Crime, Thriller & Adventure','Espionage, Thriller, Ex-CIA agent, Italy',1,51,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330332774','Bridget Joness Diary:A Novel','Fielding, Helen','Picador','1997','General & Literary Fiction','Romantic comedy, Diary, Single woman, London',1,52,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780241003008','The Very Hungry Caterpillar','Carle, Eric','Puffin Books','1994','Picture Books','Childrens book, Caterpillar, Food, Transformation',1,53,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747582977','A Thousand Splendid Suns','Hosseini, Khaled','Bloomsbury Publishing PLC','2007','General & Literary Fiction','Afghanistan, Women, Friendship, Resilience',1,54,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781846051616','The Sound of Laughter','Kay, Peter','Century','2006','Autobiography','Comedy, Autobiography, Humor, Entertainment',1,55,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718147709','Jamies Italy','Oliver, Jamie','Michael Joseph','2005','Picture Books','Cookbook, Italian cuisine, Recipes, Travelogue',1,56,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780755307500','Small Island','Levy, Andrea','Headline Review','2004','General & Literary Fiction','Historical fiction, Post-war, Immigration, Identity',1,57,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141030142','The Memory Keepers Daughter','Edwards, Kim','Penguin Books','2007','General & Literary Fiction','Family secrets, Identity, Memory, Emotional journey',1,58,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007110926','Billy Connolly','Stephenson, Pamela','HarperCollins Publishers','2002','Picture Books','Comedy, Autobiography, Scottish, Entertainer',1,59,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330448444','The House at Riverton','Morton, Kate','Pan Books','2007','General & Literary Fiction','Historical fiction, Mystery, Secrets, English countryside',1,60,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747561071','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2004','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,61,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780701181840','Nigella Express','Lawson, Nigella','Chatto & Windus','2007','Fitness & Diet','Cooking, Quick and Easy, Recipes, Nigella Lawson',1,62,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099771517','Memoirs of a Geisha','Golden, Arthur','Vintage','1998','General & Literary Fiction','Geisha, Japan, Memoirs, Historical Fiction',1,63,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780563384311','Delias How to Cook:(Bk.1) ','Smith, Delia','BBC Books (Random House)','1999','Fitness & Diet','Cooking, Recipes, Instructional, Delia Smith',1,64,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780590112895','The Subtle Knife :His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','Subtle Knife, His Dark Materials, Fantasy, Adventure',1,65,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718148621','Jamies Ministry of Food:Anyone Can Learn to Cook in 24 Hours','Oliver, Jamie','Michael Joseph','2008','Fitness & Diet','Jamie Oliver, Ministry of Food, Cooking, Learn to Cook',1,66,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904994367','Guinness World Records 2009:2009','Guinness World Records','Guinness World Records','2008','Picture Books','Guinness World Records, 2009, Book, Record-breaking',1,67,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781861978769','Why Dont Penguins Feet Freeze?:And 114 Other Questions','Profile Books','Profile Books','2006','General & Literary Fiction','Penguins, Feet Freeze, Questions, Curiosity',1,68,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718152437','Jamie at Home:Cook Your Way to the Good Life','Oliver, Jamie','Michael Joseph','2007','Fitness & Diet','Jamie, Home, Cook, Good Life',1,69,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780140276336','White Teeth','Smith, Zadie','Penguin Books','2001','General & Literary Fiction','White Teeth, Zadie Smith, Multiculturalism, Identity',1,70,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007156108','The Devil Wears Prada','Weisberger, Lauren','HarperCollins Publishers','2003','General & Literary Fiction','Devil, Wears, Prada, Fashion',1,71,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593059258','At My Mothers Knee ...:and Other Low Joints','O''Grady, Paul','Bantam Press','2008','Autobiography','Mothers, Knee, Low Joints, Memoir',1,72,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780752893686','No Time for Goodbye','Barclay, Linwood','Orion (an Imprint of The Orion','2008','Crime, Thriller & Adventure','No Time, Goodbye, Mystery, Thriller',1,73,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007207329','The "Times" Su Doku:The Utterly Addictive Number-placing Puzzle:(Bk.) ','Times Books','Times Books','2005','Puzzles','Times, Su Doku, Number-placing puzzle, Addictive',1,74,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','General & Literary Fiction','Chocolat, France, Romance, Magic',1,75,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718144395','The Return of the Naked Chef','Oliver, Jamie','Michael Joseph','2000','Fitness & Diet','Jamie, Home, Cook, Good Life',1,76,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780006498407','Angelas Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','Autobiography','Angelas Ashes, Memoir, Childhood, Ireland',1,77,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747563204','Schotts Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','Puzzles','Schotts Original Miscellany, Trivia, Facts, Curiosities',1,78,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','Puzzles','Dreams from My Father, Race, Inheritance, Memoir',1,79,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007232741','The Dangerous Book for Boys','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','Puzzles','The Dangerous Book for Boys, Adventure, Skills, Knowledge, Activities',1,80,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099419785','To Kill a Mockingbird','Lee, Harper','Arrow Books','1989','General & Literary Fiction','race, Harper Lee, Southern Gothic, Social injustice',1,81,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Science Fiction','Wizardry, Hogwarts, Friendship, Adventure',1,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099406136','The Summons','Grisham, John','Arrow Books','2002','Crime, Thriller & Adventure','The Summons, John Grisham, Legal thriller, Family secrets',1,82,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552149525','The Lost Symbol','Brown, Dan','Corgi Books','2010','Crime, Thriller & Adventure','Mystery, Symbols, Washington D.C., Secret societies',1,83,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780140237504','The Catcher in the Rye','Salinger, J.D.','Penguin Books','1994','General & Literary Fiction','The Catcher in the Rye, J.D. Salinger, Coming-of-age, Alienation',1,84,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','Fitness & Diet','I Can Make You Thin, Paul McKenna, Weight loss, Mindset change',1,85,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','Fitness & Diet','Jamie, Home, Cook, Good Life',1,86,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','General & Literary Fiction','Brick Lane, Monica Ali, Immigrant experience, Cultural identity',1,87,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','General & Literary Fiction','Anybody Out There, Marian Keyes, Contemporary fiction, Mystery, Romance',1,88,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552772747','Undomestic Goddess','Kinsella, Sophie','Black Swan','2006','General & Literary Fiction','Undomestic Goddess, Sophie Kinsella, Chick lit, Humor, Romance',1,89,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552773898','Book Thief','Zusak, Markus','Black Swan','2008','General & Literary Fiction','The Book Thief, Markus Zusak, Historical fiction, World War II, Coming-of-age',1,90,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','Autobiography','I Know You Got Soul, Jeremy Clarkson, Non-fiction, Automotive, Humor',1,91,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','Autobiography','Sharon Osbourne Extreme, Autobiography, Celebrity, Personal journey',1,92,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','Picture Books','Guinness World Records, 2009, Book, Record-breaking',1,93,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780439993586','The Amber Spyglass:His Dark Materials S.','Pullman, Philip','Point','2001','Adult Fiction','The Amber Spyglass, His Dark Materials, Fantasy, Adventure, Trilogy',1,94,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','General & Literary Fiction','Can You Keep a Secret?, Sophie Kinsella, Fiction, Chick lit, Romantic comedy',1,95,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','General & Literary Fiction','Down Under, Bill Bryson, Travel, Australia, Humor',1,96,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099506928','A Spot of Bother','Haddon, Mark','Vintage','2007','General & Literary Fiction','A Spot of Bother, Mark Haddon, Fiction, Family drama, Humor',1,97,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','Autobiography','Dear Fatty, Dawn French, Memoir, Autobiography, Comedy, Personal anecdotes',1,98,'800.xx',(FLOOR(RAND() * 300)+100));
-- Create random no_pages per book
-- lpad(rand() * 1000000, 1, '0') -- Random 3digits
-- insert to school_id = 2
call AddBook( '9780552772747','Undomestic Goddess','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Undomestic Goddess, Sophie Kinsella, Chick lit, Humor, Romance',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747532743','Harry Potter and the Philosopher''s Stone','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552150736','Angels and Demons','Brown, Dan','Corgi Books','2003','Crime, Thriller & Adventure','Angels, Demons, Vatican, Thriller',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233657','Twilight','Meyer, Stephenie','ATOM','2007','Adult Fiction','Vampires, Romance, Fantasy, Teenagers',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552151764','Deception Point','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Thriller, Conspiracy, Science, Government',2,10,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233886','New Moon','Meyer, Stephenie','ATOM','2007','Adult Fiction','Romance, Fantasy, Vampires, Werewolves',2,11,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330457729','Lovely Bones,The','Sebold, Alice','Picador','2009','General & Literary Fiction','Mystery, Supernatural, Grief, Afterlife',2,12,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552151696','Digital Fortress','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Cryptography, Thriller, Technology, Espionage',2,13,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099450252','The Curious Incident of the Dog in the Night-time','Haddon, Mark','Vintage','2004','General & Literary Fiction','Mystery, Autism, Perspective, Mathematics',2,14,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233916','Eclipse','Meyer, Stephenie','ATOM','2008','Adult Fiction','Vampires, Love Triangle, Supernatural, Eclipse',2,15,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781847245458','Millennium Trilogy: The Girl with the Dragon Tattoo','Larsson, Stieg','Quercus','2008','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',2,16,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747566533','Kite Runner','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','General & Literary Fiction','Friendship, Redemption, Betrayal, Afghanistan',2,17,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099464464','The Time Travelers Wife','Niffenegger, Audrey','Vintage','2004','General & Literary Fiction','Time travel, Love, Destiny, Relationship',2,18,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141017891','The World According to Clarkson','Clarkson, Jeremy','Penguin Books','2005','General & Literary Fiction','Opinions, Humor, Observations, Controversial',2,19,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099429791','Atonement','McEwan, Ian','Vintage','2002','General & Literary Fiction','Guilt, Love, Betrayal, Redemption',2,20,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593054277','The Lost Symbol','Brown, Dan','Bantam Press','2009','Crime, Thriller & Adventure','Mystery, Symbols, Washington D.C., Secret societies',2,21,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552997041','A Short History of Nearly Everything','Bryson, Bill','Black Swan','2004','General & Literary Fiction','Science, History, Universe, Exploration',2,22,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Adult Fiction','Vampires, Romance, Supernatural, Transformation',2,23,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,24,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747591061','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Science Fiction','Wizardry, Hogwarts, Friendship, Adventure',2,25,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781849163422','Millennium Trilogy: The Girl Who Played With Fire','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',2,26,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780752837505','A Child Called It','Pelzer, Dave','Orion (an Imprint of The Orion','2001','Autobiography','Abuse, Survival, Memoir, Resilience',2,27,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780349116754','The No. 1 Ladies Detective Agency','McCall Smith, Alexander','Abacus','2003','Crime, Thriller & Adventure','Mystery, Botswana, Female detective, Cultural exploration',2,28,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718147655','You are What You Eat:The Plan That Will Change Your Life','McKeith, Gillian','Michael Joseph','2004','Fitness & Diet','Diet, Nutrition, Health, Lifestyle',2,29,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780006512134','Man and Boy','Parsons, Tony','HarperCollins Publishers','2000','General & Literary Fiction','Fatherhood, Relationships, Coming of Age, Identity',2,30,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099387916','Birdsong','Faulks, Sebastian','Vintage','1994','General & Literary Fiction','War, Love, Tragedy, Survival',2,31,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780752877327','Labyrinth','Mosse, Kate','Orion (an Imprint of The Orion','2006','General & Literary Fiction','Mystery, Historical, Quest, Secrets',2,32,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780755309511','The Island','Hislop, Victoria','Headline Review','2006','General & Literary Fiction','Isolation, Survival, Identity, Redemption',2,33,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781841953922','Life of Pi','Martel, Yann','Canongate Books','2003','General & Literary Fiction','Adventure, Survival, Faith, Storytelling',2,34,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780091889487','Dr. Atkins New Diet Revolution:The No-hunger, Luxurious Weight Loss P','Atkins, Robert C.','Vermilion','2003','Fitness & Diet','Low-carb, Weight loss, Health, Diet plan',2,35,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747599876','Tales of Beedle the Bard,The','Rowling, J. K.','Bloomsbury Publishing PLC','2008','Children''s Fiction','Wizarding world, Folklore, Magical stories, J.K. Rowling',2,36,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780749397548','Captain Corelli''s Mandolin','De Bernieres, Louis','Minerva','1995','General & Literary Fiction','κονιαρημικροτσουσουνε',2,37,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780563384304','Delia''s How to Cook:(Bk.) ','Smith, Delia','BBC Books (Random House)','1998','Fitness & Diet','κονιαρημικροτσουσουνε',2,38,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330507417','The Gruffalo','Donaldson, Julia','Macmillan Children''s Books','2009','Picture Books','Childrens book, Rhyme, Adventure, Friendship',2,39,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781861976123','Eats, Shoots and Leaves:The Zero Tolerance Approach to Punctuation','Truss, Lynne','Profile Books','2003','Picture Books','Grammar, Punctuation, Humor, Writing',2,40,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780590660549','Northern Lights:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','Fantasy, Adventure, Multiverse, Coming-of-age',2,41,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780755331420','The Interpretation of Murder','Rubenfeld, Jed','Headline Review','2007','Crime, Thriller & Adventure','Psychological thriller, Historical fiction, Sigmund Freud, New York City',2,42,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781849162746','Millennium Trilogy: The Girl Who Kicked the Hornets'' Nest','Larsson, Stieg','Quercus Publishing Plc','2010','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',2,43,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330367356','Bridget Jones: The Edge of Reason','Fielding, Helen','Picador','2000','General & Literary Fiction','Romantic comedy, Diary, Relationships, London',2,44,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141020525','A Short History of Tractors in Ukrainian','Lewycka, Marina','Penguin Books','2006','General & Literary Fiction','Family dynamics, Immigration, Humor, Cultural clash',2,45,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780722532935','The Alchemist:A Fable About Following Your Dream','Coelho, Paulo','Thorsons','1999','General & Literary Fiction','Alchemy, Personal legend, Dreams, Destiny',2,46,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552996006','Notes from a Small Island','Bryson, Bill','Black Swan','1996','General & Literary Fiction','Travel, Humor, Britain, Observations',2,47,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099487821','The Boy in the Striped Pyjamas','Boyne, John','Definitions','2007','Adult Fiction','Holocaust, Friendship, Innocence, Historical fiction',2,48,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','Picture Books','Politics, Satire, Criticism, Current affairs',2,49,'800.xx',(FLOOR(RAND() * 300)+100));
-- school_id = 3
call AddBook( '9780141011905','Stupid White Men:...and Other Sorry Excuses for the State of the Natio','Moore, Michael','Penguin Books','2002','Picture Books','Politics, Satire, Criticism, Current affairs',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718154776','Jamies 30-minute Meals','Oliver, Jamie','Michael Joseph','2010','Fitness & Diet','Jamie, Home, Cook, Good Life',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099457169','The Broker','Grisham, John','Arrow Books','2005','Crime, Thriller & Adventure','Espionage, Thriller, Ex-CIA agent, Italy',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330332774','Bridget Jones Diary:A Novel','Fielding, Helen','Picador','1997','General & Literary Fiction','Romantic comedy, Diary, Relationships, London',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780241003008','The Very Hungry Caterpillar','Carle, Eric','Puffin Books','1994','Picture Books','Childrens book, Caterpillar, Food, Transformation',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747582977','A Thousand Splendid Suns','Hosseini, Khaled','Bloomsbury Publishing PLC','2007','General & Literary Fiction','Afghanistan, Women, Friendship, Resilience',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781846051616','The Sound of Laughter','Kay, Peter','Century','2006','Autobiography','Comedy, Autobiography, Humor, Entertainment',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718147709','Jamies Italy','Oliver, Jamie','Michael Joseph','2005','Picture Books','Cookbook, Italian cuisine, Recipes, Travelogue',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780755307500','Small Island','Levy, Andrea','Headline Review','2004','General & Literary Fiction','Historical fiction, Post-war, Immigration, Identity',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141030142','Memory Keeper''s Daughter,The','Edwards, Kim','Penguin Books','2007','General & Literary Fiction','κονιαρημικροτσουσουνε',3,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007110926','Billy Connolly','Stephens978-0552772747on, Pamela','HarperCollins Publishers','2002','Picture Books','Comedy, Autobiography, Scottish, Entertainer',3,59,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330448444','The House at Riverton','Morton, Kate','Pan Books','2007','General & Literary Fiction','Historical fiction, Mystery, Secrets, English countryside',3,60,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747561071','Harry Potter and the Order of the Phoenix#','Rowling, J. K.','Bloomsbury Publishing PLC','2004','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',3,61,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780701181840','Nigella Express','Lawson, Nigella','Chatto & Windus','2007','Fitness & Diet','Cooking, Quick and Easy, Recipes, Nigella Lawson',3,62,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099771517','Memoirs of a Geisha','Golden, Arthur','Vintage','1998','General & Literary Fiction','Geisha, Japan, Memoirs, Historical Fiction',3,63,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780563384311','Delia''s How to Cook:(Bk.3) ','Smith, Delia','BBC Books (Random House)','1999','Fitness & Diet','κονιαρημικροτσουσουνε',3,64,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780590112895','The Subtle Knife:His Dark Materials S.','Pullman, Philip','Point','1998','Adult Fiction','Subtle Knife, His Dark Materials, Fantasy, Adventure',3,65,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718148621','Jamies Ministry of Food:Anyone Can Learn to Cook in 24 Hours','Oliver, Jamie','Michael Joseph','2008','Fitness & Diet','Jamie Oliver, Ministry of Food, Cooking, Learn to Cook',3,66,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904994367','Guinness World Records 2009:2009','Guinness World Records','Guinness World Records','2008','Picture Books','Guinness World Records, 2009, Book, Record-breaking',3,67,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781861978769','Why Don''t Penguins'' Feet Freeze?:And 114 Other Questions','Profile Books','Profile Books','2006','General & Literary Fiction','Penguins, Feet Freeze, Questions, Curiosity',3,68,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718152437','Jamie at Home:Cook Your Way to the Good Life','Oliver, Jamie','Michael Joseph','2007','Fitness & Diet','Jamie, Home, Cook, Good Life',3,69,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780140276336','White Teeth','Smith, Zadie','Penguin Books','2001','General & Literary Fiction','White Teeth, Zadie Smith, Multiculturalism, Identity',3,70,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007156108','The Devil Wears Prada','Weisberger, Lauren','HarperCollins Publishers','2003','General & Literary Fiction','Devil, Wears, Prada, Fashion',3,71,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593059258','At My Mothers Knee ...:and Other Low Joints','O''Grady, Paul','Bantam Press','2008','Autobiography','Mothers, Knee, Low Joints, Memoir',3,72,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780752893686','No Time for Goodbye','Barclay, Linwood','Orion (an Imprint of The Orion','2008','Crime, Thriller & Adventure','No Time, Goodbye, Mystery, Thriller',3,73,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007207329','The "Times" Su Doku:The Utterly Addictive Number-placing Puzzle:(Bk.)','Times Books','Times Books','2005','Puzzles','Times, Su Doku, Number-placing puzzle, Addictive',3,74,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','General & Literary Fiction','Chocolat, France, Romance, Magic',3,75,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718144395','Return of the Naked Chef,The','Oliver, Jamie','Michael Joseph','2000','Fitness & Diet','Jamie, Home, Cook, Good Life',3,76,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780006498407','Angelas Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','Autobiography','Angelas Ashes, Memoir, Childhood, Ireland',3,77,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747563204','Schotts Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','Puzzles','Schotts Original Miscellany, Trivia, Facts, Curiosities',3,78,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','Puzzles','Dreams from My Father, Race, Inheritance, Memoir',3,79,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007232741','The Dangerous Book for Boys','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','Puzzles','The Dangerous Book for Boys, Adventure, Skills, Knowledge, Activities',3,80,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099419785','To Kill a Mockingbird','Lee, Harper','Arrow Books','1989','General & Literary Fiction','race, Harper Lee, Southern Gothic, Social injustice',3,81,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Science Fiction','Wizardry, Hogwarts, Friendship, Adventure',3,3,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099406136','The Summons','Grisham, John','Arrow Books','2002','Crime, Thriller & Adventure','The Summons, John Grisham, Legal thriller, Family secrets',3,82,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552149525','The Lost Symbol','Brown, Dan','Corgi Books','2010','Crime, Thriller & Adventure','Mystery, Symbols, Washington D.C., Secret societies',3,83,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780140237504','The Catcher in the Rye','Salinger, J.D.','Penguin Books','1994','General & Literary Fiction','The Catcher in the Rye, J.D. Salinger, Coming-of-age, Alienation',3,84,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','Fitness & Diet','I Can Make You Thin, Paul McKenna, Weight loss, Mindset change',3,85,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','Fitness & Diet','Jamie, Home, Cook, Good Life',3,86,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','General & Literary Fiction','Brick Lane, Monica Ali, Immigrant experience, Cultural identity',3,87,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','General & Literary Fiction','Anybody Out There, Marian Keyes, Contemporary fiction, Mystery, Romance',3,88,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552772747','Undomestic Goddess','Kinsella, Sophie','Black Swan','2006','General & Literary Fiction','Undomestic Goddess, Sophie Kinsella, Chick lit, Humor, Romance',3,89,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552773898','Book Thief','Zusak, Markus','Black Swan','2008','General & Literary Fiction','The Book Thief, Markus Zusak, Historical fiction, World War II, Coming-of-age',3,90,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','Autobiography','I Know You Got Soul, Jeremy Clarkson, Non-fiction, Automotive, Humor',3,91,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','Autobiography','Sharon Osbourne Extreme, Autobiography, Celebrity, Personal journey',3,92,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','Picture Books','Guinness World Records, 2009, Book, Record-breaking',3,93,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780439993586','The Amber Spyglass:His Dark Materials S.','Pullman, Philip','Point','2001','Adult Fiction','The Amber Spyglass, His Dark Materials, Fantasy, Adventure, Trilogy',3,94,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','General & Literary Fiction','Can You Keep a Secret?, Sophie Kinsella, Fiction, Chick lit, Romantic comedy',3,95,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','General & Literary Fiction','Down Under, Bill Bryson, Travel, Australia, Humor',3,96,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099506928','A Spot of Bother','Haddon, Mark','Vintage','2007','General & Literary Fiction','A Spot of Bother, Mark Haddon, Fiction, Family drama, Humor',3,97,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','Autobiography','Dear Fatty, Dawn French, Memoir, Autobiography, Comedy, Personal anecdotes',3,98,'800.xx',(FLOOR(RAND() * 300)+100));
-- school_id = 4
call AddBook( '9780552772747','Undomestic Goddess','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Undomestic Goddess, Sophie Kinsella, Chick lit, Humor, Romance',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747532743','Harry Potter and the Philosopher''s Stone#','Rowling, J. K.','Bloomsbury Publishing PLC','1997','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747538486','Harry Potter and the Chamber of Secrets#','Rowling, J. K.','Bloomsbury Publishing PLC','1999','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552150736','Angels and Demons#','Brown, Dan','Corgi Books','2003','Crime, Thriller & Adventure','Angels, Demons, Vatican, Thriller',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747551003','Harry Potter and the Order of the Phoenix','Rowling, J. K.','Bloomsbury Publishing PLC','2003','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747581086','Harry Potter and the Half-blood Prince:Children''s Edition','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747591054','Harry Potter and the Deathly Hallows','Rowling, J. K.','Bloomsbury Publishing PLC','2007','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747546290','Harry Potter and the Prisoner of Azkaban#','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233657','Twilight','Meyer, Stephenie','ATOM','2007','Adult Fiction','Vampires, Romance, Fantasy, Teenagers',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747550990','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2001','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,1,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552151764','Deception Point','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Thriller, Conspiracy, Science, Government',4,10,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233886','New Moon','Meyer, Stephenie','ATOM','2007','Adult Fiction','Romance, Fantasy, Vampires, Werewolves',4,11,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780330457729','Lovely Bones,The','Sebold, Alice','Picador','2009','General & Literary Fiction','Mystery, Supernatural, Grief, Afterlife',4,12,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552151696','Digital Fortress','Brown, Dan','Corgi Books','2004','Crime, Thriller & Adventure','Cryptography, Thriller, Technology, Espionage',4,13,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099450252','The Curious Incident of the Dog in the Night-time','Haddon, Mark','Vintage','2004','General & Literary Fiction','Mystery, Autism, Perspective, Mathematics',4,14,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904233916','Eclipse','Meyer, Stephenie','ATOM','2008','Adult Fiction','Vampires, Love Triangle, Supernatural, Eclipse',4,15,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781847245458','Millennium Trilogy: The Girl with the Dragon Tattoo,','Larsson, Stieg','Quercus','2008','Crime, Thriller & Adventure','Mystery, Crime, Thriller, Stockholm',4,16,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747566533','Kite Runner','Hosseini, Khaled','Bloomsbury Publishing PLC','2004','General & Literary Fiction','Friendship, Redemption, Betrayal, Afghanistan',4,17,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099464464','The Time Traveler''s Wife','Niffenegger, Audrey','Vintage','2004','General & Literary Fiction','Time travel, Love, Destiny, Relationship',4,18,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141017891','The World According to Clarkson','Clarkson, Jeremy','Penguin Books','2005','General & Literary Fiction','Opinions, Humor, Observations, Controversial',4,19,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099429791','Atonement','McEwan, Ian','Vintage','2002','General & Literary Fiction','Guilt, Love, Betrayal, Redemption',4,20,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593054277','The Lost Symbol','Brown, Dan','Bantam Press','2009','Crime, Thriller & Adventure','Mystery, Symbols, Washington D.C., Secret societies',4,21,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552997041','A Short History of Nearly Everything','Bryson, Bill','Black Swan','2004','General & Literary Fiction','Science, History, Universe, Exploration',4,22,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781905654284','Breaking Dawn','Meyer, Stephenie','ATOM','2008','Adult Fiction','Vampires, Romance, Supernatural, Transformation',4,23,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747546245','Harry Potter and the Goblet of Fire','Rowling, J. K.','Bloomsbury Publishing PLC','2000','Children''s Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,24,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007207329','The "Times" Su Doku:The Utterly Addictive Number-placing Puzzle:(Bk.)','Times Books','Times Books','2005','Puzzles','Times, Su Doku, Number-placing puzzle, Addictive',4,74,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552998482','Chocolat','Harris, Joanne','Black Swan','2000','General & Literary Fiction','Chocolat, France, Romance, Magic',4,75,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718144395','The Return of the Naked Chef','Oliver, Jamie','Michael Joseph','2000','Fitness & Diet','Jamie, Home, Cook, Good Life',4,76,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780006498407','Angelas Ashes:A Memoir of a Childhood','McCourt, Frank','Flamingo','1997','Autobiography','Angelas Ashes, Memoir, Childhood, Ireland',4,77,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747563204','Schotts Original Miscellany','Schott, Ben','Bloomsbury Publishing PLC','2002','Puzzles','Schotts Original Miscellany, Trivia, Facts, Curiosities',4,78,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781847670946','Dreams from My Father:A Story of Race and Inheritance','Obama, Barack','Canongate Books','2008','Puzzles','Dreams from My Father, Race, Inheritance, Memoir',4,79,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780007232741','The Dangerous Book for Boys','Iggulden, Conn & Iggulden, Hal','HarperCollins Publishers','2006','Puzzles','The Dangerous Book for Boys, Adventure, Skills, Knowledge, Activities',4,80,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099419785','To Kill a Mockingbird','Lee, Harper','Arrow Books','1989','General & Literary Fiction','race, Harper Lee, Southern Gothic, Social injustice',4,81,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780747581109','Harry Potter and the Half-blood Prince','Rowling, J. K.','Bloomsbury Publishing PLC','2005','Science Fiction','Wizardry, Hogwarts, Friendship, Adventure',4,4,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099406136','The Summons','Grisham, John','Arrow Books','2002','Crime, Thriller & Adventure','The Summons, John Grisham, Legal thriller, Family secrets',4,82,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552149525','The Lost Symbol','Brown, Dan','Corgi Books','2010','Crime, Thriller & Adventure','Mystery, Symbols, Washington D.C., Secret societies',4,83,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780140237504','The Catcher in the Rye','Salinger, J.D.','Penguin Books','1994','General & Literary Fiction','The Catcher in the Rye, J.D. Salinger, Coming-of-age, Alienation',4,84,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780593050545','I Can Make You Thin','McKenna, Paul','Bantam Press','2005','Fitness & Diet','I Can Make You Thin, Paul McKenna, Weight loss, Mindset change',4,85,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780718144845','Happy Days with the Naked Chef','Oliver, Jamie','Michael Joseph','2001','Fitness & Diet','Jamie, Home, Cook, Good Life',4,86,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552771153','Brick Lane','Ali, Monica','Black Swan','2004','General & Literary Fiction','Brick Lane, Monica Ali, Immigrant experience, Cultural identity',4,87,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141019376','Anybody Out There?','Keyes, Marian','Penguin Books','2007','General & Literary Fiction','Anybody Out There, Marian Keyes, Contemporary fiction, Mystery, Romance',4,88,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552772747','Undomestic Goddess','Kinsella, Sophie','Black Swan','2006','General & Literary Fiction','Undomestic Goddess, Sophie Kinsella, Chick lit, Humor, Romance',4,89,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552773898','Book Thief','Zusak, Markus','Black Swan','2008','General & Literary Fiction','The Book Thief, Markus Zusak, Historical fiction, World War II, Coming-of-age',4,90,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780141022925','I Know You Got Soul','Clarkson, Jeremy','Penguin Books','2006','Autobiography','I Know You Got Soul, Jeremy Clarkson, Non-fiction, Automotive, Humor',4,91,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780316731317','Sharon Osbourne Extreme:My Autobiography','Osbourne, Sharon','Time Warner Books','2005','Autobiography','Sharon Osbourne Extreme, Autobiography, Celebrity, Personal journey',4,92,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781904994497','Guinness World Records 2010','Guinness World Records','Guinness World Records','2009','Picture Books','Guinness World Records, 2009, Book, Record-breaking',4,93,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780439993586','The Amber Spyglass:His Dark Materials S.','Pullman, Philip','Point','2001','Adult Fiction','The Amber Spyglass, His Dark Materials, Fantasy, Adventure, Trilogy',4,94,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552771108','Can You Keep a Secret?','Kinsella, Sophie','Black Swan','2003','General & Literary Fiction','Can You Keep a Secret?, Sophie Kinsella, Fiction, Chick lit, Romantic comedy',4,95,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780552997034','Down Under','Bryson, Bill','Black Swan','2001','General & Literary Fiction','Down Under, Bill Bryson, Travel, Australia, Humor',4,96,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9780099506928','A Spot of Bother','Haddon, Mark','Vintage','2007','General & Literary Fiction','A Spot of Bother, Mark Haddon, Fiction, Family drama, Humor',4,97,'800.xx',(FLOOR(RAND() * 300)+100));
call AddBook( '9781846053443','Dear Fatty','French, Dawn','Century','2008','Autobiography','Dear Fatty, Dawn French, Memoir, Autobiography, Comedy, Personal anecdotes',4,98,'800.xx',(FLOOR(RAND() * 300)+100));
-- apo katw einai apo chat gpt tou mariou
call Addbook('9780140449266', 'Pride and Prejudice', 'Jane Austen', 'Penguin Classics', 1813, 'Fiction, Romance', 'love, society, marriage', 1, 5, '823.7', 400);
call Addbook('9780061122415', 'To Kill a Mockingbird', 'Harper Lee', 'Harper Perennial Modern Classics', 1960, 'Fiction, Classics', 'race, Harper Lee, Southern Gothic, Social injustice', 2, 3, '813.54', 336);
call Addbook('9780141439563', 'Great Expectations', 'Charles Dickens', 'Penguin Classics', 1861, 'Fiction, Classics', 'ambition, social class, identity', 1, 4, '823.8', 544);
call Addbook('9780060850524', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, 'Fiction, Classics', 'adolescence, alienation, identity', 3, 2, '813.54', 224);
call Addbook('9780062315007', '1984', 'George Orwell', 'Signet Classics', 1949, 'Fiction, Dystopian', 'surveillance, totalitarianism, thought control', 2, 1, '823.91', 328);
call Addbook('9780061120084', 'The Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 1937, 'Fantasy, Adventure', 'quest, dragons, Middle-earth', 4, 5, '823.91', 320);
call Addbook('9780547928227', 'Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury Publishing', 1997, 'Fantasy, Adventure', 'Wizardry, Hogwarts, Friendship, Adventure', 1, 3, '823.91', 336);
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
call Addbook('9780385721790', 'The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', 2003, 'Fiction, Historical', 'Friendship, Redemption, Betrayal, Afghanistan', 2, 2, '813.6', 371);
call Addbook('9780451524936', 'Frankenstein', 'Mary Shelley', 'Signet Classics', 1818, 'Fiction, Horror', 'science, creation, morality', 3, 3, '823.7', 352);
call Addbook('9780060562496', 'The Odyssey', 'Homer', 'Harper Perennial Modern Classics', 8, 'Poetry, Epic', 'heroism, adventure, homecoming', 4, 1, '883', 541);


UPDATE book b SET b.image = concat('http://images.amazon.com/images/P/',ISBN13to10(b.ISBN),'.01.LZZZZZZZ.jpg');
UPDATE book SET summary = 'Frank McCourt returned to America when he was nineteen. For many years, he was an English teacher at Stuyvesant High School in New York City. The sequel to "Angela''s Ashes, ''Tis, " will be published in the fall of 1999. McCourt lives in Connecticut.', no_pages = 426 WHERE ISBN = '9780006498407';
UPDATE book SET summary = 'A Fabulously Engaging Novel, A Sunday Times Number 1 Bestseller, With Over 1.2 Million Copies Sold. Harry Silver Has It All. A Successful Job In Tv, A Gorgeous Wife, A Lovely Child. And In One Moment Of Madness, He Chucks It All Away. Man And Boy Is The Story Of How He Comes To Terms With His Life And Achieves A Degree Of Self-Respect, Bringing Up His Son Alone And, Gradually, Learning What Words Like Love And Family Really Mean. Very Well-Written, Pacy, Funny And Heart-Breakingly Moving. ''Parsons Has Written A Sharp, Witty And Wise Book Straight From His Heart. His Characters Are All Nitty-Gritty, Bounce-Off-The-Page, Real People; His Dialogue Is Brilliant.'' Daily Mail', no_pages = 356 WHERE ISBN = '9780006512134';
UPDATE book SET summary = 'Biography of Billy Connolly, written by his wife Pamela Stephenson.', no_pages = 428 WHERE ISBN = '9780007110926';
UPDATE book SET summary = 'A novel is set in the world of fashion.', no_pages = 404 WHERE ISBN = '9780007156108';
UPDATE book SET summary = 'The First Official Book Of The Puzzle, Certain To Satisfy The Many Fans Of This Exciting Brainteaser. Here, For The First Time, Is A Collection Of 100 Never-Before-Published Puzzles Ranked In Order Of Difficulty. They Have Been Created By Wayne Gould Who Sets The Puzzle For The Times.', no_pages = 180 WHERE ISBN = '9780007207329';
UPDATE book SET summary = 'Illustrated in color, and black and white, this book is designed to provide information to men of all ages. The chapters include: The Seven Ancient Wonders of the World, Conkers, Laws of Football, Dinosaurs, Fishing, Juggling, Timers and Tripwires, Kings and Queens, Famous Battles, Spies, Making Crystals, Insects and Spiders, Artillery, and Girls.', no_pages = 306 WHERE ISBN = '9780007232741';
UPDATE book SET summary = 'Four young ladies enter London society with one necessary goal: they must use their feminine wit and wiles to find a husband. So they band together, and a daring husband-hunting scheme is born. It Happened at the Ball... Where beautiful but bold Lillian Bowman quickly learned that her independent American ways weren''t entirely "the thing." And the most disapproving of all was insufferable, snobbish, and impossible Marcus, Lord Westcliff, London''s most eligible aristocrat. It Happened in the Garden… When Marcus shockingly -- and dangerously–swept her into his arms. Lillian was overcome with a consuming passion for a man she didn''t even like. Time stood still; it was as if no one else existed…thank goodness they weren''t caught very nearly in the act! It Happened One Autumn... Marcus was a man in charge of his own emotions, a bedrock of stability. But with Lillian, every touch was exquisite torture, every kiss an enticement for more. Yet how could he consider taking a woman so blatantly unsuitable…as his bride?', no_pages = 406 WHERE ISBN = '9780060562496';
UPDATE book SET summary = 'Summary of the Book', no_pages = 224 WHERE ISBN = '9780060850524';
UPDATE book SET summary = 'The highly original satire about Oedipa Maas, a woman who finds herself enmeshed in a worldwide conspiracy, meets some extremely interesting characters, and attains a not inconsiderable amount of self knowledge.', no_pages = 196 WHERE ISBN = '9780060913076';
UPDATE book SET summary = 'Summary of the Book', no_pages = 1178 WHERE ISBN = '9780060913077';
UPDATE book SET summary = 'Summary of the Book', no_pages = 208 WHERE ISBN = '9780060935467';
UPDATE book SET summary = 'Summary of the Book', no_pages = 288 WHERE ISBN = '9780060951395';
UPDATE book SET summary = 'Harper Lee''s Pulitzer Prize-winning masterwork of honor and injustice in the deep South -- and the heroism of one man in the face of blind and violent hatred One of the best-loved stories of all time, To Kill a Mockingbird has been translated into more than forty languages, sold more than thirty million copies worldwide, served as the basis of an enormously popular motion picture, and was voted one of the best novels of the twentieth century by librarians across the country. A gripping, heart-wrenching, and wholly remarkable tale of coming-of-age in a South poisoned by virulent prejudice, it views a world of great beauty and savage inequities through the eyes of a young girl, as her father -- a crusading local lawyer -- risks everything to defend a black man unjustly accused of a terrible crime.', no_pages = 346 WHERE ISBN = '9780061120084';
UPDATE book SET summary = '"My heart is afraid that it will have to suffer," the boy told the alchemist one night as they looked up at the moonless sky." Tell your heart that the fear of suffering is worse than the suffering itself. And that no heart has ever suffered when it goes in search of its dreams." Every few decades a book is published that changes the lives of its readers forever. The Alchemist is such a book. With over a million and a half copies sold around the world, The Alchemist has already established itself as a modern classic, universally admired. Paulo Coelho''s charming fable, now available in English for the first time, will enchant and inspire an even wider audience of readers for generations to come. The Alchemist is the magical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure as extravagant as any ever found. From his home in Spain he journeys to the markets of Tangiers and across the Egyptian desert to a fateful encounter with the alchemist. The story of the treasures Santiago finds along the way teaches us, as only a few stories have done, about the essential wisdom of listening to our hearts, learning to read the omens strewn along life''s path, and, above all, following our dreams.', no_pages = 210 WHERE ISBN = '9780061122415';
UPDATE book SET summary = 'Summary of the Book', no_pages = 180 WHERE ISBN = '9780061122416';
UPDATE book SET summary = 'A special 25th anniversary edition of the extraordinary international bestseller, including a new Foreword by Paulo Coelho. Combining magic, mysticism, wisdom and wonder into an inspiring tale of self-discovery, The Alchemist has become a modern classic, selling millions of copies around the world and transforming the lives of countless readers across generations. Paulo Coelho''s masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure. His quest will lead him to riches far different—and far more satisfying—than he ever imagined. Santiago''s journey teaches us about the essential wisdom of listening to our hearts, of recognizing opportunity and learning to read the omens strewn along life''s path, and, most importantly, to follow our dreams.', no_pages = 208 WHERE ISBN = '9780062315007';
UPDATE book SET summary = '"A brand new edition of the American blockbuster diet that has sold over 10 million copies world wide and promises you need never go hungry" "Follow the Dr Atkins'' Diet and forget counting calories. Watch the fat melt away as a healthier and firmer body emerges. Enjoy more energy as well as freedom from a range of ailments from diabetes to heart disease. Essentially a low carbohydrate plan, the Atkins'' Diet boosts your metabolic rate and once your metabolism is changed, your body adjusts to a new way of burning fat. Dieting can work, and with this medically proven regime you can lose weight without reducing - or counting - calories. On the Atkins'' Diet you can- Eat luxuriously and feel completely satisfied Experience the metabolic boost the Atkins'' Diet provides Use a maintenance diet that will ensure you never become fat again Enjoy mouth-watering, gourmet recipes In this new edition the world''s number one diet expert has updated his proven program for a new century to include; new controlled carbohydrate recipes for breakfast, lunch and dinner; brand new case studies and the very latest scientific research."', no_pages = 562 WHERE ISBN = '9780091889487';
UPDATE book SET summary = 'Set before and during the great war, Birdsong captures the drama of that era on both a national and a personal scale. It is the story of Stephen, a young Englishman, who arrives in Amiens in 1910. Over the course of the novel he suffers a series of traumatic experiences, from the clandestine love affair that tears apart the family with whom he lives, to the unprecedented experiences of the war itself.', no_pages = 530 WHERE ISBN = '9780099387916';
UPDATE book SET summary = 'Ray Atlee is summonsed by his dying father to return home to discuss details of his estate - He arrives home too late and finds that his father has left behind a shocking secret.', no_pages = 48 WHERE ISBN = '9780099406136';
UPDATE book SET summary = 'This title is also available as a film.', no_pages = 322 WHERE ISBN = '9780099419785';
UPDATE book SET summary = 'Fledgling writer Briony Tallis, as a 13-year-old, irrevocably changes the course of several lives when she accuses her older sister''s lover of a crime he did not commit.', no_pages = 48 WHERE ISBN = '9780099429791';
UPDATE book SET summary = 'The curious Incident of the Dog in the Night-Time is a murder mystery novel like no other. The detective, and narrator, is Christopher Boone. Christopher is fifteen and has Asperger''s Syndrome. He knows a very great deal about maths and very little about human beings. He loves lists, patterns and the truth. He hates the colours yellow and brown and being touched. He has never gone further than the end of the road in his own, but when he finds a neighbour''s dog murdered he sets out on a terrifying journey which will turn his finds a whole world upside down.', no_pages = 226 WHERE ISBN = '9780099450252';
UPDATE book SET summary = 'In his final hours in the Oval Office the outgoing President grants a full pardon to Joel Backman, a notorious Washington power broker who has spent the last six years hidden away in a federal prison. It''s a controversial move, but what no one else knows is that the presidential pardon comes as a result of enormous pressure from the CIA. They claim that Backman may have obtained secrets that would compromise the world''s most sophisticated satellite surveillance system. Backman is quietly smuggled out of the country in a military cargo plane; he is given a new name, a new identity, and a new home in Italy. Eventually, once he has settled into his new life, the CIA will leak his whereabouts to the Israelis, the Russians, the Chinese and the Saudis. Then the CIA will do what it does best: sit back and watch. The question is not whether Backman will survive - there''s no chance of that. The question the CIA needs answered is: who will kill him?', no_pages = 56 WHERE ISBN = '9780099457169';
UPDATE book SET summary = 'Rediscover the extraordinary love story that inspired the major new Sky TV series. Clare and Henry met when Clare was just six and Henry thirty-six, and were married when Clare was twenty-two and Henry thirty. Impossible but true. The Time Traveler''s Wife is the international bestselling novel of a time-altering love. Henry is a librarian who suffers from a rare condition where his genetic clock periodically resets, finding himself pulled suddenly into his past or future. Meanwhile, Clare is an artist waiting all her life for her great love Henry to appear. In the face of this force neither can prevent nor control, Henry and Clare''s struggle to lead normal lives is both intensely moving and entirely unforgettable. ''Dark, unpredictable, incredibly clever and a modern romance'' Grazia', no_pages = 532 WHERE ISBN = '9780099464464';
UPDATE book SET summary = 'The Boy in the Striped Pyjamas is told from the perspective of Bruno, a nine-year-old boy forced to leave his home in Berlin to live with his family in a strange and unwelcome environment. The only friend he finds in his drab new home is a little boy, Shmuel, separated from him by the big fence that separates Bruno''s world from the very peculiar place on the other side.', no_pages = 228 WHERE ISBN = '9780099487821';
UPDATE book SET summary = 'Unnoticed in the uproar, George quietly begins to go mad. The way a family of damaged people fall apart - and come together - is the true subject of Haddon''s hilarious and disturbing portrait of a dignified man trying to go insane politely.', no_pages = 516 WHERE ISBN = '9780099506928';
UPDATE book SET summary = '"Captivating, minutely imagined . . . a novel that refuses to stay shut" ("Newsweek"), "Memoirs of a Geisha" is now released in a movie tie-in edition.', no_pages = 452 WHERE ISBN = '9780099771517';
UPDATE book SET summary = 'In the mid-1960s, the publication of Pynchon''s V and The Crying of Lot 49 introduced a brilliant new voice to American literature. Gravity''s Rainbow, his convoluted, allusive novel about a metaphysical quest, published in 1973, further confirmed Pynchon''s reputation as one of the greatest writers of the century.', no_pages = 772 WHERE ISBN = '9780140188592';
UPDATE book SET summary = 'The Catcher in the Rye is the ultimate novel for disaffected youth, but it''s relevant to all ages. The story is told by Holden Caulfield, a seventeen- year-old dropout who has just been kicked out of his fourth school. Throughout, Holden dissects the ''phony'' aspects of society, and the ''phonies'' themselves: the headmaster whose affability depends on the wealth of the parents, his roommate who scores with girls using sickly-sweet affection. Lazy in style, full of slang and swear words, it''s a novel whose interest and appeal comes from its observations rather than its plot intrigues (in conventional terms, there is hardly any plot at all). Salinger''s style creates an effect of conversation, it is as though Holden is speaking to you personally, as though you too have seen through the pretences of the American Dream and are growing up unable to see the point of living in, or contributing to, the society around you.', no_pages = 192 WHERE ISBN = '9780140237504';
UPDATE book SET summary = 'Chosen by the Guardian as one of the Best Books of the 21st Century From the MAN BOOKER PRIZE- and WOMEN''S PRIZE-SHORTLISTED author of Swing Time, On Beauty and Grand Union ''BELIEVE THE HYPE'' The Times The international bestseller and modern classic of multicultural Britain - an unforgettable portrait of London One of the most talked about debut novels of all time, White Teeth is a funny, generous, big-hearted novel, adored by critics and readers alike. Dealing - among many other things - with friendship, love, war, three cultures and three families over three generations, one brown mouse, and the tricky way the past has of coming back and biting you on the ankle, it is a life-affirming, riotous must-read of a book. ''The almost preposterous talent was clear from the first pages'' Julian Barnes, Guardian ''Street-smart and learned, sassy and philosophical all at the same time'' New York Times ''Outstanding'' Sunday Telegraph', no_pages = 160 WHERE ISBN = '9780140276336';
UPDATE book SET summary = 'The eighteen chapters of The Bhagavad Gita (c. 500 b.c.), the glory of Sanskrit literature, encompass the whole spiritual struggle of a human soul. Its three central themes—love, light, and life—arise from the symphonic vision of God in all things and of all things in God. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', no_pages = 166 WHERE ISBN = '9780140449181';
UPDATE book SET summary = '"On what slender threads do life and fortune hang." Nominated as one of America’s best-loved novels by PBS’s The Great American Read Thrown in prison for a crime he has not committed, Edmond Dantes is confined to the grim fortress of If. There he learns of a great hoard of treasure hidden on the Isle of Monte Cristo and he becomes determined not only to escape, but also to unearth the treasure and use it to plot the destruction of the three men responsible for his incarceration. Dumas’ epic tale of suffering and retribution, inspired by a real-life case of wrongful imprisonment, was a huge popular success when it was first serialized in the 1840s. Robin Buss’s lively English translation is complete and unabridged, and remains faithful to the style of Dumas’s original. This edition includes an introduction, explanatory notes and suggestions for further reading. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', no_pages = 0 WHERE ISBN = '9780140449266';
UPDATE book SET summary = 'This text tells you everything you need to know about how the great and the good screw us over. It reveals - among other things - how President Bush stole an election aided only by his brother, cousin, his dad''s cronies, electoral fraud and tame judges; how the rich stay rich while forcing the rest of us to live in economic fear; and how politicians have whored themselves to big business. Not to mention providing detail on just how stupid Bush is, a convincing case for male obsolescence and a fabulous new use for Whites Only signs', no_pages = 316 WHERE ISBN = '9780141011905';
UPDATE book SET summary = 'It''s not about the cars!', no_pages = 340 WHERE ISBN = '9780141017891';
UPDATE book SET summary = '‘I had to go back to New York and try to find him. There was a chance he mightn’t be there but I had to give it a go because there was one thing I was certain of: he wasn’t here.’ Anna Walsh is officially a wreck. She’s covered in bandages and she’s lying in her parents’ Good Front Room dreaming of leaving Dublin and getting back to New York. To her friends. To The Most Fabulous Job in the World™. And most of all, back to her husband, Aiden. But her family have other ideas (not to mention the usual problems that beset the Walsh sisters). And Aiden, for some reason, seems unwilling to get in touch. What happened to Anna to send her so far from all that she loves? And what happened to her marriage that her husband won’t talk to her?', no_pages = 610 WHERE ISBN = '9780141019376';
UPDATE book SET summary = 'When their recently widowed father announces he plans to remarry, sisters Vera and Nadezhda realise they must put aside a lifetime of feuding in order to save him. His new love is a voluptuous gold-digger from the Ukraine half his age, with a proclivity for green satin underwear and boil-in-the-bag cuisine, who stops at nothing in her single minded pursuit of the luxury Western lifestyle she dreams of. But the old man, too, is pursuing his eccentric dreams - and writing a history of tractors in Ukrainian. A wise, tender and deeply funny novel about families, the healing of old wounds, the trials and consolations of old age and - really - about the legacy of Europe''s history over the last fifty years.', no_pages = 311 WHERE ISBN = '9780141020525';
UPDATE book SET summary = 'Summary of the Book', no_pages = 186 WHERE ISBN = '9780141022925';
UPDATE book SET summary = 'Families have secrets they hide even from themselves... It should have been an ordinary birth, the start of an ordinary happy family. But the night Dr David Henry delivers his wife''s twins is a night that will haunt five lives for ever. For though David''s son is a healthy boy, his daughter has Down''s syndrome. And, in a shocking act of betrayal whose consequences only time will reveal, he tells his wife their daughter died while secretly entrusting her care to a nurse. As grief quietly tears apart David''s family, so a little girl must make her own way in the world as best she can. This also includes the first chapter of Kim Edwards'' new novel The Lake of Dreams (Viking 2011).', no_pages = 420 WHERE ISBN = '9780141030142';
UPDATE book SET summary = 'A young orphan, Pip, receives a fortune from a mysterious benefactor and travels to London in order to become a gentleman', no_pages = 792 WHERE ISBN = '9780141439563';
UPDATE book SET summary = 'Eric Carle''s children''s classic is the story of a very small and very hungry caterpillar who manages to nibble his way through the pages of this enchanting book.', no_pages = 26 WHERE ISBN = '9780241003008';
UPDATE book SET summary = 'A devoted wife and mother, businesswoman, TV star and award-winning producer, Sharon Osbourne has, in her own words, ''lived fifty lives in fifty years''. From her extraordinary childhood as the daughter of infamous rock manager Don Arden, to managing and marrying rock legend Ozzy Osbourne, to her own rising fame on shows such as The Osbournes and The X Factor, Sharon Osbourne has experienced tremendous highs and devastating lows. She has earned her reputation by overcoming seemingly insurmountable obstacles with her honesty, charm, sense of humour, great instincts, and keen eye for business. Now she will reveal the truth behind the headlines in her characteristically frank, intimate and articulate way. Her story will, undoubtedly, be the autobiography of the year.', no_pages = 372 WHERE ISBN = '9780316731317';
UPDATE book SET summary = 'Bridget Jones''s Diary was first published in 1996 and applauded by critics from Salman Rushdie to Jilly Cooper. A number one best-seller, Helen Fielding''s book has sold over fifteen million copies worldwide and has been turned into an Academy Award-nominated film starring Renee Zellweger, Colin Firth and Hugh Grant. Bridget Jones''s Diary is followed by Bridget Jones: The Edge of Reason and Bridget Jones: Mad About the Boy. Bridget Jones is everyone''s favourite spinster. In Bridget Jones''s Diary she documents her struggles through the social minefield of her 30s and tries to weigh up the eternal question: Daniel Cleaver of Mark Darcy? She is supported through the whole process by four indispensable friends, Shazzer, Jude, Tom and a bottle of chardonnay. A dazzling urban satire of modern relationships? An ironic, tragic insight into the demise of the nuclear family? Or the confused ramblings of a pissed thirty-something?', no_pages = 310 WHERE ISBN = '9780330332774';
UPDATE book SET summary = 'At the end of Bridget Jones''s Diary, Bridget hiccuped off into the sunset with man-of-her-dreams Mark Darcy. Now she discovers what it is like when you have the man of your dreams actually in your flat and he doesn''t do the washing up, not just the whole of this week, but ever.', no_pages = 422 WHERE ISBN = '9780330367356';
UPDATE book SET summary = 'This gorgeous debut novel is set in England between the two World Wars. The story of an aristocratic family, a mysterious death, and a vanishing way of life is told in flashback by a woman who witnessed it all and kept secrets for more than 50 years.', no_pages = 612 WHERE ISBN = '9780330448444';
UPDATE book SET summary = 'This is the tale of family, memory, love, and living told by 14-year-old Susie Salmon, who is already in heaven. Through the voice of a precocious teenage girl, Susie relates the awful events of her death and builds out of her family''s grief a hopeful and joyful story.', no_pages = 340 WHERE ISBN = '9780330457729';
UPDATE book SET summary = 'Adored by children and adults the world over, the award-winning story of a clever little mouse outwitting the creatures of the deep dark wood is the perfect picture book and a genuine modern classic. Macmillan is proud to launch THE GRUFFALO''s 10th birthday celebrations with this limited edition, which is sure to delight fans and new readers alike.', no_pages = 32 WHERE ISBN = '9780330507417';
UPDATE book SET summary = 'Summary of the Book', no_pages = 172 WHERE ISBN = '9780349116754';
UPDATE book SET summary = 'NATIONAL BESTSELLER • A symphonic novel of love and war, childhood and class, guilt and forgiveness that provides all the satisfaction of a brilliant narrative and the provocation we have come to expect from the acclaimed Booker Prize–winning, internationally bestselling author. On a hot summer day in 1935, thirteen-year-old Briony Tallis witnesses a moment’s flirtation between her older sister, Cecilia, and Robbie Turner, the son of a servant and Cecilia’s childhood friend. But Briony’s incomplete grasp of adult motives—together with her precocious literary gifts—brings about a crime that will change all their lives. As it follows that crime’s repercussions through the chaos and carnage of World War II and into the close of the twentieth century, Atonement engages the reader on every conceivable level, with an ease and authority that mark it as a genuine masterpiece. Don’t miss Ian McEwan’s new novel, Lessons, available now!', no_pages = 372 WHERE ISBN = '9780385721790';
UPDATE book SET summary = 'For all those who are dying to learn the fate of Will and Lyra, hoping for the return of Iorek Byrnison, longing to know the truth about Dust, and waiting to face the ultimate clash of opposing powers, this book has the answers.', no_pages = 548 WHERE ISBN = '9780439993586';
UPDATE book SET summary = 'Written more than 70 years ago, 1984 was George Orwell’s chilling prophecy about the future. And while 1984 has come and gone, his dystopian vision of a government that will do anything to control the narrative is timelier than ever... • Nominated as one of America’s best-loved novels by PBS’s The Great American Read • “The Party told you to reject the evidence of your eyes and ears. It was their final, most essential command.” Winston Smith toes the Party line, rewriting history to satisfy the demands of the Ministry of Truth. With each lie he writes, Winston grows to hate the Party that seeks power for its own sake and persecutes those who dare to commit thoughtcrimes. But as he starts to think for himself, Winston can’t escape the fact that Big Brother is always watching... A startling and haunting novel, 1984 creates an imaginary world that is completely convincing from start to finish. No one can deny the novel’s hold on the imaginations of whole generations, or the power of its admonitions—a power that seems to grow, not lessen, with the passage of time.', no_pages = 280 WHERE ISBN = '9780451524935';
UPDATE book SET summary = 'Summary of the Book', no_pages = 352 WHERE ISBN = '9780451524936';
UPDATE book SET summary = 'Referring to "Adventures of Huckleberry Finn, " H. L. Mencken noted that his discovery of this classic American novel was "the most stupendous event of my whole life"; Ernest Hemingway declared that "all modern American literature stems from this one book," while T. S. Eliot called Huck "one of the permanent symbolic figures of fiction, not unworthy to take a place with Ulysses, Faust, Don Quixote, Don Juan, Hamlet." The novel''s preeminence derives from its wonderfully imaginative re-creation of boyhood adventures along the mighty Mississippi River, its inspired characterization, the author''s remarkable ear for dialogue, and the book''s understated development of serious underlying themes: "natural" man versus "civilized" society, the evils of slavery, the innate value and dignity of human beings, the stultifying effects of convention, and other topics. But most of all, "Adventures of Huckleberry Finn" is a wonderful story filled with high adventure and unforgettable characters (including the great river itself) that no one who has read it will ever forget. Unabridged Dover (1994) republication of the text of the first American edition, published by Charles L. Webster and Company, New York, 1885. New introductory Note."', no_pages = 227 WHERE ISBN = '9780486280615';
UPDATE book SET summary = 'The adventures of the well-to-do hobbit, Bilbo Baggins, who lived happily in his comfortable home until a wandering wizard granted his wish.', no_pages = 306 WHERE ISBN = '9780547928227';
UPDATE book SET summary = 'Robert Langdon, Harvard Professor Of Symbology, Receives An Urgent Late-Night Call While In Paris: The Curator Of The Louvre Has Been Murdered. Alongside The Body Is A Series Of Baffling Ciphers. Langdon And A Gifted French Cryptologist, Sophie Neveu, Are Stunned To Find A Trail That Leads To The Works Of Da Vinci And Further. The Curator, Part Of A Secret Society Named The Priory Of Sion, May Have Sacrificed His Life To Keep Secret The Location Of A Vastly Important Religious Relic Hidden For Centuries. It Appears That The Clandestine Vatican-Sanctioned Catholic Sect Opus Dei Has Now Made Its Move. Unless Landon And Neveu Can Decipher The Labyrinthine Code And Quickly Assemble The Pieces Of The Puzzle, The Priory S Secret And A Stunning Historical Truth Will Be Lost Forever.', no_pages = 484 WHERE ISBN = '9780552149518';
UPDATE book SET summary = 'Summary of the Book', no_pages = 354 WHERE ISBN = '9780552149525';
UPDATE book SET summary = 'When A World Renowned Scientist Is Found Brutally Murdered In A Swiss Research Facility, A Harvard Professor, Robert Langdon, Is Summoned To Identify The Mysterious Symbol Seared Onto The Dead Man S Chest. His Baffling Conclusion: That It Is The Work Of The Illuminati, A Secret Brotherhood Presumed Extinct For Nearly Four Hundred Years - Reborn To Continue Their Bitter Vendetta Against Their Most Hated Enemy, The Catholic Church.In Rome, The College Of Cardinals Assembles To Elect A New Pope. Yet Somewhere Within The Walls Of The Vatican, An Unstoppable Bomb Of Terrifying Power Relentlessly Counts Down To Oblivion. While The Minutes Tick Away, Langdon Joins Forces With Vittoria Vetra, A Beautiful And Mysterious Italian Scientist, To Decipher The Labyrinthine Trail Of Ancient Symbols That Snakes Across Rome To The Long-Forgotten Illuminati Lair A Secret Refuge Wherein Lies The Only Hope For The Vatican.But, With Each Revelation Comes Another Twist, Another Turn In The Plot, Which Leaves Langdom And Vetra Reeling And At The Mercy Of A Seemingly Invisible Enemy&Angels &Amp; Demons Is A Breathtakingly Brilliant Thriller Which Catapults The Reader Through The Antiquity Of Rome, Through Sealed Crypts, Dangerous Catacombs, Deserted Cathedrals And Even The Most Secret Vault On Earth. As The Prequel To Dan Brown S Worldwide Bestseller, The Da Vinci Code, It Has The Distinction Of Introducing His Readers To Harvard Symbologist, Robert Langdon.Angels &Amp; Demons Begins The Journey Of Enlightening Epiphanies To Dark Truths As The Battle Between Science And Religion Turns To War.', no_pages = 628 WHERE ISBN = '9780552150736';
UPDATE book SET summary = 'When The National Security Agency S Invincible Code-Breaking Machine Encounters A Mysterious Code It Cannot Break, The Agency Calls In Its Head Cryptographer, Susan Fletcher, A Brilliant, Beautiful Mathematician. What She Uncovers Sends Shock Waves Through The Corridors Of Power. The Nsa Is Being Held Hostage Not By Guns Or Bombs, But By A Code So Complex That If Released Would Cripple U.S. Intelligence.Caught In An Accelerating Tempest Of Secrecy And Lies, Fletcher Battles To Save The Agency She Believes In. Betrayed On All Sides, She Finds Herself Fighting Not Only For Her Country But For Her Life, And In The End, For The Life Of The Man She Loves&', no_pages = 516 WHERE ISBN = '9780552151696';
UPDATE book SET summary = 'Rachel Sexton works for the National Reconnaissance Office as an intelligence officer. She is also the daughter of a Senator currently running for President. Her father s main offensive, and a very popular one, against the incumbent President is to attack', no_pages = 596 WHERE ISBN = '9780552151764';
UPDATE book SET summary = 'An instant "New York Times" bestseller, Kinsella''s first stand-alone novel since the unforgettable Shopaholic series features the lovable and irrepressible Emma Corrigan, a young woman with a huge heart and a few little secrets.', no_pages = 372 WHERE ISBN = '9780552771108';
UPDATE book SET summary = 'Focusing on a cross-section of the Bangladeshi community in Tower Hamlets, a community all but invisible to the rest of London, Ali''s novel is warm, shrewd, startling, and hugely readable; the sort of book you race through greedily.', no_pages = 500 WHERE ISBN = '9780552771153';
UPDATE book SET summary = 'The story of a girl who needs to slow down. To find herself. To fall in love. And to discover what an iron is for... Samantha is a high-powered lawyer in London. She works all hours, has no home life, and cares only about getting a partnership.She thrives on the pressure and adrenalin. Until one day... she makes a mistake. A mistake so huge, it''ll wreck her career. She walks right out of the office, gets on the first train she sees, and finds herself in the middle of nowhere. Asking for directions at a big, beautiful house, she is mistaken for the interviewee housekeeper and finds herself being offered the job. They have no idea they''ve hired a Cambridge-educated lawyer with an IQ of 158 - Samantha has no idea how to work the oven. Disaster ensues. It''s chaos as Samantha battles with the washing machine...the ironing board...and attempts to cook a cordon bleu dinner.But gradually, she falls in love with her new life in a wholly unexpected way. Will her employers ever discover the truth? Will Samantha''s old life ever catch up with her? And if it does...will she want it back?', no_pages = 235 WHERE ISBN = '9780552772747';
UPDATE book SET summary = 'HERE IS A SMALL FACT - YOU ARE GOING TO DIE 1939. Nazi Germany. The country is holding its breath. Death has never been busier. Liesel, a nine-year-old girl, is living with a foster family on Himmel Street. Her parents have been taken away to a concentration camp. Liesel steals books. This is her story and the story of the inhabitants of her street when the bombs begin to fall. SOME IMPORTANT INFORMATION - THIS NOVEL IS NARRATED BY DEATH It''s a small story, about: a girl an accordionist some fanatical Germans a Jewish fist fighter and quite a lot of thievery. ANOTHER THING YOU SHOULD KNOW - DEATH WILL VISIT THE BOOK THIEF THREE TIMES', no_pages = 564 WHERE ISBN = '9780552773898';
UPDATE book SET summary = 'Summary of the Book', no_pages = 332 WHERE ISBN = '9780552996006';
UPDATE book SET summary = 'It is the driest, flattest, hottest, most desiccated, infertile and climatically aggressive of all the inhabited continents and still Australia teems with life - a large portion of it quite deadly. In tact, Australia has more things that can kill you in a very nasty way than anywhere else. Ignoring such dangers - and yet curiously obsessed by them - Bill Bryson journeyed to Australia and promptly fell in love with the country. And who can blame him t The people are cheerful, extrovert, quick-witted and unfailingly obliging : their cities are safe and clean and nearly always built on water ; the food is excellent ; the beer is cold and the sun nearly always shines. Life doesn''t get much better than this...', no_pages = 397 WHERE ISBN = '9780552997034';
UPDATE book SET summary = 'An easy guide to many scientific mysteries, fully indexed.', no_pages = 686 WHERE ISBN = '9780552997041';
UPDATE book SET summary = 'Try me...Test me...Taste me.When an exotic stranger, Vianne Rocher, arrives in the French village of Lansquenet and opens a chocolate boutique directly opposite the church, Father Reynaud identifies her as a serious danger to his flock especially as it', no_pages = 388 WHERE ISBN = '9780552998482';
UPDATE book SET summary = 'This is an easy-to-follow cookery course for people of all abilities. In this two-part series, Delia returns to the very roots of cooking to look at the techniques and the ingredients which underline the best traditions of British cookery.', no_pages = 240 WHERE ISBN = '9780563384304';
UPDATE book SET summary = 'Summary of the Book', no_pages = 339 WHERE ISBN = '9780563384311';
UPDATE book SET summary = 'As the boundaries between worlds begin to dissolve, Lyra and her daemon help Will Parry in his search for his father and for a powerful, magical knife.', no_pages = 341 WHERE ISBN = '9780590112895';
UPDATE book SET summary = 'In this first part of the Dark Materials trilogy, Lyra''s friend Roger disappears. She and her daemon, Pantalaimon, determine to find him. Their quest leads them to the bleak splendour of the North where a team of scientists are conducting unspeakably horrible experiments.', no_pages = 399 WHERE ISBN = '9780590660549';
UPDATE book SET summary = 'The easy way to lose weight and stay slim — with a free weight-loss CD included. Do you want to lose weight easily? Would you like to feel really happy with your body? Are you unable to lose those last 10 pounds? Are you a late night snacker? Do you find it hard to say no to second helpings? Do you get disheartened about your eating habits and your weight? Yes? Well, Paul McKenna has written the book for you.I Can Make You Thinwill change your attitude to food forever.', no_pages = 230 WHERE ISBN = '9780593050545';
UPDATE book SET summary = 'WHAT WAS LOST WILL BE FOUND&Washington DC: Harvard symbologist Robert Langdon is summoned at the last minute to deliver an evening lecture in the Capitol Building. Within moments of his arrival, however, a disturbing object gruesomely encoded with fiv', no_pages = 526 WHERE ISBN = '9780593054277';
UPDATE book SET summary = 'The story of Paul O''Grady''s early life in Irish Catholic Birkenhead that started him on the long and winding road from mischievous altar boy to national treasure.', no_pages = 372 WHERE ISBN = '9780593059258';
UPDATE book SET summary = 'Summary of the Book', no_pages = 417 WHERE ISBN = '9780679732761';
UPDATE book SET summary = 'Nigella And Her Style Of Cookery Have Earned A Special Place In Our Lives, Symbolising All That Is Best, Most Pleasurable, Most Hands-On And Least Fussy About Good Food. But That Doesn T Mean She Wants Us To Spend Hours In The Kitchen, Slaving Over A Hot Stove. Featuring Fabulous Fast Foods, Ingenious Short Cuts, Terrific Time-Saving Ideas, And Easy, Delicious Meals, Nigella Express Is Her Solution To Eating Well When Time Is Short. This New Book Is Every Working Mother S Dream And A Joy For Everyone Who Wants To Cook But Can T Seem To Find The Time. Here Are Mouthwatering Recipes, Quick To Prepare, Easy To Follow, That You Can Conjure Up After A Long Day In The Office Or On A Busy Weekend. This Is Food You Can Make As You Hit The Kitchen Running, With Vital Tips On How To Keep Your Store Cupboard Stocked, Freezer And Fridge Stacked. When Time Is Precious, You Can''T Spend Hours Shopping, So You Need To Make Life Easier By Being Prepared. Not That The Recipes Are Basic - Though They Are Always Simple - But It S Important To Make Every Ingredient Earn Its Place In A Recipe. Minimise Effort By Maximising Taste. And Here Too Is Great Food That Can Be Prepared Quickly But Cooked Slowly In The Oven, Leaving You Time To Have A Bath, A Drink, Talk To Friends, Or Do The Children''S Homework. Minimum Stress For Maximum Enjoyment.This Is A New Generation Of Fast Food Never Basic, Never Dull, Always Do-Able, Quick And Delicious - For The Busy Lives We Lead. The Domestic Goddess Is Back But This Time It S Instant.', no_pages = 172 WHERE ISBN = '9780701181840';
UPDATE book SET summary = 'Number one for over 5 months in Britain with The Naked Chef , the bestselling, brilliant Jamie Oliver is back with a brand spanking new book to accompany a second cracking BBC TV series. There is no doubt that Jamie has captured the hearts of the nation with his passion for simple, delicious, home-cooked food. His talent his huge, his style relaxed and his recipes divine. If you think cooking is boring or time-consuming or you haven''t the confidence to chuck out those ready-made meals, let Jamie change all that for you. Here he returns to get you into the kitchen with his mouth-watering recipes and new angles on favourite dishes - from the most fantastic breakfasts, tapas and bevies to robust roasts, funky fish dishes and desserts to die for. Filled with fresh ingredients, pukka recipes and boundless enthusiasm, The Return of the Naked Chef is definitely something not to be missed.', no_pages = 285 WHERE ISBN = '9780718144395';
UPDATE book SET summary = 'For Jamie Oliver, food is all about happy days - not just cooking superbly fresh and funky ingredients, but good fun, great eating and top-quality time spent with friends and family. Now Jamie, one of Britain''s best-loved chefs, gives us Happy Days, his third book, to accompany his fantastic new series of The Naked Chef on BBC2. Jamie believes in finding the best ingredients and making tasty, easy, sociable food with the minimum of fuss. Like his first two books, Happy Days is filled with fantastic salads, pastas, meat, fish, breads and desserts for all occasions. Enjoy yourself, get stuck in . . . Happy days!', no_pages = 317 WHERE ISBN = '9780718144845';
UPDATE book SET summary = 'Dr Gillian McKeith has turned round Britain''s Worst Eaters with incredible results. Now discover her fabulous diet secrets and get ready to meet the new you. Take the food IQ test and find out what your diet is doing to you. Banish your cravings. Prevent food-related health problems such as diabetes. Discover how small changes are going to make a big difference. Eat more . . . not less. Follow Dr McKeith''s simple advice and seven-day jumpstart plan and you''ll look and feel fantastic. You''ll be amazed at the difference a few changes can make, and how easy it can be. Just give it a go and see . . .', no_pages = 224 WHERE ISBN = '9780718147655';
UPDATE book SET summary = 'AUTHENTIC ITALY DELICIOUS ITALY JAMIE''S ITALY Italy has inspired Jamie Oliver throughout his career. His ambition has always been to travel across the country on a quest to capture the very essence of Italian cooking - and to produce the best and simplest Italian cookbook for everybody to enjoy. Jamie''s Italy is a result of that journey - and it''s a land of plenty. With more than 120 brand-new recipes for everything from risotto to roasts and spaghetti to stews, and structured like a traditional trattoria menu, Jamie''s Italy takes you all over Italy to cook with and learn from the real masters of Italian cuisine: the locals. Far from the standard ''lemons and olives'' version of Italian cooking, it is a cookbook by the people for the people. From Sicily to Tuscany, it''s about the local fishermen, family bakers and, of course, the ''Mamas'', sharing their recipes and the tips that have gone into their cooking for generations. But it''s not only mouth-watering food that Jamie brings back home: it''s also the spirit that makes cooking and eating absolutely central to family life whichever part of Italy you''re in. Bursting with the warmth and hospitality of real family life, this is both a superbly accessible cookbook and a unique travelogue and diary, in which you''ll find the authentic flavour of Italy and the people who live there. If you love quality food prepared with genuine passion - you''ll never want to leave Jamie''s Italy.', no_pages = 319 WHERE ISBN = '9780718147709';
UPDATE book SET summary = '"The aim of this book is to completely inspire people who have no interest in food to have a go. Sixty years ago food was in short supply and malnutrition rates were high. The Ministry of Food was set up to teach the public how to make the best use of the food available to them. Fast forward to the present day, where we have unlimited choices and plenty of food, yet we''re living in a world of junk food, additives and preservatives. Our war is now against obesity, as most people have little or no idea about how to cook and what makes a balanced diet. We need to learn from the past. We need to look back at the way our grandmothers and great-grandmothers cooked - wholesome, tasty food that was simple and quick to prepare."--Publisher details.', no_pages = 184 WHERE ISBN = '9780718148621';
UPDATE book SET summary = 'Simple cooking with great flavours all year round. This book includes over 100 recipes, as well as some basic planting information and tips if you fancy having a go at getting your hands dirty as well.', no_pages = 195 WHERE ISBN = '9780718152437';
UPDATE book SET summary = 'This year, I''ve got the message loud and clear that as everyone comes under bigger and bigger financial pressure, they want help to cook tasty, nutritious food on a budget - so this book was born completely out of public demand. It draws on knowledge and cooking skills to help you make better choices, showing you how to buy economically and efficiently, get the most out of your ingredients, save time and prevent food waste. And there''s no compromise - I''m talking big flavours, comfort food that makes you happy, and colourful, optimistic dishes. As well as that, every single recipe in the book is cheaper per portion than your average takeaway, so every choice is a great value choice. Our biggest luxury is knowledge, whether times are hard or not, so get kitchen smart and smash the recession.', no_pages = 280 WHERE ISBN = '9780718154776';
UPDATE book SET summary = 'This text is a magical fable about learning to listen to your heart, read the omens strewn along life''s path and, above all, following your dreams. The book tells the story of Santiago, an Andalusian shepherd boy who dreams of travelling the world in search of a fabulous worldly treasure.', no_pages = 212 WHERE ISBN = '9780722532935';
UPDATE book SET summary = 'Summary of the Book', no_pages = 196 WHERE ISBN = '9780747532743';
UPDATE book SET summary = 'WIDESCREEN EDITION - DVD.', no_pages = 251 WHERE ISBN = '9780747538486';
UPDATE book SET summary = 'The summer holidays are dragging on and Harry Potter can''t wait for the start of the school year. It is his fourth year at Hogwarts School of Witchcraft and Wizardry and there are spells to be learnt and (unluckily) Potions and Divination lessons to be attended. But Harry can''t know that the atmosphere is darkening around him, and his worst enemy is preparing a fate that it seems will be inescapable . . . With characteristic wit, fast-paced humour and marvellous emotional depth, J.K. Rowling has proved herself yet again to be a master story-teller.', no_pages = 636 WHERE ISBN = '9780747546245';
UPDATE book SET summary = 'When Harry and his best friends go back for their third year at Hogwarts, the atmosphere is tense. There''s an escaped mass-murderer on the loose and the sinister prison guards of Azkaban have been called in to guard the school. Lessons, however, must go on and there are lots of new subjects in third year - Care of Magical Creatures and Divination among others - to take Harry''s mind off things!', no_pages = 317 WHERE ISBN = '9780747546290';
UPDATE book SET summary = 'Summary of the Book', no_pages = 202 WHERE ISBN = '9780747550990';
UPDATE book SET summary = 'Summary of the Book', no_pages = 163 WHERE ISBN = '9780747551003';
UPDATE book SET summary = 'Dumbledore lowered his hands and surveyed Harry through his half-moon glasses. ''It is time,'' he said, ''for me to tell you what I should have told you five years ago, Harry. Please sit down. I am going to tell you everything.'' Harry Potter is due to start his fifth year at Hogwarts School of Witchcraft and Wizadry. He is desperate to get back to school and find out why his friends Ron and Hermione have been so secretive all summer. However, what Harry is about to discover in his new year at Hogwarts will turn his whole world upside down . . . But before he even gets to school, Harry has an unexpected and frightening encounter with two Dementors, has to face a court hearing at the Ministry of Magic and has been escorted on a night-time broomstick ride to the secret headquarters of a mysterious group called ''The Order of the Phoenix''. And that is just the start. A gripping and electrifying novel, full of suspense, secrets, and - of course - magic.', no_pages = 766 WHERE ISBN = '9780747561071';
UPDATE book SET summary = 'Schott''s Original Miscellany makes few claims to be exhaustive or even practical. It does, however, claim to be essential. It will afford you great wisdom in the morning, several conversational bon mots for the afternoon, and many an enlightened smile after dark. Where else can you find, packed on to one page, the 13 principles of witchcraft, the structure of military hierarchy, all of the clothing care symbols, a list of the countries where you drive on the left, and a nursery rhyme about sneezing? Where else, but Schott''s Miscellany, will you stumble across John Lennon''s cat, the supplier of bagpipes to the Queen, and the brutal methods of murder encountered by Miss Marple? A book like no other, Schott''s Miscellany is entertaining, informative, unpredictable and utterly addictive.', no_pages = 158 WHERE ISBN = '9780747563204';
UPDATE book SET summary = 'Twelve-year-old Amir is desperate to win the approval of his father and resolves to win the local kite-fighting tournament, to prove that he has the makings of a man. His loyal friend Hassan promises to help him - for he always helps Amir - but this is 1970s Afghanistan and Hassan is merely a low-caste servant who is jeered at in the street, although Amir still feels jealous of his natural courage and the place he holds in his father''s heart. But neither of the boys could foresee what would happen to Hassan on the afternoon of the tournament, which was to shatter their lives. After the Russians invade and the family is forced to flee to America, Amir realises that one day he must return, to find the one thing that his new world cannot grant him: redemption.', no_pages = 324 WHERE ISBN = '9780747566533';
UPDATE book SET summary = '''In a brief statement on Friday night, Minister for Magic Cornelius Fudge confirmed that He Who Must Not Be Named has returned to this country and is once more active. "It is with great regret that I must confirm that the wizard styling himself Lord - well, you know who I mean - is alive and among us again," said Fudge.'' These dramatic words appeared in the final pages of Harry Potter and the Order of the Phoenix. In the midst of this battle of good and evil, Harry Potter and the Half-Blood Prince takes up the story of Harry Potter''s sixth year at Hogwarts School of Witchcraft and Wizardry, with Voldemort''s power and followers increasing day by day . . .', no_pages = 607 WHERE ISBN = '9780747581086';
UPDATE book SET summary = 'Harry Potter and the Half-Blood Prince: The sixth in J. K. Rowling''s series of the adventures of the young wizard Harry Potter. Vietnamese version translated by Ly Lan and Huong Lan. 679p. (6)', no_pages = 607 WHERE ISBN = '9780747581109';
UPDATE book SET summary = 'Mariam is only fifteen when she is sent to Kabul to marry the troubled and bitter Rasheed, who is thirty years her senior. Nearly two decades later, in a climate of growing unrest, tragedy strikes fifteen-year-old Laila, who must leave her home and join Mariam''s unhappy household. Laila and Mariam are to find consolation in each other, their friendship to grow as deep as the bond between sisters, as strong as the ties between mother and daughter. With the passing of time comes Taliban rule over Afghanistan, the streets of Kabul loud with the sound of gunfire and bombs, life a desperate struggle against starvation, brutality and fear, the women''s endurance tested beyond their worst imaginings. Yet love can move a person to act in unexpected ways, lead them to overcome the most daunting obstacles with a startling heroism. In the end it is love that triumphs over death and destruction. A Thousand Splendid Sunsis an unforgettable portrait of a wounded country and a deeply moving story of family and friendship. It is a beautiful, heart-wrenching story of an unforgiving time, an unlikely bond and an indestructible love.', no_pages = 372 WHERE ISBN = '9780747582977';
UPDATE book SET summary = 'The seventh and final volume of the spellbinding Harry Potter series.', no_pages = 607 WHERE ISBN = '9780747591054';
UPDATE book SET summary = '''His hand closed automatically around the fake Horcrux, but in spite of everything, in spite of the dark and twisting path he saw stretching ahead for himself, in spite of the final meeting with Voldemort he knew must come, whether in a month, in a year, or in ten, he felt his heart lift at the thought that there was still one last golden day of peace left to enjoy with Ron and Hermione.'' With these words Harry Potter and the Half-Blood Prince draws to a close. And here, in this seventh and final book, Harry discovers what fate truly has in store for him as he inexorably makes his way to that final meeting with Voldemort. In this thrilling climax to the phenomenally bestselling series, J.K. Rowling will reveal all to her eagerly waiting readers.', no_pages = 607 WHERE ISBN = '9780747591061';
UPDATE book SET summary = '''You''ve never heard of The Tales of Beedle the Bard?'' said Ron incredulously. ''You''re kidding, right?'' (From Harry Potter and the Deathly Hallows) Published by the charity Lumos in association with Bloomsbury Publishing Plc, The Tales of Beedle the Bard is the first new book from J. K. Rowling since the publication of Harry Potter and the Deathly Hallows. The Tales of Beedle the Bardplayed a crucial role in assisting Harry, with his friends Ron and Hermione, to finally defeat Lord Voldemort. Fans will be thrilled to have this opportunity to read the tales in full. An exciting addition to the canon of Harry Potter, the tales reveal the wonderful versatility of the author, as she tackles with relish the structure and varying tones of a classic fairy tale. There are five tales: ''The Tale of the Three Brothers'', recounted in Deathly Hallows, plus ''The Fountain of Fair Fortune'', ''The Warlock''s Hairy Heart'', ''The Wizard and the Hopping Pot'', and ''Babbitty Rabbitty and her Cackling Stump''. Each has its own magical character and will bring delight, laughter and the thrill of mortal peril. Translated from the original runes by Hermione Granger, the tales are introduced and illustrated by J. K. Rowling. Also included are notes by Professor Albus Dumbledore, which appear by kind permission of the Hogwarts Headmasters'' Archive. Lumos is a charity founded by J. K. Rowling which aims to make life better for disadvantaged children. Registered Charity Number: 1112575.', no_pages = 108 WHERE ISBN = '9780747599876';
UPDATE book SET summary = 'Summary of the Book', no_pages = 252 WHERE ISBN = '9780749397548';
UPDATE book SET summary = 'Dave Pelzer was brutally beaten and starved by his emotionally unstable, alcoholic mother, a mother who played tortuous, unpredictable games - games that left one of her three sons nearly dead. She no longer considered Dave a son, but a slave; no longer a boy, but an ''it''. His bed was an old army cot in the basement, his clothes were torn and smelly, and when he was allowed the luxury of food it was scraps from the dog''s bowl. The outside world knew nothing of the nightmare played out behind closed doors. But throughout Dave kept alive dreams of finding a family to love him. This book covers the early years of his life and is an affecting and inspirational book of the horrors of child abuse and the steadfast determination of one child to survive.', no_pages = 169 WHERE ISBN = '9780752837505';
UPDATE book SET summary = 'July 1209: in Carcassonne a seventeen-year-old girl is given a mysterious book by her father which he claims contains the secret of the true Grail. Although Alais cannot understand the strange words and symbols hidden within, she knows that her destiny lies in keeping the secret of the labyrinth safe... July 2005: Alice Tanner discovers two skeletons in a forgotten cave in the French Pyrenees. Puzzled by the labyrinth symbol carved into the rock, she realises she''s disturbed something that was meant to remain hidden. Somehow, a link to a horrific past - her past - has been revealed.', no_pages = 708 WHERE ISBN = '9780752877327';
UPDATE book SET summary = 'Thriller.', no_pages = 452 WHERE ISBN = '9780752893686';
UPDATE book SET summary = 'Returning to England after the war Gilbert Joseph is treated very differently now that he is no longer in an RAF uniform. Joined by his wife Hortense, he rekindles a friendship with Queenie who takes in Jamaican lodgers. Can their dreams of a better life in England overcome the prejudice they face?', no_pages = 533 WHERE ISBN = '9780755307500';
UPDATE book SET summary = 'The acclaimed million-copy number one bestseller and winner of Richard & Judy''s Summer Read 2006 from Victoria Hislop is a dramatic tale of four generations, rent by war, illicit love, violence and leprosy, from the thirties, through the war, to the present day. On the brink of a life-changing decision, Alexis Fielding longs to find out about her mother''s past. But Sofia has never spoken of it. All she admits to is growing up in a small Cretan village before moving to London. When Alexis decides to visit Crete, however, Sofia gives her daughter a letter to take to an old friend, and promises that through her she will learn more. Arriving in Plaka, Alexis is astonished to see that it lies a stone''s throw from the tiny, deserted island of Spinalonga - Greece''s former leper colony. Then she finds Fotini, and at last hears the story that Sofia has buried all her life: the tale of her great-grandmother Eleni and her daughters and a family rent by tragedy, war and passion. She discovers how intimately she is connected with the island, and how secrecy holds them all in its powerful grip...', no_pages = 473 WHERE ISBN = '9780755309511';
UPDATE book SET summary = 'The 10 year anniversary edition of a dazzling literary thriller including brand new material, THE INTERPRETATION OF MURDER is the story of Sigmund Freud assisting a Manhattan murder investigation. Think SHADOW OF THE WIND meets THE HISTORIAN. THE INTERPRETATION OF MURDER is an inventive tour de force inspired by Sigmund Freud''s 1909 visit to America, accompanied by protégé and rival Carl Jung. When a wealthy young debutante is discovered bound, whipped and strangled in a luxurious apartment overlooking the city, and another society beauty narrowly escapes the same fate, the mayor of New York calls upon Freud to use his revolutionary new ideas to help the surviving victim recover her memory of the attack, and solve the crime. But nothing about the attacks - or about the surviving victim, Nora - is quite as it seems. And there are those in very high places determined to stop the truth coming out, and Freud''s startling theories taking root on American soil.', no_pages = 548 WHERE ISBN = '9780755331420';
UPDATE book SET summary = 'After the sinking of a crago ship, a solitary lifeboat remains bobbing on the wild blue Pacific. The only survivors from the wreck are a sixteen-year-old boy named Pi, a hyena, a wounded zebra, and orangutan-and a 450-pound Royal Bengel tiger.', no_pages = 337 WHERE ISBN = '9781841953922';
UPDATE book SET summary = 'A memoir filled with the unique brand of humour for which his TV series has made him so popular endearing characters who rejoice in, not politics or sex, but far funnier areas of life: elderly relatives and answering machines, Dads dancing at weddings, Mums'' HRT.', no_pages = 150 WHERE ISBN = '9781846051616';
UPDATE book SET summary = 'Dear Dad So, you''re still dead. It''s been over 30 years and every day I have to remind myself of that fact, and every day I am shocked. I''m not 19 anymore and many things have happened that we haven''t shared, so I have decided to write this book for you. I want to remember our time together and I want to tell you about lots of stuff since. So far, it''s been better than expected... With a sharp eye for comic detail and wicked ear for the absurdities of life, Dawn French shows just how an RAF girl from the west country with dreams of becoming a ballerina/air hostess/bridesmaid rose to be one of the best loved comedy actresses of our time. Here Dawn French shares her story, and in particular with her father who committed suicide when she was nineteen years old. She invites us into her most personal relationships with, among others, her mum and dad, her husband, her daughter and her friend Jennifer. Dawn reveals the people, experiences and obsessions that have influenced her and that helped shape her comedy creations - including kissing, dogs, grandmas, David Cassidy, teenage angst, school, stealing, Madonna and not forgetting chocolate. She is as open about her fears and sorrows as she is about her delights and joys, and for the first time shares the experience of losing her beloved dad and later finding a tip-topmost chap in Lenny Henry. From raging about class, celebrity and bullying to describing the highs and lows of motherhood and friendship, Dear Fatty reveals the surprising life behind the smile.', no_pages = 415 WHERE ISBN = '9781846053443';
UPDATE book SET summary = 'Summary of the Book', no_pages = 284 WHERE ISBN = '9781847245458';
UPDATE book SET summary = 'Simplified Chinese edition of Dreams from My Father: A Story of Race and Inheritance. Obama''s bestselling biography when he entered politics.', no_pages = 465 WHERE ISBN = '9781847670946';
UPDATE book SET summary = 'Summary of the Book', no_pages = 399 WHERE ISBN = '9781849162746';
UPDATE book SET summary = 'Lisbeth Salander is a wanted woman. Two journalists from Millennium magazine about to expose the truth about the sex trade in Sweden are brutally murdered, and Salander''s prints are on the weapon. Meanwhile, Blomkvist, editor-in-chief of Millennium, does not believe that she is guilty.', no_pages = 150 WHERE ISBN = '9781849163422';
UPDATE book SET summary = 'Summary of the Book', no_pages = 130 WHERE ISBN = '9781861976123';
UPDATE book SET summary = 'Why Don''t Penguins'' Feet Freeze? is the latest compilation of readers'' answers to the questions in the ''Last Word'' column of New Scientist, the world''s best-selling science weekly. Following the phenomenal success of Does Anything Eat Wasps? - the Christmas 2005 surprise bestseller - this new collection includes recent answers never before published in book form, and also old favourites from the column''s early days. Yet again, many seemingly simple questions turn out to have complex answers. And some that seem difficult have a very simple explanation. New Scientist''s ''Last Word'' is regularly voted the magazine''s most popular section as it celebrates all questions - the trivial, idiosyncratic, baffling and strange. This new selection of the best is popular science at its most entertaining and enlightening.', no_pages = 150 WHERE ISBN = '9781861978769';
UPDATE book SET summary = 'Summary of the Book', no_pages = 141 WHERE ISBN = '9781904233657';
UPDATE book SET summary = 'Summary of the Book', no_pages = 255 WHERE ISBN = '9781904233886';
UPDATE book SET summary = 'Bella?'' Edward''s soft voice came from behind me. I turned to see him spring lightly up the porch steps, his hair windblown from running. He pulled me into his arms at once, and kissed me again. His kiss frightened me. There was too much tension, too strong an edge to the way his lips crushed mine - like he was afraid we had only so much time left to us. As Seattle is ravaged by a string of mysterious killings and a malicious vampire continues her quest for revenge, Bella once again finds herself surrounded by danger. In the midst of it all, she is forced to choose between her love for Edward and her friendship with Jacob - knowing that her decision has the potential to ignite the ageless struggle between vampire and werewolf. With her graduation approaching, Bella has one more decision to make: life or death. But which is which? Following the international bestsellers Twilight and New Moon, Eclipse is the much-anticipated third book in Stephenie Meyer''s captivating saga of vampire romance.', no_pages = 628 WHERE ISBN = '9781904233916';
UPDATE book SET summary = 'Published this autumn Guinness World Records 2009 continues to build on the intriguing, informative, inspiring and instructional records and superlatives that have made Guinness World Records one of the most famous brands and books in the world. New features of the book include: Eye-catching ''sunburst'' holographic cover; 100 percent new photographs; 3D PHOTOGRAPHIC FEATURES!; A pair of 3D glasses to view more than 20 3-D photographs throughout the rest of the book; 60 percent new and updated records; Gatefold pages; New urban design; and New approaches to popular themes.', no_pages = 287 WHERE ISBN = '9781904994367';
UPDATE book SET summary = 'The 2010 edition of the most famous book of world records, including the top 100 record-breakers of the decade, and the "unbreakable" records that have never been beaten.', no_pages = 287 WHERE ISBN = '9781904994497';
UPDATE book SET summary = 'Twilight tempted the imagination ...New Moon made readers thirsty for more ...Eclipse turned the saga into a worldwide phenomenon ...And now the book that everyone has been waiting for ...Breaking Dawn. In the much anticipated fourth book in Stephenie Meyer''s love story, questions will be answered and the fate of Bella and Edward will be revealed. -- Publisher description.', no_pages = 756 WHERE ISBN = '9781905654284';
UPDATE category SET name = 'Crime' WHERE category_id = 1;
UPDATE category SET name = 'General Fiction' WHERE category_id = 4;
UPDATE category SET name = 'Fitness' WHERE category_id = 7;
UPDATE category SET name ='Romance' WHERE category_id = 10;
UPDATE category SET name ='Classics' WHERE category_id = 11;
UPDATE category SET name ='Dystopian' WHERE category_id = 12;
UPDATE category SET name ='Adventure' WHERE category_id = 13;
UPDATE category SET name ='Inspirational' WHERE category_id = 14;
UPDATE category SET name ='Magical Realism' WHERE category_id = 15;
UPDATE category SET name ='Science Fiction' WHERE category_id = 16;
UPDATE category SET name ='Historical' WHERE category_id = 17;
UPDATE category SET name ='Horror' WHERE category_id = 18;
UPDATE category SET name ='Poetry' WHERE category_id = 19;

INSERT INTO category (name) VALUES ('Thriller');
INSERT INTO book_to_category (ISBN, category_id) 
SELECT bc.ISBN,20 FROM book_to_category bc WHERE bc.category_id = 1;
INSERT INTO book_to_category (ISBN, category_id) 
SELECT bc.ISBN,13 FROM book_to_category bc WHERE bc.category_id = 1;
INSERT INTO category (name) VALUES ('Literary Fiction');
INSERT INTO book_to_category (ISBN, category_id) 
SELECT bc.ISBN,21 FROM book_to_category bc WHERE bc.category_id = 4;
INSERT INTO category (name) VALUES ('Diet');
INSERT INTO book_to_category (ISBN, category_id) 
SELECT bc.ISBN,22 FROM book_to_category bc WHERE bc.category_id = 7;
INSERT INTO category (name) VALUES ('Fiction');
INSERT INTO book_to_category (ISBN, category_id) 
SELECT bc.ISBN,23 FROM book_to_category bc WHERE bc.category_id >= 10 AND bc.category_id <= 18;
INSERT INTO category (name) VALUES ('Epic');
INSERT INTO book_to_category (ISBN, category_id) 
SELECT bc.ISBN,24 FROM book_to_category bc WHERE bc.category_id = 19;
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(6,'not so noice',2, 9780006498407);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(7,'noice',4, 9780006498407);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(8,'a little noice',3, 9780006498407);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(9,'noice',4, 9780006498407);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(10,'noice',4, 9780006498407);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(11,'not so noice',2, 9780007207329);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(12,'noice',4, 9780007207329);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(13,'a little noice',3, 9780007207329);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(14,'noice',4, 9780007207329);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(15,'noice',4, 9780007207329);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(16,'not so noice',2, 9780007156108);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(17,'noice',4, 9780007156108);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(18,'a little noice',3, 9780007156108);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(19,'noice',4, 9780007156108);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(20,'noice',4, 9780007156108);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(21,'not so noice',2, 9780060850524);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(22,'noice',4, 9780060850524);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(23,'a little noice',3, 9780060850524);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(24,'noice',4, 9780060850524);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(25,'noice',4, 9780060850524);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(26,'not so noice',2, 9780060913076);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(27,'noice',4, 9780060913076);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(28,'a little noice',3, 9780060913076);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(29,'noice',4, 9780060913076);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(30,'noice',4, 9780060913076);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(31,'not so noice',2, 9780060913077);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(32,'noice',4, 9780060913077);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(33,'a little noice',3, 9780060913077);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(34,'noice',4, 9780060913077);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(35,'noice',4, 9780060913077);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(36,'not so noice',2, 9780060935467);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(37,'noice',4, 9780060935467);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(38,'a little noice',3, 9780060935467);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(39,'noice',4, 9780060935467);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(40,'noice',4, 9780060935467);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(41,'not so noice',2, 9780061122415);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(42,'noice',4, 9780061122415);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(43,'a little noice',3, 9780061122415);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(44,'noice',4, 9780061122415);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(45,'noice',4, 9780061122415);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(46,'not noice',1, 9780061122416);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(47,'noice',4, 9780061122416);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(48,'a little noice',3, 9780061122416);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(49,'noice',4, 9780061122416);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(50,'noice',4, 9780061122416);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(51,'not noice',1, 9780062315007);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(52,'noice',4, 9780062315007);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(53,'a little noice',3, 9780062315007);
INSERT INTO review(user_id,review_text,rating,book_id)
VALUES(54,'very noice',5, 9780062315007);
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(56,'not noice',1, 9780091889487,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(57,'very noice',5, 9780091889487,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(58,'a little noice',3, 9780091889487,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(59,'noice',4, 9780091889487,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(60,'noice',4, 9780091889487,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(61,'not noice',1, 9780099387916,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(62,'noice',4, 9780099387916,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(63,'a little noice',3, 9780099387916,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(64,'very noice',5, 9780099387916,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(65,'very noice',5, 9780099387916,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(6,'not so noice',2, 9780099487821,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(7,'noice',4, 9780099487821,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(8,'a little noice',3, 9780099487821,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(9,'noice',4, 9780099487821,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(10,'noice',4, 9780099487821,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(11,'not so noice',2, 9780099429791,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(12,'noice',4, 9780099429791,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(13,'a little noice',3, 9780099429791,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(14,'noice',4, 9780099429791,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(15,'noice',4, 9780099429791,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(16,'not so noice',2, 9780099450252,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(17,'noice',4, 9780099450252,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(18,'a little noice',3, 9780099450252,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(19,'noice',4, 9780099450252,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(20,'noice',4, 9780099450252,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(21,'not so noice',2, 9780099464464,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(22,'noice',4, 9780099464464,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(23,'a little noice',3, 9780099464464,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(24,'noice',4, 9780099464464,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(25,'noice',4, 9780099464464,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(26,'not so noice',2, 9780099506928,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(27,'noice',4, 9780099506928,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(28,'a little noice',3, 9780099506928,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(29,'noice',4, 9780099506928,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(30,'noice',4, 9780099506928,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(31,'not so noice',2, 9780099771517,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(32,'noice',4, 9780099771517,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(33,'a little noice',3, 9780099771517,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(34,'noice',4, 9780099771517,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(35,'noice',4, 9780099771517,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(36,'not so noice',2, 9780140188592,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(37,'noice',4, 9780140188592,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(38,'a little noice',3, 9780140188592,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(39,'noice',4, 9780140188592,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(40,'noice',4, 9780140188592,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(41,'not so noice',2, 9780140237504,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(42,'noice',4, 9780140237504,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(43,'a little noice',3, 9780140237504,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(44,'noice',4, 9780140237504,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(45,'noice',4, 9780140237504,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(46,'not noice',1, 9780140276336,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(47,'noice',4, 9780140276336,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(48,'a little noice',3, 9780140276336,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(49,'noice',4, 9780140276336,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(50,'noice',4, 9780140276336,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(51,'not noice',1, 9780140449181,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(52,'noice',4, 9780140449181,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(53,'a little noice',3, 9780140449181,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(54,'very noice',5, 9780140449181,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(55,'noice',4, 9780140449181,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(56,'not noice',1, 9780140449266,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(57,'very noice',5, 9780140449266,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(58,'a little noice',3, 9780140449266,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(59,'noice',4, 9780140449266,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(60,'noice',4, 9780140449266,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(61,'not noice',1, 9780141011905,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(62,'noice',4, 9780141011905,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(63,'a little noice',3, 9780141011905,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(64,'very noice',5, 9780141011905,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(65,'very noice',5, 9780141011905,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(6,'not so noice',2, 9780141017891,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(7,'noice',4, 9780141017891,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(8,'a little noice',3, 9780141017891,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(9,'noice',4, 9780141017891,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(10,'noice',4, 9780141017891,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(11,'not so noice',2, 9780141019376,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(12,'noice',4, 9780141019376,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(13,'a little noice',3, 9780141019376,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(14,'noice',4, 9780141019376,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(15,'noice',4, 9780141019376,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(16,'not so noice',2, 9780141020525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(17,'noice',4, 9780141020525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(18,'a little noice',3, 9780141020525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(19,'noice',4, 9780141020525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(20,'noice',4, 9780141020525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(21,'not so noice',2, 9780141022925,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(22,'noice',4, 9780141022925,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(23,'a little noice',3, 9780141022925,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(24,'noice',4, 9780141022925,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(25,'noice',4, 9780141022925,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(26,'not so noice',2, 9780141030142,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(27,'noice',4, 9780141030142,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(28,'a little noice',3, 9780141030142,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(29,'noice',4, 9780141030142,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(30,'noice',4, 9780141030142,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(31,'not so noice',2, 9780141439563,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(32,'noice',4, 9780141439563,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(33,'a little noice',3, 9780141439563,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(34,'noice',4, 9780141439563,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(35,'noice',4, 9780141439563,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(36,'not so noice',2, 9780241003008,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(37,'noice',4, 9780241003008,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(38,'a little noice',3, 9780241003008,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(39,'noice',4, 9780241003008,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(40,'noice',4, 9780241003008,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(41,'not so noice',2, 9780316731317,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(42,'noice',4, 9780316731317,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(43,'a little noice',3, 9780316731317,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(44,'noice',4, 9780316731317,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(45,'noice',4, 9780316731317,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(46,'not noice',1, 9780330332774,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(47,'noice',4, 9780330332774,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(48,'a little noice',3, 9780330332774,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(49,'noice',4, 9780330332774,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(50,'noice',4, 9780330332774,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(51,'not noice',1, 9780330367356,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(52,'noice',4, 9780330367356,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(53,'a little noice',3, 9780330367356,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(54,'very noice',5, 9780330367356,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(55,'noice',4, 9780330367356,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(56,'not noice',1, 9780330448444,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(57,'very noice',5, 9780330448444,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(58,'a little noice',3, 9780330448444,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(59,'noice',4, 9780330448444,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(60,'noice',4, 9780330448444,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(61,'not noice',1, 9780330457729,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(62,'noice',4, 9780330457729,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(63,'a little noice',3, 9780330457729,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(64,'very noice',5, 9780330457729,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(65,'very noice',5, 9780330457729,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(6,'not so noice',2, 9780330507417,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(7,'noice',4, 9780330507417,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(8,'a little noice',3, 9780330507417,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(9,'noice',4, 9780330507417,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(10,'noice',4, 9780330507417,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(11,'not so noice',2, 9780349116754,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(12,'noice',4, 9780349116754,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(13,'a little noice',3, 9780349116754,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(14,'noice',4, 9780349116754,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(15,'noice',4, 9780349116754,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(16,'not so noice',2, 9780385721790,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(17,'noice',4, 9780385721790,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(18,'a little noice',3, 9780385721790,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(19,'noice',4, 9780385721790,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(20,'noice',4, 9780385721790,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(21,'not so noice',2, 9780439993586,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(22,'noice',4, 9780439993586,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(23,'a little noice',3, 9780439993586,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(24,'noice',4, 9780439993586,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(25,'noice',4, 9780439993586,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(26,'not so noice',2, 9780451524935,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(27,'noice',4, 9780451524935,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(28,'a little noice',3, 9780451524935,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(29,'noice',4, 9780451524935,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(30,'noice',4, 9780451524935,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(31,'not so noice',2, 9780451524936,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(32,'noice',4, 9780451524936,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(33,'a little noice',3, 9780451524936,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(34,'noice',4, 9780451524936,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(35,'noice',4, 9780451524936,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(36,'not so noice',2, 9780486280615,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(37,'noice',4, 9780486280615,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(38,'a little noice',3, 9780486280615,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(39,'noice',4, 9780486280615,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(40,'noice',4, 9780486280615,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(41,'not so noice',2, 9780547928227,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(42,'noice',4, 9780547928227,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(43,'a little noice',3, 9780547928227,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(44,'noice',4, 9780547928227,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(45,'noice',4, 9780547928227,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(46,'not noice',1, 9780552149525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(47,'noice',4, 9780552149525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(48,'a little noice',3, 9780552149525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(49,'noice',4, 9780552149525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(50,'noice',4, 9780552149525,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(51,'not noice',1, 9780552150736,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(52,'noice',4, 9780552150736,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(53,'a little noice',3, 9780552150736,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(54,'very noice',5, 9780552150736,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(55,'noice',4, 9780552150736,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(56,'not noice',1, 9780552151696,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(57,'very noice',5, 9780552151696,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(58,'a little noice',3, 9780552151696,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(59,'noice',4, 9780552151696,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(60,'noice',4, 9780552151696,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(61,'not noice',1, 9780552151764,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(62,'noice',4, 9780552151764,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(63,'a little noice',3, 9780552151764,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(64,'very noice',5, 9780552151764,'accepted');
INSERT INTO review(user_id,review_text,rating,book_id,review_status)
VALUES(65,'very noice',5, 9780552151764,'accepted');
call Add_Author2Book(9781847670946,'Katsikopoulos, Konstantinos');
call Add_Author2Book(9780552772747, 'Rozos, Marios');
call Add_Author2Book(9780552772747, 'Katsikopoulos, Konstantinos');
call Add_Author2Book(9780552772747, 'Malos, Vassilis');
call Add_Author2Book(9780007232741, 'Rozos, Marios');
call Add_Author2Book(9780007156108, 'Malos, Vassilis');
call Add_Author2Book(9780099450252, 'Rozos, Marios');
call Add_Author2Book(9780099464464, 'Malos, Vassilis');
call Add_Author2Book(9780140188592, 'Katsikopoulos, Konstantinos');

-- multiple overdue-returned book
INSERT INTO checkout (checkout_time, return_time, book_copy_id, user_id, checkout_status)
VALUES
('2019-09-13', '2019-09-23', 51, 10, 'overdue-returned'),
('2019-09-13', '2019-09-23', 52, 11, 'overdue-returned'),
('2019-09-13', '2019-09-23', 53, 12, 'overdue-returned'),
('2019-09-13', '2019-09-23', 54, 13, 'overdue-returned'),
('2019-09-13', '2019-09-23', 55, 14, 'overdue-returned'),
('2019-09-13', '2019-09-23', 56, 15, 'overdue-returned'),
('2019-09-13', '2019-09-23', 57, 16, 'overdue-returned'),
('2019-09-13', '2019-09-23', 58, 17, 'overdue-returned'),
('2019-09-13', '2019-09-23', 59, 18, 'overdue-returned'),
('2019-09-13', '2019-09-23', 60, 19, 'overdue-returned'),
('2019-09-13', '2019-09-23', 61, 20, 'overdue-returned'),
('2019-09-13', '2019-09-23', 62, 21, 'overdue-returned'),
('2019-09-13', '2019-09-23', 63, 22, 'overdue-returned'),
('2019-09-13', '2019-09-23', 64, 23, 'overdue-returned'),
('2019-09-13', '2019-09-23', 65, 24, 'overdue-returned'),
('2019-09-13', '2019-09-23', 66, 25, 'overdue-returned'),
('2019-09-13', '2019-09-23', 67, 26, 'overdue-returned'),
('2019-09-13', '2019-09-23', 68, 27, 'overdue-returned'),
('2019-09-13', '2019-09-23', 69, 28, 'overdue-returned'),
('2019-09-13', '2019-09-23', 70, 29, 'overdue-returned'),
('2019-09-13', '2019-09-23', 71, 30, 'overdue-returned'),
('2019-09-13', '2019-09-23', 72, 31, 'overdue-returned'),
('2019-09-13', '2019-09-23', 73, 32, 'overdue-returned'),
('2019-09-13', '2019-09-23', 74, 33, 'overdue-returned'),
('2019-09-13', '2019-09-23', 75, 34, 'overdue-returned'),
('2019-09-13', '2019-09-23', 76, 35, 'overdue-returned'),
('2019-09-13', '2019-09-23', 77, 36, 'overdue-returned'),
('2019-09-20', '2019-09-29', 78, 37, 'overdue-returned'),
('2019-09-20', '2019-09-29', 79, 38, 'overdue-returned'),
('2019-09-20', '2019-09-29', 80, 39, 'overdue-returned'),
('2019-09-20', '2019-09-29', 81, 40, 'overdue-returned'),
('2019-09-20', '2019-09-29', 82, 41, 'overdue-returned'),
('2019-09-20', '2019-09-29', 83, 42, 'overdue-returned'),
('2019-09-20', '2019-09-29', 84, 43, 'overdue-returned'),
('2019-09-20', '2019-09-29', 85, 44, 'overdue-returned'),
('2019-09-20', '2019-09-29', 86, 45, 'overdue-returned'),
('2019-09-20', '2019-09-29', 87, 46, 'overdue-returned'),
('2019-09-20', '2019-09-29', 88, 47, 'overdue-returned'),
('2019-09-20', '2019-09-29', 89, 48, 'overdue-returned'),
('2019-09-20', '2019-09-29', 90, 49, 'overdue-returned'),
('2019-09-20', '2019-09-29', 91, 50, 'overdue-returned'),
('2019-09-20', '2019-09-29', 92, 51, 'overdue-returned'),
('2018-09-20', '2018-09-29', 93, 52, 'overdue-returned'),
('2018-09-20', '2018-09-29', 94, 53, 'overdue-returned'),
('2018-09-20', '2018-09-29', 95, 54, 'overdue-returned'),
('2018-09-20', '2018-09-29', 96, 55, 'overdue-returned'),
('2018-09-20', '2018-09-29', 97, 56, 'overdue-returned'),
('2018-09-20', '2018-09-29', 98, 57, 'overdue-returned'),
('2018-09-20', '2018-09-29', 99, 58, 'overdue-returned'),
('2018-09-20', '2018-09-29', 100, 59, 'overdue-returned'),
('2018-09-20', '2018-09-29', 101, 60, 'overdue-returned'),
('2018-09-20', '2018-09-29', 102, 61, 'overdue-returned'),
('2018-09-20', '2018-09-29', 103, 62, 'overdue-returned'),
('2018-09-20', '2018-09-29', 104, 63, 'overdue-returned'),
('2018-09-20', '2018-09-29', 105, 64, 'overdue-returned'),
('2018-09-20', '2018-09-29', 106, 65, 'overdue-returned'),
('2018-09-20', '2018-09-29', 107, 66, 'overdue-returned'),
('2018-09-20', '2018-09-29', 108, 67, 'overdue-returned'),
('2018-09-20', '2018-09-29', 109, 68, 'overdue-returned'),
('2018-09-20', '2018-09-29', 110, 69, 'overdue-returned'),
('2018-09-20', '2018-09-29', 111, 70, 'overdue-returned'),
('2018-09-20', '2018-09-29', 112, 71, 'overdue-returned'),
('2018-09-20', '2018-09-29', 113, 72, 'overdue-returned'),
('2018-09-20', '2018-09-29', 114, 73, 'overdue-returned'),
('2018-09-20', '2018-09-29', 115, 74, 'overdue-returned'),
('2018-09-20', '2018-09-29', 116, 75, 'overdue-returned'),
('2018-09-20', '2018-09-29', 117, 76, 'overdue-returned'),
('2018-09-20', '2018-09-29', 118, 77, 'overdue-returned'),
('2018-09-20', '2018-09-29', 119, 78, 'overdue-returned'),
('2018-09-20', '2018-09-29', 120, 79, 'overdue-returned'),
('2018-09-20', '2018-09-29', 121, 80, 'overdue-returned'),
('2018-09-20', '2018-09-29', 122, 81, 'overdue-returned'),
('2018-09-20', '2018-09-29', 123, 82, 'overdue-returned'),
('2018-09-20', '2018-09-29', 124, 83, 'overdue-returned'),
('2019-09-12','2019-09-20', 100, 84,'overdue-returned'),
('2019-09-12','2019-09-20', 101, 85,'overdue-returned'),
('2019-09-12','2019-09-20', 102, 86,'overdue-returned'),
('2019-09-12','2019-09-20', 103, 87,'overdue-returned'),
('2019-09-12','2019-09-20', 104, 88,'overdue-returned'),
('2019-09-12','2019-09-20', 105, 89,'overdue-returned'),
('2019-09-12','2019-09-20', 106, 90,'overdue-returned'),
('2019-09-12','2019-09-20', 107, 91,'overdue-returned'),
('2019-09-12','2019-09-20', 108, 92,'overdue-returned'),
('2019-09-12','2019-09-20', 109, 93,'overdue-returned'),
('2019-09-12','2019-09-20', 110, 94,'overdue-returned'),
('2019-09-12','2019-09-20', 111, 95,'overdue-returned'),
('2019-09-12','2019-09-20', 112, 96,'overdue-returned'),
('2019-09-12','2019-09-20', 113, 97,'overdue-returned'),
('2019-09-12','2019-09-20', 114, 98,'overdue-returned'),
('2018-09-12','2018-09-20', 115, 99,'overdue-returned'),
('2018-09-12','2018-09-20', 116, 100,'overdue-returned'),
('2018-09-12','2018-09-20', 117, 101,'overdue-returned'),
('2018-09-12','2018-09-20', 118, 102,'overdue-returned'),
('2018-09-12','2018-09-20', 119, 103,'overdue-returned'),
('2018-09-12','2018-09-20', 120, 104,'overdue-returned'),
('2018-09-12','2018-09-20', 121, 105,'overdue-returned'),
('2018-09-12','2018-09-20', 122, 106,'overdue-returned'),
('2018-09-12','2018-09-20', 123, 107,'overdue-returned'),
('2018-09-12','2018-09-20', 124, 108,'overdue-returned'),
('2018-09-12','2018-09-20', 125, 109,'overdue-returned'),
('2018-09-12','2018-09-20', 126, 110,'overdue-returned'),
('2018-09-12','2018-09-20', 127, 111,'overdue-returned'),
('2018-09-12','2018-09-20', 128, 112,'overdue-returned'),
('2018-09-12','2018-09-20', 129, 113,'overdue-returned'),
('2018-09-12','2018-09-20', 130, 114,'overdue-returned'),
('2018-09-12','2018-09-20', 131, 115,'overdue-returned'),
('2018-09-12','2018-09-20', 132, 116,'overdue-returned'),
('2018-09-12','2018-09-20', 133, 117,'overdue-returned'),
('2018-09-12','2018-09-20', 134, 118,'overdue-returned'),
('2018-09-12','2018-09-20', 135, 119,'overdue-returned'),
('2018-09-12','2018-09-20', 136, 120,'overdue-returned'),
('2018-09-12','2018-09-20', 137, 52,'overdue-returned'),
('2018-09-12','2018-09-20', 138, 53,'overdue-returned'),
('2018-09-12','2018-09-20', 139, 54,'overdue-returned'),
('2018-09-12','2018-09-20', 140, 55,'overdue-returned'),
('2018-09-12','2018-09-20', 141, 56,'overdue-returned'),
('2018-09-12','2018-09-20', 142, 57,'overdue-returned'),
('2018-09-12','2018-09-20', 143, 58,'overdue-returned'),
('2018-09-12','2018-09-20', 144, 59,'overdue-returned'),
('2018-09-12','2018-09-20', 145, 60,'overdue-returned'),
('2018-09-12','2018-09-20', 146, 61,'overdue-returned'),
('2018-09-12','2018-09-20', 147, 62,'overdue-returned'),
('2018-09-12','2018-09-20', 148, 63,'overdue-returned'),
('2018-09-12','2018-09-20', 149, 64,'overdue-returned'),
('2018-09-12','2018-09-20', 150, 65,'overdue-returned'),
('2018-09-12','2018-09-20', 151, 66,'overdue-returned'),
('2018-09-12','2018-09-20', 152, 67,'overdue-returned'),
('2018-09-12','2018-09-20', 153, 68,'overdue-returned'),
('2018-09-12','2018-09-20', 154, 69,'overdue-returned'),
('2018-09-12','2018-09-20', 155, 70,'overdue-returned'),
('2018-09-12','2018-09-20', 156, 27,'overdue-returned');


-- multiple returned books for students
INSERT INTO checkout (checkout_time,return_time, book_copy_id, user_id,checkout_status)
VALUES
('2019-07-13','2019-07-15', 39, 32,'returned'),
('2019-07-13','2019-07-15', 40, 33,'returned'),
('2019-07-13','2019-07-15', 41, 34,'returned'),
('2019-07-13','2019-07-15', 41, 35,'returned'),
('2019-07-13','2019-07-15', 12, 35,'returned'),
('2019-07-13','2019-07-15', 13, 36,'returned'),
('2019-07-13','2019-07-15', 14, 37,'returned'),
('2019-07-13','2019-07-15', 15, 38,'returned'),
('2019-07-13','2019-07-15', 16, 38,'returned'),
('2019-07-13','2019-07-15', 17, 39,'returned'),
('2019-07-13','2019-07-15', 18, 40,'returned'),
('2019-07-13','2019-07-15', 19, 41,'returned'),
('2019-07-13','2019-07-15', 20, 42,'returned'),
('2019-07-13','2019-07-15', 21, 43,'returned'),
('2019-07-13','2019-07-15', 22, 44,'returned'),
('2019-07-13','2019-07-15', 23, 45,'returned'),
('2019-07-13','2019-07-15', 24, 46,'returned'),
('2019-07-13','2019-07-15', 25, 47,'returned'),
('2019-07-13','2019-07-15', 26, 48,'returned'),
('2019-07-13','2019-07-15', 26, 49,'returned'),
('2019-07-13','2019-07-15', 27, 50,'returned'),
('2019-07-13','2019-07-15', 28, 51,'returned'),
('2019-07-13','2019-07-15', 29, 52,'returned'),
('2019-07-13','2019-07-15', 30, 53,'returned'),
('2019-07-13','2019-07-15', 31, 54,'returned'),
('2019-07-13','2019-07-15', 32, 55,'returned'),
('2019-07-13','2019-07-15', 33, 56,'returned'),
('2019-07-13','2019-07-15', 34, 57,'returned'),
('2019-07-13','2019-07-15', 35, 58,'returned'),
('2019-07-13','2019-07-15', 36, 59,'returned'),
('2019-07-13','2019-07-15', 37, 60,'returned'),
('2019-07-13','2019-07-15', 38, 61,'returned'),
('2019-07-13','2019-07-15', 39, 62,'returned'),
('2019-07-13','2019-07-15', 30, 63,'returned'),
('2019-07-13','2019-07-15', 31, 64,'returned'),
('2019-07-13','2019-07-15', 32, 65,'returned'),
('2019-07-13','2019-07-15', 33, 66,'returned'),
('2019-07-13','2019-07-15', 34, 67,'returned'),
('2019-07-13','2019-07-15', 35, 68,'returned'),
('2019-07-13','2019-07-15', 36, 69,'returned'),
('2019-07-13','2019-07-15', 37, 70,'returned'),
('2019-07-13','2019-07-15', 38, 27,'returned'),
('2018-07-13','2018-07-15', 39, 32,'returned'),
('2018-07-13','2018-07-15', 40, 33,'returned'),
('2018-07-13','2018-07-15', 41, 34,'returned'),
('2018-07-13','2018-07-15', 41, 35,'returned'),
('2018-07-13','2018-07-15', 12, 35,'returned'),
('2018-07-13','2018-07-15', 13, 36,'returned'),
('2018-07-13','2018-07-15', 14, 37,'returned'),
('2018-07-13','2018-07-15', 15, 38,'returned'),
('2018-07-13','2018-07-15', 16, 38,'returned'),
('2018-07-13','2018-07-15', 17, 39,'returned'),
('2018-07-13','2018-07-15', 18, 40,'returned'),
('2018-07-13','2018-07-15', 19, 41,'returned'),
('2018-07-13','2018-07-15', 20, 42,'returned'),
('2018-07-13','2018-07-15', 21, 43,'returned'),
('2018-07-13','2018-07-15', 22, 44,'returned'),
('2018-07-13','2018-07-15', 23, 45,'returned'),
('2018-07-13','2018-07-15', 24, 46,'returned'),
('2018-07-13','2018-07-15', 25, 47,'returned'),
('2018-07-13','2018-07-15', 26, 48,'returned'),
('2018-07-13','2018-07-15', 26, 49,'returned'),
('2018-07-13','2018-07-15', 27, 50,'returned'),
('2018-07-13','2018-07-15', 28, 51,'returned'),
('2018-07-13','2018-07-15', 29, 52,'returned'),
('2018-07-13','2018-07-15', 30, 53,'returned'),
('2018-07-13','2018-07-15', 31, 54,'returned'),
('2018-07-13','2018-07-15', 32, 55,'returned'),
('2018-07-13','2018-07-15', 33, 56,'returned'),
('2018-07-13','2018-07-15', 34, 57,'returned'),
('2018-07-13','2018-07-15', 35, 58,'returned'),
('2018-07-13','2018-07-15', 36, 59,'returned'),
('2018-07-13','2018-07-15', 37, 60,'returned'),
('2018-07-13','2018-07-15', 38, 61,'returned'),
('2018-07-13','2018-07-15', 39, 62,'returned'),
('2018-07-13','2018-07-15', 30, 63,'returned'),
('2018-07-13','2018-07-15', 31, 64,'returned'),
('2018-07-13','2018-07-15', 32, 65,'returned'),
('2018-07-13','2018-07-15', 33, 66,'returned'),
('2018-07-13','2018-07-15', 34, 67,'returned'),
('2018-07-13','2018-07-15', 35, 68,'returned'),
('2018-07-13','2018-07-15', 36, 69,'returned'),
('2018-07-13','2018-07-15', 37, 70,'returned'),
('2018-07-13','2018-07-15', 38, 27,'returned');
-- mupliple returned checkouts for teachers
INSERT INTO checkout (checkout_time,return_time, book_copy_id, user_id,checkout_status)
VALUES
('2022-01-10','2022-01-15', 1, 6,'returned'),
('2022-02-10','2022-02-15', 1, 6,'returned'),
('2022-01-10','2022-01-15', 1, 7,'returned'),
('2022-01-10','2022-01-15', 1, 8,'returned'),
('2022-01-10','2022-01-15', 2, 8,'returned'),
('2022-01-10','2022-01-15', 3, 9,'returned'),
('2022-01-10','2022-01-15', 4, 9,'returned'),
('2022-01-10','2022-01-15', 5, 10,'returned'),
('2022-01-10','2022-01-15', 6, 10,'returned'),
('2022-01-10','2022-01-15', 7, 11,'returned'),
('2022-01-10','2022-01-15', 8, 11,'returned'),
('2022-01-10','2022-01-15', 9, 12,'returned'),
('2022-01-10','2022-01-15', 10, 12,'returned'),
('2022-01-10','2022-01-15', 11, 13,'returned'),
('2022-01-10','2022-01-15', 12, 13,'returned'),
('2022-01-10','2022-01-15', 13, 14,'returned'),
('2022-01-10','2022-01-15', 13, 14,'returned'),
('2022-01-10','2022-01-15', 14, 15,'returned'),
('2022-01-10','2022-01-15', 15, 15,'returned'),
('2022-01-10','2022-01-15', 16, 16,'returned'),
('2022-01-10','2022-01-15', 17, 16,'returned'),
('2022-01-10','2022-01-15', 18, 17,'returned'),
('2022-01-10','2022-01-15', 19, 18,'returned'),
('2022-01-10','2022-01-15', 20, 19,'returned'),
('2022-01-10','2022-01-15', 21, 19,'returned'),
('2022-01-10','2022-01-15', 22, 20,'returned'),
('2022-01-10','2022-01-15', 23, 20,'returned'),
('2022-01-10','2022-01-15', 24, 21,'returned'),
('2022-01-10','2022-01-15', 25, 21,'returned'),
('2022-01-10','2022-01-15', 26, 22,'returned'),
('2022-01-10','2022-01-15', 27, 22,'returned'),
('2022-01-10','2022-01-15', 28, 23,'returned'),
('2022-01-10','2022-01-15', 29, 23,'returned'),
('2022-01-10','2022-01-15', 30, 24,'returned'),
('2022-01-10','2022-01-15', 31, 24,'returned'),
('2022-01-10','2022-01-15', 32, 24,'returned'),
('2022-01-10','2022-01-15', 33, 24,'returned'),
('2022-01-10','2022-01-15', 34, 25,'returned'),
('2022-01-10','2022-01-15', 35, 25,'returned'),
('2022-01-10','2022-01-15', 36, 26,'returned'),
('2022-01-10','2022-01-15', 37, 26,'returned'),
('2022-01-10','2022-01-15', 38, 27,'returned'),
('2021-01-10','2021-01-15', 39, 6,'returned'),
('2021-01-10','2021-01-15', 40, 6,'returned'),
('2021-01-10','2021-01-15', 41, 7,'returned'),
('2021-01-10','2021-01-15', 41, 8,'returned'),
('2021-01-10','2021-01-15', 12, 8,'returned'),
('2021-01-10','2021-01-15', 13, 9,'returned'),
('2021-01-10','2021-01-15', 14, 9,'returned'),
('2021-01-10','2021-01-15', 15, 10,'returned'),
('2021-01-10','2021-01-15', 16, 10,'returned'),
('2021-01-10','2021-01-15', 17, 11,'returned'),
('2021-01-10','2021-01-15', 18, 11,'returned'),
('2021-01-10','2021-01-15', 19, 12,'returned'),
('2021-01-10','2021-01-15', 20, 12,'returned'),
('2021-01-10','2021-01-15', 21, 13,'returned'),
('2021-01-10','2021-01-15', 22, 13,'returned'),
('2021-01-10','2021-01-15', 23, 14,'returned'),
('2021-01-10','2021-01-15', 24, 14,'returned'),
('2021-01-10','2021-01-15', 25, 15,'returned'),
('2021-01-10','2021-01-15', 26, 15,'returned'),
('2021-01-10','2021-01-15', 26, 16,'returned'),
('2021-01-10','2021-01-15', 27, 16,'returned'),
('2021-01-10','2021-01-15', 28, 17,'returned'),
('2021-01-10','2021-01-15', 29, 18,'returned'),
('2021-01-10','2021-01-15', 30, 19,'returned'),
('2021-01-10','2021-01-15', 31, 19,'returned'),
('2021-01-10','2021-01-15', 32, 20,'returned'),
('2021-01-10','2021-01-15', 33, 20,'returned'),
('2021-01-10','2021-01-15', 34, 21,'returned'),
('2021-01-10','2021-01-15', 35, 21,'returned'),
('2021-01-10','2021-01-15', 36, 22,'returned'),
('2021-01-10','2021-01-15', 37, 22,'returned'),
('2021-01-10','2021-01-15', 38, 23,'returned'),
('2021-01-10','2021-01-15', 39, 23,'returned'),
('2021-01-10','2021-01-15', 30, 24,'returned'),
('2021-01-10','2021-01-15', 31, 24,'returned'),
('2021-01-10','2021-01-15', 32, 24,'returned'),
('2021-01-10','2021-01-15', 33, 24,'returned'),
('2021-01-10','2021-01-15', 34, 25,'returned'),
('2021-01-10','2021-01-15', 35, 25,'returned'),
('2021-01-10','2021-01-15', 36, 26,'returned'),
('2021-01-10','2021-01-15', 37, 26,'returned'),
('2021-01-10','2021-01-15', 38, 27,'returned'),
('2020-01-10','2020-01-15', 39, 6,'returned'),
('2020-01-10','2020-01-15', 40, 6,'returned'),
('2020-01-10','2020-01-15', 41, 7,'returned'),
('2020-01-10','2020-01-15', 41, 8,'returned'),
('2020-01-10','2020-01-15', 12, 8,'returned'),
('2020-01-10','2020-01-15', 13, 9,'returned'),
('2020-01-10','2020-01-15', 14, 9,'returned'),
('2020-01-10','2020-01-15', 15, 10,'returned'),
('2020-01-10','2020-01-15', 16, 10,'returned'),
('2020-01-10','2020-01-15', 17, 11,'returned'),
('2020-01-10','2020-01-15', 18, 11,'returned'),
('2020-01-10','2020-01-15', 19, 12,'returned'),
('2020-01-10','2020-01-15', 20, 12,'returned'),
('2020-01-10','2020-01-15', 21, 13,'returned'),
('2020-01-10','2020-01-15', 22, 13,'returned'),
('2020-01-10','2020-01-15', 23, 14,'returned'),
('2020-01-10','2020-01-15', 24, 14,'returned'),
('2020-01-10','2020-01-15', 25, 15,'returned'),
('2020-01-10','2020-01-15', 26, 15,'returned'),
('2020-01-10','2020-01-15', 26, 16,'returned'),
('2020-01-10','2020-01-15', 27, 16,'returned'),
('2020-01-10','2020-01-15', 28, 17,'returned'),
('2020-01-10','2020-01-15', 29, 18,'returned'),
('2020-01-10','2020-01-15', 30, 19,'returned'),
('2020-01-10','2020-01-15', 31, 19,'returned'),
('2020-01-10','2020-01-15', 32, 20,'returned'),
('2020-01-10','2020-01-15', 33, 20,'returned'),
('2020-01-10','2020-01-15', 34, 21,'returned'),
('2020-01-10','2020-01-15', 35, 21,'returned'),
('2020-01-10','2020-01-15', 36, 22,'returned'),
('2020-01-10','2020-01-15', 37, 22,'returned'),
('2020-01-10','2020-01-15', 38, 23,'returned'),
('2020-01-10','2020-01-15', 39, 23,'returned'),
('2020-01-10','2020-01-15', 30, 24,'returned'),
('2020-01-10','2020-01-15', 31, 24,'returned'),
('2020-01-10','2020-01-15', 32, 24,'returned'),
('2020-01-10','2020-01-15', 33, 24,'returned'),
('2020-01-10','2020-01-15', 34, 25,'returned'),
('2020-01-10','2020-01-15', 35, 25,'returned'),
('2020-01-10','2020-01-15', 36, 26,'returned'),
('2020-01-10','2020-01-15', 37, 26,'returned'),
('2020-01-10','2020-01-15', 38, 27,'returned'),
('2019-01-10','2019-01-15', 39, 6,'returned'),
('2019-01-10','2019-01-15', 40, 6,'returned'),
('2019-01-10','2019-01-15', 41, 7,'returned'),
('2019-01-10','2019-01-15', 41, 8,'returned'),
('2019-01-10','2019-01-15', 12, 8,'returned'),
('2019-01-10','2019-01-15', 13, 9,'returned'),
('2019-01-10','2019-01-15', 14, 9,'returned'),
('2019-01-10','2019-01-15', 15, 10,'returned'),
('2019-01-10','2019-01-15', 16, 10,'returned'),
('2019-01-10','2019-01-15', 17, 11,'returned'),
('2019-01-10','2019-01-15', 18, 11,'returned'),
('2019-01-10','2019-01-15', 19, 12,'returned'),
('2019-01-10','2019-01-15', 20, 12,'returned'),
('2019-01-10','2019-01-15', 21, 13,'returned'),
('2019-01-10','2019-01-15', 22, 13,'returned'),
('2019-01-10','2019-01-15', 23, 14,'returned'),
('2019-01-10','2019-01-15', 24, 14,'returned'),
('2019-01-10','2019-01-15', 25, 15,'returned'),
('2019-01-10','2019-01-15', 26, 15,'returned'),
('2019-01-10','2019-01-15', 26, 16,'returned'),
('2019-01-10','2019-01-15', 27, 16,'returned'),
('2019-01-10','2019-01-15', 28, 17,'returned'),
('2019-01-10','2019-01-15', 29, 18,'returned'),
('2019-01-10','2019-01-15', 30, 19,'returned'),
('2019-01-10','2019-01-15', 31, 19,'returned'),
('2019-01-10','2019-01-15', 32, 20,'returned'),
('2019-01-10','2019-01-15', 33, 20,'returned'),
('2019-01-10','2019-01-15', 34, 21,'returned'),
('2019-01-10','2019-01-15', 35, 21,'returned'),
('2019-01-10','2019-01-15', 36, 22,'returned'),
('2019-01-10','2019-01-15', 37, 22,'returned'),
('2019-01-10','2019-01-15', 38, 23,'returned'),
('2019-01-10','2019-01-15', 39, 23,'returned'),
('2019-01-10','2019-01-15', 30, 24,'returned'),
('2019-01-10','2019-01-15', 31, 24,'returned'),
('2019-01-10','2019-01-15', 32, 24,'returned'),
('2019-01-10','2019-01-15', 33, 24,'returned'),
('2019-01-10','2019-01-15', 34, 25,'returned'),
('2019-01-10','2019-01-15', 35, 25,'returned'),
('2019-01-10','2019-01-15', 36, 26,'returned'),
('2019-01-10','2019-01-15', 37, 26,'returned'),
('2019-01-10','2019-01-15', 38, 27,'returned');


-- για το κουιρι 3.1.5
INSERT INTO checkout (checkout_time,return_time, book_copy_id, user_id,checkout_status)
VALUES
('2023-01-10','2023-01-15', 1, 138,'returned'),
('2023-01-10','2023-01-15', 1, 138,'returned'),
('2023-01-10','2023-01-15', 1, 139,'returned'),
('2023-01-10','2023-01-15', 1, 140,'returned'),
('2023-01-10','2023-01-15', 2, 140,'returned'),
('2023-01-10','2023-01-15', 3, 141,'returned'),
('2023-01-10','2023-01-15', 4, 141,'returned'),
('2023-01-10','2023-01-15', 5, 142,'returned'),
('2023-01-10','2023-01-15', 6, 142,'returned'),
('2023-01-10','2023-01-15', 7, 143,'returned'),
('2023-01-10','2023-01-15', 8, 143,'returned'),
('2023-01-10','2023-01-15', 9, 144,'returned'),
('2023-01-10','2023-01-15', 10, 144,'returned'),
('2023-01-10','2023-01-15', 11, 145,'returned'),
('2023-01-10','2023-01-15', 12, 145,'returned'),
('2023-01-10','2023-01-15', 13, 146,'returned'),
('2023-01-10','2023-01-15', 13, 146,'returned'),
('2023-01-10','2023-01-15', 14, 147,'returned'),
('2023-01-10','2023-01-15', 15, 147,'returned'),
('2023-01-10','2023-01-15', 16, 148,'returned'),
('2023-01-10','2023-01-15', 17, 148,'returned'),
('2023-01-10','2023-01-15', 18, 125,'returned'),
('2023-01-10','2023-01-15', 19, 126,'returned'),
('2023-01-10','2023-01-15', 20, 127,'returned'),
('2023-01-10','2023-01-15', 21, 127,'returned'),
('2023-01-10','2023-01-15', 22, 128,'returned'),
('2023-01-10','2023-01-15', 23, 128,'returned'),
('2023-01-10','2023-01-15', 24, 129,'returned'),
('2023-01-10','2023-01-15', 25, 129,'returned'),
('2023-01-10','2023-01-15', 26, 130,'returned'),
('2023-01-10','2023-01-15', 27, 130,'returned'),
('2023-01-10','2023-01-15', 28, 131,'returned'),
('2023-01-10','2023-01-15', 29, 131,'returned'),
('2023-01-10','2023-01-15', 30, 132,'returned'),
('2023-01-10','2023-01-15', 31, 132,'returned'),
('2023-01-10','2023-01-15', 32, 133,'returned'),
('2023-01-10','2023-01-15', 33, 133,'returned'),
('2023-01-10','2023-01-15', 34, 134,'returned'),
('2023-01-10','2023-01-15', 35, 134,'returned'),
('2023-01-10','2023-01-15', 36, 135,'returned'),
('2023-01-10','2023-01-15', 37, 135,'returned'),
('2023-01-10','2023-01-15', 38, 136,'returned');

INSERT INTO checkout (checkout_time, book_copy_id, user_id)
VALUES
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 39, 20),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 40, 30),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 41, 31),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 42, 32),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 43, 39),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 44, 42),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 45, 43),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 46, 77),
(DATE_ADD(current_timestamp(),INTERVAL -16 DAY), 47, 23),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 48, 33),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 49, 34),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 50, 40),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 51, 49),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 52, 50),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 53, 26),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 54, 90),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 55, 58),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 56, 59),
(DATE_ADD(current_timestamp(),INTERVAL -2 DAY), 57, 61),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 58, 88),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 59, 29),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 60, 37),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 61, 38),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 62, 38),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 63, 69),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 64, 70),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 65, 103),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 66, 104),
(DATE_ADD(current_timestamp(),INTERVAL -1 DAY), 67, 114),
(current_timestamp(), 68, 124),
(current_timestamp(), 69, 104),
(current_timestamp(), 70, 108),
(current_timestamp(), 71, 68),
(current_timestamp(), 72, 65),
(current_timestamp(), 73, 66),
(current_timestamp(), 74, 123),
(current_timestamp(), 75, 123),
(current_timestamp(), 76, 116),
(current_timestamp(), 77, 116),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 78, 115),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 79, 115),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 80, 92),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 81, 92),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 82, 93),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 83, 95),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 84, 95),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 86, 36),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 87, 41),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 87, 57),
(DATE_ADD(current_timestamp(),INTERVAL -4 DAY), 87, 58);

-- active checkouts
INSERT INTO checkout (checkout_time, book_copy_id, user_id)
VALUES
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 10, 80),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 11, 81),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 12, 82),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 13, 33),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 14, 34),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 15, 35),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 16, 36),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 17, 37),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 18, 87),
(DATE_ADD(current_timestamp(), INTERVAL -2 DAY), 19, 83),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 20, 40),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 21, 41),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 22, 84),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 23, 85),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 24, 44),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 25, 45),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 26, 46),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 27, 47),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 28, 48),
(DATE_ADD(current_timestamp(), INTERVAL -1 DAY), 29, 49),
(current_timestamp(), 30, 50),
(current_timestamp(), 31, 51),
(current_timestamp(), 32, 52),
(current_timestamp(), 33, 53),
(current_timestamp(), 34, 54),
(current_timestamp(), 35, 55),
(current_timestamp(), 36, 56),
(current_timestamp(), 37, 57),
(current_timestamp(), 38, 91),
(current_timestamp(), 39, 59),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 40, 60),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 41, 61),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 42, 73),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 43, 63),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 44, 64),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 45, 72),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 46, 66),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 47, 71),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 48, 68),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 49, 69),
(DATE_ADD(current_timestamp(), INTERVAL -4 DAY), 50, 101);
