CREATE OR REPLACE TRIGGER abs_mdi."Accesories_PurlinExtensions_TRG" 
BEFORE INSERT ON abs_mdi."Accesories_PurlinExtensions" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PurlinExtensionId" IS NULL THEN
      SELECT "Accesories_PurlinExtensions_SEQ".NEXTVAL INTO :NEW."PurlinExtensionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/