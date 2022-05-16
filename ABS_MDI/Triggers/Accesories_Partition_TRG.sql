CREATE OR REPLACE TRIGGER abs_mdi."Accesories_Partition_TRG" 
BEFORE INSERT ON abs_mdi."Accesories_Partition" 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PartitionId" IS NULL THEN
      SELECT "Accesories_Partition_SEQ".NEXTVAL INTO :NEW."PartitionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/