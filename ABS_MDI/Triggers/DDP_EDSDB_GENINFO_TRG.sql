CREATE OR REPLACE TRIGGER abs_mdi."DDP_EDSDB_GENINFO_TRG" 
BEFORE INSERT ON abs_mdi.DDP_EDSDB_GENINFO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.GENINFOID IS NULL THEN
      SELECT DDP_EDSDB_GENINFO_SEQ.NEXTVAL INTO :NEW.GENINFOID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/