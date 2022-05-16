CREATE OR REPLACE TRIGGER abs_mdi."SkinningTypographyDetail_TRG2" 
BEFORE INSERT ON abs_mdi."SkinningTypographyDetail" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT "SkinningTypographyDetail_SEQ1".NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
    DECLARE n NUMBER;
    BEGIN
        SELECT COUNT(1) AS a INTO n FROM "SkinningTypographyDetail" WHERE "ID" = :NEW.ID;
        IF INSERTING AND n > 0 THEN
            SELECT (MAX("ID")+1) INTO :NEW.ID FROM "SkinningTypographyDetail";
        END IF;
    END;    
  END COLUMN_SEQUENCES;
END;
/