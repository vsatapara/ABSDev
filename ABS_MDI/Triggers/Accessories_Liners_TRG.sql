CREATE OR REPLACE TRIGGER abs_mdi."Accessories_Liners_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_Liners" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."LinerId" IS NULL THEN
      SELECT "Accessories_Liners_SEQ".NEXTVAL INTO :NEW."LinerId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/