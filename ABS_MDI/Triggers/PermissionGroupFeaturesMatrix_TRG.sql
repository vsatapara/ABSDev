CREATE OR REPLACE TRIGGER abs_mdi."PermissionGroupFeaturesMatrix_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PermissionGroupFeaturesMatrix" 
FOR EACH ROW 
BEGIN  
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."PermissionGroupFeaturesMatrixId" IS NULL THEN
          SELECT "PermissionGroupFeaturesMatrix_SEQ".NEXTVAL INTO :NEW."PermissionGroupFeaturesMatrixId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF (:old."IsEnabled" != :new."IsEnabled") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PermissionGroupFeaturesMatrix','IsEnabled', :old."IsEnabled", :new."IsEnabled",:new."IpAddress"); 
        END IF;
    END IF;
END;



/