CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_Deflections_TRG1" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_Deflections" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/