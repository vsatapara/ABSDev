CREATE OR REPLACE TRIGGER abs_mdi."Accessories_Cranes_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_Cranes" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CraneId" IS NULL THEN
      SELECT "Accessories_Cranes_SEQ".NEXTVAL INTO :NEW."CraneId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/