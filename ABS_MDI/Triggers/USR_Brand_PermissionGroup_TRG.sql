CREATE OR REPLACE TRIGGER abs_mdi."USR_Brand_PermissionGroup_TRG" 
BEFORE INSERT ON abs_mdi."USR_Brand_PermissionGroup" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."UsrBrandPermissionId" IS NULL THEN
      SELECT "USR_Brand_PermissionGroup_SEQ".NEXTVAL INTO :NEW."UsrBrandPermissionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/