--query 3.1.1
SELECT school.school_id, school.school_name, COUNT(*) AS total_checkouts
FROM checkout
JOIN book_copy ON checkout.book_copy_id = book_copy.copy_id
JOIN school ON book_copy.school_id = school.school_id
WHERE YEAR(checkout.start_time) = 2023 AND MONTH(checkout.start_time) = 5
GROUP BY school.school_id, school.school_name;
--3.1.2
SELECT DISTINCT author.name AS author, user.first_name AS teacher
FROM book
JOIN book_to_author ON book.ISBN = book_to_author.author_id
JOIN author ON book_to_author.author_id = author.author_id
JOIN book_copy ON book.ISBN = book_copy.book_id
JOIN checkout ON book_copy.book_id = checkout.book_copy_id
JOIN user ON checkout.user_id = user.user_id
JOIN book_to_category ON book.ISBN = book_to_category.ISBN
JOIN category ON book_to_category.category_id = category.category_id
WHERE category.name = 'F2.1  Crime, Thriller & Adventure'
AND user.role = 'teacher'
AND YEAR(checkout.start_time) = YEAR(NOW()) - 1;
--3.1.2(different)
SELECT DISTINCT author.name AS author, user.first_name AS teacher
FROM book
JOIN book_to_author ON book.ISBN = book_to_author.ISBN
JOIN author ON book_to_author.author_id = author.author_id
JOIN book_copy ON book.ISBN = book_copy.book_id
JOIN checkout ON book_copy.copy_id = checkout.book_copy_id
JOIN user ON checkout.user_id = user.user_id
JOIN book_to_category ON book.ISBN = book_to_category.ISBN
JOIN category ON book_to_category.category_id = category.category_id
WHERE category.name = 'πρεπει να βαλουμε την κατηγορια'
AND user.role = 'teacher'
AND YEAR(checkout.start_time) = YEAR(NOW());

