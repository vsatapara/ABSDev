CREATE OR REPLACE TRIGGER abs_mdi."RoleMaster_TRG" 
BEFORE INSERT ON abs_mdi."RoleMaster" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."RoleId" IS NULL THEN
      SELECT "RoleMaster_SEQ".NEXTVAL INTO :NEW."RoleId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/