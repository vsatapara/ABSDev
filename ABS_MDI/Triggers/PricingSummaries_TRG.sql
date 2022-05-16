CREATE OR REPLACE TRIGGER abs_mdi."PricingSummaries_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."PricingSummaries" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."PricingSummaryId" IS NULL THEN
          SELECT "PricingSummaries_SEQ".NEXTVAL INTO :NEW."PricingSummaryId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF; 

    IF UPDATING THEN
        IF (:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSummaries','Name', :old."Name", :new."Name",:new."IpAddress");
        END IF;
        IF (:old."CampaignId" != :new."CampaignId") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSummaries','CampaignId', :old."CampaignId", :new."CampaignId",:new."IpAddress");
        END IF;
        IF (:old."ShippingToCountryId" != :new."ShippingToCountryId") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSummaries','ShippingToCountryId', :old."ShippingToCountryId", :new."ShippingToCountryId",:new."IpAddress");
        END IF;
        IF (:old."CultureId" != :new."CultureId") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSummaries','CultureId', :old."CultureId", :new."CultureId",:new."IpAddress");
        END IF;
        IF (:old."IsForSignatureOrders" != :new."IsForSignatureOrders") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSummaries','IsForSignatureOrders', :old."IsForSignatureOrders", :new."IsForSignatureOrders",:new."IpAddress");
        END IF;
        IF (:old."IsForComponents" != :new."IsForComponents") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'PricingSummaries','IsForComponents', :old."IsForComponents", :new."IsForComponents",:new."IpAddress");
        END IF;
    END IF;

END;



/