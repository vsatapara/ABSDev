CREATE OR REPLACE TRIGGER abs_mdi."CAD_TitleBlock_TRG" 
BEFORE INSERT ON abs_mdi."CAD_TitleBlock" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/