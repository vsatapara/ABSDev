CREATE OR REPLACE TRIGGER abs_mdi."Accessories_Vents_DropdownValue_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_Vents_DropdownValue" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."Id" IS NULL THEN
      SELECT "Accessories_Vents_DropdownValue_SEQ".NEXTVAL INTO :NEW."Id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/