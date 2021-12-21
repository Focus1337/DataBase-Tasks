use ControlWork

-- 1.
ALTER TABLE ShipmentAccountings
DROP CONSTRAINT fk_shipmentAccounting_detailAviability;

-- 2.
ALTER TABLE DetailsAviability
DROP CONSTRAINT pk_detailAviability;

-- 3.
ALTER TABLE ShipmentAccountings
ALTER COLUMN detail_id BIGINT NOT NULL;

-- 4.
ALTER TABLE DetailsAviability
ALTER COLUMN detail_id BIGINT NOT NULL;

-- 5.
ALTER TABLE DetailsAviability
ADD CONSTRAINT pk_detailAviability PRIMARY KEY(storage_id, detail_id);

-- 6.
ALTER TABLE ShipmentAccountings
ADD CONSTRAINT fk_shipmentAccounting_detailAviability FOREIGN KEY(storage_id, detail_id)
		REFERENCES DetailsAviability(storage_id, detail_id)
		on delete cascade on update cascade