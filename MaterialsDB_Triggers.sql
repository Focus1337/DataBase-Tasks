use materialsdb

GO
CREATE TRIGGER Materials_INSERT
ON Materials
AFTER INSERT
AS
SELECT mat_code, 'Material "' + name + '"added. Unit: "' + unit + '" with price ' + CONVERT(varchar(10), price) as 'status'
FROM inserted
GO


GO
CREATE TRIGGER Materials_UPDATE
ON Materials
AFTER UPDATE
AS
SELECT mat_code, 'Values are updated. New: '  as 'status', *
FROM inserted
SELECT 'Old values: ', *
from deleted
GO


GO
CREATE TRIGGER Materials_DELETE
ON Materials
INSTEAD OF DELETE
AS 
DELETE FROM MaterialsConsumption
WHERE MaterialsConsumption.mat_code in (SELECT mat_code FROM deleted) 
DELETE FROM Materials
WHERE mat_code in (SELECT mat_code FROM deleted);
SELECT mat_code, 'Material "' + name + '" was deleted'  as 'status'
FROM deleted


GO
ALTER TRIGGER MaterialsConsumption_INSERT
ON MaterialsConsumption
AFTER INSERT
AS
UPDATE MaterialsConsumption
SET MaterialsConsumption.unit = (SELECT m.unit FROM Materials m WHERE m.mat_code = MaterialsConsumption.mat_code)
where exists (select * from inserted i where MaterialsConsumption.det_code = i.det_code and
											 MaterialsConsumption.mat_code = i.mat_code and
											 MaterialsConsumption.oper_num = i.oper_num and
											 i.unit is null)