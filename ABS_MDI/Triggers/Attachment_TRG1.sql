CREATE OR REPLACE TRIGGER abs_mdi."Attachment_TRG1" 
BEFORE INSERT ON abs_mdi."Attachment" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/