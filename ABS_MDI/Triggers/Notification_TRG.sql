CREATE OR REPLACE TRIGGER abs_mdi."Notification_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Notification" 
FOR EACH ROW 
BEGIN
   IF INSERTING THEN   
		<<COLUMN_SEQUENCES>>
          BEGIN
            IF INSERTING AND :NEW."NotificationId" IS NULL THEN
              SELECT "Notification_SEQ".NEXTVAL INTO :NEW."NotificationId" FROM SYS.DUAL;
            END IF;
          END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN

        IF(:old."NotificationName" != :new."NotificationName")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','NotificationName', :old."NotificationName", :new."NotificationName",:new."IpAddress");
        END IF;

        IF(:old."IsActive" != :new."IsActive")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress");
        END IF;

        IF(:old."StartDate" != :new."StartDate")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','StartDate', :old."StartDate", :new."StartDate",:new."IpAddress");
        END IF;

        IF(:old."EndDate" != :new."EndDate")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','EndDate', :old."EndDate", :new."EndDate",:new."IpAddress");
        END IF;

        IF(:old."CompanyId" != :new."CompanyId")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','CompanyId', :old."CompanyId", :new."CompanyId",:new."IpAddress");
        END IF;

        IF(:old."SortOrder" != :new."SortOrder")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','SortOrder', :old."SortOrder", :new."SortOrder",:new."IpAddress");
        END IF;

        IF(:old."IsSystemNotification" != :new."IsSystemNotification")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','IsSystemNotification', :old."IsSystemNotification", :new."IsSystemNotification",:new."IpAddress");
        END IF;

        IF(:old."FeaturedImageId" != :new."FeaturedImageId")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'Notification','FeaturedImageId', :old."FeaturedImageId", :new."FeaturedImageId",:new."IpAddress");
        END IF;

        IF(:old."Content" != :new."Content")
        THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'Notification','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;
    END IF;
END;



/