CREATE OR REPLACE TRIGGER abs_mdi."CAD_TitleBlock_TRG1" 
BEFORE INSERT ON abs_mdi."CAD_TitleBlock" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."Id" IS NULL THEN
      SELECT "CAD_TitleBlock_SEQ1".NEXTVAL INTO :NEW."Id" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/