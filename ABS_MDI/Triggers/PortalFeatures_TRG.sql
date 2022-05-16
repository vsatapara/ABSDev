CREATE OR REPLACE TRIGGER abs_mdi."PortalFeatures_TRG" 
BEFORE INSERT ON abs_mdi."PortalFeatures" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."FeatureId" IS NULL THEN
          SELECT "PortalFeatures_SEQ".NEXTVAL INTO :NEW."FeatureId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
      END IF;
END;



/