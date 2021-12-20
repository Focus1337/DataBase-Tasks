-- глава 4
-- 1) Напишите запрос который может дать вам все  заказы со  значениями суммы заказа выше чем 1,000. 
SELECT * FROM Orders WHERE amt > 1000

-- 2) Напишите запрос, который дает всех заказчиков с рейтингом выше чем 150. 
SELECT * FROM Customers WHERE rating > 150

-- 3) Напишите запрос который может выдать вам поля sname и city для всех продавцов в Лондоне с комиссионными выше .10 . 
SELECT sname, city FROM Salespeople WHERE city = 'London' and comm > 0.10

-- 4) Напишите запрос, который может выдать вам поля cname и city для всех заказчиков из города San Jose с рейтингом выше 150.
SELECT cname, city FROM Customers WHERE city = 'San Jose' and rating > 150

-- 5) Напишите запрос к таблице Заказчиков чей вывод может включить  всех заказчиков с оценкой =< 100, если они не находятся в Риме.
SELECT * FROM Customers WHERE rating <= 100 and city != 'Rome'

-- 6) Напишите запрос к таблице Продавцов, который дает всех Продавцов за исключением Продавцов из города London, имеющих комиссионные выше 0.11.
SELECT * FROM Salespeople WHERE not (city = 'London' and comm > 0.11)

-- 7)  Напишите запрос к таблице Продавцов, который дает всех Продавцов таких что, если он из города London, то его комиссионные не выше 0.11, а иначе - выше 0.13. 
SELECT * FROM Salespeople WHERE (city = 'London' and comm <= 0.11) or comm > 0.13