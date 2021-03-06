CREATE OR REPLACE TRIGGER abs_mdi."M_Panel_Dropdown_TRG" 
BEFORE INSERT ON abs_mdi."M_Panel_Dropdown" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."Id" IS NULL THEN
      SELECT "M_Panel_Dropdown_SEQ".NEXTVAL INTO :NEW."Id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/