CREATE OR REPLACE TRIGGER abs_mdi."EDSPrice_I_Owner_TRG" 
BEFORE INSERT ON abs_mdi."EDSPrice_I_Owner" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."OwnerId" IS NULL THEN
      SELECT "EDSPrice_I_Owner_SEQ".NEXTVAL INTO :NEW."OwnerId" FROM SYS.DUAL;
    END IF;

    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "EDSPrice_I_Owner" WHERE "OwnerId" = :NEW."OwnerId";

        IF INSERTING AND n > 0 THEN
            SELECT (MAX("OwnerId")+1) INTO :NEW."OwnerId" FROM "EDSPrice_I_Owner";
        END IF; 
      END;  
  END COLUMN_SEQUENCES;
END;

/