CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_DifferentiatedPricingRxRunSuccess_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_DifferentiatedPricingRxRunSuccess" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/