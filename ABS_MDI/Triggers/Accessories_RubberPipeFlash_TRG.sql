CREATE OR REPLACE TRIGGER abs_mdi."Accessories_RubberPipeFlash_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_RubberPipeFlash" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."RubberPipeFlashId" IS NULL THEN
      SELECT "Accessories_RubberPipeFlash_SEQ".NEXTVAL INTO :NEW."RubberPipeFlashId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/