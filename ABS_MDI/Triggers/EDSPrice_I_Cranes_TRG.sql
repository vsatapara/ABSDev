CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_I_Cranes_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_I_Cranes" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/