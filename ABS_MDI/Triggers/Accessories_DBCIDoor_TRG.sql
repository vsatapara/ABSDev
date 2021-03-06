CREATE OR REPLACE TRIGGER abs_mdi."Accessories_DBCIDoor_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_DBCIDoor" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."DbciDoorId" IS NULL THEN
      SELECT "Accessories_DBCIDoor_SEQ".NEXTVAL INTO :NEW."DbciDoorId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;



/