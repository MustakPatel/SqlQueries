we are gonna perform all the queries on these tables.
-----------------------------------------------------
SELECT * FROM Customers;
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2001 | Hoffman  | London  |    100 | 1001 |
| 2002 | Giovanni | Rome    |    200 | 1003 |
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2004 | Grass    | Berlin  |    300 | 1002 |
| 2006 | Clemens  | London  |    100 | 1001 |
| 2007 | pereira  | Rome    |    100 | 1004 |
| 2008 | Cisneros | SanJose |    300 | 1007 |
+------+----------+---------+--------+------+

SELECT * FROM Orders;
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
| 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
| 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
| 3008 |    4723 | 1990-05-10 | 2006 | 1001 |
| 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
| 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-06-10 | 2006 | 1001 |
+------+---------+------------+------+------+

SELECT * FROM SalesPeople;

        +------+---------+-----------+------+
        | SNUM | SNAME   | CITY      | COMM |
        +------+---------+-----------+------+
        | 1001 | Peel    | London    |   12 |
        | 1002 | Serres  | SanJose   |   13 |
        | 1003 | AxelRod | New York  |   10 |
        | 1004 | Molike  | London    |   11 |
        | 1007 | Rifkin  | Barcelona |   15 |
        | 1008 | Fran    | London    |   25 |
        +------+---------+-----------+------+
-----------------------------------------------------

Solve Following Queries

1) List all the columns of the SalesPeople table.

Query : SELECT * FROM SalesPeople;

        +------+---------+-----------+------+
        | SNUM | SNAME   | CITY      | COMM |
        +------+---------+-----------+------+
        | 1001 | Peel    | London    |   12 |
        | 1002 | Serres  | SanJose   |   13 |
        | 1003 | AxelRod | New York  |   10 |
        | 1004 | Molike  | London    |   11 |
        | 1007 | Rifkin  | Barcelona |   15 |
        | 1008 | Fran    | London    |   25 |
        +------+---------+-----------+------+
---------------------------------------------------

2) List all Customers with a rating of 100.

Query : SELECT * FROM Customers WHERE Ratting = 100;

        +------+---------+--------+---------+------+
        | CNUM | CNAME   | CITY   | RATTING | SNUM |
        +------+---------+--------+---------+------+
        | 2001 | Hoffman | London |     100 | 1001 |
        | 2006 | Clemens | London |     100 | 1001 |
        | 2007 | pereira | Rome   |     100 | 1004 |
        +------+---------+--------+---------+------+
---------------------------------------------------

3) Find the largest order taken by each salesperson on each date.

Query : SELECT o.onum, s.sname, o.amt
        FROM Orders o INNER JOIN SalesPeople s
        ON o.snum = s.snum And o.amt
        in (SELECT max(amt) FROM Orders GROUP BY snum);

        +------+---------+---------+
        | ONUM | SNAME   | AMT     |
        +------+---------+---------+
        | 3002 | Molike  |  1900.1 |
        | 3005 | Serres  | 5160.45 |
        | 3006 | Rifkin  | 1098.16 |
        | 3009 | AxelRod | 1713.23 |
        | 3011 | Peel    | 9891.88 |
        +------+---------+---------+
---------------------------------------------------

4) Arrange the Order table by descending customer number.

Query : SELECT * FROM Orders ORDER BY Cnum DESC;

        +------+---------+------------+------+------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM |
        +------+---------+------------+------+------+
        | 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
        | 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
        | 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
        | 3008 |    4723 | 1990-05-10 | 2006 | 1001 |
        | 3011 | 9891.88 | 1990-06-10 | 2006 | 1001 |
        | 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
        | 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
        | 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
        | 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
        | 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
        +------+---------+------------+------+------+
---------------------------------------------------

5) Find which SalesPeople currently have Orders in the order table.

Query :  SELECT s.sname AS SalesPeople
         FROM SalesPeople s, Orders o
         WHERE s.snum = o.snum GROUP BY s.snum;

        +-------------+
        | SalesPeople |
        +-------------+
        | Peel        |
        | Serres      |
        | AxelRod     |
        | Molike      |
        | Rifkin      |
        +-------------+
---------------------------------------------------

6) List names of all Customers matched with the SalesPeople serving them.

Query :  SELECT C1.cname AS Customers, S1.sname AS SalesMen
         FROM Customers C1, SalesPeople S1
         where C1.snum = S1.snum;

        +-----------+----------+
        | Customers | SalesMen |
        +-----------+----------+
        | Hoffman   | Peel     |
        | Giovanni  | AxelRod  |
        | Liu       | Serres   |
        | Grass     | Serres   |
        | Clemens   | Peel     |
        | pereira   | Molike   |
        | Cisneros  | Rifkin   |
        +-----------+----------+
---------------------------------------------------

7) Find the names and numbers of all SalesPeople who have more than one customer.

Query : SELECT sname AS SalesMen,snum AS NUMBER FROM SalesPeople
        WHERE snum IN (SELECT snum FROM Customers GROUP BY (snum) HAVING count(snum) > 1 );

        +----------+--------+
        | SalesMen | NUMBER |
        +----------+--------+
        | Peel     |   1001 |
        | Serres   |   1002 |
        +----------+--------+
---------------------------------------------------

8) Count the Orders of each of the SalesPeople and output the results in descending order.

Query : SELECT o.snum "Numbers",
        s.sname "SalesPeople",
        count(o.snum) "Orders"
        FROM Orders o, SalesPeople s
        WHERE o.snum = s.snum
        GROUP BY o.snum;

        +---------+-------------+--------+
        | Numbers | SalesPeople | Orders |
        +---------+-------------+--------+
        |    1001 | Peel        |      3 |
        |    1002 | Serres      |      3 |
        |    1003 | AxelRod     |      1 |
        |    1004 | motika      |      1 |
        |    1007 | Rifkin      |      2 |
        +---------+-------------+--------+
---------------------------------------------------

9) List the customer table if and only if one or more of the Customers in the Customer table are located in SanJose.

Query :  SELECT * FROM Customers where city = 'SanJose';

        +------+----------+---------+---------+------+
        | CNUM | CNAME    | CITY    | RATTING | SNUM |
        +------+----------+---------+---------+------+
        | 2003 | Liu      | SanJose |     200 | 1002 |
        | 2008 | Cisneros | SanJose |     300 | 1007 |
        +------+----------+---------+---------+------+

---------------------------------------------------

10) Match SalesPeople to Customers according to what city they live in.

Query :  SELECT s.sname AS salesman, s.city,c.cname AS customername
             FROM SalesPeople s, Customers c where s.city = c.city;

        +----------+---------+--------------+
        | salesman | city    | customername |
        +----------+---------+--------------+
        | Fran     | London  | Hoffman      |
        | Molike   | London  | Hoffman      |
        | Peel     | London  | Hoffman      |
        | Serres   | SanJose | Liu          |
        | Fran     | London  | Clemens      |
        | Molike   | London  | Clemens      |
        | Peel     | London  | Clemens      |
        | Serres   | SanJose | Cisneros     |
        +----------+---------+--------------+

---------------------------------------------------

11) Find all the Customers in SanJose who have a rating above 200.

Query : SELECT cname AS Customers, ratting FROM Customers
        WHERE city = 'SanJose' AND ratting > 200;

        +-----------+---------+
        | Customers | ratting |
        +-----------+---------+
        | Cisneros  |     300 |
        +-----------+---------+
---------------------------------------------------

12) List the names and commissions of all SalesPeople in London.

Query : SELECT SNAME AS name, comm as commissions
        FROM SalesPeople WHERE city = 'London';

        +--------+-------------+
        | name   | commissions |
        +--------+-------------+
        | Peel   |          12 |
        | Molike |          11 |
        | Fran   |          25 |
        +--------+-------------+
---------------------------------------------------

13) List all the Orders of Salesperson Motika from the Orders table.

Query : SELECT * FROM Orders
        WHERE snum
        in (SELECT snum FROM SalesPeople WHERE sname = 'motika');

        +------+--------+------------+------+------+
        | ONUM | AMT    | ODATE      | CNUM | SNUM |
        +------+--------+------------+------+------+
        | 3002 | 1900.1 | 1990-03-10 | 2007 | 1004 |
        +------+--------+------------+------+------+
---------------------------------------------------
14) Find all Customers who booked Orders on October 3.

Query : SELECT cname AS Customers, odate as orderdate
        FROM Customers c, Orders o
        WHERE c.cnum = o.cnum and o.odate = '1990-10-03';

        +-----------+------------+
        | Customers | orderdate  |
        +-----------+------------+
        | Cisneros  | 1990-10-03 |
        | pereira   | 1990-10-03 |
        | Hoffman   | 1990-10-03 |
        | Liu       | 1990-10-03 |
        | Cisneros  | 1990-10-03 |
        +-----------+------------+
---------------------------------------------------

15) Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000 above
the maximum Amount.

Query : SELECT sum(amt) FROM Orders GROUP BY odate;

        +--------------------+
        | sum(amt)           |
        +--------------------+
        |  8944.590208053589 |
        |   1788.97998046875 |
        |               4723 |
        | 11201.829833984375 |
        +--------------------+
---------------------------------------------------

16) Select all Orders that had amounts that were greater than at least one of the Orders from October 6.

Query : SELECT *, max(amt) FROM Orders WHERE odate ='1990-10-06';

        +------+---------+------------+------+------+----------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM | max(amt) |
        +------+---------+------------+------+------+----------+
        | 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |  9891.88 |
        +------+---------+------------+------+------+----------+
---------------------------------------------------

17) Write a query that uses the EXISTS operator to extract all SalesPeople who have Customers with a rating of 300.

Query : SELECT snum,sname,city
        FROM salespeople s
        WHERE EXISTS (SELECT * FROM customers c
                        WHERE s.snum = c.snum
                        AND c.ratting = 300);

+------+--------+-----------+
| snum | sname  | city      |
+------+--------+-----------+
| 1002 | Serres | SanJose   |
| 1007 | Rifkin | Barcelona |
+------+--------+-----------+
---------------------------------------------------

18) Find all Customers whose cnum is 1000 above the snum of Serres.

Query : SELECT cnum,cname FROM Customers
        WHERE cnum > (SELECT snum+1000 FROM SalesPeople WHERE sname = 'Serres');

        +------+----------+
        | cnum | cname    |
        +------+----------+
        | 2003 | Liu      |
        | 2004 | Grass    |
        | 2006 | Clemens  |
        | 2007 | pereira  |
        | 2008 | Cisneros |
        +------+----------+
---------------------------------------------------

19) Give the SalesPeople’s commissions as percentages instead of decimal numbers.
---------------------------------------------------

20) Find the largest order taken by each salesperson on each date, eliminating those Maximum Orders, which are less than 3000.

Query : SELECT o.onum,s.sname,o.amt
        FROM SalesPeople s INNER JOIN Orders o
        ON o.snum = s.snum AND o.amt
        IN (SELECT amt FROM Orders WHERE amt > 3000 GROUP BY snum);

        +------+--------+---------+
        | onum | sname  | amt     |
        +------+--------+---------+
        | 3005 | Serres | 5160.45 |
        | 3008 | Peel   |    4723 |
        | 3011 | Peel   | 9891.88 |
        +------+--------+---------+
---------------------------------------------------

21) List all the largest Orders for October 3, for each salesperson.

Query : SELECT o.onum, o.amt, o.odate, s.snum,s.sname FROM Orders o INNER JOIN SalesPeople s
        ON o.snum = s.snum
        AND o.odate = '1990-10-03'
        AND o.amt
        IN (SELECT max(amt) FROM Orders GROUP BY snum);

        +------+---------+------------+------+--------+
        | onum | amt     | odate      | snum | sname  |
        +------+---------+------------+------+--------+
        | 3002 |  1900.1 | 1990-10-03 | 1004 | motika |
        | 3005 | 5160.45 | 1990-10-03 | 1002 | Serres |
        | 3006 | 1098.16 | 1990-10-03 | 1007 | Rifkin |
        +------+---------+------------+------+--------+
---------------------------------------------------

22) Find all Customers located in cities where Serres has Customers.

Query : SELECT cname AS Customers,city FROM Customers
        WHERE city IN (SELECT city FROM Customers
        WHERE snum IN (SELECT snum FROM SalesPeople
        WHERE sname ='Serres'));

        +-----------+---------+
        | Customers | city    |
        +-----------+---------+
        | Liu       | SanJose |
        | Grass     | Berlin  |
        | Cisneros  | SanJose |
        +-----------+---------+
---------------------------------------------------

23) Select all Customers with a rating above 200.

Query :  SELECT * FROM Customers WHERE ratting > 200;

        +------+----------+---------+---------+------+
        | CNUM | CNAME    | CITY    | RATTING | SNUM |
        +------+----------+---------+---------+------+
        | 2004 | Grass    | Berlin  |     300 | 1002 |
        | 2008 | Cisneros | SanJose |     300 | 1007 |
        +------+----------+---------+---------+------+
---------------------------------------------------

24) Count the number of SalesPeople currently having Orders in the Orders table.

Query :  SELECT count(DISTINCT s.snum)
         FROM SalesPeople s,Orders o
         WHERE s.snum = o.snum;

        +------------------------+
        | count(DISTINCT s.snum) |
        +------------------------+
        |                      5 |
        +------------------------+
---------------------------------------------------

25) Write a query that produces all Customers serviced by SalesPeople with a commission above 12%. Output the customer’s name,
salesperson’s name and the salesperson’s rate of commission.

Query : SELECT c.cname AS Customers, s.sname AS salespersons, s.comm AS commission
        FROM SalesPeople s INNER JOIN Customers c
        on s.snum = c.snum AND s.comm > 12;

        +-----------+--------------+------------+
        | Customers | salespersons | commission |
        +-----------+--------------+------------+
        | Liu       | Serres       |         13 |
        | Grass     | Serres       |         13 |
        | Cisneros  | Rifkin       |         15 |
        +-----------+--------------+------------+
---------------------------------------------------

26) Find SalesPeople who have multiple Customers.

Query : SELECT snum, sname AS salespersons
        FROM SalesPeople
        WHERE snum
        IN (SELECT snum from Customers group by snum having count(snum)>1);

        +------+--------------+
        | snum | salespersons |
        +------+--------------+
        | 1001 | Peel         |
        | 1002 | Serres       |
        +------+--------------+
---------------------------------------------------

27) Find SalesPeople with Customers located in their own cities.

Query :  SELECT c.cname,s.sname
         FROM SalesPeople s, Customers c
         WHERE s.snum = c.snum AND s.city = c.city;

        +---------+--------+
        | cname   | sname  |
        +---------+--------+
        | Hoffman | Peel   |
        | Liu     | Serres |
        | Clemens | Peel   |
        +---------+--------+
-- ---------------------------------------------------

28) Find all SalesPeople whose name starts with ‘P’ and fourth character is ‘I’.

Query : SELECT * FROM SalesPeople
        WHERE sname LIKE 'P__L';

        +------+-------+--------+------+
        | SNUM | SNAME | CITY   | COMM |
        +------+-------+--------+------+
        | 1001 | Peel  | London |   12 |
        +------+-------+--------+------+
---------------------------------------------------

29) Write a query that uses a subquery to obtain all Orders for the customer named ‘Cisneros’. Assume you do not know his customer number.

Query : SELECT * FROM SalesPeople
        WHERE  snum  = (SELECT snum FROM Customers WHERE cname = 'cisneros');

        +------+--------+-----------+------+
        | SNUM | SNAME  | CITY      | COMM |
        +------+--------+-----------+------+
        | 1007 | Rifkin | Barcelona |   15 |
        +------+--------+-----------+------+
---------------------------------------------------

30) Find the largest Orders for Serres and Rifkin.

Query :  SELECT o.onum,
         s.snum,
         s.sname,
         max(o.amt)
         FROM salespeople s, orders o
         WHERE s.snum = o.snum
         AND s.sname IN ('serres','rifkin')
         GROUP BY s.snum;

        +------+------+--------+------------+
        | onum | snum | sname  | max(o.amt) |
        +------+------+--------+------------+
        | 3005 | 1002 | Serres |    5160.45 |
        | 3001 | 1007 | Rifkin |    1098.16 |
        +------+------+--------+------------+
---------------------------------------------------

31) Sort the SalesPeople table in the following order: snum, sname, commission, city.

Query : SELECT Snum, sname, comm, city FROM SalesPeople
        ORDER BY Snum, sname, comm, city;

        +------+---------+------+-----------+
        | Snum | sname   | comm | city      |
        +------+---------+------+-----------+
        | 1001 | Peel    |   12 | London    |
        | 1002 | Serres  |   13 | SanJose   |
        | 1003 | AxelRod |   10 | New York  |
        | 1004 | motika  |   11 | London    |
        | 1007 | Rifkin  |   15 | Barcelona |
        | 1008 | Fran    |   25 | London    |
        +------+---------+------+-----------+
---------------------------------------------------

32) Select all Customers whose names fall in between ‘A’ and ‘G’ alphabetical range.

Query : SELECT * FROM Customers
        WHERE cname BETWEEN 'A' AND 'G';

        +------+----------+---------+---------+------+
        | CNUM | CNAME    | CITY    | RATTING | SNUM |
        +------+----------+---------+---------+------+
        | 2006 | Clemens  | London  |     100 | 1001 |
        | 2008 | Cisneros | SanJose |     300 | 1007 |
        +------+----------+---------+---------+------+
---------------------------------------------------

33) Select all the possible combinations of Customers you can assign.

Query :
---------------------------------------------------


34) Select all Orders that are greater than the average for October 4.

Query : SELECT * FROM Orders
        WHERE amt >(SELECT  avg(amt)
                    FROM Orders
                    WHERE odate = '1990-10-04');

        +------+---------+------------+------+------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM |
        +------+---------+------------+------+------+
        | 3002 |  1900.1 | 1990-10-03 | 2007 | 1004 |
        | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
        | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
        | 3008 |    4723 | 1990-10-05 | 2006 | 1001 |
        | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
        | 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
        | 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
        +------+---------+------------+------+------+
---------------------------------------------------

35) Write a select command using correlated subquery that selects the names and numbers of all Customers with ratings equal to the maximum
    for their city.

Query :
36) Write a query that totals the Orders for each day and places the results in descending order.

Query : SELECT odate, count(odate)
        FROM Orders
        GROUP BY odate ORDER BY count(odate) ;

        +------------+--------------+
        | odate      | count(odate) |
        +------------+--------------+
        | 1990-10-05 |            1 |
        | 1990-10-04 |            2 |
        | 1990-10-06 |            2 |
        | 1990-10-03 |            5 |
        +------------+--------------+
---------------------------------------------------
37) Write a select command that produces the rating followed by the name of each customer in SanJose.

Query : SELECT cname,city,ratting from Customers where city = 'sanjose';

        +----------+---------+---------+
        | cname    | city    | ratting |
        +----------+---------+---------+
        | Liu      | SanJose |     200 |
        | Cisneros | SanJose |     300 |
        +----------+---------+---------+
---------------------------------------------------

38) Find all Orders with amounts smaller than any amount for a customer in SanJose.

Query :  SELECT onum,amt
         FROM orders
         WHERE amt < (SELECT max(amt)
                        FROM orders o,customers c
                        WHERE city = 'sanjose'
                        AND o.cnum = c.cnum);

        +------+---------+
        | onum | amt     |
        +------+---------+
        | 3001 |   18.69 |
        | 3002 |  1900.1 |
        | 3003 |  767.19 |
        | 3006 | 1098.16 |
        | 3007 |   75.75 |
        | 3008 |    4723 |
        | 3009 | 1713.23 |
        | 3010 | 1309.95 |
        +------+---------+
---------------------------------------------------

39) Find all Orders with above average amounts for their Customers.

---------------------------------------------------

40) Write a query that selects the highest rating in each city.

Query : select city,max(ratting) from Customers group by city;

        +---------+--------------+
        | city    | max(ratting) |
        +---------+--------------+
        | London  |          100 |
        | Rome    |          200 |
        | SanJose |          300 |
        | Berlin  |          300 |
        +---------+--------------+
---------------------------------------------------

41) Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.00.
Query :
42) Count the Customers with ratings above SanJose’s average.

Query : SELECT count(ratting)
        FROM customers
        WHERE ratting > (SELECT avg(amt) FROM orders
                            WHERE cnum IN (SELECT cnum FROM
                                                customers where city = 'sanjose'));

        +----------------+
        | count(ratting) |
        +----------------+
        |              0 |
        +----------------+
---------------------------------------------------

43) Find all SalesPeople that are located in either Barcelona or London.

Query : SELECT * FROM SalesPeople
        WHERE city='Barcelona' OR city='London';

        +------+--------+-----------+------+
        | SNUM | SNAME  | CITY      | COMM |
        +------+--------+-----------+------+
        | 1001 | Peel   | London    |   12 |
        | 1004 | motika | London    |   11 |
        | 1007 | Rifkin | Barcelona |   15 |
        | 1008 | Fran   | London    |   25 |
        +------+--------+-----------+------+
---------------------------------------------------

44) Find all SalesPeople with only one customer.

Query : SELECT * FROM SalesPeople s,Customers c
        WHERE s.snum = c.snum
        GROUP BY c.snum having count(c.snum)=1;

        +------+---------+-----------+------+------+----------+---------+---------+------+
        | SNUM | SNAME   | CITY      | COMM | CNUM | CNAME    | CITY    | RATTING | SNUM |
        +------+---------+-----------+------+------+----------+---------+---------+------+
        | 1003 | AxelRod | New York  |   10 | 2002 | Giovanni | Rome    |     200 | 1003 |
        | 1004 | motika  | London    |   11 | 2007 | pereira  | Rome    |     100 | 1004 |
        | 1007 | Rifkin  | Barcelona |   15 | 2008 | Cisneros | SanJose |     300 | 1007 |
        +------+---------+-----------+------+------+----------+---------+---------+------+
---------------------------------------------------
45) Write a query that joins the Customer table to itself to find all pairs or Customers served by a single salesperson.

Query : SELECT c1.cname,c1.snum
        FROM Customers c1 INNER JOIN Customers c2
        ON c1.snum = c2.snum
        AND c1.cname <> c2.cname ORDER BY c1.snum;

        +---------+------+
        | cname   | snum |
        +---------+------+
        | Hoffman | 1001 |
        | Clemens | 1001 |
        | Liu     | 1002 |
        | Grass   | 1002 |
        +---------+------+
---------------------------------------------------

46) Write a query that will give you all Orders for more than $1000.00.

Query :  SELECT * FROM Orders WHERE amt > '1000.00';

        +------+---------+------------+------+------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM |
        +------+---------+------------+------+------+
        | 3002 |  1900.1 | 1990-10-03 | 2007 | 1004 |
        | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
        | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
        | 3008 |    4723 | 1990-10-05 | 2006 | 1001 |
        | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
        | 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
        | 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
        +------+---------+------------+------+------+
---------------------------------------------------

47) Write a query that lists each order number followed by the name of the customer who made that order.

Query : SELECT O.onum, c.cname FROM Orders o, Customers c
        WHERE O.cnum = c.cnum ORDER BY o.onum;

        +------+----------+
        | onum | cname    |
        +------+----------+
        | 3001 | Cisneros |
        | 3002 | pereira  |
        | 3003 | Hoffman  |
        | 3005 | Liu      |
        | 3006 | Cisneros |
        | 3007 | Grass    |
        | 3008 | Clemens  |
        | 3009 | Giovanni |
        | 3010 | Grass    |
        | 3011 | Clemens  |
        +------+----------+
---------------------------------------------------

48) Write a query that selects all the Customers   to or greater than ANY(in the SQL sense) of ‘Serres’.

Query : SELECT cname,ratting FROM Customers
        WHERE ratting >= ANY (SELECT ratting
                                    FROM Customers
                                    WHERE snum = (SELECT snum from SalesPeople
                                                        WHERE sname = 'serres'));

        +----------+---------+
        | cname    | ratting |
        +----------+---------+
        | Giovanni |     200 |
        | Liu      |     200 |
        | Grass    |     300 |
        | Cisneros |     300 |
        +----------+---------+
---------------------------------------------------

49) Write two queries that will produce all Orders taken on October 3 or October 4.

Query : SELECT * FROM Orders
        WHERE odate in ('1990-10-03','1990-10-04');

        +------+---------+------------+------+------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM |
        +------+---------+------------+------+------+
        | 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
        | 3002 |  1900.1 | 1990-10-03 | 2007 | 1004 |
        | 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
        | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
        | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
        | 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
        | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
        +------+---------+------------+------+------+
---------------------------------------------------

50) Find only those Customers whose ratings are higher than every customer in Rome.

Query : SELECT cname,ratting FROM Customers WHERE ratting > ANY (SELECT max(ratting) FROM Customers WHERE city = 'Rome');

        +----------+---------+
        | cname    | ratting |
        +----------+---------+
        | Grass    |     300 |
        | Cisneros |     300 |
        +----------+---------+
---------------------------------------------------

51) Write a query on the Customers table whose output will exclude all Customers with a rating<= 100.00, unless they are located in Rome.
52) Find all rows from the customer’s table for which the salesperson number is 1001.

Query : SELECT * FROM Customers WHERE snum = 1001;

        +------+---------+--------+---------+------+
        | CNUM | CNAME   | CITY   | RATTING | SNUM |
        +------+---------+--------+---------+------+
        | 2001 | Hoffman | London |     100 | 1001 |
        | 2006 | Clemens | London |     100 | 1001 |
        +------+---------+--------+---------+------+
---------------------------------------------------

53) Find the total amount in Orders for each salesperson where their total of amounts are greater than the amount of the largest order in the table.

Query : SELECT snum,sum(amt) FROM Orders
        GROUP BY snum
        HAVING sum(amt) > (SELECT max(amt) FROM Orders);

        +------+--------------------+
        | snum | sum(amt)           |
        +------+--------------------+
        | 1001 | 15382.069885253906 |
        +------+--------------------+
---------------------------------------------------

54) Write a query that selects all Orders save those with zeroes or NULL in the amount file.

Query :  SELECT * FROM Orders WHERE amt IN (0,NULL);

         Empty set (0.00 sec)
---------------------------------------------------

55) Produce all combinations of SalesPeople and customer names such that the former precedes the latter alphabetically, and the latter has a
rating of less than 200.
56) Find all SalesPeople name and commission.

Query :  SELECT sname AS SalesPeople,comm AS commission FROM SalesPeople;

        +-------------+------------+
        | SalesPeople | commission |
        +-------------+------------+
        | Peel        |         12 |
        | Serres      |         13 |
        | AxelRod     |         10 |
        | motika      |         11 |
        | Rifkin      |         15 |
        | Fran        |         25 |
        +-------------+------------+
---------------------------------------------------

57) Write a query that produces the names and cities of all Customers with the same rating as Hoffman. Write the query using Hoffman’s cnum
rather than his rating, so that it would still be usable if his rating is changed.

Query : SELECT cname,city FROM Customers
        WHERE cnum IN (SELECT cnum FROM Customers
                            WHERE ratting
                            IN (SELECT ratting FROM Customers
                                    WHERE cname = 'hoffman'));

        +---------+--------+
        | cname   | city   |
        +---------+--------+
        | Hoffman | London |
        | Clemens | London |
        | pereira | Rome   |
        +---------+--------+
---------------------------------------------------

58) Find all SalesPeople for whom there are Customers that follow them in alphabetical order.
59) Write a query that produces the names and ratings of all Customers who have average Orders.
60) Find the SUM of all Amounts from the Orders table.

Query : SELECT sum(amt) FROM Orders;

        +--------------------+
        | sum(amt)           |
        +--------------------+
        | 26658.400022506714 |
        +--------------------+
---------------------------------------------------

61) Write a SELECT command that produces the order number, amount, and the date from rows in the order table.

Query : SELECT onum AS orderNumber, amt AS amount, odate AS date FROM Orders;

        +-------------+---------+------------+
        | orderNumber | amount  | date       |
        +-------------+---------+------------+
        |        3001 |   18.69 | 1990-10-03 |
        |        3002 |  1900.1 | 1990-10-03 |
        |        3003 |  767.19 | 1990-10-03 |
        |        3005 | 5160.45 | 1990-10-03 |
        |        3006 | 1098.16 | 1990-10-03 |
        |        3007 |   75.75 | 1990-10-04 |
        |        3008 |    4723 | 1990-10-05 |
        |        3009 | 1713.23 | 1990-10-04 |
        |        3010 | 1309.95 | 1990-10-06 |
        |        3011 | 9891.88 | 1990-10-06 |
        +-------------+---------+------------+
---------------------------------------------------

62) Count the number of non NULL rating fields in the Customers table (including repeats).

Query : SELECT count(ratting) FROM Customers WHERE ratting IS NOT NULL;

        +----------------+
        | count(ratting) |
        +----------------+
        |              7 |
        +----------------+
---------------------------------------------------

63) Write a query that gives the names of both the salesperson and the customer for each order after the order number.

Query : SELECT o.onum, s.sname, c.cname
        FROM Orders o, SalesPeople s, Customers c
        WHERE o.snum = s.snum AND o.cnum = c.cnum;

        +------+---------+----------+
        | onum | sname   | cname    |
        +------+---------+----------+
        | 3003 | Peel    | Hoffman  |
        | 3009 | AxelRod | Giovanni |
        | 3005 | Serres  | Liu      |
        | 3007 | Serres  | Grass    |
        | 3010 | Serres  | Grass    |
        | 3008 | Peel    | Clemens  |
        | 3011 | Peel    | Clemens  |
        | 3002 | motika  | pereira  |
        | 3001 | Rifkin  | Cisneros |
        | 3006 | Rifkin  | Cisneros |
        +------+---------+----------+
---------------------------------------------------

64) List the commissions of all SalesPeople servicing Customers in London.

Query : SELECT s.sname AS SalesMen, s.city, c.cname AS Customers, c.city
        FROM SalesPeople s, Customers c
        where s.snum = c.snum
        AND c.city = 'London'
        GROUP BY s.snum;

        +----------+--------+-----------+--------+
        | SalesMen | city   | Customers | city   |
        +----------+--------+-----------+--------+
        | Peel     | London | Hoffman   | London |
        +----------+--------+-----------+--------+
---------------------------------------------------

65) Write a query using ANY or ALL that will find all SalesPeople who have no Customers located in their city.

Query : SELECT s.sname,s.city, c.cname, c.city
        FROM SalesPeople s, Customers c
        WHERE s.snum = c.snum
        AND S.CITY != ANY (select c.city FROM Customers);

        +---------+-----------+----------+---------+
        | sname   | city      | cname    | city    |
        +---------+-----------+----------+---------+
        | AxelRod | New York  | Giovanni | Rome    |
        | Serres  | SanJose   | Grass    | Berlin  |
        | motika  | London    | pereira  | Rome    |
        | Rifkin  | Barcelona | Cisneros | SanJose |
        +---------+-----------+----------+---------+
---------------------------------------------------

66) Write a query using the EXISTS operator that selects all SalesPeople with Customers located in their cities who are not assigned to them.

Query : SELECT s.sname,s.city,c.cname,c.city
        FROM SalesPeople s, Customers c
        WHERE EXISTS (SELECT cnum FROM Customers
                        WHERE s.snum <> c.snum
                          AND s.city = c.city);

        +--------+---------+----------+---------+
        | sname  | city    | cname    | city    |
        +--------+---------+----------+---------+
        | Fran   | London  | Hoffman  | London  |
        | motika | London  | Hoffman  | London  |
        | Fran   | London  | Clemens  | London  |
        | motika | London  | Clemens  | London  |
        | Serres | SanJose | Cisneros | SanJose |
        +--------+---------+----------+---------+
---------------------------------------------------

67) Write a query that selects all Customers serviced by Peel or Motika. (Hint: The snum field relates the 2 tables to one another.)

Query : SELECT c.cnum,c.cname,c.city,c.ratting,c.snum
        FROM Customers c, SalesPeople s
        WHERE s.snum = c.snum
        AND s.sname IN ('Peel','motika');

        +------+---------+--------+---------+------+
        | cnum | cname   | city   | ratting | snum |
        +------+---------+--------+---------+------+
        | 2001 | Hoffman | London |     100 | 1001 |
        | 2006 | Clemens | London |     100 | 1001 |
        | 2007 | pereira | Rome   |     100 | 1004 |
        +------+---------+--------+---------+------+
---------------------------------------------------

68) Count the number of SalesPeople registering Orders for each day. (If a salesperson has more than one order on a given day, he or she should
be counted only once.)

Query :  SELECT odate AS Date,count(odate)
         FROM Orders GROUP BY odate;

        +------------+--------------+
        | Date       | count(odate) |
        +------------+--------------+
        | 1990-10-03 |            5 |
        | 1990-10-04 |            2 |
        | 1990-10-05 |            1 |
        | 1990-10-06 |            2 |
        +------------+--------------+
---------------------------------------------------

69) Find all Orders attributed to SalesPeople who live in London.

Query : SELECT * FROM Orders o, SalesPeople s
        WHERE s.snum = o.snum
        AND s.city = 'London'
        GROUP BY s.snum;

        +------+--------+------------+------+------+------+--------+--------+------+
        | ONUM | AMT    | ODATE      | CNUM | SNUM | SNUM | SNAME  | CITY   | COMM |
        +------+--------+------------+------+------+------+--------+--------+------+
        | 3003 | 767.19 | 1990-10-03 | 2001 | 1001 | 1001 | Peel   | London |   12 |
        | 3002 | 1900.1 | 1990-10-03 | 2007 | 1004 | 1004 | motika | London |   11 |
        +------+--------+------------+------+------+------+--------+--------+------+
---------------------------------------------------

70) Find all Orders by Customers not located in the same cities as their SalesPeople.

Query : SELECT o.onum,o.amt,c.cname,c.city,s.sname,s.city
        FROM Orders o, Customers c,SalesPeople s
        WHERE o.cnum = c.cnum
        AND o.snum = s.snum
        AND s.city <> c.city
        group by c.cname;

        +------+---------+----------+---------+---------+-----------+
        | onum | amt     | cname    | city    | sname   | city      |
        +------+---------+----------+---------+---------+-----------+
        | 3009 | 1713.23 | Giovanni | Rome    | AxelRod | New York  |
        | 3007 |   75.75 | Grass    | Berlin  | Serres  | SanJose   |
        | 3002 |  1900.1 | pereira  | Rome    | motika  | London    |
        | 3001 |   18.69 | Cisneros | SanJose | Rifkin  | Barcelona |
        +------+---------+----------+---------+---------+-----------+
---------------------------------------------------

71) Find all SalesPeople who have Customers with more than one current order.

Query : SELECT s.snum,s.sname
        FROM SalesPeople s, Customers c
        WHERE s.snum = c.snum
        GROUP BY snum HAVING count(c.snum) > 1;

        +------+--------+
        | snum | sname  |
        +------+--------+
        | 1001 | Peel   |
        | 1002 | Serres |
        +------+--------+
---------------------------------------------------

72) Write a query that extracts from the customer’s table every customer assigned to a salesperson, who is currently having at least one another
customer(besides the customer being selected) with Orders in the Orders Table.

---------------------------------------------------

73) Write a query on the customer’s table that will find the highest rating in each city. Put the output in this form: for the city (city), the highest
rating is (rating).

Query : SELECT  city "(city)", max(ratting) "(rating)"
        FROM Customers GROUP BY city;

        +---------+----------+
        | (city)  | (rating) |
        +---------+----------+
        | London  |      100 |
        | Rome    |      200 |
        | SanJose |      300 |
        | Berlin  |      300 |
        +---------+----------+
---------------------------------------------------

74) Write a query that will produce the snum values of all SalesPeople with Orders, having amt greater than 1000 in the Orders Table(without repeats).

Query : SELECT * FROM Orders
        WHERE amt > 1000
        GROUP BY snum;

        +------+---------+------------+------+------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM |
        +------+---------+------------+------+------+
        | 3008 |    4723 | 1990-10-05 | 2006 | 1001 |
        | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
        | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
        | 3002 |  1900.1 | 1990-10-03 | 2007 | 1004 |
        | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
        +------+---------+------------+------+------+
---------------------------------------------------

75) Write a query that lists Customers in a descending order of rating. Output the rating field first, followed by the customer’s names and numbers.

Query : SELECT ratting,cname "customer’s names", cnum "numbers", city
        FROM Customers
        ORDER BY ratting DESC;

        +---------+--------------------+---------+---------+
        | ratting | customer’s names   | numbers | city    |
        +---------+--------------------+---------+---------+
        |     300 | Grass              |    2004 | Berlin  |
        |     300 | Cisneros           |    2008 | SanJose |
        |     200 | Giovanni           |    2002 | Rome    |
        |     200 | Liu                |    2003 | SanJose |
        |     100 | Hoffman            |    2001 | London  |
        |     100 | Clemens            |    2006 | London  |
        |     100 | pereira            |    2007 | Rome    |
        +---------+--------------------+---------+---------+
---------------------------------------------------

76) Find the average commission for SalesPeople in London.

Query : SELECT avg(comm) FROM SalesPeople
        WHERE city = 'london';

        +-----------+
        | avg(comm) |
        +-----------+
        |   16.0000 |
        +-----------+
---------------------------------------------------

77) Find all Orders credited to the same salesperson who services Hoffman.(cnum 2001).

Query : SELECT o.onum, o.amt, o.odate,s.snum,s.sname, c.cnum, c.cname
        FROM Customers c, Orders o, SalesPeople s
        WHERE o.snum = s.snum
        AND o.cnum = c.cnum
        AND c.cname = 'hoffman';

        +------+--------+------------+------+-------+------+---------+
        | onum | amt    | odate      | snum | sname | cnum | cname   |
        +------+--------+------------+------+-------+------+---------+
        | 3003 | 767.19 | 1990-10-03 | 1001 | Peel  | 2001 | Hoffman |
        +------+--------+------------+------+-------+------+---------+
---------------------------------------------------

78) Find all SalesPeople whose commission is in between 0.10 and 0.12(both inclusive).

Query : SELECT * FROM SalesPeople
        WHERE comm
        BETWEEN 0.10 AND 0.12;

        Empty set (0.00 sec)
---------------------------------------------------

79) Write a query that will give you the names and cities of all SalesPeople in London with a commission above 0.10.

Query : SELECT sname "names", city "cities"
        FROM SalesPeople
        WHERE city = 'London'
        AND comm > 0.10;

        +--------+--------+
        | names  | cities |
        +--------+--------+
        | Peel   | London |
        | motika | London |
        | Fran   | London |
        +--------+--------+
---------------------------------------------------

80) Write a query that selects each customer’s smallest order.

Query : SELECT c.cname "Customers name", min(o.amt) "smallest order"
        FROM Orders o, Customers c
        WHERE o.cnum = c.cnum
        GROUP BY o.cnum;

        +----------------+----------------+
        | Customers name | smallest order |
        +----------------+----------------+
        | Hoffman        |         767.19 |
        | Giovanni       |        1713.23 |
        | Liu            |        5160.45 |
        | Grass          |          75.75 |
        | Clemens        |           4723 |
        | pereira        |         1900.1 |
        | Cisneros       |          18.69 |
        +----------------+----------------+
---------------------------------------------------

81) Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.

Query : SELECT cname "Customers name"
        FROM Customers
        WHERE cname like 'g%'
        ORDER BY cname;

        +----------------+
        | Customers name |
        +----------------+
        | Giovanni       |
        | Grass          |
        +----------------+

---------------------------------------------------

82) Write a query that counts the number of different non NULL city values in the Customers table.

Query : SELECT  count(distinct city) "City" FROM Customers
        WHERE city IS NOT NULL;

        +------+
        | City |
        +------+
        |    4 |
        +------+
---------------------------------------------------

83) Find the average amount from the Orders Table.

Query : SELECT avg(amt) "average amount" FROM Orders;

        +-------------------+
        | average amount    |
        +-------------------+
        | 2665.840002250671 |
        +-------------------+
---------------------------------------------------

84) Find all Customers who are not located in SanJose and whose rating is above 200.

Query : SELECT * FROM Customers
        WHERE city <> 'sanjose'
        AND ratting > 200;

        +------+-------+--------+---------+------+
        | CNUM | CNAME | CITY   | RATTING | SNUM |
        +------+-------+--------+---------+------+
        | 2004 | Grass | Berlin |     300 | 1002 |
        +------+-------+--------+---------+------+
---------------------------------------------------

85) Give a simpler way to write this query.SELECT snum, sname, city, comm FROM SalesPeople WHERE (comm > + 0.12 OR comm < 0.14);

Query : SELECT snum, sname, city, comm FROM SalesPeople WHERE (0.12 < comm > 0.14);

---------------------------------------------------

86) Which salespersons attend to Customers not in the city they have been assigned to?

Query :
---------------------------------------------------

87) Which SalesPeople get commission greater than 0.11 are serving Customers rated less than 250?

Query : select s.snum "Number"
        ,s.sname "sales men"
        ,s.comm "commission"
        ,c.ratting "Rating"
        ,c.cname "Customers"
        FROM SalesPeople s, Customers c
        WHERE s.snum = c.snum
        AND (s.comm > 0.11 AND c.ratting < 250);

        +--------+-----------+------------+--------+-----------+
        | Number | sales men | commission | Rating | Customers |
        +--------+-----------+------------+--------+-----------+
        |   1001 | Peel      |         12 |    100 | Hoffman   |
        |   1001 | Peel      |         12 |    100 | Clemens   |
        |   1002 | Serres    |         13 |    200 | Liu       |
        |   1003 | AxelRod   |         10 |    200 | Giovanni  |
        |   1004 | motika    |         11 |    100 | pereira   |
        +--------+-----------+------------+--------+-----------+
---------------------------------------------------


88) Which SalesPeople have been assigned to the same city but get different commission percentages?

Query :
---------------------------------------------------

89) Which salesperson has earned the maximum commission?

Query : SELECT snum "number",
        sname "salesperson",
        comm "commission"
        from SalesPeople
        where comm
        in (select max(comm) from SalesPeople);

        +--------+-------------+------------+
        | number | salesperson | commission |
        +--------+-------------+------------+
        |   1008 | Fran        |         25 |
        +--------+-------------+------------+
---------------------------------------------------

90) Does the customer who has placed the maximum number of Orders have the maximum rating?
---------------------------------------------------

91) List all Customers in descending order of customer rating.

Query : SELECT * FROM Customers
        ORDER BY ratting DESC;

        +------+----------+---------+---------+------+
        | CNUM | CNAME    | CITY    | RATTING | SNUM |
        +------+----------+---------+---------+------+
        | 2004 | Grass    | Berlin  |     300 | 1002 |
        | 2008 | Cisneros | SanJose |     300 | 1007 |
        | 2002 | Giovanni | Rome    |     200 | 1003 |
        | 2003 | Liu      | SanJose |     200 | 1002 |
        | 2001 | Hoffman  | London  |     100 | 1001 |
        | 2006 | Clemens  | London  |     100 | 1001 |
        | 2007 | pereira  | Rome    |     100 | 1004 |
        +------+----------+---------+---------+------+
---------------------------------------------------

92) On which days has Hoffman placed Orders?

Query : select c.cname "customer",
        o.onum "Number",
        o.amt "amount",
        o.odate "Date"
        FROM Orders o, Customers c
        WHERE c.cnum = o.cnum
        AND ( c.cname = 'Hoffman');

        +----------+--------------+--------+------------+
        | customer | Order Number | amount | Date       |
        +----------+--------------+--------+------------+
        | Hoffman  |         3003 | 767.19 | 1990-10-03 |
        +----------+--------------+--------+------------+
---------------------------------------------------

93) Which salesmen have no Orders between 10/03/1990 and 10/05/1990?

Query :  SELECT s.snum "numbers",
        s.sname "salesmen"
        FROM SalesPeople s, Orders o
        WHERE s.snum = o.snum
        AND o.odate
        NOT BETWEEN '1990-10-03' AND '1990-10-05';

        +---------+----------+
        | numbers | salesmen |
        +---------+----------+
        |    1002 | Serres   |
        |    1001 | Peel     |
        +---------+----------+
---------------------------------------------------

94) How many salespersons have succeeded in getting Orders?

Query : SELECT count(distinct snum) "Total salesmen" FROM Orders;

        +----------------+
        | Total salesmen |
        +----------------+
        |              5 |
        +----------------+
---------------------------------------------------

95) How many Customers have placed Orders?

Query :  SELECT count(distinct cnum) "Total salesmen" FROM Orders;

        +----------------+
        | Total salesmen |
        +----------------+
        |              7 |
        +----------------+
---------------------------------------------------

96) On which date has each salesman booked an order of maximum value?

Query : SELECT snum "sales number",
        onum "number",
        odate "Date",
        amt "maxmaximum value"
        FROM Orders
        WHERE amt IN (SELECT max(amt) FROM Orders GROUP BY snum);

        +--------------+--------+------------+------------------+
        | sales number | number | Date       | maxmaximum value |
        +--------------+--------+------------+------------------+
        |         1004 |   3002 | 1990-10-03 |           1900.1 |
        |         1002 |   3005 | 1990-10-03 |          5160.45 |
        |         1007 |   3006 | 1990-10-03 |          1098.16 |
        |         1003 |   3009 | 1990-10-04 |          1713.23 |
        |         1001 |   3011 | 1990-10-06 |          9891.88 |
        +--------------+--------+------------+------------------+
---------------------------------------------------

97) Who is the most successful salesperson?

Query : SELECT s.snum,
        s.sname,sum(amt)
        FROM salespeople s, orders o
        WHERE s.snum = o.snum
        GROUP BY o.snum
        HAVING sum(amt) > (SELECT max(amt) FROM orders);

        +------+-------+--------------------+
        | snum | sname | sum(amt)           |
        +------+-------+--------------------+
        | 1001 | Peel  | 15382.069885253906 |
        +------+-------+--------------------+
---------------------------------------------------

98) Which Customers have the same rating?

Query : SELECT c1.cname,
        c2.cname,
        c1.ratting,
        c2.ratting
        from Customers c1,Customers c2
        WHERE c1.snum <> c2.snum
        AND c1.ratting = c2.ratting
        order by c1.ratting;

        +----------+----------+---------+---------+
        | cname    | cname    | ratting | ratting |
        +----------+----------+---------+---------+
        | pereira  | Hoffman  |     100 |     100 |
        | pereira  | Clemens  |     100 |     100 |
        | Clemens  | pereira  |     100 |     100 |
        | Hoffman  | pereira  |     100 |     100 |
        | Liu      | Giovanni |     200 |     200 |
        | Giovanni | Liu      |     200 |     200 |
        | Cisneros | Grass    |     300 |     300 |
        | Grass    | Cisneros |     300 |     300 |
        +----------+----------+---------+---------+
---------------------------------------------------

99) Find all Orders greater than the average for October 4th.

Query : SELECT * FROM Orders
        WHERE amt >(SELECT  avg(amt)
                        FROM Orders

                        WHERE odate = '1990-10-04');

        +------+---------+------------+------+------+
        | ONUM | AMT     | ODATE      | CNUM | SNUM |
        +------+---------+------------+------+------+
        | 3002 |  1900.1 | 1990-10-03 | 2007 | 1004 |
        | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
        | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
        | 3008 |    4723 | 1990-10-05 | 2006 | 1001 |
        | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
        | 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
        | 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
        +------+---------+------------+------+------+
---------------------------------------------------

100) List all Customers with ratings above Grass’s average.

Query : SELECT cname FROM Customers
        WHERE ratting > (SELECT avg(amt)
                            FROM Orders
                            WHERE cnum
                            IN (SELECT cnum FROM Customers
                                    WHERE cname = 'grass'));

Empty set (0.00 sec)
---------------------------------------------------

101) Which Customers have above average Orders?

Query :
---------------------------------------------------

102) Select the total amount in Orders for each salesperson for which the total is greater than the amount of the largest order in the table.

Query : SELECT o.onum,
        s.snum,
        s.sname,
        sum(amt)
        FROM salespeople s, orders o
        WHERE s.snum = o.snum
        GROUP BY o.snum
        HAVING sum(amt) > (SELECT max(amt) FROM orders);

        +------+------+-------+--------------------+
        | onum | snum | sname | sum(amt)           |
        +------+------+-------+--------------------+
        | 3003 | 1001 | Peel  | 15382.069885253906 |
        +------+------+-------+--------------------+
---------------------------------------------------

103) Give names and numbers of all salespersons that have more than one customer?

Query : SELECT s.snum "numbers",
        s.sname "name"
        FROM SalesPeople s,Customers c
        WHERE s.snum = c.snum
        group by c.snum having count(c.snum) > 1;

        +---------+--------+
        | numbers | name   |
        +---------+--------+
        |    1001 | Peel   |
        |    1002 | Serres |
        +---------+--------+
---------------------------------------------------

104) Select all SalesPeople by name and number who have Customers in their city whom they don’t service.

Query : SELECT DISTINCT s.snum,s.sname
        FROM SalesPeople s, Customers c
        WHERE s.city = c.city
        AND c.snum <> s.snum;

        +------+--------+
        | snum | sname  |
        +------+--------+
        | 1008 | Fran   |
        | 1004 | motika |
        | 1002 | Serres |
        +------+--------+
---------------------------------------------------

105) Does the total amount in Orders by customer in Rome and London, exceed the commission paid to salesperson in London, and New York by
more than 5 times?

Query :
---------------------------------------------------

106) Which are the date, order number, amt and city for each salesperson (by name) for the maximum order he has obtained?

Query :
---------------------------------------------------

107) Which salesperson is having lowest commission?

Query : SELECt * FROM SalesPeople
        WHERE comm IN (SELECT min(comm) from SalesPeople);

        +------+---------+----------+------+
        | SNUM | SNAME   | CITY     | COMM |
        +------+---------+----------+------+
        | 1003 | AxelRod | New York |   10 |
        +------+---------+----------+------+
---------------------------------------------------
