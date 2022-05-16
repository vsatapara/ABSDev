CREATE OR REPLACE TRIGGER abs_mdi."BuildingInformation_TRG2" 
BEFORE INSERT ON abs_mdi."BuildingInformation" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuildingInformationId" IS NULL THEN
      SELECT "BuildingInformation_SEQ1".NEXTVAL INTO :NEW."BuildingInformationId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/