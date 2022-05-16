CREATE OR REPLACE TRIGGER abs_mdi."Accessories_CanopyMaster_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_CanopyMaster" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."AccessoriesCanopyId" IS NULL THEN
      SELECT "Accessories_CanopyMaster_SEQ".NEXTVAL INTO :NEW."AccessoriesCanopyId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/