CREATE OR REPLACE TRIGGER abs_mdi."Accesories_Wainscot_TRG" 
BEFORE INSERT ON abs_mdi."Accesories_Wainscot" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."WainscotId" IS NULL THEN
      SELECT "Accesories_Wainscot_SEQ".NEXTVAL INTO :NEW."WainscotId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/