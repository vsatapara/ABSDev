CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_ProcessingResults_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_ProcessingResults" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."ProcessingResultsId" IS NULL THEN
      SELECT "EDSPrice_ProcessingResults_SEQ".NEXTVAL INTO :NEW."ProcessingResultsId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/