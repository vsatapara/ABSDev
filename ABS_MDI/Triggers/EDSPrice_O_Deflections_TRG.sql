CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_Deflections_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_Deflections" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
        IF INSERTING AND :NEW."DeflectionsId" IS NULL THEN
      SELECT "EDSPrice_O_Deflections_SEQ".NEXTVAL INTO :NEW."DeflectionsId" FROM SYS.DUAL;
    END IF;

    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "EDSPrice_O_Deflections" WHERE "DeflectionsId" = :NEW."DeflectionsId";

        IF INSERTING AND n > 0 THEN
            SELECT (MAX("DeflectionsId")+1) INTO :NEW."DeflectionsId" FROM "EDSPrice_O_Deflections";
        END IF;
    END;
  END COLUMN_SEQUENCES;
END;

/