CREATE OR REPLACE TRIGGER abs_mdi."Tools_ProjectNotes_TRG" 
BEFORE INSERT ON abs_mdi."Tools_ProjectNotes" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."ProjectNotesId" IS NULL THEN
      SELECT "Tools_ProjectNotes_SEQ".NEXTVAL INTO :NEW."ProjectNotesId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/