use materialsdb

-- Task 1
--SQL
SELECT c.oper_num, m.name, c.det_code, c.consumption
FROM MaterialsConsumption c, Materials m 
WHERE c.mat_code = m.mat_code
AND c.oper_num = value  -- определяется операцией

--RA
[oper_num, det_code, consumption]([oper_num = ](MaterialsConsumption))*[name](Materials)
-- или
[c.oper_num, m.name, c.det_code, c.consumption]([oper_num = value](MaterialsConsumption c))*(Materials m)
-- или
[oper_num, name, det_code, consumption]([oper_num = value](MaterialsConsumption))*(Materials)

-- RIK
FIND{(c.oper_num, m.name, c.det_code, c.consumption) | c in MaterialsConsumption, m in Materials} 
		c.mat_code = m.mat_code & c.oper_num = value




-- Task 2
SELECT cost.det_code, cost.oper_num, worker_code, worker_qualif, tariff_code, pf_time, piece_time
FROM ManufacturingCosts cost JOIN MaterialsConsumption consump ON consump.det_code = cost.det_code
WHERE consumption > 20
AND consump.mat_code IN (SELECT mat_code FROM Materials WHERE price > 100)
AND cost.oper_num = value -- определяется операцией

-- RA
[det_code, oper_num, worker_code, worker_qualif, tariff_code, pf_time, piece_time]([oper_num = ](ManufacturingCosts))*([consumption > 20](MaterialsConsumption)) *([price > 100](Materials))

-- RIK
FIND{(c.det_code, c.oper_num, c.worker_code, c.worker_qualif, c.tariff_code, c.pf_time, c.piece_time) | c in ManufacturingCosts} 
		EXISTS(mc in MaterialsConsumption) c.det_code = mc.det_code & mc.consumption > 20 &
		(EXISTS(m in Materials) mc.mat_code = m.mat_code & m.price > 100 &
		c.oper_num = value)