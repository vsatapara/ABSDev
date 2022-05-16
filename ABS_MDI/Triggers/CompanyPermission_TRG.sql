CREATE OR REPLACE TRIGGER abs_mdi."CompanyPermission_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyPermission" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
         <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."CompanyId" IS NULL THEN
          SELECT "CompanyPermission_SEQ".NEXTVAL INTO :NEW."CompanyId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN
        IF (:old."PermissionGroupId" != :new."PermissionGroupId") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPermission','PermissionGroupId', :old."PermissionGroupId", :new."PermissionGroupId",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPermission','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
    END IF;
END;



/