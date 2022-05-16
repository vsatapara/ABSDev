CREATE OR REPLACE TRIGGER abs_mdi."PermissionGroup_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PermissionGroup" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
      END IF;

    IF UPDATING THEN
        IF (:old."PermissionGroupName" != :new."PermissionGroupName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PermissionGroup','PermissionGroupName', :old."PermissionGroupName", :new."PermissionGroupName",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PermissionGroup','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
    END IF;
END;



/