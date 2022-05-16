CREATE OR REPLACE TRIGGER abs_mdi."DocumentPricing_TRG" 
BEFORE INSERT ON abs_mdi."DocumentPricing" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."DocumentPricingId" IS NULL THEN
      SELECT "DocumentPricing_SEQ".NEXTVAL INTO :NEW."DocumentPricingId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/