CREATE OR REPLACE TRIGGER abs_mdi."InsulationAccessories_TRG" 
BEFORE INSERT ON abs_mdi."InsulationAccessories" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."InsulationAccessoriesId" IS NULL THEN
      SELECT "InsulationAccessories_SEQ".NEXTVAL INTO :NEW."InsulationAccessoriesId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/