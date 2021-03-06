CREATE OR REPLACE TRIGGER abs_mdi."PermissionItems_TRG" 
BEFORE INSERT ON abs_mdi."PermissionItems" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."SelectiveId" IS NULL THEN
      SELECT "PermissionItems_SEQ".NEXTVAL INTO :NEW."SelectiveId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/