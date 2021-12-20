-- ГЛАВА 10

--1. Напишите  запрос,  который  бы  использовал подзапрос для получения
--   всех заказов заказчика с именем Cisneros.  Предположим, что вы
--   не знаете номера этого заказчика, указываемого в поле cnum.
SELECT *
FROM Orders o
WHERE o.cnum = (SELECT cnum 
				FROM Customers 
				WHERE cname = 'Cisneros')

--2. Напишите  запрос,  который  бы  использовал подзапрос для получения
--   всех заказчиков, которых обслуживают  продавцы из города London.
SELECT *
FROM Customers 
WHERE snum in (SELECT snum 
				FROM Salespeople
				WHERE city = 'London')

--3. Напишите запрос который вывел бы имена и рейтинги тех заказчиков,
--	у которых есть заказы на сумму выше средней суммы по всем заказам.
SELECT distinct c.cname, c.rating
FROM Customers c, Orders o
WHERE c.cnum = o.cnum and amt > (SELECT avg(amt) FROM Orders)


--4. Напишите запрос который вывел бы имена и комиссионные тех продавцов,
--	которые обслуживают хотя бы одного заказчика с рейтингом выше среднего.
SELECT distinct s.sname, s.comm
FROM Salespeople s, Customers c
WHERE s.snum = c.snum and c.rating > (SELECT avg(rating) FROM Customers)

--5. Напишите запрос который бы выбрал общую сумму всех  приобретений  в
--   заказах  для  каждого продавца,  у которого эта общая сумма больше
--   чем наибольшая стоимость заказов в таблице.
SELECT snum, sum(amt) as sum
FROM Orders
group by snum
HAVING sum(amt) > (SELECT max(amt) FROM Orders)


--6. Напишите запрос, который бы выбрал количество заказов для каждого покупателя,
--   у которого минимальная стоимость заказов больше средней стоимости по всем заказам.
SELECT cnum, COUNT(cnum) as count
FROM Orders
group by cnum
HAVING min(amt) > (SELECT avg(amt) FROM Orders)
