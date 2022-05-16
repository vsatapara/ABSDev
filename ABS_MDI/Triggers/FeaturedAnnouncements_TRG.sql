CREATE OR REPLACE TRIGGER abs_mdi."FeaturedAnnouncements_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."FeaturedAnnouncements" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."FAnnouncementId" IS NULL THEN
          SELECT "FeaturedAnnouncements_SEQ".NEXTVAL INTO :NEW."FAnnouncementId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF; 

  IF UPDATING THEN

        IF(:old."IsActive" != :new."IsActive")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'FeaturedAnnouncements','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF;

        IF(:old."Title" != :new."Title") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'FeaturedAnnouncements','Title', :old."Title", :new."Title",:new."IpAddress"); 
        END IF;

        IF(:old."StartDate" != :new."StartDate")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'FeaturedAnnouncements','StartDate', :old."StartDate", :new."StartDate",:new."IpAddress"); 
        END IF;

        IF(:old."EndDate" != :new."EndDate")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'FeaturedAnnouncements','EndDate', :old."EndDate", :new."EndDate",:new."IpAddress"); 
        END IF;

        IF(:old."AnnouncementImageVideoId" != :new."AnnouncementImageVideoId")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'FeaturedAnnouncements','AnnouncementImageVideoId', :old."AnnouncementImageVideoId", :new."AnnouncementImageVideoId",:new."IpAddress"); 
        END IF;

        IF(:old."SortOrder" != :new."SortOrder")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'FeaturedAnnouncements','SortOrder', :old."SortOrder", :new."SortOrder",:new."IpAddress"); 
        END IF;

        IF(:old."Description" != :new."Description")
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'FeaturedAnnouncements','Description', :old."Description", :new."Description",:new."IpAddress"); 
        END IF;

    END IF;
END;



/