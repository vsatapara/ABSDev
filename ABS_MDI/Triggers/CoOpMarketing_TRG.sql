CREATE OR REPLACE TRIGGER abs_mdi."CoOpMarketing_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CoOpMarketing" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."CoOpMarketingId" IS NULL THEN
          SELECT "CoOpMarketing_SEQ".NEXTVAL INTO :NEW."CoOpMarketingId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;

     IF UPDATING THEN
        IF (:old."BrandAssetsTitle" != :new."BrandAssetsTitle") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CoOpMarketing','BrandAssetsTitle', :old."BrandAssetsTitle", :new."BrandAssetsTitle",:new."IpAddress"); 
        END IF;
         IF (:old."BrandAssetsContent" != :new."BrandAssetsContent") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'CoOpMarketing','BrandAssetsContent', :old."BrandAssetsContent", :new."BrandAssetsContent",:new."IpAddress"); 
        END IF;
         IF (:old."ProgramGuideLinesTitle" != :new."ProgramGuideLinesTitle") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CoOpMarketing','ProgramGuideLinesTitle', :old."ProgramGuideLinesTitle", :new."ProgramGuideLinesTitle",:new."IpAddress"); 
        END IF;
         IF (:old."ProgramGuideLinesContent" != :new."ProgramGuideLinesContent") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'CoOpMarketing','ProgramGuideLinesContent', :old."ProgramGuideLinesContent", :new."ProgramGuideLinesContent",:new."IpAddress"); 
        END IF;
         IF (:old."RequestForApprovalTitle" != :new."RequestForApprovalTitle") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CoOpMarketing','RequestForApprovalTitle', :old."RequestForApprovalTitle", :new."RequestForApprovalTitle",:new."IpAddress"); 
        END IF;
         IF (:old."RequestForApprovalContent" != :new."RequestForApprovalContent") 
        THEN
            "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'CoOpMarketing','RequestForApprovalContent', :old."RequestForApprovalContent", :new."RequestForApprovalContent",:new."IpAddress"); 
        END IF;
    END IF;
END;



/