CREATE OR REPLACE TRIGGER abs_mdi."TermsAndCondition_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."TermsAndCondition" 
FOR EACH ROW 
BEGIN
  IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."TermsAndConditionsId" IS NULL THEN
          SELECT "TermsAndCondition_SEQ".NEXTVAL INTO :NEW."TermsAndConditionsId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
  END IF;
  IF UPDATING THEN

    IF(:old."CompanyId" != :new."CompanyId")
    THEN
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','CompanyId', :old."CompanyId", :new."CompanyId",:new."IpAddress"); 
    END IF;
    IF(:old."Content" != :new."Content") 
    THEN
        "HISTORYEVENTSCONTENT"(:new."ModifiedBy",'TermsAndCondition','Content', :old."Content", :new."Content",:new."IpAddress"); 
    END IF;
    IF(:old."IsForSignatureOrders" != :new."IsForSignatureOrders")
    THEN
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','IsForSignatureOrders', :old."IsForSignatureOrders", :new."IsForSignatureOrders",:new."IpAddress"); 
    END IF;
    IF(:old."Name" != :new."Name")
    THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','Name', :old."Name", :new."Name",:new."IpAddress"); 
    END IF;
    IF(:old."ShippingToCountryId" != :new."ShippingToCountryId") 
    THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','ShippingToCountryId', :old."ShippingToCountryId", :new."ShippingToCountryId",:new."IpAddress"); 
    END IF;
    IF(:old."CultureId" != :new."CultureId") 
    THEN
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','CultureId', :old."CultureId", :new."CultureId",:new."IpAddress"); 
    END IF;
    IF(:old."CampaignId" != :new."CampaignId") 
    THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','CampaignId', :old."CampaignId", :new."CampaignId",:new."IpAddress"); 
    END IF;
    IF(:old."IsDefault" != :new."IsDefault") 
    THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','IsDefault', :old."IsDefault", :new."IsDefault",:new."IpAddress"); 
    END IF;
    IF(:old."IsForComponents" != :new."IsForComponents") 
    THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','IsForComponents', :old."IsForComponents", :new."IsForComponents",:new."IpAddress"); 
    END IF;
    IF(:old."IsForBuildings" != :new."IsForBuildings") 
    THEN 
        "HistoryEventsOP"(:new."ModifiedBy",'TermsAndCondition','IsForBuildings', :old."IsForBuildings", :new."IsForBuildings",:new."IpAddress"); 
    END IF;
  END IF;
END;



/