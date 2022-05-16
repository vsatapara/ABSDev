CREATE OR REPLACE TRIGGER abs_mdi."CompanyLabelMessagingDetail_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyLabelMessagingDetail" 
FOR EACH ROW 
BEGIN
 IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN
        IF(:old."IsDefualtSetting" != :new."IsDefualtSetting")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','IsDefualtSetting', :old."IsDefualtSetting", :new."IsDefualtSetting",:new."IpAddress");
        END IF;
        IF(:old."LoginWelcomeMessage" != :new."LoginWelcomeMessage")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','LoginWelcomeMessage', :old."LoginWelcomeMessage", :new."LoginWelcomeMessage",:new."IpAddress");
        END IF;
        IF(:old."ForgotPasswordMeassage" != :new."ForgotPasswordMeassage")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','ForgotPasswordMeassage', :old."ForgotPasswordMeassage", :new."ForgotPasswordMeassage",:new."IpAddress");
        END IF;
        IF(:old."OrderNoteMessage" != :new."OrderNoteMessage")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','OrderNoteMessage', :old."OrderNoteMessage", :new."OrderNoteMessage",:new."IpAddress");
        END IF;
        IF(:old."StartBuildingAction" != :new."StartBuildingAction")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','StartBuildingAction', :old."StartBuildingAction", :new."StartBuildingAction",:new."IpAddress");
        END IF;
        IF(:old."StartBuildingURL" != :new."StartBuildingURL")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','StartBuildingURL', :old."StartBuildingURL", :new."StartBuildingURL",:new."IpAddress");
        END IF;
        IF(:old."OrderComponent" != :new."OrderComponent") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','OrderComponent', :old."OrderComponent", :new."OrderComponent",:new."IpAddress");
        END IF;
        IF(:old."OrderComponntURL" != :new."OrderComponntURL") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','OrderComponntURL', :old."OrderComponntURL", :new."OrderComponntURL",:new."IpAddress"); 
        END IF;
        IF(:old."ReturnTowebsideName" != :new."ReturnTowebsideName") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','ReturnTowebsideName', :old."ReturnTowebsideName", :new."ReturnTowebsideName",:new."IpAddress");
        END IF;
        IF(:old."ReturnToWebSideUrl" != :new."ReturnToWebSideUrl") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','ReturnToWebSideUrl', :old."ReturnToWebSideUrl", :new."ReturnToWebSideUrl",:new."IpAddress");
        END IF;
        IF(:old."CompanyAddess" != :new."CompanyAddess") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyLabelMessagingDetail','CompanyAddess', :old."CompanyAddess", :new."CompanyAddess",:new."IpAddress");
        END IF;

  END IF;
END;

/