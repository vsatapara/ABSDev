CREATE OR REPLACE TRIGGER abs_mdi."Input_GirtsBaySpacing_Girt_TRG" 
BEFORE INSERT ON abs_mdi."Input_GirtsBaySpacing_Girt" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."GirtBaySpaceId" IS NULL THEN
      SELECT "Input_GirtsBaySpacing_Girt_SEQ".NEXTVAL INTO :NEW."GirtBaySpaceId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/