CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_I_Payment_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_I_Payment" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;



/