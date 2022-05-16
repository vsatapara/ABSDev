CREATE OR REPLACE TRIGGER abs_mdi."Accesories_Windows_TRG" 
BEFORE INSERT ON abs_mdi."Accesories_Windows" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."WindowId" IS NULL THEN
      SELECT "Accesories_Windows_SEQ".NEXTVAL INTO :NEW."WindowId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/