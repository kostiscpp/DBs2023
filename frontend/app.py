from flask import Flask, render_template, request, redirect, url_for, session, flash
import pymysql
import json
from pymysql import Error
# from barcode import Code128
# from barcode.writer import ImageWriter
# from io import BytesIO

app = Flask(__name__)

app.secret_key = 'your secret key'

conn = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    db='db1initial',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)
@app.route('/admin/login', methods=['GET', 'POST'])
def login_admin():
    # Output message if something goes wrong...
    # msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        username = request.form.get('username')
        password = request.form.get('password')
        # Check if account exists using MySQL
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM user WHERE username = %s AND pwd = %s AND (role="admin" OR role="operator")',
                       (username, password,))
        # Fetch one record and return result
        account = cursor.fetchone()
        # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['user_id'] = account['user_id']
            session['username'] = account['username']
            session['role'] = account['role']
            session['barcode'] = account['barcode']
            session['school_id'] = account['school_id']
            # Redirect to home page
            # return render_template('index_admin.html')
            if session['role'] == 'admin':
                return redirect('/admin/main')
            else:
                return redirect('/operator/main')
        else:
            # Account doesnt exist or username/password incorrect
            error_message = 'Incorrect username/password!'
    # Show the login form with message (if any)
    return redirect(url_for('main'))


@app.route('/user/login', methods=['GET', 'POST'])
def login_user():
    # Output message if something goes wrong...
    # msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        username = request.form.get('username')
        password = request.form.get('password')
        # Check if account exists using MySQL
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM user WHERE username = %s AND pwd = %s AND (role="teacher" OR role="student");',
                       (username, password,))
        # Fetch one record and return result
        account = cursor.fetchone()

        # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['user_id'] = account['user_id']
            session['username'] = account['username']
            session['role'] = account['role']
            session['barcode'] = account['barcode']
            session['school_id'] = account['school_id']
            # Redirect to home page
            checkouts = checkout_data()
            return render_template('index_user.html', checkouts=checkouts)
        else:
            # Account doesnt exist or username/password incorrect
            error_message = 'Incorrect username/password!'
            return redirect(url_for('main'))
    # Show the login form with message (if any)
    return redirect(url_for('main'))

def checkout_data():
        user_id = session['user_id']
        query = """
            SELECT
                (SELECT COUNT(*) FROM checkout WHERE checkout.user_id = %s AND checkout.checkout_status = 'active') AS active_checkouts,
                (SELECT COUNT(*) FROM checkout WHERE checkout.user_id = %s AND checkout.checkout_status = 'returned' OR checkout.checkout_status = 'overdue-returned') AS total_checkouts,
                (SELECT COUNT(*) FROM checkout WHERE checkout.user_id = %s AND checkout.checkout_status = 'overdue') AS overdue_checkouts,
                (SELECT COUNT(*) FROM hold WHERE hold.user_id = %s AND hold.hold_status = 'active') AS active_holds;
        """
        cursor = conn.cursor()
        cursor.execute(query, (user_id, user_id, user_id, user_id,))
        checkouts_data = cursor.fetchone()
        return checkouts_data

@app.route('/user/register', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        query = """
            SELECT s.school_id, s.school_name FROM school s WHERE s.school_id > 0;
        """
        cursor = conn.cursor()
        cursor.execute(query)
        schools = cursor.fetchall()
        return render_template('register.html', schools = schools)
    if request.method == 'POST' and all(field in request.form for field in ['username', 'password', 'first_name', 'surname', 'birth_date', 'barcode', 'email', 'role', 'school_name']):
        # Create variables for easy access
        credentials = [request.form.get(field) for field in ['first_name', 'surname', 'username', 'password', 'birth_date', 'email', 'role','school_name']]
        print(credentials)
        # Check if account exists using MySQL
        cursor = conn.cursor()
        cursor.execute('SELECT school_id FROM school WHERE school_name = %s', (credentials[-1],))
        result = cursor.fetchone()
        if result:
            school_id = result['school_id']
            try:
                cursor.execute('INSERT INTO user (first_name, surname, username, pwd, birth_date, email, role, school_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)', tuple(credentials[:-1] + [school_id]))
                conn.commit()
                cursor.close()
                return redirect('/user/login')
            except Exception as e:
                error_message = 'An error occurred during registration. Please try again.'
                # Log the error or handle it appropriately
        else:
            error_message = 'This school does not exist!'

    return render_template('register.html')

@app.route('/main', methods=['GET', 'POST'])
def go_to_main():
    role = session['role']
    if role == 'admin':
        return redirect('/admin/main')
    elif role == 'operator':
        return redirect('/operator/main')
    else:
        return redirect('go_to_main_user')


@app.route('/admin/main', methods=['GET', 'POST'])
def go_to_main_admin():
    return render_template('index_admin.html')


@app.route('/operator/main', methods=['GET', 'POST'])
def go_to_main_operator():
    return render_template('index_operator.html')


@app.route('/user/main', methods=['GET', 'POST'])
def go_to_main_user():
    checkouts = checkout_data()
    return render_template('index_user.html',checkouts=checkouts)

@app.route('/admin/profile', methods=['GET', 'POST'])
def profile_admin():
    username = session['username']
    school = session['school_id']
    query = """
    SELECT u.*, s.school_name
    FROM user u 
    JOIN school s on u.school_id = s.school_id
    WHERE u.username = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    return render_template('profile_admin.html', user=user)

@app.route('/operator/profile', methods=['GET', 'POST'])
def profile_operator():
    username = session['username']
    school = session['school_id']
    query = """
    SELECT u.*, s.school_name
    FROM user u 
    JOIN school s on u.school_id = s.school_id
    WHERE u.username = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    return render_template('profile_operator.html', user=user)


@app.route('/user/profile', methods=['GET', 'POST'])
def profile_user():
    username = session['username']
    role = session['role']
    query = """
        SELECT u.*, s.school_name FROM user u 
        JOIN school s ON s.school_id = u.school_id
        WHERE u.username = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    if role == 'teacher':
        return render_template('profile_teacher.html', user=user)
    else:
        return render_template('profile_student.html', user=user)

@app.route('/activity_log',methods=['GET','POST'])
def activity_log_user():
    username = session['username']
    schoolID = int(session['school_id'])
    checkout_query = """
        SELECT vs.title, vs.image, c.checkout_status, c.checkout_time, c.return_time
        FROM checkout c
        JOIN view_school_users vsu on c.user_id = vsu.user_id
        JOIN view_school vs on c.book_copy_id = vs.copy_id
        WHERE vsu.username = %s;
    """
    cursor = conn.cursor()
    cursor.execute(checkout_query, (username,))
    checkouts = cursor.fetchall()

    review_query = """
        SELECT r.review_text AS text, r.rating, s.school_name, u.username, u.profile, u.role, b.title, b.image
        FROM review r
        JOIN book b ON b.ISBN = r.book_id
        JOIN user u ON u.user_id = r.user_id
        JOIN school s ON s.school_id = u.school_id
        WHERE u.username = %s AND r.review_status = 'accepted';
    """
    cursor = conn.cursor()
    cursor.execute(review_query, (username, ))
    reviews = cursor.fetchall()
    print(schoolID )
    print(reviews)
    return render_template('activity_log_user.html',checkouts = checkouts, reviews=reviews)


@app.route('/search_book', methods=['GET', 'POST'])
def search_book_redirect():
    role = session['role']
    if role == 'admin':
        return redirect(url_for('search_book_admin'))
    elif role == 'operator':
        return redirect(url_for('search_book_operator'))
    elif role == 'student' or role == 'teacher':
        return redirect(url_for('search_book_user'))

@app.route('/user/books', methods=['GET'])
def search_book_user():
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)
    query = """ 
            SELECT
            vs.title,
            GROUP_CONCAT(a.name SEPARATOR ', ') AS author_names,
            vs.available_copies_number,
            vs.book_copies_number
        FROM
            view_school vs
            JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN
            JOIN author a ON a.author_id = b2a.author_id
        WHERE
            vs.school_id = %s
        GROUP BY
            vs.title, vs.available_copies_number, vs.book_copies_number;
        """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    books = cursor.fetchall()
    return render_template('book_search_user.html', books=books)


@app.route('/user/books', methods=['POST'])
def search_result():
    searchType = request.form['searchType']
    searchKey = request.form['searchKey']
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)

    if searchType == 'title':
        query = """ 
        SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
        FROM view_school vs 
        JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN 
        JOIN author a ON a.author_id = b2a.author_id 
        WHERE vs.school_id = {} AND vs.title LIKE %s
        """.format(schoolID)
        cursor = conn.cursor()
        cursor.execute(query, ('%' + searchKey + '%',))
    elif searchType == 'author':
        query = """ 
        SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
        FROM view_school vs 
        JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN 
        JOIN author a ON a.author_id = b2a.author_id 
        WHERE vs.school_id = {} AND a.name LIKE %s
        """.format(schoolID)
        cursor = conn.cursor()
        cursor.execute(query, ('%' + searchKey + '%',))
    elif searchType == 'category':
        query = """ 
        SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
        FROM view_school vs 
        JOIN book_to_category b2c ON vs.ISBN = b2c.ISBN 
        JOIN category c ON b2c.category_id = c.category_id 
        JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN 
        JOIN author a ON b2a.author_id = a.author_id 
        WHERE vs.school_id = {} AND c.category LIKE %s
        """.format(schoolID)
        cursor = conn.cursor()
        cursor.execute(query, ('%' + searchKey + '%',))
    elif searchType == 'keyword':
        query = """ 
        SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
        FROM view_school vs 
        JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN 
        JOIN author a ON b2a.author_id = a.author_id
        WHERE vs.school_id = {} AND vs.keywords LIKE %s
        """.format(schoolID)
        cursor = conn.cursor()
        cursor.execute(query, ('%' + searchKey + '%',))
    elif searchType == 'ISBN':
        query = """ 
        SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
        FROM view_school vs 
        JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN 
        JOIN author a ON b2a.author_id = a.author_id
        WHERE vs.school_id = {} AND vs.ISBN LIKE %s
        """.format(schoolID)
        cursor = conn.cursor()
        cursor.execute(query, ('%' + searchKey + '%',))
    else:
        return 'Invalid search type'

    books = cursor.fetchall()
    return render_template('book_search_user.html', books=books)


@app.route('/user/books/<book>', methods=['GET', 'POST'])
def book_details_user(book):
    schoolID = session['school_id']
    query = """
    SELECT vs.*, GROUP_CONCAT(DISTINCT a.name  SEPARATOR ', ') AS author_names, GROUP_CONCAT(DISTINCT c.name  SEPARATOR ', ') AS categories
    FROM view_school vs
    JOIN book_to_author b2a ON vs.book_id = b2a.ISBN
    JOIN author a ON b2a.author_id = a.author_id
    JOIN book_to_category b2c ON vs.ISBN = b2c.ISBN
    JOIN category c ON b2c.category_id = c.category_id
    WHERE vs.title = %s AND vs.school_id = {};
    """.format(schoolID)
    cursor = conn.cursor()
    cursor.execute(query, (book,))
    book_data = cursor.fetchone()
    return render_template('book_details_user.html', book=book_data)

@app.route('/admin/books', methods=['GET'])
def search_book_admin():
    schoolID = session['school_id']
    query = """ 
        SELECT DISTINCT b.title, a.name, b.ISBN, b.ISBN 
        FROM book b
	    JOIN book_to_author b2a ON b2a.ISBN = b.ISBN
	    JOIN author a ON a.author_id = b2a.author_id;
        """
    cursor = conn.cursor()
    cursor.execute(query)
    books = cursor.fetchall()
    return render_template('book_search_admin.html', books=books)

@app.route('/operator/books', methods=['GET'])
def search_book_operator():
    schoolID = session['school_id']
    query = """ 
        SELECT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
        FROM view_school vs
	    JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN
	    JOIN author a ON a.author_id = b2a.author_id
	    WHERE school_id = %s;
        """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    books = cursor.fetchall()
    return render_template('book_search_operator.html', books=books)


@app.route('/operator/books', methods=['POST'])
def operator_search_result():
        searchType = request.form['searchType']
        searchKey = request.form['searchKey']
        schoolID = session['school_id']
        # view_name = "view_school_" + str(schoolID)

        if searchType == 'title':
            query = """ 
            SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
            FROM view_school vs 
            JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN 
            JOIN author a ON a.author_id = b2a.author_id 
            WHERE vs.school_id = {} AND vs.title LIKE %s
            """.format(schoolID)
            cursor = conn.cursor()
            cursor.execute(query, ('%' + searchKey + '%',))
        elif searchType == 'author':
            query = """ 
            SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
            FROM view_school vs 
            JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN 
            JOIN author a ON a.author_id = b2a.author_id 
            WHERE vs.school_id = {} AND a.name LIKE %s
            """.format(schoolID)
            cursor = conn.cursor()
            cursor.execute(query, ('%' + searchKey + '%',))
        elif searchType == 'category':
            query = """ 
            SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
            FROM view_school vs 
            JOIN book_to_category b2c ON vs.ISBN = b2c.ISBN 
            JOIN category c ON b2c.category_id = c.category_id 
            JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN 
            JOIN author a ON b2a.author_id = a.author_id 
            WHERE vs.school_id = {} AND c.name LIKE %s
            """.format(schoolID)
            cursor = conn.cursor()
            cursor.execute(query, ('%' + searchKey + '%',))
        elif searchType == 'keyword':
            query = """ 
            SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
            FROM view_school vs 
            JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN 
            JOIN author a ON b2a.author_id = a.author_id
            WHERE vs.school_id = {} AND vs.keywords LIKE %s
            """.format(schoolID)
            cursor = conn.cursor()
            cursor.execute(query, ('%' + searchKey + '%',))
        elif searchType == 'ISBN':
            query = """ 
            SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number 
            FROM view_school vs 
            JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN 
            JOIN author a ON b2a.author_id = a.author_id
            WHERE vs.school_id = {} AND vs.ISBN LIKE %s
            """.format(schoolID)
            cursor = conn.cursor()
            cursor.execute(query, ('%' + searchKey + '%',))
        else:
            return 'Invalid search type'

        books = cursor.fetchall()
        return render_template('book_search_operator.html', books=books)

@app.route('/operator/books/<book>', methods=['GET', 'POST'])
def book_details_operator(book):
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)
    query = """
    SELECT b.*, a.name
    FROM view_school b
    JOIN book_to_author b2a ON b.ISBN = b2a.ISBN
    JOIN author a ON b2a.author_id = a.author_id
    JOIN book_to_category b2c ON b.ISBN = b2c.ISBN
    JOIN category c ON b2c.category_id = c.category_id
    WHERE b.title = %s AND b.school_id = {}
    """.format(schoolID)
    cursor = conn.cursor()
    cursor.execute(query, (book,))
    book_data = cursor.fetchone()
    return render_template('book_details_operator.html', book=book_data)

@app.route('/admin/books/<book>', methods=['GET', 'POST'])
def book_details_admin(book):
    # view_name = "view_school_" + str(schoolID)
    query = """
    SELECT b.*, a.name
    FROM view_school b
    JOIN book_to_author b2a ON b.ISBN = b2a.ISBN
    JOIN author a ON b2a.author_id = a.author_id
    # JOIN book_to_category b2c ON b.ISBN = b2c.ISBN
    # JOIN category c ON b2c.category_id = c.category_id
    WHERE b.title = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (book,))
    book_data = cursor.fetchone()
    return render_template('book_details_admin.html', book=book_data)


@app.route('/user/books/<book>/reviews', methods=['GET', 'POST'])
def book_reviews_user(book):
    # view_name = "view_school_" + str(schoolID)
    query = """
    SELECT r.review_text AS text, r.rating, s.school_name, u.username, u.profile, u.role, b.title
    FROM review r
    JOIN book b ON b.ISBN = r.book_id
    JOIN user u ON u.user_id = r.user_id
    JOIN school s ON s.school_id = u.school_id
    WHERE b.title = %s AND r.review_status = 'accepted';
    """
    cursor = conn.cursor()
    cursor.execute(query, (book,))
    reviews = cursor.fetchall()
    print(reviews)
    return render_template('book_reviews_user.html', reviews=reviews)


@app.route('/user/books/<book>/add_review', methods=['GET', 'POST'])
def book_add_review_user(book):
    if request.method == 'POST':
        schoolID = session['school_id']
        userID = session['user_id']
        rating = int(request.form.get('ratingInput'))
        reviewText = request.form.get('textInput')
        # view_name = "view_school_" + str(schoolID)
        if rating and reviewText:
            cursor = conn.cursor()
            cursor.execute("SELECT b.ISBN FROM view_school b WHERE (b.title = %s AND b.school_id  = %s);",
                           (book, schoolID))
            bookID = cursor.fetchone()['ISBN']
            query = """
            INSERT INTO review (user_id,review_text,rating,book_id) VALUES (%s,%s,%s,%s); 
            """
            cursor.execute(query, (userID, reviewText, rating, bookID,))
            conn.commit()
            cursor.close()
            return redirect(url_for('book_reviews_user', book=book))

    return render_template('book_add_review_user.html', book=book)
@app.route('/user/books/checkout/<book_copy_id>', methods=['GET'])
def user_checkout_request(book_copy_id):
    try:
        user_id = session['user_id']

        # Insert the hold record into the database
        query = """
        CALL DemandBook(%s, %s);
        """
        cursor = conn.cursor()
        cursor.execute(query, (book_copy_id, user_id,))
        conn.commit()
        cursor.close()

        flash('Το αίτημά σας καταχωρήθηκε', 'success')
    except pymysql.Error as e:
        error_code = e.args[0]
        error_message = e.args[1]

        print(f"Error Code: {error_code}")
        print(f"Error Message: {error_message}")

        # flash (str(error_code) + str(error_message), 'danger')
        if error_code == 1644:
            flash('Σφάλμα: ' + error_message, 'danger')
        else:
            flash('Αναπάντεχο σφάλμα στη βάση δεδομένων', 'danger')
    except Exception as e:
        # Handle other general exceptions and display a generic error message
        flash('Αναπάντεχο σφάλμα: ' + str(e), 'error')

    return redirect(url_for('search_book_user'))


@app.route('/search_users', methods=['GET', 'POST'])
def search_users_redirect():
    role = session['role']
    if role == 'admin':
        return redirect(url_for('/admin/users'))
    elif role == 'operator':
        return redirect(url_for('search_users_operator'))


@app.route('/operator/users', methods=['GET'])
def search_users_operator():
    schoolID = session['school_id']
    query = """
        SELECT DISTINCT CONCAT(vsu.first_name, ' ', vsu.surname) AS full_name, vsu.email, vsu.role, vsu.username
        FROM view_school_users vsu
        WHERE school_id = %s; 
    """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    users = cursor.fetchall()
    return render_template('catalog_user_operator.html', users=users)

@app.route('/operator/users', methods=['POST'])
def user_operator_search_result():
    searchKey = request.form.get('searchKey')
    schoolID = session['school_id']
    print(schoolID)
    query = """
    SELECT DISTINCT CONCAT(vsu.first_name, ' ', vsu.surname) AS full_name, vsu.email, vsu.role, vsu.username
    FROM view_school_users vsu
    WHERE vsu.school_id = %s AND CONCAT(vsu.first_name, ' ', vsu.surname) LIKE %s
 """.format(schoolID)
    cursor = conn.cursor()
    cursor.execute(query, (schoolID, '%' + searchKey + '%'))
    users = cursor.fetchall()
    return render_template('catalog_user_operator.html', users=users)

@app.route('/operator/users/<user>', methods=['GET', 'POST'])
def user_details_operator(user):
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)
    query = """
    SELECT  DISTINCT  vsu.first_name, vsu.surname, vsu.birth_date, vsu.email, vsu.status, vsu.profile, s.school_name, vsu.barcode
    FROM view_school_users vsu
    JOIN school s ON s.school_id = vsu.school_id
    WHERE vsu.school_id = %s  AND username = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID, user))
    user_data = cursor.fetchone()
    return render_template('user_details_operator.html', user = user_data)

@app.route('/update_profile', methods=['POST'])
def update_profile():
    # Get the updated form data
    birth_date = request.form['birth_date']
    email = request.form['email']
    profile = request.form['profile']
    username = session['username']

    # Connect to the MySQL database
    cursor = conn.cursor()

    # Prepare the SQL statement to update the user's birth date and school
    update_query = "UPDATE `user` SET `birth_date` = %s, `email` = %s, `profile` = %s WHERE `username` = %s"

    # Execute the update query
    cursor.execute(update_query, (birth_date, email, profile, username,))

    # Commit the changes to the database
    conn.commit()
    cursor.close()

    flash('Οι αλλαγές αποθηκεύθηκαν', 'success')

    role = session['role']
    if role == 'admin':
        return redirect('/admin/profile')
    elif role == 'operator':
        return redirect('/operator/profile')
    elif role == 'teacher':
        return redirect('/user/profile')

@app.route('/update_book_details', methods=['POST'])
def update_book_details():
    # Get the updated form data
    title = request.form['title']
    # author = request.form['author']
    no_pages = request.form['no_pages']
    language = request.form['language']
    year_published = request.form['year_published']
    image = request.form['image']
    isbn = request.form['ISBN']

    # Connect to the MySQL database
    cursor = conn.cursor()

    # Prepare the SQL statement to update the user's birth date and school
    update_query = "UPDATE `book` SET `title` = %s, `no_pages` = %s, `language` = %s, `year_published` = %s, `image`=%s WHERE `ISBN` = %s ;"

    # Execute the update query
    cursor.execute(update_query, (title, no_pages, language, year_published, isbn,image))

    # Commit the changes to the database
    conn.commit()
    cursor.close()

    flash('Οι αλλαγές αποθηκεύθηκαν', 'success')


    role = session['role']
    if role == 'admin':
        return redirect('/admin/books')
    elif role == 'operator':
        return redirect('/operator/books')

@app.route('/pending_holds', methods=['GET', 'POST'])
def pending_holds_redirect():
    role = session['role']
    if role == 'operator':
        return redirect('/operator/pending_holds')
    elif role == 'admin':
        return redirect('/admin/pending_holds')


@app.route('/operator/pending_holds', methods=['GET', 'POST'])
def pending_holds_operator():
    schoolID = session['school_id']
    query = """ 
        SELECT h.book_copy_id, h.hold_id, h.user_id, vs.title AS book, CONCAT(vsu.first_name, ' ', vsu.surname) AS name, h.hold_time AS time 
        FROM hold h
        JOIN view_school vs ON vs.copy_id = h.book_copy_id
        JOIN view_school_users vsu ON vsu.user_id = h.user_id
        WHERE vs.school_id = %s AND h.hold_status = 'pending'
        ORDER BY h.hold_time DESC;
    """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    holds = cursor.fetchall()
    return render_template('pending_holds_operator.html', holds=holds)

@app.route('/operator/update_hold_status', methods=['GET', 'POST'])
def update_hold_status_operator():
    hold_id = request.form['hold_id']
    action = request.form['action']
    user_id = request.form['user_id']
    book_copy_id = request.form['book_copy_id']

    if action == 'accept':
        update_query = "CALL CheckoutBook(%s, %s);"
        cursor = conn.cursor()
        cursor.execute(update_query, (book_copy_id, user_id,))
    elif action == 'reject':
        update_query = """
            UPDATE hold
            SET hold_status = 'cancelled'
            WHERE hold_id = %s;
            """
        cursor = conn.cursor()
        cursor.execute(update_query, (hold_id,))

    conn.commit()
    cursor.close()
    return redirect('/operator/pending_holds')

@app.route('/register_redirect', methods=['GET','POST'])
def register_monitoring_redirect():
    role = session['role']
    if role == 'operator':
        return redirect(url_for('register_monitoring_operator'))
    elif role == 'admin':
        return redirect(url_for('register_monitoring_admin'))

@app.route('/operator/registers/register_monitoring', methods=['GET','POST'])
def register_monitoring_operator():
    schoolID = session['school_id']
    query = """
        SELECT vsu.*
        FROM view_school_users vsu  
        WHERE vsu.school_id = %s AND vsu.status = 'pending';
    """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    users = cursor.fetchall()
    no_users = False
    if len(users) == 0:
        no_users = True
    else:
        cursor.execute("SELECT school_name FROM school WHERE school_id = %s", schoolID)
        users[0]['school_id'] = cursor.fetchall()[0]['school_name']
    return render_template('register_monitoring_operator.html', users=users, no_users=no_users)

@app.route('/operator/update_register_status', methods=['GET', 'POST'])
def update_register_status_operator():
    action = request.form['action']
    user_id = request.form['user_id']

    if action == 'accept':
        update_query = "UPDATE user SET status = 'active', barcode = LPAD(FLOOR(RAND() * 999999) + 1, 8, '0') WHERE user_id = %s;"
        cursor = conn.cursor()
        cursor.execute(update_query, (user_id,))
    elif action == 'reject':
        update_query = """
            UPDATE user
            SET status = 'rejected'
            WHERE user_id = %s;
            """
        cursor = conn.cursor()
        cursor.execute(update_query, (user_id,))

    conn.commit()
    cursor.close()
    return redirect('/operator/registers/register_monitoring')

@app.route('/checkout_redirect', methods=['GET','POST'])
def checkout_monitoring_redirect():
    role = session['role']
    if role == 'operator':
        return redirect(url_for('checkout_monitoring_operator'))
    elif role == 'admin':
        return redirect(url_for('checkout_monitoring_admin'))

@app.route('/operator/checkouts/checkout_monitoring', methods=['GET','POST'])
def checkout_monitoring_operator():
    schoolID = session['school_id']
    query = """
        SELECT ch.*, vs.title AS book, CONCAT(vsu.first_name,' ', vsu.surname) AS name
        FROM checkout ch
        JOIN view_school vs on vs.copy_id = ch.book_copy_id
        JOIN view_school_users vsu on vsu.user_id = ch.user_id
        WHERE vs.school_id = %s AND ch.checkout_status = 'active'
        ORDER BY ch.checkout_time DESC;
    """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    checkouts = cursor.fetchall()
    no_checkouts = False
    if len(checkouts) == 0:
        no_checkouts = True
    return render_template('checkout_monitoring_operator.html', checkouts=checkouts, no_checkouts=no_checkouts)

@app.route('/return_book', methods=['GET', 'POST'])
def return_book_redirect():
    role = session['role']
    if role == 'operator':
        return redirect(url_for('return_book_operator'))
    elif role == 'admin':
        return redirect(url_for('return_book_admin'))


@app.route('/admin/return_book/result', methods=['GET', 'POST'])
def return_book_admin():
    if 'barcode' not in request.form:
        return "Barcode is missing in the form data"
    barcode = request.form['barcode']
    schoolID = session['school_id']
    print(barcode)
    print(schoolID)
    query = """
        SELECT c.checkout_time AS time, c.checkout_status AS status, vsu.user_id, 
            CONCAT(vsu.first_name,' ', vsu.surname) AS name, vsu.barcode, vs.title, vs.copy_id
        FROM checkout c
        JOIN view_school_users vsu on vsu.user_id = c.user_id
        JOIN view_school vs on vs.copy_id = c.book_copy_id
        WHERE vsu.barcode = %s AND vsu.school_id = %s 
        AND c.checkout_status = 'active' OR c.checkout_status = 'overdue';
    """
    cursor = conn.cursor()
    cursor.execute(query, (barcode, schoolID,))
    checkouts = cursor.fetchall()
    return render_template('return_book_admin.html', checkouts=checkouts)
@app.route('/operator/return_book/result', methods=['GET', 'POST'])
def return_book_operator():
    barcode = request.form.get('barcode')
    schoolID = session['school_id']
    query = """
    SELECT c.checkout_time AS time, c.checkout_status AS status, vsu.user_id, 
        CONCAT(vsu.first_name,' ', vsu.surname) AS name, vsu.barcode, vs.title, vs.copy_id
        FROM checkout c
        JOIN view_school_users vsu on vsu.user_id = c.user_id
        JOIN view_school vs on vs.copy_id = c.book_copy_id
        WHERE vsu.barcode = %s AND vsu.school_id = %s
        AND (c.checkout_status = 'active' OR c.checkout_status = 'overdue');
    """
    cursor = conn.cursor()
    cursor.execute(query, (barcode, schoolID,))
    checkouts = cursor.fetchall()
    return render_template('return_book_operator.html', checkouts=checkouts)

@app.route('/admin/update_return_book', methods=['GET', 'POST'])
def update_return_book_admin():
    user_id = request.form['user_id']
    book_copy_id = request.form['book_copy_id']
    update_query = "CALL ReturnBook(%s, %s);"
    cursor = conn.cursor()
    cursor.execute(update_query, (book_copy_id, user_id,))
    conn.commit()
    cursor.close()
    return redirect('/admin/return_book')

@app.route('/operator/update_return_book', methods=['GET', 'POST'])
def update_return_book_operator():
    user_id = request.form['user_id']
    book_copy_id = request.form['book_copy_id']
    update_query = "CALL ReturnBook(%s, %s);"
    cursor = conn.cursor()
    cursor.execute(update_query, (book_copy_id, user_id,))
    conn.commit()
    cursor.close()
    return redirect('/operator/return_book/result')
@app.route('/create_checkout_redirect_operator')
def create_checkout_redirect():
    role = session['role']
    if role == 'admin':
        return redirect(url_for('create_checkout_admin'))
    elif role == 'operator':
        return redirect(url_for('create_checkout_operator'))

@app.route('/operator/create_checkout', methods=['GET','POST'])
def create_checkout_operator():
    if request.method == 'POST':
        schoolID = session['school_id']
        isbn = request.form.get('isbn')
        barcode = request.form.get('barcode')
        print(isbn)
        print(barcode)
        if isbn and barcode:
            cursor = conn.cursor()
            cursor.execute('SELECT copy_id FROM view_school WHERE (school_id = %s AND ISBN = %s);', (schoolID, isbn))
            copyID = cursor.fetchone()['copy_id']
            cursor.execute('SELECT user_id FROM user WHERE (school_id = %s AND barcode = %s);', (schoolID,barcode,))
            userID = cursor.fetchone()['user_id']
            if copyID and userID:
                cursor.execute("INSERT INTO checkout(book_copy_id, user_id) VALUES (%s,%s);", (copyID, userID))
                conn.commit()
    return render_template('create_checkout_operator.html')

@app.route('/checkout/autocomplete/book', methods=['GET','POST'])
def autocomplete_book():
    isbn = request.args.get('isbn')  # Retrieve the 'isbn' parameter from the query string
    schoolID = session['school_id']
    query = """
        SELECT vs.ISBN, vs.title, vs.no_pages AS pages, vs.year_published AS year, a.name AS author
        FROM view_school vs
        JOIN book_to_author bta on vs.ISBN = bta.ISBN
        JOIN author a on bta.author_id = a.author_id
        WHERE vs.ISBN = %s AND vs.school_id = %s ;
    """
    cursor = conn.cursor()
    cursor.execute(query, (isbn, schoolID,))
    books = cursor.fetchall()
    books_json = json.dumps(books)

    # Return the books data as JSON response
    return books_json

@app.route('/checkout/autocomplete/user', methods=['GET', 'POST'])
def autocomplete_user():
    barcode = str(request.args.get('barcode'))
    schoolID = session['school_id']
    query = """
        SELECT vsu.barcode, vsu.first_name, vsu.surname, vsu.role, vsu.email, s.school_name
        FROM view_school_users vsu
        JOIN school s ON s.school_id = vsu.school_id
        WHERE vsu.barcode = %s AND vsu.school_id = %s ;
    """
    cursor = conn.cursor()
    cursor.execute(query, (barcode, schoolID,))
    users = cursor.fetchall()
    users_json = json.dumps(users)
    return users_json
@app.route('/operator/pending_reviews', methods=['GET', 'POST'])
def pending_reviews_operator():
    schoolID = session['school_id']
    query = """ 
        SELECT r.book_id, r.review_id, r.user_id, vs.title AS book, CONCAT(vsu.first_name, ' ', vsu.surname) AS name, r.rating, r.review_text 
        FROM review r
        JOIN view_school vs ON vs.book_id = r.book_id
        JOIN view_school_users vsu ON vsu.user_id = r.user_id
        WHERE vs.school_id = %s AND r.review_status = 'pending';
    """
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    reviews = cursor.fetchall()
    return render_template('pending_reviews_operator.html', reviews=reviews)

@app.route('/operator/update_review_status', methods=['GET', 'POST'])
def update_review_status_operator():
    review_id = request.form['review_id']
    action = request.form['action']

    if action == 'accept':
        update_query = """
            UPDATE review
            SET review_status = 'accepted'
            WHERE review_id = %s;
            """
        cursor = conn.cursor()
        cursor.execute(update_query, (review_id,))
    elif action == 'reject':
        update_query = """
            UPDATE review
            SET review_status = 'rejected'
            WHERE review_id = %s;
            """
        cursor = conn.cursor()
        cursor.execute(update_query, (review_id,))

    conn.commit()
    cursor.close()
    return redirect('/operator/pending_reviews')



@app.route('/admin/analytics/query313')
def query313_redirect():
    return render_template('query313.html')

@app.route('/admin/analytics/most_checkouts', methods=['GET','POST'])
def query313():
    role = request.form.get('rrole')
    age = str(request.form.get('aage'))
    print(role)
    if role == "student" or role == 'teacher':
        query = """
            SELECT u.user_id, CONCAT(u.first_name,' ', u.surname) AS name, TIMESTAMPDIFF(YEAR, u.birth_date, CURDATE()) AS age, 
            s.school_name AS school, s.city, COUNT(ch.checkout_id) AS total_checkouts
            FROM user u
            LEFT JOIN checkout ch ON ch.user_id = u.user_id
            INNER JOIN school s ON s.school_id = u.school_id
            WHERE u.role = %s AND TIMESTAMPDIFF(YEAR, u.birth_date, CURDATE()) < %s
            GROUP BY u.user_id
            ORDER BY total_checkouts DESC, age DESC, u.surname ASC;
        """
        cursor = conn.cursor()
        cursor.execute(query, (role, age,))
        users = cursor.fetchall()
    elif role == 'both':
        query = """
            SELECT u.user_id, CONCAT(u.first_name,' ', u.surname) AS name, TIMESTAMPDIFF(YEAR, u.birth_date, CURDATE()) AS age, 
            s.school_name AS school, s.city, COUNT(ch.checkout_id) AS total_checkouts
            FROM user u
            LEFT JOIN checkout ch ON ch.user_id = u.user_id
            INNER JOIN school s ON s.school_id = u.school_id
            WHERE (u.role = 'teacher' OR u.role = 'student') AND TIMESTAMPDIFF(YEAR, u.birth_date, CURDATE()) < %s
            GROUP BY u.user_id
            ORDER BY total_checkouts DESC, age DESC, u.surname ASC;
        """
        cursor = conn.cursor()
        cursor.execute(query, (age,))
        users = cursor.fetchall()
    print(users)
    return render_template('query313.html', users = users)

@app.route('/admin/analytics/query314')
def query314_redirect():
    return redirect(url_for('query314'))

@app.route('/admin/analytics/lonely_authors', methods=['GET','POST'])
def query314():
    query = """
        SELECT a.name,
        (SELECT COUNT(*) FROM book_to_author ba WHERE ba.author_id = a.author_id) AS total_books,
        (SELECT SUM(bc.book_copies_number) FROM book_to_author ba
         JOIN book b ON ba.ISBN = b.ISBN
         JOIN book_copy bc ON b.ISBN = bc.book_id
         WHERE ba.author_id = a.author_id) AS total_copies
        FROM author a
        WHERE NOT EXISTS (
            SELECT 1
            FROM book b
            JOIN book_to_author ba ON b.ISBN = ba.ISBN
            JOIN book_copy bc ON b.ISBN = bc.book_id
            JOIN checkout co ON bc.copy_id = co.book_copy_id
            WHERE ba.author_id = a.author_id
    );
    """
    cursor = conn.cursor()
    cursor.execute(query)
    authors = cursor.fetchall()
    return render_template('query314.html', authors = authors)

@app.route('/admin/analytics/query315')
def query315_redirect():
    return redirect(url_for('query315'))

@app.route('/admin/analytics/successful_operators', methods=['GET','POST'])
def query315():
    query = """
        SELECT s.school_name, s.operator_name, s.city, COUNT(*) AS book_count
        FROM checkout c
        JOIN user u ON c.user_id = u.user_id
        JOIN school s ON u.school_id = s.school_id
        WHERE c.checkout_time BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE()
        GROUP BY s.school_name
        HAVING COUNT(*) > 20;
    """
    cursor = conn.cursor()
    cursor.execute(query)
    schools = cursor.fetchall()
    return render_template('query315.html', schools = schools)

@app.route('/admin/analytics/query316')
def query316_redirect():
    return redirect(url_for('query316'))

@app.route('/admin/analytics/top3-categories', methods=['GET','POST'])
def query316():
    query = """
        SELECT c1.name AS category1, c2.name AS category2, COUNT(*) AS num_books
        FROM book b
        JOIN book_to_category bc1 ON b.ISBN = bc1.ISBN
        JOIN category c1 ON bc1.category_id = c1.category_id
        JOIN book_to_category bc2 ON b.ISBN = bc2.ISBN
        JOIN category c2 ON bc2.category_id = c2.category_id
        JOIN book_copy bc ON b.ISBN = bc.book_id
        JOIN checkout co ON bc.copy_id = co.book_copy_id
        GROUP BY c1.name, c2.name
        HAVING category1 < category2
        ORDER BY num_books DESC
        LIMIT 3;
    """
    cursor = conn.cursor()
    cursor.execute(query)
    categories = cursor.fetchall()
    return render_template('query316.html', categories = categories)
@app.route('/admin/analytics/query317')
def query317_redirect():
    return redirect(url_for('query317'))

@app.route('/admin/analytics/unsuccessful_authors', methods=['GET','POST'])
def query317():
    query = """
        SELECT a.author_id, a.name, COUNT(*) AS book_count, SUM(vs.book_copies_number) AS total_copies
        FROM book_to_author bta
        JOIN author a ON bta.author_id = a.author_id
        JOIN view_school vs ON bta.isbn = vs.isbn
        GROUP BY a.author_id, a.name
        HAVING COUNT(*) <= (SELECT MAX(book_count) - 5
                FROM (SELECT COUNT(*) AS book_count
                      FROM book_to_author
                      GROUP BY author_id) AS counts)
        ORDER BY book_count DESC, name ASC;
    """
    cursor = conn.cursor()
    cursor.execute(query)
    authors = cursor.fetchall()
    return render_template('query317.html', authors = authors)

@app.route('/operator/analytics/overdue_users_redirect')
def overdue_users_redirect():
    return redirect(url_for('overdue_users'))

@app.route('/operator/analytics/overdue_users')
def overdue_users():
    schoolID = session['school_id']
    query = """
        SELECT CONCAT(vsu.first_name, ' ', vsu.surname) AS name, vs.title,
        DATEDIFF(NOW(), c.checkout_time)+8 AS days_passed
        FROM view_school_users vsu
        JOIN checkout c on vsu.user_id = c.user_id
        JOIN view_school vs on vsu.school_id = vs.school_id
        WHERE c.checkout_status = 'overdue' AND vsu.school_id = %s
        ORDER BY days_passed,vsu.surname DESC;
    """
    cursor = conn.cursor()
    cursor.execute(query,(schoolID,))
    users = cursor.fetchall()
    return render_template('overdue_users_operator.html', users=users)

@app.route('/operator/analytics/reviews_redirect')
def review_analysis_operatorredirect():
    return redirect(url_for('review_analysis_operator'))

@app.route('/operator/analytics/reviews')
def review_analysis_operator():
    schoolID = session['school_id']
    query1 = """
        SELECT CONCAT(vsu.first_name, ' ', vsu.surname, ' (',username, ')') AS name, ROUND(AVG(r.rating),2) AS average_rating
        FROM review r
        JOIN view_school_users vsu ON vsu.user_id = r.user_id
        WHERE r.review_status = 'accepted' AND vsu.school_id = %s
        GROUP BY vsu.username
        ORDER BY average_rating DESC;
    """
    cursor = conn.cursor()
    cursor.execute(query1, (schoolID,))
    users1 = cursor.fetchall()
    query2 = """
        SELECT c.name AS category, ROUND(AVG(r.rating), 2) AS average_rating
        FROM category c 
        JOIN book_to_category b2c ON b2c.category_id = c.category_id
        JOIN view_school vs ON b2c.ISBN = vs.book_id
        JOIN review r ON r.book_id = vs.book_id
        WHERE r.review_status = 'accepted' AND vs.school_id = %s
        GROUP BY c.name
        ORDER BY average_rating DESC;
    """
    cursor = conn.cursor()
    cursor.execute(query2, (schoolID,))
    users2 = cursor.fetchall()
    return render_template('review_analysis_operator.html', users1=users1, users2 = users2)

@app.route('/library_card')
def library_card():
    user = {
        'name': 'John Doe',
        'libraryId': '123456',
        'email': 'john.doe@example.com',
        'address': '123 Main St, City, Country',
        'barcode': '12345678'
    }
    barcode_value = '12345678'  # Replace with your barcode value

    # # Generate the barcode image using Code128 format
    # barcode = Code128(barcode_value, writer=ImageWriter())
    #
    # # Create an in-memory buffer to hold the image
    # barcode = Code128(barcode_value, writer=ImageWriter())
    #
    # # Create an in-memory buffer to hold the image
    # buffer = BytesIO()
    # barcode.write(buffer)
    # buffer.seek(0)
    #
    # # Convert the image to base64 encoding
    # barcode_image_base64 = base64.b64encode(buffer.read()).decode('utf-8')

    return render_template('dummy-search.html', user=user)

@app.errorhandler(401)
def unauthorized_error(error):
    return render_template('401.html'), 401


@app.errorhandler(404)
def not_found_error(error):
    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_server_error(error):
    return render_template('500.html'), 500


@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
    session.pop('loggedin', None)
    session.pop('user_id', None)
    session.pop('username', None)
    # Redirect to login page
    return render_template("login.html")

@app.route("/")
def main():
    return render_template("login.html")


if __name__ == "__main__":
    app.run(debug=True)