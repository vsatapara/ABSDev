CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_I_Taxes_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_I_Taxes" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."TaxesId" IS NULL THEN
      SELECT "EDSPrice_I_Taxes_SEQ".NEXTVAL INTO :NEW."TaxesId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/