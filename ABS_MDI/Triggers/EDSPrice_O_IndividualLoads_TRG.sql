CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_IndividualLoads_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_IndividualLoads" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/