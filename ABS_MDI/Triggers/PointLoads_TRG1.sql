CREATE OR REPLACE TRIGGER abs_mdi."PointLoads_TRG1" 
BEFORE INSERT ON abs_mdi."PointLoads" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PointLoadId" IS NULL THEN
      SELECT "PointLoads_SEQ1".NEXTVAL INTO :NEW."PointLoadId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/