CREATE OR REPLACE TRIGGER abs_mdi."SkinningTypographyDetail_TRG" 
BEFORE INSERT ON abs_mdi."SkinningTypographyDetail" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/