CREATE OR REPLACE TRIGGER abs_mdi."Accessories_Valleygutters_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_Valleygutters" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
   BEGIN
    IF INSERTING AND :NEW."ValleyguttersId" IS NULL THEN
      SELECT "Accessories_Valleygutters_SEQ".NEXTVAL INTO :NEW."ValleyguttersId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/