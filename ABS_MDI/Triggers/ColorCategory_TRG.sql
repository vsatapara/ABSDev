CREATE OR REPLACE TRIGGER abs_mdi."ColorCategory_TRG" 
BEFORE INSERT ON abs_mdi."ColorCategory" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CategotyId" IS NULL THEN
      SELECT "ColorCategory_SEQ".NEXTVAL INTO :NEW."CategotyId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/