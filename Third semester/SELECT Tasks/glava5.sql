-- глава 5
-- 1) Напишите  два запроса которые могли бы вывести все заказы  на 3 или 4 Октября 2015
SELECT * FROM Orders WHERE odate = '2015-10-03'
UNION
SELECT * FROM Orders WHERE odate = '2015-10-04'

-- 2) Напишите запрос, который дает все заказы на 3 и 6 Октября 2015.
SELECT * FROM Orders WHERE odate = '2015-10-03' or odate = '2015-10-06'

-- 3) Напишите запрос, который дает все заказы, выполняемые продавцами 1001, 1003, 1007. 
SELECT * FROM Orders WHERE snum = 1001 or snum = 1003 or snum = 1007

-- 4) Напишите  запрос который выберет всех заказчиков обслуживаемых продавцами Peel или Motika.
SELECT * FROM Customers WHERE snum = (SELECT snum FROM Salespeople WHERE sname = 'Peel')
UNION
SELECT * FROM Customers WHERE snum = (SELECT snum FROM Salespeople WHERE sname = 'Motika')

-- 5) Напишите запрос,  который может вывести всех заказчиков чьи  имена начинаются с буквы попадающей в диапазон от A до G. 
SELECT * FROM Customers WHERE cname LIKE '[A-G]%'

-- 6) Напишите запрос, который может вывести всех продавцов, чьи  имена начинаются с буквы попадающей в диапазон от M до R. 
SELECT * FROM Salespeople WHERE sname LIKE '[M-R]%' 

-- 7) Напишите запрос который выберет всех покупателей чьи имена  начинаются с буквы C.
SELECT * FROM Customers WHERE cname LIKE 'C%'

-- 8) Напишите запрос, который выберет всех продавцов, чьи имена  заканчиваются на букву s.
SELECT * FROM Salespeople WHERE sname LIKE '%s'
