CREATE OR REPLACE TRIGGER abs_mdi."Permission_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Permission" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."PermissionId" IS NULL THEN
      SELECT "Permission_SEQ".NEXTVAL INTO :NEW."PermissionId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN	
        IF(:old."PermissionId" != :new."PermissionId")	
        THEN 	
            "HistoryEventsOP"(:new."ModifiedBy",'Permission','PermissionId', :old."PermissionId", :new."PermissionId",:new."IpAddress");	
        END IF;	
        IF(:old."PermissionGrpName" != :new."PermissionGrpName")	
        THEN	
            "HistoryEventsOP"(:new."ModifiedBy",'Permission','PermissionGrpName', :old."PermissionGrpName", :new."PermissionGrpName",:new."IpAddress");	
        END IF;	
        IF(:old."IsActive" != :new."IsActive")	
        THEN	
            "HistoryEventsOP"(:new."ModifiedBy",'Permission','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 	
        END IF;	
        IF(:old."IsDelete" != :new."IsDelete")	
        THEN	
            "HistoryEventsOP"(:new."ModifiedBy",'Permission','IsDelete', :old."IsDelete", :new."IsDelete",:new."IpAddress");	
        END IF;

     END IF;
END;

/