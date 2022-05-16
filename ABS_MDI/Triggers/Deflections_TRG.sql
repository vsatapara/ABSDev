CREATE OR REPLACE TRIGGER abs_mdi."Deflections_TRG" 
BEFORE INSERT ON abs_mdi."Deflections" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."DeflectionId" IS NULL THEN
      SELECT "Deflections_SEQ".NEXTVAL INTO :NEW."DeflectionId" FROM SYS.DUAL;
    END IF;

    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "Deflections" WHERE "DeflectionId" = :NEW."DeflectionId";

        IF INSERTING AND n > 0 THEN
            SELECT (MAX("DeflectionId")+1) INTO :NEW."DeflectionId" FROM "Deflections";
        END IF;
    END;    
  END COLUMN_SEQUENCES;
END;

/