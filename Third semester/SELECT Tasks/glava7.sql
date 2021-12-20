-- глава 7
--1. Предположим  что каждый продавец имеет 12%  комиссионных.  Напишите запрос к таблице Заказов который мог бы вывести
--  номер заказа, номер продавца, и сумму комиссионных продавца для этого заказа. 
SELECT onum, s.snum, amt*0.12 as 'amt comm'
FROM Salespeople s join Orders o
ON s.snum = o.snum

--2. Предположим,  что с каждой продажи необходимо платить налог в размере 5% от стоимости.
--Напишите запрос к таблице Заказов, который мог бы вывести  о каждом заказе: номер заказа, сумму заказа  и сумму заказа за вычетом налога.
SELECT onum, amt, (amt - amt*0.05) as 'sum without nalog' 
FROM Salespeople, Orders
WHERE Salespeople.snum = Orders.snum


--3. Напишите запрос к таблице Заказчиков который мог  бы найти  высшую оценку в каждом городе.
-- Вывод должен быть в такой форме:
--         For the city (city), the highest rating is: (rating).
SELECT 'For the city', city, 'the highest rating is:', max(rating)
FROM Customers
GROUP BY city


--4. Напишите запрос к таблице Продавцов, который мог  бы
--  найти  наименьшие комиссионные в каждом городе.
--  Вывод должен быть в такой форме:
--  В городе <Наименование> наименьшие комиссионные <Значение>.
SELECT 'В городе', city, 'наименьшие комиссионные', min(comm)
FROM Salespeople, Orders
WHERE Salespeople.snum = Orders.snum
group by city

--5. Напишите  запрос  который выводил бы список заказчиков
-- в нисходящем порядке рейтингов.  Вывод поля оценки ( rating )
-- должден сопровождаться именем заказчика и его номером.
SELECT rating, cname, cnum
FROM Customers
order by rating desc

--6. Напишите  запрос,  который выводил бы список продавцов
-- в нисходящем порядке комиссионных.  Вывод поля комиссионные
-- (Comm) должен сопровождаться именем продавца и его номером.
SELECT comm, sname, snum
FROM Salespeople
order by comm desc

--7. Напишите запрос который бы выводил общую сумму заказов 
--на каждый  день  и помещал результаты в нисходящем порядке. 
SELECT odate, sum(amt) as sum
FROM Orders
group by odate
order by sum(amt) desc

--8. Напишите запрос, который бы выводил общую сумму заказов
-- для каждого заказчика, и помещал результаты
-- в нисходящем порядке (по сумме).
SELECT cname, sum(amt) as sum
FROM Customers, Orders
WHERE Customers.cnum = Orders.cnum
group by cname
order by sum(amt) desc