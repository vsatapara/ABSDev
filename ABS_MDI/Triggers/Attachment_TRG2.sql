CREATE OR REPLACE TRIGGER abs_mdi."Attachment_TRG2" 
BEFORE INSERT ON abs_mdi."Attachment" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."AttachmentId" IS NULL THEN
      SELECT "Attachment_SEQ2".NEXTVAL INTO :NEW."AttachmentId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/