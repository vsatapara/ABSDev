CREATE OR REPLACE TRIGGER abs_mdi."MAINTENANCE_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Maintenance" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
         <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."MaintenanceId" IS NULL THEN
          SELECT MAINTENANCE_SEQ.NEXTVAL INTO :NEW."MaintenanceId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;
   IF UPDATING THEN
        IF (:old."FromDate" != :new."FromDate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Maintenance','FromDate', to_char(:old."FromDate",'MM/DD/YYYY HH24:MI:SS'), to_char(:new."FromDate",'MM/DD/YYYY HH24:MI:SS'),:new."IpAddress"); 
        END IF;
        IF (:old."ToDate" != :new."ToDate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Maintenance','ToDate', to_char(:old."ToDate",'MM/DD/YYYY HH24:MI:SS'), to_char(:new."ToDate",'MM/DD/YYYY HH24:MI:SS'),:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Maintenance','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
        IF (:old."Content" != :new."Content") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'Maintenance','Content', :old."Content", :new."Content",:new."IpAddress"); 
        END IF;
    END IF;
END;

/