CREATE OR REPLACE TRIGGER abs_mdi."Input_GirtsBaySpacing_Roof_TRG" 
BEFORE INSERT ON abs_mdi."Input_Bays" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;


/