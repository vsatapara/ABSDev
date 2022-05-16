CREATE OR REPLACE TRIGGER abs_mdi."CompanyEmailNotification_TRG" 
BEFORE INSERT ON abs_mdi."CompanyEmailNotification" 
FOR EACH ROW 
BEGIN
IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CompanyEmailNotificationId" IS NULL THEN
      SELECT "CompanyEmailNotification_SEQ".NEXTVAL INTO :NEW."CompanyEmailNotificationId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
  END IF;
   IF UPDATING THEN
       IF(:old."PurchaseQueueEmailBuildings" != :new."PurchaseQueueEmailBuildings")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyEmailNotification','PurchaseQueueEmailBuildings', :old."PurchaseQueueEmailBuildings", :new."PurchaseQueueEmailBuildings",:new."IpAddress");
        END IF;
        IF(:old."PurchaseQueueEmailComponent" != :new."PurchaseQueueEmailComponent")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyEmailNotification','PurchaseQueueEmailComponent', :old."PurchaseQueueEmailComponent", :new."PurchaseQueueEmailComponent",:new."IpAddress");
        END IF;
   END IF;
END;



/