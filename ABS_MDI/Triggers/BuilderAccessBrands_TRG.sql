CREATE OR REPLACE TRIGGER abs_mdi."BuilderAccessBrands_TRG" 
BEFORE INSERT ON abs_mdi."BuilderAccessBrands" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuilderAccessBrandId" IS NULL THEN
      SELECT "BuilderAccessBrands_SEQ".NEXTVAL INTO :NEW."BuilderAccessBrandId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/