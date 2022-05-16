CREATE OR REPLACE TRIGGER abs_mdi."PresidentsAdvisoryCouncil_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PresidentsAdvisoryCouncil" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
    <<COLUMN_SEQUENCES>>
        BEGIN
            IF INSERTING AND :NEW."PresidentsAdvisoryCouncilId" IS NULL THEN
            SELECT "PresidentsAdvisoryCouncil_SEQ".NEXTVAL INTO :NEW."PresidentsAdvisoryCouncilId" FROM SYS.DUAL;
            END IF;
        END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF (:old."TabName" != :new."TabName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','TabName', :old."TabName", :new."TabName",:new."IpAddress"); 
        END IF;
        IF (:old."MembersOnly" != :new."MembersOnly") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','MembersOnly', :old."MembersOnly", :new."MembersOnly",:new."IpAddress"); 
        END IF;
        IF (:old."Sort" != :new."Sort") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','Sort', :old."Sort", :new."Sort",:new."IpAddress"); 
        END IF;
        IF (:old."Title" != :new."Title") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','Title', :old."Title", :new."Title",:new."IpAddress"); 
        END IF;
        IF (:old."Content" != :new."Content") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','Content', :old."Content", :new."Content",:new."IpAddress"); 
        END IF;
        IF (:old."CommitteesContent" != :new."CommitteesContent") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','CommitteesContent', :old."CommitteesContent", :new."CommitteesContent",:new."IpAddress"); 
        END IF;
         IF (:old."MembersContent" != :new."MembersContent") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','MembersContent', :old."MembersContent", :new."MembersContent",:new."IpAddress"); 
        END IF;
         IF (:old."FeaturedImageVideo" != :new."FeaturedImageVideo") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PresidentsAdvisoryCouncil','FeaturedImageVideo', :old."FeaturedImageVideo", :new."FeaturedImageVideo",:new."IpAddress"); 
        END IF;
    END IF;

END;



/