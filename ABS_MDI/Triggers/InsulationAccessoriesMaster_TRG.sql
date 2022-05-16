CREATE OR REPLACE TRIGGER abs_mdi."InsulationAccessoriesMaster_TRG" 
BEFORE INSERT ON abs_mdi."InsulationAccessoriesMaster" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."Id" IS NULL THEN
      SELECT "InsulationAccessoriesMaster_SEQ".NEXTVAL INTO :NEW."Id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/