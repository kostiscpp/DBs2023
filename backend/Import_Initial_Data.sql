ALTER TABLE school AUTO_INCREMENT = 0;
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
INSERT INTO `user` (first_name,surname,username,pwd,birth_date,email,school_id,status,`role`,profile,barcode) VALUES
	 ('Αδμίνος','Α.','admin','pwd!','500-12-07','adminos@gmail.com',1,'active','admin','https://i.insider.com/602ee9ced3ad27001837f2ac?width=1000&format=jpeg&auto=webp','-42'),
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
-- Create random no_pages per book
-- lpad(rand() * 1000000, 3, '0') -- Random 3digits
INSERT INTO book_copy (book_id, school_id) 
VALUES
('9780552149518','2'),
('9780747532743','2'),
('9780747538486','2'),
('9780552150736','2'),
('9780747551003','2'),
('9780747581086','2'),
('9780747591054','2'),
('9780747546290','2'),
('9781904233657','2'),
('9780747550990','2'),
('9780552151764','2'),
('9781904233886','2'),
('9780330457729','2'),
('9780552151696','2'),
('9780099450252','2'),
('9781904233916','2'),
('9781847245458','2'),
('9780747566533','2'),
('9780099464464','2'),
('9780141017891','2'),
('9780099429791','2'),
('9780593054277','2'),
('9780552997041','2'),
('9781905654284','2'),
('9780747546245','2'),
('9780747591061','2'),
('9781849163422','2'),
('9780752837505','2'),
('9780349116754','2'),
('9780718147655','2'),
('9780006512134','2'),
('9780099387916','2'),
('9780752877327','2'),
('9780755309511','2'),
('9781841953922','2'),
('9780091889487','2'),
('9780747599876','2'),
('9780749397548','2'),
('9780563384304','2'),
('9780330507417','2'),
('9781861976123','3'),
('9780590660549','3'),
('9780755331420','3'),
('9781849162746','3'),
('9780330367356','3'),
('9780141020525','3'),
('9780722532935','3'),
('9780552996006','3'),
('9780099487821','3'),
('9780141011905','3'),
('9780718154776','3'),
('9780099457169','3'),
('9780330332774','3'),
('9780241003008','3'),
('9780747582977','3'),
('9781846051616','3'),
('9780718147709','3'),
('9780755307500','3'),
('9780141030142','3'),
('9780007110926','3'),
('9780330448444','3'),
('9780747561071','3'),
('9780701181840','3'),
('9780099771517','3'),
('9780563384311','3'),
('9780590112895','3'),
('9780718148621','3'),
('9781904994367','3'),
('9781861978769','3'),
('9780718152437','3'),
('9780140276336','3'),
('9780007156108','3'),
('9780593059258','3'),
('9780752893686','3'),
('9780007207329','3'),
('9780552998482','3'),
('9780718144395','3'),
('9780006498407','3'),
('9780747563204','3'),
('9781847670946','3'),
('9780007232741','3'),
('9780099419785','3'),
('9780747581109','4'),
('9780099406136','4'),
('9780552149525','4'),
('9780140237504','4'),
('9780593050545','4'),
('9780718144845','4'),
('9780552771153','4'),
('9780141019376','4'),
('9780552772747','4'),
('9780552773898','4'),
('9780141022925','4'),
('9780316731317','4'),
('9781904994497','4'),
('9780439993586','4'),
('9780552771108','4'),
('9780552997034','4'),
('9780099506928','4'),
('9781846053443','4');
INSERT INTO book_copy (book_id, school_id) 
VALUES
('9780552149518','2'),
('9780747532743','2'),
('9780747538486','2'),
('9780552150736','2'),
('9780747551003','2'),
('9780747581086','2'),
('9780747591054','2'),
('9780747546290','2'),
('9781904233657','2'),
('9780747550990','2'),
('9780552151764','2'),
('9781904233886','2'),
('9780330457729','2'),
('9780552151696','2'),
('9780099450252','2'),
('9781904233916','2'),
('9781847245458','2'),
('9780747566533','2'),
('9780099464464','2'),
('9780141017891','2'),
('9780099429791','2'),
('9780593054277','2'),
('9780552997041','2'),
('9781905654284','2'),
('9780747546245','2'),
('9780747591061','2'),
('9781849163422','2'),
('9780752837505','2'),
('9780349116754','2'),
('9780718147655','2'),
('9780006512134','2'),
('9780099387916','2'),
('9780752877327','2'),
('9780755309511','2'),
('9781841953922','2'),
('9780091889487','2'),
('9780747599876','2'),
('9780749397548','2'),
('9780563384304','2'),
('9780330507417','2'),
('9781861976123','3'),
('9780590660549','3'),
('9780755331420','3'),
('9781849162746','3'),
('9780330367356','3'),
('9780141020525','3'),
('9780722532935','3'),
('9780552996006','3'),
('9780099487821','3'),
('9780141011905','3'),
('9780718154776','3'),
('9780099457169','3'),
('9780330332774','3'),
('9780241003008','3'),
('9780747582977','3'),
('9781846051616','3'),
('9780718147709','3'),
('9780755307500','3'),
('9780141030142','3'),
('9780007110926','3'),
('9780330448444','3'),
('9780747561071','3'),
('9780701181840','3'),
('9780099771517','3'),
('9780563384311','3'),
('9780590112895','3'),
('9780718148621','3'),
('9781904994367','3'),
('9781861978769','3'),
('9780718152437','3'),
('9780140276336','3'),
('9780007156108','3'),
('9780593059258','3'),
('9780752893686','3'),
('9780007207329','3'),
('9780552998482','3'),
('9780718144395','3'),
('9780006498407','3'),
('9780747563204','3'),
('9781847670946','3'),
('9780007232741','3'),
('9780099419785','3'),
('9780747581109','4'),
('9780099406136','4'),
('9780552149525','4'),
('9780140237504','4'),
('9780593050545','4'),
('9780718144845','4'),
('9780552771153','4'),
('9780141019376','4'),
('9780552772747','4'),
('9780552773898','4'),
('9780141022925','4'),
('9780316731317','4'),
('9781904994497','4'),
('9780439993586','4'),
('9780552771108','4'),
('9780552997034','4'),
('9780099506928','4'),
('9781846053443','4');
INSERT INTO book_copy (book_id, school_id) 
VALUES
('9780552149518','2'),
('9780747532743','2'),
('9780747538486','2'),
('9780552150736','2'),
('9780747551003','2'),
('9780747581086','2'),
('9780747591054','2'),
('9780747546290','2'),
('9781904233657','2'),
('9780747550990','2'),
('9780552151764','2'),
('9781904233886','2'),
('9780330457729','2'),
('9780552151696','2'),
('9780099450252','2'),
('9781904233916','2'),
('9781847245458','2'),
('9780747566533','2'),
('9780099464464','2'),
('9780141017891','2'),
('9780099429791','2'),
('9780593054277','2'),
('9780552997041','2'),
('9781905654284','2'),
('9780747546245','2'),
('9780747591061','2'),
('9781849163422','2'),
('9780752837505','2'),
('9780349116754','2'),
('9780718147655','2'),
('9780006512134','2'),
('9780099387916','2'),
('9780752877327','2'),
('9780755309511','2'),
('9781841953922','2'),
('9780091889487','2'),
('9780747599876','2'),
('9780749397548','2'),
('9780563384304','2'),
('9780330507417','2'),
('9781861976123','3'),
('9780590660549','3'),
('9780755331420','3'),
('9781849162746','3'),
('9780330367356','3'),
('9780141020525','3'),
('9780722532935','3'),
('9780552996006','3'),
('9780099487821','3'),
('9780141011905','3'),
('9780718154776','3'),
('9780099457169','3'),
('9780330332774','3'),
('9780241003008','3'),
('9780747582977','3'),
('9781846051616','3'),
('9780718147709','3'),
('9780755307500','3'),
('9780141030142','3'),
('9780007110926','3'),
('9780330448444','3'),
('9780747561071','3'),
('9780701181840','3'),
('9780099771517','3'),
('9780563384311','3'),
('9780590112895','3'),
('9780718148621','3'),
('9781904994367','3'),
('9781861978769','3'),
('9780718152437','3'),
('9780140276336','3'),
('9780007156108','3'),
('9780593059258','3'),
('9780752893686','3'),
('9780007207329','3'),
('9780552998482','3'),
('9780718144395','3'),
('9780006498407','3'),
('9780747563204','3'),
('9781847670946','3'),
('9780007232741','3'),
('9780099419785','3'),
('9780747581109','4'),
('9780099406136','4'),
('9780552149525','4'),
('9780140237504','4'),
('9780593050545','4'),
('9780718144845','4'),
('9780552771153','4'),
('9780141019376','4'),
('9780552772747','4'),
('9780552773898','4'),
('9780141022925','4'),
('9780316731317','4'),
('9781904994497','4'),
('9780439993586','4'),
('9780552771108','4'),
('9780552997034','4'),
('9780099506928','4'),
('9781846053443','4');
INSERT INTO book_copy (book_id, school_id) 
VALUES
('9780552149518','2'),
('9780747532743','2'),
('9780747538486','2'),
('9780552150736','2'),
('9780747551003','2'),
('9780747581086','2'),
('9780747591054','2'),
('9780747546290','2'),
('9781904233657','2'),
('9780747550990','2'),
('9780552151764','2'),
('9781904233886','2'),
('9780330457729','2'),
('9780552151696','2'),
('9780099450252','2'),
('9781904233916','2'),
('9781847245458','2'),
('9780747566533','2'),
('9780099464464','2'),
('9780141017891','2'),
('9780099429791','2'),
('9780593054277','2'),
('9780552997041','2'),
('9781905654284','2'),
('9780747546245','2'),
('9780747591061','2'),
('9781849163422','2'),
('9780752837505','2'),
('9780349116754','2'),
('9780718147655','2'),
('9780006512134','2'),
('9780099387916','2'),
('9780752877327','2'),
('9780755309511','2'),
('9781841953922','2'),
('9780091889487','2'),
('9780747599876','2'),
('9780749397548','2'),
('9780563384304','2'),
('9780330507417','2'),
('9781861976123','3'),
('9780590660549','3'),
('9780755331420','3'),
('9781849162746','3'),
('9780330367356','3'),
('9780141020525','3'),
('9780722532935','3'),
('9780552996006','3'),
('9780099487821','3'),
('9780141011905','3'),
('9780718154776','3'),
('9780099457169','3'),
('9780330332774','3'),
('9780241003008','3'),
('9780747582977','3'),
('9781846051616','3'),
('9780718147709','3'),
('9780755307500','3'),
('9780141030142','3'),
('9780007110926','3'),
('9780330448444','3'),
('9780747561071','3'),
('9780701181840','3'),
('9780099771517','3'),
('9780563384311','3'),
('9780590112895','3'),
('9780718148621','3'),
('9781904994367','3'),
('9781861978769','3'),
('9780718152437','3'),
('9780140276336','3'),
('9780007156108','3'),
('9780593059258','3'),
('9780752893686','3'),
('9780007207329','3'),
('9780552998482','3'),
('9780718144395','3'),
('9780006498407','3'),
('9780747563204','3'),
('9781847670946','3'),
('9780007232741','3'),
('9780099419785','3'),
('9780747581109','4'),
('9780099406136','4'),
('9780552149525','4'),
('9780140237504','4'),
('9780593050545','4'),
('9780718144845','4'),
('9780552771153','4'),
('9780141019376','4'),
('9780552772747','4'),
('9780552773898','4'),
('9780141022925','4'),
('9780316731317','4'),
('9781904994497','4'),
('9780439993586','4'),
('9780552771108','4'),
('9780552997034','4'),
('9780099506928','4'),
('9781846053443','4');
INSERT INTO `keyword` (`keyword_id`, `word`) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Pre-school'),
(4, 'Children'),
(5, 'Young Adult'),
(6, 'Picture Books'),
(7, 'Early Learning'),
(8, 'Fitness Diet'),
(9, 'Travel Writing'),
(10, 'Popular Science'),
(11, 'Autobiography'),
(12, 'Biography'),
(13, 'Writing Guides'),
(14, 'Encyclopedias'),
(15, 'Cook'),
(16, 'Food'),
(17, 'Quiz'),
(18, 'Humor'),
(19, 'Indoor Games'),
(20, 'Science Fiction'),
(21, 'Fantacy Fiction'),
(22, 'Crime'),
(23, 'Thriller & Adventure'),
(24, 'Literary Fiction'),
(25, 'Puzzles');


INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552149518', 1),('9780552149518', 22),('9780552149518', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552150736', 1),('9780552150736', 22),('9780552150736', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552151764', 1),('9780552151764', 22),('9780552151764', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552151696', 1),('9780552151696', 22),('9780552151696', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781847245458', 1),('9781847245458', 22),('9781847245458', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780593054277', 1),('9780593054277', 22),('9780593054277', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781849163422', 1),('9781849163422', 22),('9781849163422', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780349116754', 1),('9780349116754', 22),('9780349116754', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780755331420', 1),('9780755331420', 22),('9780755331420', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781849162746', 1),('9781849162746', 22),('9781849162746', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099457169', 1),('9780099457169', 22),('9780099457169', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780752893686', 1),('9780752893686', 22),('9780752893686', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099406136', 1),('9780099406136', 22),('9780099406136', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552149525', 1),('9780552149525', 22),('9780552149525', 23);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747591061', 1),('9780747591061', 20),('9780747591061', 21);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747581109', 1),('9780747581109', 20),('9780747581109', 21);                      
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747532743', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747538486', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747551003', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747581086', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747591054', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747546290', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747550990', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747546245', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747599876', 4);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747561071', 4);              
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781904233657', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781904233886', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781904233916', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781905654284', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780590660549', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099487821', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780590112895', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780439993586', 5);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780141011905', 2);             
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780141022925', 2);              
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780330457729', 2),('9780330457729', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099450252', 2),('9780099450252', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747566533', 2),('9780747566533', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099464464', 2),('9780099464464', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099429791', 2),('9780099429791', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780006512134', 2),('9780006512134', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099387916', 2),('9780099387916', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780752877327', 2),('9780752877327', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780755309511', 2),('9780755309511', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781841953922', 2),('9781841953922', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780749397548', 2),('9780749397548', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780330367356', 2),('9780330367356', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780141020525', 2),('9780141020525', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780722532935', 2),('9780722532935', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780330332774', 2),('9780330332774', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747582977', 2),('9780747582977', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780755307500', 2),('9780755307500', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780141030142', 2),('9780141030142', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780330448444', 2),('9780330448444', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099771517', 2),('9780099771517', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780140276336', 2),('9780140276336', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780007156108', 2),('9780007156108', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552998482', 2),('9780552998482', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099419785', 2),('9780099419785', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780140237504', 2),('9780140237504', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552771153', 2),('9780552771153', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780141019376', 2),('9780141019376', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552772747', 2),('9780552772747', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552773898', 2),('9780552773898', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552771108', 2),('9780552771108', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780099506928', 2),('9780099506928', 1);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780141017891', 18),('9780141017891', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552997041', 10),('9780552997041', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781861978769', 10),('9781861978769', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780752837505', 11),('9780752837505', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781846051616', 11),('9781846051616', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780006498407', 11),('9780006498407', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718147655', 8),('9780718147655', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780091889487', 8),('9780091889487', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780593050545', 8),('9780593050545', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780563384304', 16),('9780563384304', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718154776', 16),('9780718154776', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780701181840', 16),('9780701181840', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780563384311', 16),('9780563384311', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718148621', 16),('9780718148621', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718152437', 16),('9780718152437', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718144395', 16),('9780718144395', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718144845', 16),('9780718144845', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780330507417', 6),('9780330507417', 4);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781861976123', 13),('9781861976123', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552996006', 9),('9780552996006', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780552997034', 9),('9780552997034', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780241003008', 7),('9780241003008', 3);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780718147709', 15),('9780718147709', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780007110926', 11),('9780007110926', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781904994367', 14),('9781904994367', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781904994497', 14),('9781904994497', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780593059258', 12),('9780593059258', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780316731317', 12),('9780316731317', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781846053443', 12),('9781846053443', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780007207329', 25),('9780007207329', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780747563204', 17),('9780747563204', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9781847670946', 11),('9781847670946', 2);                 
INSERT INTO db1initial.book_to_keyword (ISBN, Keyword_id) VALUES ('9780007232741', 19),('9780007232741', 1);                 


