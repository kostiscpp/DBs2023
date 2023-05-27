from flask import Flask, render_template, request, redirect, url_for, session, flash
import pymysql
from pymysql import Error

app = Flask(__name__)

app.secret_key = 'your secret key'

# Enter your database connection details below
# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = ''
# app.config['MYSQL_DB'] = 'db1initial'

# Intialize MySQL
# mysql = MySQL(app)
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
            return redirect('/admin/main')
        else:
            # Account doesnt exist or username/password incorrect
            error_message = 'Incorrect username/password!'
    # Show the login form with message (if any)
    return render_template('login.html', error_message=error_message)


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
        cursor.execute('SELECT * FROM user WHERE username = %s AND pwd = %s AND (role="teacher" OR role="student")',
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
            # Redirect to home page
            return render_template('index_user.html')
        else:
            # Account doesnt exist or username/password incorrect
            error_message = 'Incorrect username/password!'
    # Show the login form with message (if any)
    return render_template('login.html', error_message=error_message)


@app.route('/main', methods=['GET', 'POST'])
def go_to_main():
    role = session['role']
    if role == 'admin' or role == 'operator':
        return render_template('index_admin.html')
    else:
        return render_template('index_user.html')

@app.route('/admin/main', methods=['GET', 'POST'])
def go_to_main_admin():
    return render_template('index_admin.html')


@app.route('/user/main', methods=['GET', 'POST'])
def go_to_main_user():
    return render_template('index_user.html')


@app.route('/admin/profile_admin', methods=['GET', 'POST'])
def profile_admin():
    username = request.args.get('username')
    query = "SELECT * FROM user WHERE username = %s"
    cursor = conn.cursor()
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    query_school = "SELECT school.school_name AS school_name FROM user JOIN school on user.school_id = school.school_id WHERE user.username = %s;"
    cursor.execute(query_school, (username,))
    school = cursor.fetchone()['school_name']
    return render_template('profile_admin.html', user=user, school=school)


@app.route('/user/profile', methods=['GET', 'POST'])
def profile_user():
    if 'loggedin' in session:
        username = session['username']
        query = "SELECT * FROM user WHERE username = %s"
        cursor = conn.cursor()
        cursor.execute(query, (username,))
        user = cursor.fetchone()
        query_school = "SELECT school.school_name AS school_name FROM user JOIN school on user.school_id = school.school_id WHERE user.username = %s;"
        cursor.execute(query_school, (username,))
        school = cursor.fetchone()['school_name']
        if (user['role'] == 'teacher'):
            return render_template('profile_teacher.html', user=user, school=school)
        else:
            return render_template('profile_student.html', user=user, school=school)

    return redirect('login.html')


@app.route('/search_book_user', methods=['GET', 'POST'])
def search_book_user_redirect():
    # Perform any necessary actions or data processing
    # Redirect to the desired URL and render the template
    return redirect(url_for('search_book_user'))


@app.route('/user/books', methods=['GET'])
def search_book_user():
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)
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
    # view_name = "view_school_" + str(schoolID)
    query = """
    SELECT b.*, a.name
    FROM view_school b
    JOIN book_to_author b2a ON b.ISBN = b2a.ISBN
    JOIN author a ON b2a.author_id = a.author_id
    # JOIN book_to_category b2c ON b.ISBN = b2c.ISBN
    # JOIN category c ON b2c.category_id = c.category_id
    WHERE b.title = %s AND b.school_id = {}
    """.format(schoolID)
    cursor = conn.cursor()
    cursor.execute(query, (book,))
    book_data = cursor.fetchone()
    return render_template('book_details_user.html', book=book_data)


@app.route('/search_book_admin', methods=['GET', 'POST'])
def search_book_admin_redirect():
    # Perform any necessary actions or data processing
    # Redirect to the desired URL and render the template
    return redirect(url_for('search_book_admin'))


@app.route('/admin/books', methods=['GET'])
def search_book_admin():
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)
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
    return render_template('book_search_admin.html', books=books)


@app.route('/admin/books', methods=['POST'])
def admin_search_result():
    searchType = request.form['searchType']
    searchKey = request.form['searchKey']
    schoolID = session['school_id']

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
    return render_template('book_search_admin.html', books=books)


@app.route('/admin/books/<book>', methods=['GET', 'POST'])
def book_details_admin(book):
    schoolID = session['school_id']
    # view_name = "view_school_" + str(schoolID)
    query = """
    SELECT b.*, a.name
    FROM view_school b
    JOIN book_to_author b2a ON b.ISBN = b2a.ISBN
    JOIN author a ON b2a.author_id = a.author_id
    # JOIN book_to_category b2c ON b.ISBN = b2c.ISBN
    # JOIN category c ON b2c.category_id = c.category_id
    WHERE b.title = %s AND b.school_id = {}
    """.format(schoolID)
    cursor = conn.cursor()
    cursor.execute(query, (book,))
    book_data = cursor.fetchone()
    return render_template('book_details_admin.html', book=book_data)


# # Route for updating the book
# @app.route('/admin/books/update_book', methods=['POST'])
# def update_book():
#     # Get the updated form data
#     title = request.form['book_title']
#     language = request.form['book-language']
#     isbn = request.form['book-isbn']
#     pages = session['book-pages']
#     author = session['book-author']
#     year = session['book-year']

#     # Connect to the MySQL database
#     cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

#     # Prepare the SQL statement to update the user's birth date and school
#     update_query = "UPDATE `book` SET `title` = %s, `language` = %s, `ISBN` = %s `pages` = %s `year` = %s WHERE `` = %s"

#     # Execute the update query
#     cursor.execute(update_query, (birth_date, email, profile, username,))

#     # Commit the changes to the databasesearch_result
#     mysql.connection.commit()
#     cursor.close()

#     flash('Οι αλλαγές αποθηκεύτηκαν', 'success')

#     # Redirect back to the profile page after the update
#     return redirect('/user/profile')

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


@app.route('/search_user', methods=['GET', 'POST'])
def search_users_redirect():
    # Perform any necessary actions or data processing
    # Redirect to the desired URL and render the template
    return redirect(url_for('search_users'))


@app.route('/admin/users', methods=['GET', 'POST'])
def search_users():
    schoolID = session['school_id']

    query = " SELECT vsu.* FROM view_school_users vsu WHERE vsu.school_id = %s;"
    cursor = conn.cursor()
    cursor.execute(query, (schoolID,))
    users = cursor.fetchall()
    return render_template('catalog_user.html', users=users)


# @app.route('/user/books', methods=['POST'])
# def search_result():
#     searchType = request.form['searchType']
#     searchKey = request.form['searchKey']
#     schoolID = session['school_id']
#     # view_name = "view_school_" + str(schoolID)

#     if searchType == 'title':
#         query = """
#         SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number
#         FROM view_school vs
#         JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN
#         JOIN author a ON a.author_id = b2a.author_id
#         WHERE vs.school_id = {} AND vs.title LIKE %s
#         """.format(schoolID)
#         cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#         cursor.execute(query, ('%' + searchKey + '%',))
#     elif searchType == 'author':
#         query = """
#         SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number
#         FROM view_school vs
#         JOIN book_to_author b2a ON b2a.ISBN = vs.ISBN
#         JOIN author a ON a.author_id = b2a.author_id
#         WHERE vs.school_id = {} AND a.name LIKE %s
#         """.format(schoolID)
#         cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#         cursor.execute(query, ('%' + searchKey + '%',))
#     elif searchType == 'category':
#         query = """
#         SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number
#         FROM view_school vs
#         JOIN book_to_category b2c ON vs.ISBN = b2c.ISBN
#         JOIN category c ON b2c.category_id = c.category_id
#         JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN
#         JOIN author a ON b2a.author_id = a.author_id
#         WHERE vs.school_id = {} AND c.category LIKE %s
#         """.format(schoolID)
#         cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#         cursor.execute(query, ('%' + searchKey + '%',))
#     elif searchType == 'keyword':
#         query = """
#         SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number
#         FROM view_school vs
#         JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN
#         JOIN author a ON b2a.author_id = a.author_id
#         WHERE vs.school_id = {} AND vs.keywords LIKE %s
#         """.format(schoolID)
#         cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#         cursor.execute(query, ('%' + searchKey + '%',))
#     elif searchType == 'ISBN':
#         query = """
#         SELECT DISTINCT vs.title, a.name, vs.available_copies_number, vs.book_copies_number
#         FROM view_school vs
#         JOIN book_to_author b2a ON vs.ISBN = b2a.ISBN
#         JOIN author a ON b2a.author_id = a.author_id
#         WHERE vs.school_id = {} AND vs.ISBN LIKE %s
#         """.format(schoolID)
#         cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#         cursor.execute(query, ('%' + searchKey + '%',))
#     else:
#         return 'Invalid search type'

#     books = cursor.fetchall()
#     return render_template('book_search_user.html', books=books)

# @app.route('/user/books/<book>', methods=['GET', 'POST'])
# def book_details_user(book):
#     schoolID = session['school_id']
#     # view_name = "view_school_" + str(schoolID)
#     query = """
#     SELECT b.*, a.name
#     FROM view_school b
#     JOIN book_to_author b2a ON b.ISBN = b2a.ISBN
#     JOIN author a ON b2a.author_id = a.author_id
#     # JOIN book_to_category b2c ON b.ISBN = b2c.ISBN
#     # JOIN category c ON b2c.category_id = c.category_id
#     WHERE b.title = %s AND b.school_id = {}
#     """.format(schoolID)
#     cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#     cursor.execute(query, (book,))
#     book_data = cursor.fetchone()
#     return render_template('book_details_user.html', book=book_data)


# Route for updating the profile
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

    # Redirect back to the profile page after the update
    return redirect('/user/profile')


@app.route('/pending_holds', methods=['GET', 'POST'])
def pending_holds_redirect():
    return redirect('/admin/pending_holds')


@app.route('/admin/pending_holds', methods=['GET', 'POST'])
def pending_holds():
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
    return render_template('pending_holds.html', holds=holds)


@app.route('/admin/update_hold_status', methods=['GET', 'POST'])
def update_hold_status():
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
    return redirect('/admin/pending_holds')


@app.route('/checkout_redirect', methods=['GET','POST'])
def checkout_monitoring_redirect():
    return redirect(url_for('checkout_monitoring'))

@app.route('/admin/checkouts/checkout_monitoring', methods=['GET','POST'])
def checkout_monitoring():
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
    return render_template('checkout_monitoring.html', checkouts=checkouts)

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