CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_ProjectTotal_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_ProjectTotal" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."ProjectTotalId" IS NULL THEN
      SELECT "EDSPrice_O_ProjectTotal_SEQ".NEXTVAL INTO :NEW."ProjectTotalId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/