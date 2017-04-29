--Jessie Stieger
--CIS336 iLab Week 7

--Query 1
CREATE VIEW CUST_VIEW AS
SELECT customerid,firstname,lastname,state
FROM book_customer;

INSERT INTO book_customer(customerid,firstname,lastname,state) VALUES(1021,'Edward','Blake','TX');

SELECT * FROM CUST_VIEW;

--Query 2
CREATE VIEW CUST_ORDER AS
SELECT Book_Customer.Customerid,Lastname,State,Orderid,Orderdate
FROM Book_Customer,Book_Order
WHERE Book_Customer.Customerid = Book_Order.Customerid;

INSERT INTO CUST_ORDER VALUES(1022,'smith','KS',1021,TO_DATE('10-OCT-2004','dd-mon-yyyy');
SELECT * FROM CUST_ORDER;

--Query 3
--This doesn't work because a view doesn't create a copy of a table in the sense that the view is itself a table
--The view is just a snapshot of a table that you can perform queries on

--Query 4
CREATE SEQUENCE PUBNUM_SEQ
START WITH 7
INCREMENT BY 2
MAXVALUE 1000
NOCYCLE;

--Query 5
INSERT INTO Publisher VALUES(PUBNUM_SEQ.nextval,'Double Week','Jennifer Close','800-959-6321');
INSERT INTO Publisher VALUES(PUBNUM_SEQ.nextval,'Specific House','Freddie Farmore','866-825-3200');

SELECT * FROM Publisher;

--Query 6
SELECT PUBNUM_SEQ.CURRVAL FROM DUAL;
SELECT PUBNUM_SEQ.nextval FROM DUAL;

--Query 7
CREATE UNIQUE INDEX BOOK_ORDER_IDX
ON Book_Order (Orderid,Customerid);

--Query 8
SELECT object_type, count(*)
FROM user_objects
GROUP BY object_type;