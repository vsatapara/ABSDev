CREATE OR REPLACE TRIGGER abs_mdi."GeometryInformation_TRG1" 
BEFORE INSERT ON abs_mdi."GeometryInformation" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."GeometryInformationId" IS NULL THEN
      SELECT "GeometryInformation_SEQ1".NEXTVAL INTO :NEW."GeometryInformationId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/