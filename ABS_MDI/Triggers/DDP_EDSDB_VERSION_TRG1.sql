CREATE OR REPLACE TRIGGER abs_mdi."DDP_EDSDB_VERSION_TRG1" 
BEFORE INSERT ON abs_mdi.DDP_EDSDB_VERSION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.EDSDBVERSIONID IS NULL THEN
      SELECT DDP_EDSDB_VERSION_SEQ.NEXTVAL INTO :NEW.EDSDBVERSIONID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/