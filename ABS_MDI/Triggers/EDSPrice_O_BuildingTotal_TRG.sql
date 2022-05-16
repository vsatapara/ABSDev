CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_BuildingTotal_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_BuildingTotal" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."BuildingTotalId" IS NULL THEN
      SELECT "EDSPrice_O_BuildingTotal_SEQ".NEXTVAL INTO :NEW."BuildingTotalId" FROM SYS.DUAL;
    END IF;

    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "EDSPrice_O_BuildingTotal" WHERE "BuildingTotalId" = :NEW."BuildingTotalId";

        IF INSERTING AND n > 0 THEN
            SELECT (MAX("BuildingTotalId")+1) INTO :NEW."BuildingTotalId" FROM "EDSPrice_O_BuildingTotal";
        END IF;
    END;    
  END COLUMN_SEQUENCES;
END;

/