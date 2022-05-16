CREATE OR REPLACE TRIGGER abs_mdi."Company_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."Company" 
FOR EACH ROW 
BEGIN    
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW."CompanyId" IS NULL THEN
      SELECT "Company_SEQ".NEXTVAL INTO :NEW."CompanyId" FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
    END IF;

    IF UPDATING THEN
        IF (:old."CompanyName" != :new."CompanyName") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Company','CompanyName', :old."CompanyName", :new."CompanyName",:new."IpAddress"); 
        END IF; 

        IF (:old."AdministratorEmail" != :new."AdministratorEmail") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Company','AdministratorEmail', :old."AdministratorEmail", :new."AdministratorEmail",:new."IpAddress"); 
        END IF;

        	IF (:old."IsActive"  != :new."IsActive") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'Company','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress"); 
        END IF; 

        IF (:old."ShippingPlantGroupFromParentId"  != :new."ShippingPlantGroupFromParentId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ShippingPlantGroupFromParentId', :old."ShippingPlantGroupFromParentId", :new."ShippingPlantGroupFromParentId",:new."IpAddress"); 
            END IF; 

        IF (:old."PricingSegmentFromParentId"  != :new."PricingSegmentFromParentId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','PricingSegmentFromParentId', :old."PricingSegmentFromParentId", :new."PricingSegmentFromParentId",:new."IpAddress"); 
            END IF; 

        IF (:old."ShippingZoneGroupFromParentId"  != :new."ShippingZoneGroupFromParentId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ShippingZoneGroupFromParentId', :old."ShippingZoneGroupFromParentId", :new."ShippingZoneGroupFromParentId",:new."IpAddress"); 
            END IF; 

        IF (:old."PermissionGroupFromParentId"  != :new."PermissionGroupFromParentId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','PermissionGroupFromParentId', :old."PermissionGroupFromParentId", :new."PermissionGroupFromParentId",:new."IpAddress"); 
            END IF; 

        IF (:old."IsNotStockedMessageForComponents"  != :new."IsNotStockedMessageForComponents") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsNotStockedMessageForComponents', :old."IsNotStockedMessageForComponents", :new."IsNotStockedMessageForComponents",:new."IpAddress"); 
            END IF; 

        IF (:old."IsNotAvailableMessageForComponents"  != :new."IsNotAvailableMessageForComponents") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsNotAvailableMessageForComponents', :old."IsNotAvailableMessageForComponents", :new."IsNotAvailableMessageForComponents",:new."IpAddress"); 
            END IF; 

        IF (:old."BuildingPhone"  != :new."BuildingPhone") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','BuildingPhone', :old."BuildingPhone", :new."BuildingPhone",:new."IpAddress"); 
            END IF; 

        IF (:old."ComponentPhone"  != :new."ComponentPhone") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ComponentPhone', :old."ComponentPhone", :new."ComponentPhone",:new."IpAddress"); 
            END IF; 

        IF (:old."BuildingPriceMultiplier"  != :new."BuildingPriceMultiplier") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','BuildingPriceMultiplier', :old."BuildingPriceMultiplier", :new."BuildingPriceMultiplier",:new."IpAddress"); 
            END IF; 

        IF (:old."ComponentPriceMultiplier"  != :new."ComponentPriceMultiplier") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ComponentPriceMultiplier', :old."ComponentPriceMultiplier", :new."ComponentPriceMultiplier",:new."IpAddress"); 
            END IF; 

        IF (:old."IsBasedInUsa"  != :new."IsBasedInUsa") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsBasedInUsa', :old."IsBasedInUsa", :new."IsBasedInUsa",:new."IpAddress"); 
            END IF; 

        IF (:old."IsNciBrand"  != :new."IsNciBrand") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsNciBrand', :old."IsNciBrand", :new."IsNciBrand",:new."IpAddress"); 
            END IF; 

        IF (:old."IsQuickQuoteAvailable"  != :new."IsQuickQuoteAvailable") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsQuickQuoteAvailable', :old."IsQuickQuoteAvailable", :new."IsQuickQuoteAvailable",:new."IpAddress"); 
            END IF; 

        IF (:old."MailServerHost"  != :new."MailServerHost") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','MailServerHost', :old."MailServerHost", :new."MailServerHost",:new."IpAddress"); 
            END IF; 

        IF (:old."MailServerPort"  != :new."MailServerPort") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','MailServerPort', :old."MailServerPort", :new."MailServerPort",:new."IpAddress"); 
            END IF; 

        IF (:old."MailServerIsAuthenticationRequired"  != :new."MailServerIsAuthenticationRequired") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','MailServerIsAuthenticationRequired', :old."MailServerIsAuthenticationRequired", :new."MailServerIsAuthenticationRequired",:new."IpAddress"); 
            END IF; 

        IF (:old."MailServerUserName"  != :new."MailServerUserName") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','MailServerUserName', :old."MailServerUserName", :new."MailServerUserName",:new."IpAddress"); 
            END IF; 

        IF (:old."MailServerPassword"  != :new."MailServerPassword") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','MailServerPassword', :old."MailServerPassword", :new."MailServerPassword",:new."IpAddress"); 
            END IF; 

        IF (:old."ReplyToAddress"  != :new."ReplyToAddress") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ReplyToAddress', :old."ReplyToAddress", :new."ReplyToAddress",:new."IpAddress"); 
            END IF; 

        IF (:old."ExpressDeliveryPrice"  != :new."ExpressDeliveryPrice") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ExpressDeliveryPrice', :old."ExpressDeliveryPrice", :new."ExpressDeliveryPrice",:new."IpAddress"); 
            END IF; 

        IF (:old."WetStampFee"  != :new."WetStampFee") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','WetStampFee', :old."WetStampFee", :new."WetStampFee",:new."IpAddress"); 
            END IF; 

        IF (:old."IsAllowedChildCompanies"  != :new."IsAllowedChildCompanies") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsAllowedChildCompanies', :old."IsAllowedChildCompanies", :new."IsAllowedChildCompanies",:new."IpAddress"); 
            END IF; 

        IF (:old."ComponentsShippingGroupId"  != :new."ComponentsShippingGroupId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ComponentsShippingGroupId', :old."ComponentsShippingGroupId", :new."ComponentsShippingGroupId",:new."IpAddress"); 
            END IF; 

        IF (:old."ComponentsPricingSegmentId"  != :new."ComponentsPricingSegmentId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ComponentsPricingSegmentId', :old."ComponentsPricingSegmentId", :new."ComponentsPricingSegmentId",:new."IpAddress"); 
            END IF; 

        IF (:old."ComponentsIncExcGeoRegionGroupId" != :new."ComponentsIncExcGeoRegionGroupId") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','ComponentsIncExcGeoRegionGroupId', :old."ComponentsIncExcGeoRegionGroupId", :new."ComponentsIncExcGeoRegionGroupId",:new."IpAddress"); 
            END IF; 

        IF (:old."IsDelete" != :new."IsDelete") 
            THEN
                "HistoryEventsOP"(:new."ModifiedBy",'Company','IsDelete', :old."IsDelete", :new."IsDelete",:new."IpAddress"); 
            END IF; 

    END IF; 
END;



/