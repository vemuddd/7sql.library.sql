
CREATE DATABASE IF NOT EXISTS DigitalLibrary;
USE DigitalLibrary;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    available INT,
    rating DECIMAL(2,1)
);

INSERT INTO Books VALUES
(1, 'Harry Potter', 'J.K. Rowling', 'Fantasy', 5500, 4, 4.8),
(2, 'Atomic Habits', 'James Clear', 'Self-Help', 4200, 7, 4.8),
(3, 'Clean Code', 'Robert C. Martin', 'Programming', 5000, 3, 4.7),
(4, '1984', 'George Orwell', 'Classic', 3500, 5, 4.7),
(5, 'Computer Networks', 'Andrew Tanenbaum', 'Programming', 7000, 0, 4.4),
(6, 'JavaScript Guide', 'David Flanagan', 'Programming', 6000, 4, 4.3),
(7, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Classic', 3900, 3, 4.6),
(8, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 3800, 5, 4.5);

-- 1. SELECT
SELECT * FROM Books;

-- 2. WHERE
SELECT * FROM Books
WHERE price > 4000;

-- 3. Бірнеше шарт
SELECT * FROM Books
WHERE category = 'Programming' AND price > 5000;

-- 4. DISTINCT
SELECT DISTINCT category FROM Books;

-- 5. ORDER BY
SELECT * FROM Books
ORDER BY price DESC;

-- 6. GROUP BY
SELECT category, COUNT(*) AS book_count
FROM Books
GROUP BY category;

-- 7. Агрегаттық функциялар
SELECT
    COUNT(*) AS total_books,
    SUM(price) AS total_price,
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM Books;

-- 8. HAVING
SELECT category, AVG(price) AS average_price
FROM Books
GROUP BY category
HAVING AVG(price) > 4000;

-- 9. Орташа бағадан қымбат кітаптар
SELECT * FROM Books
WHERE price > (SELECT AVG(price) FROM Books);

-- 10. Ең қымбат 3 кітап
SELECT title, price
FROM Books
ORDER BY price DESC
LIMIT 3;
