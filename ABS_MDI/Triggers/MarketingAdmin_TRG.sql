CREATE OR REPLACE TRIGGER abs_mdi."MarketingAdmin_TRG" 
BEFORE INSERT  OR UPDATE ON abs_mdi."MarketingAdmin" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."MarketingAdminId" IS NULL THEN
            SELECT "MarketingAdmin_SEQ".NEXTVAL INTO :NEW."MarketingAdminId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN    
        IF(:old."Title" != :new."Title")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'MarketingAdmin','Title', :old."Title", :new."Title",:new."IpAddress");
        END IF;
        IF(:old."SortOrder" != :new."SortOrder")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'MarketingAdmin','SortOrder', :old."SortOrder", :new."SortOrder",:new."IpAddress");
        END IF; 
        IF(:old."ActionButtonTitle" != :new."ActionButtonTitle")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'MarketingAdmin','ActionButtonTitle', :old."ActionButtonTitle", :new."ActionButtonTitle",:new."IpAddress");
        END IF;
        IF(:old."ActionButtonUrl" != :new."ActionButtonUrl")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'MarketingAdmin','ActionButtonUrl', :old."ActionButtonUrl", :new."ActionButtonUrl",:new."IpAddress");
        END IF;
        IF(:old."FileId" != :new."FileId")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'MarketingAdmin','FileId', :old."FileId", :new."FileId",:new."IpAddress");
        END IF;    
        IF(:old."Content" != :new."Content")
        THEN "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'MarketingAdmin','Content', :old."Content", :new."Content",:new."IpAddress");
        END IF;        
    END IF;        
END;



/