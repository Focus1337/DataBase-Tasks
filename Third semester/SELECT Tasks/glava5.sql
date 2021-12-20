-- ����� 5
-- 1) ��������  ��� ������� ������� ����� �� ������� ��� ������  �� 3 ��� 4 ������� 2015
SELECT * FROM Orders WHERE odate = '2015-10-03'
UNION
SELECT * FROM Orders WHERE odate = '2015-10-04'

-- 2) �������� ������, ������� ���� ��� ������ �� 3 � 6 ������� 2015.
SELECT * FROM Orders WHERE odate = '2015-10-03' or odate = '2015-10-06'

-- 3) �������� ������, ������� ���� ��� ������, ����������� ���������� 1001, 1003, 1007. 
SELECT * FROM Orders WHERE snum = 1001 or snum = 1003 or snum = 1007

-- 4) ��������  ������ ������� ������� ���� ���������� ������������� ���������� Peel ��� Motika.
SELECT * FROM Customers WHERE snum = (SELECT snum FROM Salespeople WHERE sname = 'Peel')
UNION
SELECT * FROM Customers WHERE snum = (SELECT snum FROM Salespeople WHERE sname = 'Motika')

-- 5) �������� ������,  ������� ����� ������� ���� ���������� ���  ����� ���������� � ����� ���������� � �������� �� A �� G. 
SELECT * FROM Customers WHERE cname LIKE '[A-G]%'

-- 6) �������� ������, ������� ����� ������� ���� ���������, ���  ����� ���������� � ����� ���������� � �������� �� M �� R. 
SELECT * FROM Salespeople WHERE sname LIKE '[M-R]%' 

-- 7) �������� ������ ������� ������� ���� ����������� ��� �����  ���������� � ����� C.
SELECT * FROM Customers WHERE cname LIKE 'C%'

-- 8) �������� ������, ������� ������� ���� ���������, ��� �����  ������������� �� ����� s.
SELECT * FROM Salespeople WHERE sname LIKE '%s'
