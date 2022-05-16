CREATE OR REPLACE TRIGGER abs_mdi."EDS_Price_DifferentiatedPricingRxImpMultiplier_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_DifferentiatedPricingRxImpMultiplier" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/