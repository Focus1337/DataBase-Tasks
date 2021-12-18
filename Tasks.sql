use materialsdb

-- Task 1
--SQL
SELECT c.oper_num, m.name, c.det_code, c.consumption
FROM MaterialsConsumption c, Materials m 
WHERE c.mat_code = m.mat_code
AND c.oper_num = value  -- определяется операцией

--RA
[oper_num, name, det_code, consumption]([oper_num = value](MaterialsConsumption))*(Materials)

-- RIK
НАЙТИ{(c.oper_num, m.name, c.det_code, c.consumption) | c in MaterialsConsumption, m in Materials} 
		c.mat_code = m.mat_code & c.oper_num = value



-- Task 2
SELECT cost.det_code, cost.oper_num, worker_code, worker_qualif, tariff_code, pf_time, piece_time
FROM ManufacturingCosts cost JOIN MaterialsConsumption consump ON consump.det_code = cost.det_code
WHERE consumption > 20
AND EXISTS (SELECT mat_code FROM Materials WHERE price > 100)
AND cost.oper_num = 2 -- определяется операцией

SELECT 5 FORALL 1 EXISTS 4

-- RA
[det_code, oper_num, worker_code, worker_qualif, tariff_code, pf_time, piece_time]
([oper_num = value](ManufacturingCosts))*([consumption > 20](MaterialsConsumption)) *([price > 100](Materials))

--5. Вывести покупателей, которые купили в этом году все товары меньше 100

--       НАЙТИ{ (c.name) | c in Cust}
--                FORALL (p in Prod) p.price < 100  ->
--                  ( EXISTS(o in Ord) o.id_cust=c.id & o.ip_prod=p.id )

-- RIK
НАЙТИ{(c.det_code, c.oper_num, c.worker_code, c.worker_qualif, c.tariff_code, c.pf_time, c.piece_time) | c in ManufacturingCosts} 
		FORALL (m in Materials) m.price > 100 &
		( EXISTS(mc in MaterialsConsumption) mc.det_code = c.det_code & mc.mat_code = m.mat_code & mc.consumption > 20 ) &
		c.oper_num = value