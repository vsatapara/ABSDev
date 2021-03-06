CREATE OR REPLACE TRIGGER abs_mdi."Input_Endwalls_OpenArea_TRG" 
BEFORE INSERT ON abs_mdi."Input_Endwalls_OpenArea" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."OptionId" IS NULL THEN
      SELECT "Input_Endwalls_OpenArea_SEQ".NEXTVAL INTO :NEW."OptionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/