CREATE OR REPLACE TRIGGER abs_mdi."Accesories_TopMountedSlideDoor_TRG" 
BEFORE INSERT ON abs_mdi."Accesories_TopMountedSlideDoor" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."TopMountedSlideDoorId" IS NULL THEN
      SELECT "Accesories_TopMountedSlideDoor_SEQ".NEXTVAL INTO :NEW."TopMountedSlideDoorId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/