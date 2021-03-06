CREATE OR REPLACE TRIGGER abs_mdi."DDP_DESIGNPACKAGECHECKLIST_TRG1" 
BEFORE INSERT ON abs_mdi.DDP_DESIGNPACKAGECHECKLIST 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT DDP_DESIGNPACKAGECHECKLIST_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/