CREATE OR REPLACE TRIGGER abs_mdi."Input_GirtsBaySpacing_Purlin_TRG" 
BEFORE INSERT ON abs_mdi."Input_GirtsBaySpacing_Purlin" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PurlinBaySpaceId" IS NULL THEN
      SELECT "Input_GirtsBaySpacing_Purlin_SEQ".NEXTVAL INTO :NEW."PurlinBaySpaceId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;


/