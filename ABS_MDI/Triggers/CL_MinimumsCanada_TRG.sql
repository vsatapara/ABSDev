CREATE OR REPLACE TRIGGER abs_mdi."CL_MinimumsCanada_TRG" 
BEFORE INSERT ON abs_mdi."CL_MinimumsCanada" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."MinimumsCanadaId" IS NULL THEN
      SELECT "CL_MinimumsCanada_SEQ".NEXTVAL INTO :NEW."MinimumsCanadaId" FROM SYS.DUAL;
    END IF;
    IF INSERTING AND :NEW."JobsiteCity" IS NULL THEN
      SELECT "CL_MinimumsCanada_SEQ".NEXTVAL INTO :NEW."JobsiteCity" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/