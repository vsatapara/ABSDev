CREATE OR REPLACE TRIGGER abs_mdi."EDS_Price_O_BuildingTotal_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_BuildingTotal" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/