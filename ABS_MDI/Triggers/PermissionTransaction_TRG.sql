CREATE OR REPLACE TRIGGER abs_mdi."PermissionTransaction_TRG" 
BEFORE INSERT ON abs_mdi."PermissionTransaction" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PermissionTransactionId" IS NULL THEN
      SELECT "PermissionTransaction_SEQ".NEXTVAL INTO :NEW."PermissionTransactionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/