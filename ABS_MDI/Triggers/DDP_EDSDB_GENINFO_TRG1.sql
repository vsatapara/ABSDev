CREATE OR REPLACE TRIGGER abs_mdi."DDP_EDSDB_GENINFO_TRG1" 
BEFORE INSERT ON abs_mdi.DDP_EDSDB_GENINFO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/