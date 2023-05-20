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

