--1. Напишите  запрос который бы вывел список номеров заказов сопровождающихся именем заказчика который создавал их.
SELECT onum, cname 
FROM Orders, Customers
WHERE Orders.cnum=Customers.cnum

--2. Напишите  запрос, который бы вывел список имен заказчиков, сопровождающихся именем продавца, который назначен их обслуживать.
SELECT cname, sname
FROM Customers, Salespeople
WHERE Customers.snum = Salespeople.snum

--3. Напишите  запрос  который бы выдавал имена продавца и заказчика для каждого заказа после номера заказа.
SELECT onum, sname, cname
FROM Salespeople, Orders, Customers
WHERE Salespeople.snum = Orders.snum and Orders.cnum = Customers.cnum

--4. Напишите  запрос,  который бы выдавал для каждого заказа: номер заказа и имена продавца и заказчика. 
SELECT onum, sname, cname
FROM Salespeople, Orders, Customers
WHERE Salespeople.snum = Orders.snum and Orders.cnum = Customers.cnum

--5. Напишите  запрос  который  бы выводил всех заказчиков обслуживаемых продавцом с комиссионными выше 12%  .
--   Выведите имя заказчика,  имя продавца, и ставку комиссионных продавца. 
SELECT cname, sname, comm
FROM Customers c join Salespeople s
ON c.snum = s.snum
WHERE comm > 0.12

--6. Напишите  запрос,  который  бы выводил все заказы,
-- обслуживаемые продавцами с комиссионными выше 12%.
--  Выведите сумму заказа, имя заказчика,  имя продавца
--  и ставку комиссионных продавца.
SELECT amt, cname, sname, comm
FROM Salespeople, Orders, Customers
WHERE comm > 0.12 and Orders.cnum = Customers.cnum and Salespeople.snum = Orders.snum

--7. Напишите запрос который вычислил бы сумму комиссионных
-- продавца для каждого заказа заказчика с рейтингом выше 100.
SELECT onum, amt*comm
FROM Salespeople, Customers, Orders
WHERE rating > 100 and Salespeople.snum = Orders.snum and Customers.cnum = Orders.cnum

--8. Напишите запрос, который отбирает заказы заказчиков
-- из Лондона и выводит: 
--         номер заказа и сумму (заказа + комиссионных). 
SELECT onum, (amt + amt*comm) as sum
FROM Customers, Orders, Salespeople
WHERE Customers.city = 'London' and Salespeople.snum = Orders.snum and Customers.cnum = Orders.cnum