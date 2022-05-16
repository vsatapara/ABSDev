CREATE OR REPLACE TRIGGER abs_mdi."BuilderAuthorizedSigner_TRG" 
BEFORE INSERT ON abs_mdi."BuilderAuthorizedSigner" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."AuthorizedSignerId" IS NULL THEN
      SELECT "BuilderAuthorizedSigner_SEQ".NEXTVAL INTO :NEW."AuthorizedSignerId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/