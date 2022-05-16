CREATE OR REPLACE TRIGGER abs_mdi."SkinningTypographyHeader_TRG" 
BEFORE INSERT ON abs_mdi."SkinningTypographyHeader" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/