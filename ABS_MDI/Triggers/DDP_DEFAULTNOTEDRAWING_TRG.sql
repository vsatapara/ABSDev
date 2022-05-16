CREATE OR REPLACE TRIGGER abs_mdi."DDP_DEFAULTNOTEDRAWING_TRG" 
BEFORE INSERT OR UPDATE ON  abs_mdi.DDP_DEFAULTNOTEDRAWING 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.NOTEDRAWINGID IS NULL THEN
      SELECT DDP_DEFAULTNOTEDRAWING_SEQ.NEXTVAL INTO :NEW.NOTEDRAWINGID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/