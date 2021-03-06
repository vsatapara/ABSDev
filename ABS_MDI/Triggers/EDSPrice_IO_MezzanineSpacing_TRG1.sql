CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_IO_MezzanineSpacing_TRG1" 
BEFORE INSERT ON abs_mdi."EDSPrice_IO_MezzanineSpacing" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."MezzanineSpacingId" IS NULL THEN
      SELECT "EDSPrice_IO_MezzanineSpacing_SEQ1".NEXTVAL INTO :NEW."MezzanineSpacingId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/