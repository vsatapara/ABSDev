CREATE OR REPLACE TRIGGER abs_mdi."Input_GirtsBaySpacing_GirtSpecified_TRG" 
BEFORE INSERT ON abs_mdi."Input_GirtsBaySpacing_GirtSpecified" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."GirtSpecifiedId" IS NULL THEN
      SELECT "Input_GirtsBaySpacing_GirtSpecified_SEQ".NEXTVAL INTO :NEW."GirtSpecifiedId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/