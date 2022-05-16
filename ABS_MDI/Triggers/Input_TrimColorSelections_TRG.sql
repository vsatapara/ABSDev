CREATE OR REPLACE TRIGGER abs_mdi."Input_TrimColorSelections_TRG" 
BEFORE INSERT ON abs_mdi."Input_TrimColorSelections" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."TrimColorSelectionId" IS NULL THEN
      SELECT "Input_TrimColorSelections_SEQ".NEXTVAL INTO :NEW."TrimColorSelectionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/