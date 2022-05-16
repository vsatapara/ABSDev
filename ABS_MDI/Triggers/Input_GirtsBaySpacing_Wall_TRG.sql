CREATE OR REPLACE TRIGGER abs_mdi."Input_GirtsBaySpacing_Wall_TRG" 
BEFORE INSERT ON abs_mdi."Input_GirtsBaySpacing_Wall" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."WallBaySpaceId" IS NULL THEN
      SELECT "Input_GirtsBaySpacing_Wall_SEQ".NEXTVAL INTO :NEW."WallBaySpaceId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/