CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_Buyouts_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_Buyouts" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."Buyout_Id" IS NULL THEN
      SELECT "EDSPrice_O_Buyouts_SEQ".NEXTVAL INTO :NEW."Buyout_Id" FROM SYS.DUAL;
    END IF;

    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "EDSPrice_O_Buyouts" WHERE "Buyout_Id" = :NEW."Buyout_Id";

        IF INSERTING AND n > 0 THEN
            SELECT (MAX("Buyout_Id")+1) INTO :NEW."Buyout_Id" FROM "EDSPrice_O_Buyouts";
        END IF;
    END;    
  END COLUMN_SEQUENCES;
END;

/