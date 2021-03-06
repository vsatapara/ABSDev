CREATE OR REPLACE TRIGGER abs_mdi."DDP_BUILDINGLOADS_TRG2" 
BEFORE INSERT ON abs_mdi.DDP_BUILDINGLOADS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BUILDINGLOADSID IS NULL THEN
      SELECT DDP_BUILDINGLOADS_SEQ.NEXTVAL INTO :NEW.BUILDINGLOADSID FROM SYS.DUAL;
    END IF;
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT DDP_BUILDINGLOADS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/