CREATE OR REPLACE TRIGGER abs_mdi."Accessories_RubberPipeFlash_Size_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_RubberPipeFlash_Size" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."Id" IS NULL THEN
      SELECT "Accessories_RubberPipeFlash_Size_SEQ".NEXTVAL INTO :NEW."Id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/