CREATE OR REPLACE TRIGGER abs_mdi."Accessories_FramedOpening_TRG" 
BEFORE INSERT ON abs_mdi."Accessories_FramedOpening" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."FramedOpeningId" IS NULL THEN
      SELECT "Accessories_FramedOpening_SEQ".NEXTVAL INTO :NEW."FramedOpeningId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/