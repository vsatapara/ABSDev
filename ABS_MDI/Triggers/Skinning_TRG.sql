CREATE OR REPLACE TRIGGER abs_mdi."Skinning_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Skinning" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
         <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF (:old."ShowWelcomeText" != :new."ShowWelcomeText") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','ShowWelcomeText', :old."ShowWelcomeText", :new."ShowWelcomeText",:new."IpAddress");
        END IF;
        IF (:old."ShowCompanyLogo" != :new."ShowCompanyLogo") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','ShowCompanyLogo', :old."ShowCompanyLogo", :new."ShowCompanyLogo",:new."IpAddress");
        END IF;
        IF (:old."PrimaryColor" != :new."PrimaryColor") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','PrimaryColor', :old."PrimaryColor", :new."PrimaryColor",:new."IpAddress"); 
        END IF;
        IF (:old."SecondaryColor" != :new."SecondaryColor") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','SecondaryColor', :old."SecondaryColor", :new."SecondaryColor",:new."IpAddress"); 
        END IF;
        IF (:old."TertiaryColor" != :new."TertiaryColor") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','TertiaryColor', :old."TertiaryColor", :new."TertiaryColor",:new."IpAddress"); 
        END IF;
        IF (:old."Accent1" != :new."Accent1") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','Accent1', :old."Accent1", :new."Accent1",:new."IpAddress"); 
        END IF;
        IF (:old."Accent2" != :new."Accent2") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','Accent2', :old."Accent2", :new."Accent2",:new."IpAddress"); 
        END IF;  
        IF (:old."Accent3" != :new."Accent3") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','Accent3', :old."Accent3", :new."Accent3",:new."IpAddress"); 
        END IF;  
        IF (:old."Accent4" != :new."Accent4") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','Accent4', :old."Accent4", :new."Accent4",:new."IpAddress"); 
        END IF;
        IF (:old."ActiveApproval" != :new."ActiveApproval") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','ActiveApproval', :old."ActiveApproval", :new."ActiveApproval",:new."IpAddress"); 
        END IF;
        IF (:old."Cancelled" != :new."Cancelled") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','Cancelled', :old."Cancelled", :new."Cancelled",:new."IpAddress"); 
        END IF;  
        IF (:old."OnHold" != :new."OnHold") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','OnHold', :old."OnHold", :new."OnHold",:new."IpAddress"); 
        END IF;  
        IF (:old."Completed" != :new."Completed") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Skinning','Completed', :old."Completed", :new."Completed",:new."IpAddress"); 
        END IF;        
    END IF;    
END;
/