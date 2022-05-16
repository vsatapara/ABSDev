CREATE OR REPLACE TRIGGER abs_mdi."BuilderAccessSection_TRG" 
BEFORE INSERT ON abs_mdi."BuilderAccessSection" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuilderAccessSectionId" IS NULL THEN
      SELECT "BuilderAccessSection_SEQ".NEXTVAL INTO :NEW."BuilderAccessSectionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/