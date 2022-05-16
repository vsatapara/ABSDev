CREATE OR REPLACE TRIGGER abs_mdi."Bracing_XBraceAnchor_TRG1" 
BEFORE INSERT ON abs_mdi."Bracing_XBraceAnchor" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."XBraceAnchorId" IS NULL THEN
      SELECT "Bracing_XBraceAnchor_SEQ1".NEXTVAL INTO :NEW."XBraceAnchorId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/