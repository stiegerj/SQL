--Jessie Stieger
--CIS336 iLab Week 6

--Query 1
SELECT CustomerID, FirstName, LastName,
NVL(TO_CHAR(Referred), 'Not Referred') AS "Referred By"
FROM Book_Customer
WHERE Referred IS NULL;

--Query 2
SELECT SUBSTR(Isbn, 1,1) || '-' || 
SUBSTR(Isbn, 3,3) || '-' || 
SUBSTR(Isbn, 5,5) || '-' || 
SUBSTR(Isbn, 10,1) AS "ISBN", TITLE
FROM Books
WHERE Category = 'COMPUTER';

 
--Query 3
SELECT Category, TO_CHAR(SUM(Retail),'$999.99') AS "Total Retail", TO_CHAR(AVG(Retail),'$999.99') AS "Average Retail"
FROM Books
GROUP BY Category
HAVING SUM(Retail) > 40;

 
--Query 4
SELECT b.Title AS "Book Title",COUNT(authorid) AS "Number of Authors"
FROM BOOKS b, BOOK_AUTHOR a
WHERE b.bookid = a.bookid
GROUP BY b.Title
HAVING COUNT(authorid) > 1;


--Query 5 
SELECT Bookid, Fname, Lname
FROM Book_Author b, Author a
WHERE b.authorid = a.authorid
GROUP BY b.bookid, Fname, Lname
HAVING b.bookid = (SELECT Bookid FROM Order_Items WHERE Quantity = (SELECT MAX(Quantity) FROM Order_Items));

--Query 6
SELECT bc.Customerid, CONCAT(firstname, lastname) AS "Customer Name", bc.City
FROM book_order bo, book_customer bc,
(SELECT Orderid FROM Order_Items WHERE Bookid = (SELECT Bookid FROM Books WHERE Retail = (SELECT MAX(Retail) FROM Books))) ExpensiveOrderIDs
WHERE bo.customerid = bc.customerid
AND ExpensiveOrderIDs.Orderid = bo.Orderid;


--Query 7
SELECT itemnum, SUM(Quantity) AS "Total",  TO_CHAR(AVG(Quantity),'99.99') AS "Average", MIN(Quantity) AS "Minimum", MAX(Quantity) AS "Maximum"
FROM Order_Items
GROUP BY itemnum;

--Query 8
SELECT Title, Pubdate, 
DECODE(Pubid,1,'Printing Is Us',2,'Publish Our Way',3,'American Publishing',4,'Reading Materials Inc.',5,'Reed-N-Rite',6,'Little House') AS "Publisher Name"
FROM Books
ORDER BY 3;


--Query 9
SELECT  'The contact person for ' || INITCAP(publishername) || ' Publishing is ' || INITCAP(contactname)
FROM Publisher;

--Query 10
SELECT LastName, City, State, SUM(Quantity) AS "Number Purchased"
FROM (Book_Customer c JOIN Book_Order o ON  c.CustomerId = o.CustomerId) JOIN Order_Items i ON o.OrderId = i.OrderId
GROUP BY LastName, City, State
HAVING SUM(Quantity) > 2;

--Query 11
SELECT Retail FROM Books WHERE pubid = 1;
UPDATE Books SET Retail=Retail*1.05 WHERE pubid = (SELECT pubid FROM Publisher WHERE publishername = 'PRINTING IS US');
SELECT Retail FROM Books WHERE pubid = 1;
ROLLBACK;

--Query 12
SELECT Firstname, Lastname
FROM BOOK_CUSTOMER
WHERE Referred = (SELECT Referred FROM Book_Customer WHERE Lastname = 'PEREZ' AND Firstname = 'JORGE') 
AND (Lastname != 'PEREZ' OR FIRSTNAME != 'JORGE');


--Query 13
SELECT Category, COUNT(*) AS "Category Total", TO_CHAR(SUM(Retail),'$999.99') AS "Cost"
FROM Books
GROUP BY Category;
