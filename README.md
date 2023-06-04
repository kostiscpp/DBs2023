## DBs2023
School Library Database (Databases Project - 6th Semester ECE 2023)

### Αναλυτικές οδηγίες εγκατάστασης

**1. Backend περιβάλλον-Βάσης**

	Για την υλοποίηση του backend χρησιμοποιήσαμε το  
	[XAMPP 8.2]  (https://www.apachefriends.org/)	
	το οποίο εκαταστάθηκε σε Linux περιβάλλον και περιλαμβάνει τα ακόλουθα :

		Web server	: Apache/2.4.54 
		Database client : libmysql - mysqlnd 8.2.0
		PHP version     : 8.2.0
		phpMyAdmin	: 5.2.0 
		Database Server : 0.4.27-MariaDB
		(https://mariadb.com/kb/en/documentation/)

	- Μετά την ολοκλήρωση της εγκατάστασης του XAMPP η βάση (MariaDB) καθώς και το βασικό περιβάλλον
	  διαχείρισης [phpMyAdmin] (http://127.0.0.1/phpmyadmin/) θα είναι διαθέσιμα πρώτα αφού 
	  γίνει εκκίνηση τoυ xampp :

		 $ sudo /opt/lampp/xampp start

		 Starting XAMPP for Linux 8.2.0-0...
		 XAMPP: Starting Apache...ok.
		 XAMPP: Starting MySQL...ok.

		$ sudo /opt/lampp/xampp status

		 Version: XAMPP for Linux 8.2.0-0
		 Apache is running.
		 MySQL is running.

	- Επιλέξαμε το RDBMS ανοιχτού κώδικα MariaDB/Mysql που είναι συμβατό με Linux & Windows
	  λειτουργικά συστήματα. Για την βάση μας χρησιμοποιήθηκε τo InnoDB  ως Database Storage 
	  Engine.

	- Για την δημιουργία, διαχείριση και τεκμηρίωση της βάσης εκτός του phpmyadmin 
	  χρησιμοποιήθηκαν και τα ακόλουθα :

		 [dbeaver 23.0.3](https://dbeaver.io/) 
		 [mysql workbench](https://www.mysql.com/products/workbench/)
		 [draw.io](https://draw.io) 

**2. FrontEnd περιβάλλον-Εφαρμογή(Flask)**

	Για την υλοποίηση της web εφαρμογής χρησιμοποιήσαμε python3 & flask (html/css/javascript)

	Σε περιβάλλον Linux (Ubuntu) τα βήματα βασικής εγκατάστασης είναι :

	[Python 3.11.2](https://www.python.org/) 
		$ sudo apt install python3

	[pip 23.0.1]        
		$ sudo apt install python3-pip

	[virtualenv 20.19.0]  
		$ sudo pip3 install virtualenv	

	Για την ανάπτυξη της εφαρμογής χρησιμοποιήθηκαν τα παρακάτω Development Tools :

		[Visual Studio Code ](https://code.visualstudio.com/)
		[pycharm            ](https://www.jetbrains.com/pycharm/)

**3. Πρόσβαση στο Git repository**

Για την δημιουργία της βάσης δεδομένων και την εγκατάσταση της εφαρμογής πρέπει πρώτα να   
γίνει clone τοπικά το git repo της εφαρμογής απο το 
[gitfront](https://gitfront.io/r/user-2518255/u2GWTJ4ezH5x/DBs2023/) 
ή από το
[github](https://github.com/kostiscpp/DBs2023/)

	Project Structure
	DBs2023
		├── backend
		│   ├── 01.school_library_ddl.sql
		│   ├── 02.school_library_procs_triggers_events.sql
		│   ├── 03.school_library_dml.sql
		│   ├── 04.school_library_query.sql
		├── frontend
		│   ├── app.py                (Flask εφαρμογή)
		│   ├── dbenv.cfg             (παρέμετροι για σύνδεση στην βάση και διαχείριση backups)
		│   ├── requirements.txt      (virtual env python requirements)
		│   ├── static                (css για το format των html)
		│   └── templates             (html pages)
		├── README.md
		└── Relational_Diagram.png
		└── ΕR_Diagram.png

**4. Βήματα δημιουργίας της βάσης δεδομένων**

	 4.1 Δημιουργία σχήματος βάσης (DDL script)
		  From phpmyadmin -> Import -> DBs2023/backend/01.school_library_ddl.sql -> GO

	 4.2 Δημιουργία Procedures/Triggers/Events
		  From phpmyadmin -> Import -> DBs2023/backend/02.school_library_procs_triggers_events.sql -> GO

	 4.3 Εισαγωγή δεδομένων στην βάση(DML script)
		  From phpmyadmin -> Import -> DBs2023/backend/03.school_library_dml.sql -> GO

**5. Βήματα εγκατάστασης της εφαρμογής**

	   5.1  Δημιουργία -  python virtual environment

	    $ python3 -m venv libsite_venv
		$ source libsite_venv/bin/activate
	    (libsite_venv) $

	    **Install requirements

		(libsite_venv) $ pip3 install flask
		(libsite_venv) $ pip3 install pymysql

		ή ενναλακτικά

		(libsite_venv) $ pip3 install -r DBs2023/forntend/requirements.txt
		(libsite_venv) $ pip3 freeze
				blinker==1.6.2
				click==8.1.3
				Flask==2.3.2
				itsdangerous==2.1.2
				Jinja2==3.1.2
				MarkupSafe==2.1.3
				PyMySQL==1.0.3
				Werkzeug==2.3.4
			
	5.2 Προετοιμασία του αρχείου διαμόρφωσης configuration file (dbenv.cfg)
   
   		(libsite_venv) $ cd DBs2023/frontend
   		       		                
		[dbenv]
		# Set the database and login credentials
		db_host = localhost
		db_user = root
		db_user_password = xxxx
		#Set source_db (active) and target_db (standby)
		active_db = school_library
		standby_db = school_library_cloned
		#Linux environment
		# Set the LAMPP binaries for mysqldump & mysql programs 
		MYSQLDUMP = /opt/lampp/bin/mysqldump
		MYSQL = /opt/lampp/bin/mysql
		#BACKUPS directory 
		backups_dir = /var/tmp/BACKUPS/
		backups_to_keep = 7

	   5.3 Εκκίνηση της εφαρμογής 

		(libsite_venv) $ cd DBs2023/frontend
			(libsite_venv) $ python3 app.py

			* Serving Flask app 'app'
			* Debug mode: on
			* Running on http://127.0.0.1:5000
			Press CTRL+C to quit
			* Restarting with stat
			* Debugger is active!
			* Debugger PIN: 453-027-276

	   5.4 Πρόσβαση στην αρχική σελίδα της εφαρμογής
		[Login Page](http://127.0.0.1:5000)
        


**Βασικές λειτουργίες διαχείρισης της βάσης δεδομένων**

	Στον σχεδιασμό μας προκειμένου να εξασφαλιστεί η αδιάλειπτη λειτουργία των
	υπηρεσιών του συστήματος , έχουμε δώσει την δυνατότητα στον διαχειριστή
	να εκτελεί Backups της active βάσης δεδομένων school_libary στο BACKUPS 
	directory (που έχει δηλωθεί στο dbenv.cfg file).

	Επιπλέον έχει την δυνατότητα για Restore των πιο πάνω BACKUPS σε μια άλλη βάση
	π.χ. school_library_cloned που την θεωρούμε standby βάση δεδομένων του συστήματος.
		
	Ετσι μπορούμε να εξασφαλίσουμε την δυνατότητα manual μετάπτωσης των υπηρεσιών του
	συστήματος σε περίπτωση προβλήματος της active βάσης (school_libary) στην standby 
	βάση (school_library_cloned) στον ελάχιστο δυνατό χρονικό διάστημα.

	Για την υλοποίηση του backup/restore έχουμε δημιουργήσει δύο python Procedures
	1. perform_FULL_backup(source_db) που υλοποιεί το backup της active_db μέσω mysqldump
   	π.χ. mysqldump -u root -ppassword -h localhost active_db \
		--single-transaction --quick \
		--add-drop-table --add-drop-trigger \
		--events --routines --triggers \
		--add-drop-database  \
		--result-file \
		/var/tmp/BACKUPS/active_db_FULL_20230601-183205.sql
	2. perform_FULL_restore(source_db,target_db) που υλοποιεί το restore της standby_db μέσω mysql
   	π.χ. mysql -u root -ppassword -h localhost \
            -e "DROP DATABASE IF EXISTS standby_db;CREATE DATABASE standby_db"
	
            mysql -u root -ppassword -h localhost standby_db < /var/tmp/BACKUPS/active_db_FULL_20230601-183205.sql

	H εφαρμογή καλεί τις procedures χρησιμοποιώντας τις παραμέτρους από το αρχείο 
	διαμόρφωσής dbenv.cfg ως εξής ,	perform_FULL_backup(active_db) & 
	perform_FULL_restore(active_db,standby_db).
	
	Φυσικά σε αυτή την περίπτωση πρέπει να σημειώσουμε ότι η standby βάση θα είναι 
	ενημερωμένη με το τελευταίο backup της active βάσης.



