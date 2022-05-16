CREATE OR REPLACE TRIGGER abs_mdi."ShipPlantCountriesToShip_TRG" 
BEFORE INSERT ON abs_mdi."ShipPlantCountriesToShip" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CountriesToShipId" IS NULL THEN
      SELECT "ShipPlantCountriesToShip_SEQ1".NEXTVAL INTO :NEW."CountriesToShipId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/