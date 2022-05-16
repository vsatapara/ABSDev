CREATE OR REPLACE TRIGGER abs_mdi."CompanyNotification_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyNotification" 
FOR EACH ROW 
BEGIN
   IF INSERTING THEN   
      <<COLUMN_SEQUENCES>>
          BEGIN
            IF INSERTING AND :NEW."CompanyNotificationId" IS NULL THEN
              SELECT "CompanyNotification_SEQ".NEXTVAL INTO :NEW."CompanyNotificationId" FROM SYS.DUAL;
            END IF;
          END COLUMN_SEQUENCES;
    END IF;
  IF UPDATING THEN    
        IF(:old."CompanyNotificationName" != :new."CompanyNotificationName")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'CompanyNotification','CompanyNotificationName', :old."CompanyNotificationName", :new."CompanyNotificationName",:new."IpAddress");
        END IF;

        IF(:old."IsActive" != :new."IsActive")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'CompanyNotification','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress");
        END IF;

        IF(:old."Content" != :new."Content")
        THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'CompanyNotification','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;

        IF(:old."StartDate" != :new."StartDate")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'CompanyNotification','StartDate', :old."StartDate", :new."StartDate",:new."IpAddress");
        END IF;

        IF(:old."EndDate" != :new."EndDate")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'CompanyNotification','EndDate', :old."EndDate", :new."EndDate",:new."IpAddress");
        END IF;

        IF(:old."CompanyId" != :new."CompanyId")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'CompanyNotification','CompanyId', :old."CompanyId", :new."CompanyId",:new."IpAddress");
        END IF;

        IF(:old."SortOrder" != :new."SortOrder")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'CompanyNotification','SortOrder', :old."SortOrder", :new."SortOrder",:new."IpAddress");
        END IF;

    END IF;
END;



/