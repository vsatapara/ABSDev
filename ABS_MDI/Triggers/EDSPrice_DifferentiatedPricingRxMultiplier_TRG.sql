CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_DifferentiatedPricingRxMultiplier_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_DifferentiatedPricingRxMultiplier" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."DifferentiatedPricingRxMultiplierId" IS NULL THEN
      SELECT "EDSPrice_DifferentiatedPricingRxMultiplier_SEQ".NEXTVAL INTO :NEW."DifferentiatedPricingRxMultiplierId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/