-- глава 3
-- 1)  Напишите команду SELECT которая бы вывела номера заказов, сумму, и дату для всех строк из таблицы Заказов. 
SELECT onum, amt, odate FROM Orders

-- 2) Напишите команду SELECT, которая бы вывела номер Заказчика, город и рейтинг для всех строк из таблицы Заказчиков.
SELECT cnum, city, rating FROM Customers

-- 3) Напишите запрос который вывел бы все строки из таблицы Заказчиков для которых номер продавца = 1001.
SELECT * FROM Customers WHERE snum = 1001

-- 4) Напишите запрос, который вывел бы все строки из таблицы Заказов, для которых номер продавца = 1001. 
SELECT * FROM Orders WHERE snum = 1001

-- 5) Напишите запрос который вывел бы таблицу Продавцов со столбцами в следующем порядке: city, sname, snum, comm.
SELECT city, sname, snum, comm FROM Salespeople

-- 6) Напишите запрос, который вывел бы таблицу Заказчиков со столбцами в порядке: city, snum, cname, cnum, rating. 
SELECT city, snum, cname, cnum, rating FROM Customers

-- 7) Напишите команду SELECT которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в San Jose. 
SELECT cname, rating FROM Customers WHERE city = 'San Jose'

-- 8) Напишите команду SELECT которая вывела бы имя и комиссионные каждого продавца из города London. 
SELECT sname, comm FROM Salespeople WHERE city = 'London'

-- 9) Напишите  запрос  который вывел бы значения snum всех продавцов в текущем порядке из таблицы Заказов без каких бы то ни было  повторений.
SELECT DISTINCT snum FROM Orders

-- 10) Напишите  запрос,  который вывел бы значения cnum всех заказчиков из таблицы Заказов без каких бы то ни было повторений. 
SELECT DISTINCT cnum FROM Orders

