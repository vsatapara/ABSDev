CREATE OR REPLACE TRIGGER abs_mdi."Input_Roof_TRG" 
BEFORE INSERT ON abs_mdi."Input_Roof" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."RoofId" IS NULL THEN
      SELECT "Input_Roof_SEQ".NEXTVAL INTO :NEW."RoofId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/