CREATE OR REPLACE TRIGGER abs_mdi."AccessoryType_TRG" 
BEFORE INSERT ON abs_mdi."AccessoryType" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."AccessoryTypeId" IS NULL THEN
      SELECT "AccessoryType_SEQ".NEXTVAL INTO :NEW."AccessoryTypeId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/