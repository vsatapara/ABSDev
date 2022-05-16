CREATE OR REPLACE TRIGGER abs_mdi."CompanyPortalDetail_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."CompanyPortalDetail" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN
        IF(:old."PortalSoftwareName" != :new."PortalSoftwareName") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','PortalSoftwareName', :old."PortalSoftwareName", :new."PortalSoftwareName",:new."IpAddress");
        END IF;
        IF(:old."PortalHeaderDescriptor" != :new."PortalHeaderDescriptor") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','PortalHeaderDescriptor', :old."PortalHeaderDescriptor", :new."PortalHeaderDescriptor",:new."IpAddress");
        END IF;
        IF(:old."PortalURL" != :new."PortalURL") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','PortalURL', :old."PortalURL", :new."PortalURL",:new."IpAddress");
        END IF;
        IF(:old."GoogleTagManagerId" != :new."GoogleTagManagerId") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','GoogleTagManagerId', :old."GoogleTagManagerId", :new."GoogleTagManagerId",:new."IpAddress"); 
        END IF;
        IF(:old."BuilderWroxSoftwareName" != :new."BuilderWroxSoftwareName") THEN 
             "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','BuilderWroxSoftwareName', :old."BuilderWroxSoftwareName", :new."BuilderWroxSoftwareName",:new."IpAddress");
        END IF;
        IF(:old."FeedBackEmailAddress" != :new."FeedBackEmailAddress") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','FeedBackEmailAddress', :old."FeedBackEmailAddress", :new."FeedBackEmailAddress",:new."IpAddress");
        END IF;
        IF(:old."Favaicon" != :new."Favaicon") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','Favaicon', :old."Favaicon", :new."Favaicon",:new."IpAddress");
        END IF;
        IF(:old."CompanyLogo" != :new."CompanyLogo") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','CompanyLogo', :old."CompanyLogo", :new."CompanyLogo",:new."IpAddress");
        END IF;
        IF(:old."SignInPage" != :new."SignInPage") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','SignInPage', :old."SignInPage", :new."SignInPage",:new."IpAddress");
        END IF;
        IF(:old."SignInPageLogo" != :new."SignInPageLogo") THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','SignInPageLogo', :old."SignInPageLogo", :new."SignInPageLogo",:new."IpAddress");
        END IF;
        IF(:old."PurchaseOrderLogo" != :new."PurchaseOrderLogo") THEN
            "HistoryEventsOP"(:new."ModifiedBy",'CompanyPortalDetail','PurchaseOrderLogo', :old."PurchaseOrderLogo", :new."PurchaseOrderLogo",:new."IpAddress");
        END IF;

  END IF;
END;
/