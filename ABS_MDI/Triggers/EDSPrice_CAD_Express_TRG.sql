CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_CAD_Express_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_CAD_Express" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/