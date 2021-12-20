-- ГЛАВА 9

--1. Напишите запрос который бы вывел все пары продавцов
-- живущих в одном и том же городе.  Исключите комбинации
--  продавцов с ними же, а также дубликаты строк выводимых
--   в обратным порядке.
SELECT s1.sname, s2.sname
FROM Salespeople s1, Salespeople s2
WHERE s1.city = s2.city and s1.sname < s2.sname


--2. Напишите запрос, который бы вывел все пары имен заказчиков,
-- которым назначен один и тот же обслуживающий продавец,
-- номер продавца тоже включите в выходную строку.
-- Исключите пары вида (А,А) и повторы вида (А,Б), (Б,А).
SELECT c1.cname, c2.cname, c1.snum
FROM Customers c1, Customers c2
WHERE c1.snum = c2.snum and c1.cname < c2.cname


--3. Напишите запрос который вывел бы все пары заказов
-- по данным заказчикам,  именам этих заказчиков,
--  и исключал дубликаты из вывода, как в предыдущем вопросе.
SELECT o1.onum, o2.onum, o1.cnum, c.cname
FROM Orders o1, Orders o2, Customers c
WHERE o1.cnum = o2.cnum and o1.onum < o2.onum and o1.cnum = c.cnum


--4. Напишите запрос, который бы вывел все пары имен заказчиков,
-- которые что-либо заказывали в один и тот же день,
-- дату такого дня тоже включите в выходную строку.
-- Также как и в предыдущем упражнении исключите вырожденные пары.

-- НЕ ДОДЕЛАЛ (ХЗ КАК ИСПРАВИТЬ ПОВТОРЕНИЕ ЗАКАЗОВ ИЗ-ЗА РАЗНЫХ ЦЕН)
SELECT DISTINCT c1.cname, c2.cname, o1.odate
FROM Customers c1, Customers c2, Orders o1, Orders o2
WHERE c1.cnum = o1.cnum and c2.cnum = o2.cnum and o1.odate = o2.odate and o1.cnum < o2.cnum
order by o1.odate


--5. Напишите  запрос  который вывел бы имена(cname)
-- и города(city) всех заказчиков с такой же оценкой(rating)
-- как у Hoffmanа. Напишите запрос использующий поле cnum
-- Hoffmanа а не его оценку,  так чтобы оно могло быть
-- использовано если его оценка вдруг изменится. 
SELECT c1.cname, c1.city, c1.rating
FROM Customers c1, Customers c2
WHERE c1.rating = c2.rating and c2.cnum in (SELECT cnum FROM Customers WHERE cname = 'Hoffman') -- = 2001


--6. Напишите  запрос,  который вывел бы имена (sname)
-- и города(city) всех продавцов с комиссионными больше,
-- чем у Peel. Напишите запрос, использующий номер продавца Peel
-- (равный 1001), а не его комиссионные,
-- так чтобы этот запрос можно было использовать даже,
-- если этот процент комиссионных вдруг изменится.
SELECT s1.sname, s1.city, s1.comm
FROM Salespeople s1, Salespeople s2
WHERE s1.comm > s2.comm and s2.snum = 1001