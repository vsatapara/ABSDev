CREATE OR REPLACE TRIGGER abs_mdi."Accesories_PartitionGirtSpacing_TRG" 
BEFORE INSERT ON abs_mdi."Accesories_PartitionGirtSpacing" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PartitionGirtSpacingId" IS NULL THEN
      SELECT "Accesories_PartitionGirtSpacing_SEQ".NEXTVAL INTO :NEW."PartitionGirtSpacingId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/