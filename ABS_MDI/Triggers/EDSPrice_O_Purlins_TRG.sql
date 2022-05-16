CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_O_Purlins_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_O_Purlins" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN

        IF INSERTING AND :NEW."PurlinsId" IS NULL THEN
        SELECT "EDSPrice_O_Purlins_SEQ".NEXTVAL INTO :NEW."PurlinsId" FROM SYS.DUAL;
        END IF;

        DECLARE n NUMBER;
        BEGIN
        SELECT COUNT(1) AS a INTO n FROM "EDSPrice_O_Purlins" WHERE "PurlinsId" = :NEW."PurlinsId";

        IF INSERTING AND n > 0 THEN
        SELECT (MAX("PurlinsId")+1) INTO :NEW."PurlinsId" FROM "EDSPrice_O_Purlins";
        END IF;
        END;
  END COLUMN_SEQUENCES;
END;

/