CREATE OR REPLACE TRIGGER abs_mdi."UpcomingEventsAdministration_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."UpcomingEventsAdministration" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."UpcomingEventId" IS NULL THEN
          SELECT "UpcomingEventsAdministration_SEQ".NEXTVAL INTO :NEW."UpcomingEventId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN
        IF (:old."Title" != :new."Title") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','Title', :old."Title", :new."Title",:new."IpAddress"); 
        END IF;
        IF (:old."EventCategoryId" != :new."EventCategoryId") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','EventCategoryId', :old."EventCategoryId", :new."EventCategoryId",:new."IpAddress"); 
        END IF;        
        IF (:old."StartDate" != :new."StartDate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','StartDate', to_char(:old."StartDate",'MM/DD/YYYY'), to_char(:new."StartDate",'MM/DD/YYYY'),:new."IpAddress"); 
        END IF;
        IF (:old."EndDate" != :new."EndDate") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','EndDate', to_char(:old."EndDate",'MM/DD/YYYY'), to_char(:new."EndDate",'MM/DD/YYYY'),:new."IpAddress"); 
        END IF;
        IF (:old."Time" != :new."Time") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','Time', :old."Time", :new."Time",:new."IpAddress"); 
        END IF;
        IF (:old."Location" != :new."Location") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','Location', :old."Location", :new."Location",:new."IpAddress"); 
        END IF;
        IF (:old."Content" != :new."Content") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'UpcomingEventsAdministration','Content', :old."Content", :new."Content",:new."IpAddress"); 
        END IF;
        IF (:old."ActionButtonTitle" != :new."ActionButtonTitle") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','ActionButtonTitle', :old."ActionButtonTitle", :new."ActionButtonTitle",:new."IpAddress"); 
        END IF;
        IF (:old."ActionButtonURL" != :new."ActionButtonURL") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','ActionButtonURL', :old."ActionButtonURL", :new."ActionButtonURL",:new."IpAddress"); 
        END IF;
        IF (:old."FeaturedFile" != :new."FeaturedFile") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','FeaturedFile', :old."FeaturedFile", :new."FeaturedFile",:new."IpAddress"); 
        END IF;
        IF (:old."IsActive" != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'UpcomingEventsAdministration','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;
    END IF; 
END;


/