CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_I_OrderRequests_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_I_OrderRequests" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/