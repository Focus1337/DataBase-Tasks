-- глава 6
--1. Напишите запрос который сосчитал бы все суммы приобретений на 3 Октября.
SELECT sum(amt) as 'sum 2015-10-03'
FROM Orders
WHERE odate = '2015-10-03'

--2. Напишите запрос, который сосчитал бы общую сумму заказов покупателя 2004. 
SELECT sum(amt) as 'sum 2004' 
FROM Orders
WHERE cnum = 2004

--3. Напишите  запрос который сосчитал бы число различных значений поля city в таблице Заказчиков. 
SELECT count(distinct city) as count 
FROM Customers

--4. Напишите  запрос, который сосчитал бы число различных значений поля city в таблице Продавцов.
SELECT count(distinct city) as count 
FROM Salespeople

--5. Напишите  запрос  который выбрал бы наименьшую сумму для каждого заказчика.
SELECT cnum, min(amt) as amt
FROM Orders
group by cnum


--6. Напишите  запрос, который выбрал бы наибольшую дату заказа для каждого заказчика. 
SELECT cnum, max(odate) as odate
FROM Orders
group by cnum


--7. Напишите запрос который бы выбирал заказчиков в алфавитном порядке, чьи имена начинаются с буквы G.
SELECT * FROM Customers
WHERE cname LIKE 'G%'
order by cname


--8. Напишите запрос, который бы выбрал первого в алфавитном порядке Продавца среди тех, чьи имена  начинаются с букв от M до R.
SELECT * FROM Salespeople
WHERE sname between 'M' and 'R'
order by sname

--9. Напишите запрос который выбрал бы высшую оценку  в каждом городе.
SELECT city, max(rating) as 'max rating'
FROM Customers
group by city


--10. Напишите запрос, который выбрал бы наименьшую сумму заказа для каждого дня.
SELECT odate, min(amt) as 'min amt'
FROM Orders
group by odate


--11. Напишите запрос, который сосчитал бы для каждого дня количество продавцов, сделавших заказ в этот день. (Если продавец имел 
-- более одного заказа в данный день, он должен учитываться только один раз.) 
SELECT odate, count(distinct snum) as 'count' 
FROM Orders
group by odate

--12. Напишите запрос, который сосчитал бы для каждого дня количество заказчиков, сделавших заказ в этот день.
-- (Если заказчик сделал более одного заказа в данный день, он должен учитываться только один раз.) 
SELECT odate, count(distinct cnum) as 'count' 
FROM Orders
group by odate