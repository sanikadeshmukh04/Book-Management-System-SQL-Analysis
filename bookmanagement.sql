create database book_management;
use book_management;

describe users;
describe rating;
describe books;

-- 1.Finding each author's rating
SELECT 
    b.`Book-Author`,
    COUNT(r.`Book-Rating`) AS Number_of_Ratings
FROM Books b
JOIN rating r
    ON b.ISBN = r.ISBN
GROUP BY b.`Book-Author`
ORDER BY Number_of_Ratings DESC
LIMIT 10;


-- 2.customers interact with the platform the most(most engaged customers) 
#Most active user
SELECT
    `User-ID`,
    COUNT(*) AS Books_Rated
FROM rating
GROUP BY `User-ID`
ORDER BY Books_Rated DESC
LIMIT 10;

show tables;


--  3.Top 3 countries by number of users
SELECT
    Country,
    COUNT(*) AS Total_Users
FROM users
GROUP BY Country
ORDER BY Total_Users DESC
LIMIT 3;

-- 4.Books written by each author
SELECT
    `Book-Author`,
    COUNT(DISTINCT `ISBN`) AS Total_Books
FROM books
GROUP BY `Book-Author`
ORDER BY Total_Books DESC;

-- 5.Books published after 2000
SELECT
    `Book-Title`,
    `Book-Author`,
    `Year of Publication`
FROM books
WHERE `Year of Publication` > 2000
ORDER BY `Year of Publication` DESC;

-- 6.Total number of books published in each year
SELECT
    `Year of Publication`,
    COUNT(*) AS Total_Books
FROM books
GROUP BY `Year of Publication`
ORDER BY `Year of Publication` ASC;

-- 7.Names of books published in 1991
SELECT *
FROM books
WHERE `Year of Publication` = 1991;


-- 8.Publisher-author combinations with the highest number of ratings first.
SELECT 
    b.`Publisher`, 
    b.`Book-Author`, 
    COUNT(r.`User-ID`) AS Total_Ratings 
FROM books b 
JOIN rating r 
    ON b.`ISBN` = r.`ISBN` 
GROUP BY b.`Publisher`, b.`Book-Author` 
ORDER BY Total_Ratings DESC;

-- 9.Total Books
SELECT COUNT(*) AS Total_Books
FROM books;

-- 10.Ratings for each book
SELECT
    ISBN,
    COUNT(*) AS Total_Ratings
FROM rating
GROUP BY ISBN;

-- 11.Books published between 1990 and 2000
SELECT `Book-Title`, `Year of Publication`
FROM books
WHERE `Year of Publication` BETWEEN 1990 AND 2000;


-- 12.average rating for each ISBN
SELECT
    ISBN,
    AVG(`Book-Rating`) AS Average_Rating
FROM rating
GROUP BY ISBN;

-- 13.Averqage age of user
SELECT ROUND(AVG(Age), 2) AS Average_Age
FROM users;

-- 14.Most popular author by number of different books rated
SELECT
    b.`Book-Author`,
    COUNT(DISTINCT b.`ISBN`) AS Different_Books_Rated
FROM books b
JOIN rating r
    ON b.`ISBN` = r.`ISBN`
GROUP BY b.`Book-Author`
ORDER BY Different_Books_Rated DESC
LIMIT 10;

-- 15.publisher with the highest number of books 
SELECT
    `Publisher`,
    COUNT(DISTINCT `ISBN`) AS Total_Books
FROM books
WHERE `Publisher` IS NOT NULL
GROUP BY `Publisher`
HAVING COUNT(DISTINCT `ISBN`) > 10
ORDER BY Total_Books DESC
LIMIT 10;

-- 16. Average user age by country (top 10 countries by user count)
SELECT
    Country,
    COUNT(*) AS Total_Users,
    ROUND(AVG(Age), 1) AS Average_Age
FROM users
WHERE Age IS NOT NULL
GROUP BY Country
ORDER BY Total_Users DESC
LIMIT 10;

-- 17. Books that have never been rated
SELECT b.`Book-Title`, b.`Book-Author`
FROM books b
LEFT JOIN rating r
    ON b.ISBN = r.ISBN
WHERE r.ISBN IS NULL;

-- 18. Rating distribution (how many users gave each score)
SELECT
    `Book-Rating`,
    COUNT(*) AS Total
FROM rating
GROUP BY `Book-Rating`
ORDER BY `Book-Rating`;






