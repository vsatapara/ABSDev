CREATE OR REPLACE TRIGGER abs_mdi."EndWallPotalFrame_TRG" 
BEFORE INSERT ON abs_mdi."EndWallPotalFrame" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;


/