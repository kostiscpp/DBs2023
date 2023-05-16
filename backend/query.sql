--query 3.1.1
SELECT school.school_id, school.school_name, COUNT(*) AS total_checkouts
FROM checkout
JOIN book_copy ON checkout.book_copy_id = book_copy.copy_id
JOIN school ON book_copy.school_id = school.school_id
WHERE YEAR(checkout.checkout_time) = 2023 AND MONTH(checkout.checkout_time) = 5
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
AND YEAR(checkout.checkout_time) = YEAR(NOW());
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
WHERE category.name = 'F2.1  Crime, Thriller & Adventure'
AND user.role = 'teacher'
AND YEAR(checkout.checkout_time) = YEAR(NOW());

--3.1.3
SELECT u.user_id, u.first_name, u.surname, tb.total_count
FROM user u
JOIN checkout_history tb ON u.user_id = tb.user_id
WHERE u.role = 'teacher' AND TIMESTAMPDIFF(YEAR, u.birth_date, CURDATE()) < 40
ORDER BY tb.total_count DESC;

--3.1.4
SELECT a.author_id, a.name
FROM author a
WHERE NOT EXISTS (
    SELECT 1
    FROM book b
    JOIN book_to_author ba ON b.ISBN = ba.ISBN
    JOIN book_copy bc ON b.ISBN = bc.book_id
    JOIN checkout co ON bc.copy_id = co.book_copy_id
    WHERE ba.author_id = a.author_id
)

--3.1.5 koniarh gamw ton xristo sou

--3.1.6
SELECT c1.name AS category1, c2.name AS category2, COUNT(*) AS total_borrowings
FROM book b
JOIN book_to_category bc1 ON b.ISBN = bc1.ISBN
JOIN book_to_category bc2 ON b.ISBN = bc2.ISBN
JOIN category c1 ON bc1.category_id = c1.category_id
JOIN category c2 ON bc2.category_id = c2.category_id
JOIN book_copy bc ON b.ISBN = bc.book_id
JOIN checkout co ON bc.book_id = co.book_copy_id
WHERE co.is_returned = 1
GROUP BY c1.name, c2.name
ORDER BY total_borrowings DESC
LIMIT 3;
--3.1.6
SELECT c1.name AS category1, c2.name AS category2, COUNT(*) AS borrow_count
FROM book b
JOIN book_to_category bc1 ON b.ISBN = bc1.ISBN
JOIN category c1 ON bc1.category_id = c1.category_id
JOIN book_to_category bc2 ON b.ISBN = bc2.ISBN
JOIN category c2 ON bc2.category_id = c2.category_id
JOIN book_copy bc ON b.ISBN = bc.book_id
JOIN checkout co ON bc.copy_id = co.book_copy_id
GROUP BY c1.name, c2.name
HAVING category1 < category2
ORDER BY borrow_count DESC
LIMIT 3;

---
SELECT c.name AS category, COUNT(*) AS borrow_count
FROM book b
JOIN book_to_category bc ON b.ISBN = bc.ISBN
JOIN checkout co ON b.ISBN = co.book_copy_id
JOIN category c ON bc.category_id = c.category_id
GROUP BY c.name
ORDER BY borrow_count DESC;

--3.1.7
SELECT a.author_id, a.name, COUNT(*) AS book_count
FROM author a
JOIN book_to_author ba ON a.author_id = ba.author_id
GROUP BY a.author_id, a.name
HAVING COUNT(*) >= (
  SELECT COUNT(*)
  FROM book_to_author
  GROUP BY author_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
) - 5;

--3.2.1
SELECT b.title, a.name AS author
FROM book b
JOIN book_to_author ba ON b.ISBN = ba.ISBN
JOIN author a ON ba.author_id = a.author_id;

--3.2.2
SELECT u.user_id, u.first_name
FROM user u
JOIN checkout co ON u.user_id = co.user_id
WHERE co.return_time < CURRENT_DATE AND co.is_returned = 0;
