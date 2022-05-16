CREATE OR REPLACE TRIGGER abs_mdi."Input_Bays_TRG1" 
BEFORE INSERT ON abs_mdi."Input_Bays" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."RoofBaySpaceId" IS NULL THEN
      SELECT "Input_Bays_SEQ1".NEXTVAL INTO :NEW."RoofBaySpaceId" FROM SYS.DUAL;
    END IF;

    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "Input_Bays" WHERE "RoofBaySpaceId" = :NEW."RoofBaySpaceId";

        IF INSERTING AND n > 0 THEN
            SELECT (MAX("RoofBaySpaceId")+1) INTO :NEW."RoofBaySpaceId" FROM "Input_Bays";
        END IF;
    END;    
  END COLUMN_SEQUENCES;
END;

/