CREATE OR REPLACE TRIGGER abs_mdi."BuilderAccessPermission_TRG" 
BEFORE INSERT ON abs_mdi."BuilderAccessPermission" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuilderAccessPermissionId" IS NULL THEN
      SELECT "BuilderAccessPermission_SEQ".NEXTVAL INTO :NEW."BuilderAccessPermissionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/