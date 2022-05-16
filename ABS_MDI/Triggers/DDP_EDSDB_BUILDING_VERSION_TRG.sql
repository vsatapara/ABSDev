CREATE OR REPLACE TRIGGER abs_mdi."DDP_EDSDB_BUILDING_VERSION_TRG" 
BEFORE INSERT ON abs_mdi.DDP_EDSDB_BUILDING_VERSION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.EDSDBBLDGVERID IS NULL THEN
      SELECT DDP_EDSDB_BUILDING_VERSION_SEQ.NEXTVAL INTO :NEW.EDSDBBLDGVERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/