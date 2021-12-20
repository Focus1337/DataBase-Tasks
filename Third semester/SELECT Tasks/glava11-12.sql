-- ГЛАВА 11-12

--1. Напишите команду SELECT использующую соотнесенный подзапрос,  кото-
--   рая  выберет  имена и номера всех заказчиков с максимальными для их
--   городов рейтингами.
SELECT c1.cname, c1.cnum
FROM Customers c1
WHERE c1.rating = (SELECT max(c2.rating)
				FROM Customers c2
				WHERE c1.city = c2.city)

--2. Напишите запрос который выберет всех продавцов (их имя и
--   номер) которые в своих городах имеют заказчиков  которых  они  не
--   обслуживают. 
SELECT sname, snum
FROM Salespeople s
WHERE city in (SELECT city 
				FROM Customers c 
				WHERE s.snum != c.snum)

--3. Найти заказчиков, не все заказы которых исполняют продавцы,
--   назначенные им для обслуживания.
SELECT *
FROM Customers c
WHERE c.snum in (SELECT s.snum FROM Salespeople s WHERE c.snum != s.snum)

--4. Напишите запрос который бы использовал оператор EXISTS для извлече-
--   ния всех продавцов которые имеют заказчиков с оценкой 300.
SELECT *
FROM Salespeople s
WHERE EXISTS (SELECT * 
				FROM Customers c 
				WHERE s.snum = c.snum and rating = 300)


--5. Напишите запрос который бы использовал оператор EXISTS для извлече-
--   ния всех заказчиков, которые имеют заказы стоимостью > 4000.
SELECT *
FROM Customers c
WHERE EXISTS (SELECT * FROM Orders o WHERE c.cnum = o.cnum and amt > 4000)

--6. Напишите  запрос  который извлекал бы из таблицы Заказчиков каждого
--   заказчика назначенного к продавцу который в данный момент имеет  по
--   крайней мере еще одного заказчика ( кроме заказчика которого вы вы-
--   берете ) с заказами в таблице Заказов 
SELECT c1.city, c1.cname, c1.cnum, c1.rating, c1.snum
FROM Customers c1, Salespeople s
WHERE c1.snum = s.snum and EXISTS (SELECT * 
				FROM Customers c2 
				WHERE c2.snum = s.snum and c1.cnum != c2.cnum)

--7. Напишите  запрос  который извлекал бы из таблицы Заказов такие заказы,
--	заказчики которых имеются по крайней мере еще один заказ.
SELECT o1.amt, o1.cnum, o1.odate, o1.onum, o1.snum
FROM Orders o1, Customers c
WHERE o1.cnum = c.cnum and EXISTS (SELECT * 
				FROM Orders o2 
				WHERE o2.cnum = c.cnum and o1.onum != o2.onum)