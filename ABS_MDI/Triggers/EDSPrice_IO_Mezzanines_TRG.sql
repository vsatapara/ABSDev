CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_IO_Mezzanines_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_IO_Mezzanines" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/