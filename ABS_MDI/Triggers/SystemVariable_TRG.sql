CREATE OR REPLACE TRIGGER abs_mdi."SystemVariable_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."SystemVariable" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
      <<COLUMN_SEQUENCES>>
      BEGIN
        IF INSERTING AND :NEW."SystemVariableId" IS NULL THEN
          SELECT "SystemVariable_SEQ".NEXTVAL INTO :NEW."SystemVariableId" FROM SYS.DUAL;
        END IF;
      END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF (:old."MinimumPasswordLength" != :new."MinimumPasswordLength")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MinimumPasswordLength', :old."MinimumPasswordLength", :new."MinimumPasswordLength",:new."IpAddress");
        END IF;
        IF (:old."LoginConfirmationDays" != :new."LoginConfirmationDays") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','LoginConfirmationDays', :old."LoginConfirmationDays", :new."LoginConfirmationDays",:new."IpAddress");
        END IF; 
        IF (:old."PasswordResetConfirmationDays" != :new."PasswordResetConfirmationDays") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','PasswordResetConfirmationDays', :old."PasswordResetConfirmationDays", :new."PasswordResetConfirmationDays",:new."IpAddress");
        END IF;
        IF (:old."LoginRetries" != :new."LoginRetries") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','LoginRetries', :old."LoginRetries", :new."LoginRetries",:new."IpAddress");
        END IF;
        IF (:old."SessionTimeout" != :new."SessionTimeout") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','SessionTimeout', :old."SessionTimeout", :new."SessionTimeout",:new."IpAddress");
        END IF;
        IF (:old."MaximumAttachmentSize" != :new."MaximumAttachmentSize") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MaximumAttachmentSize', :old."MaximumAttachmentSize", :new."MaximumAttachmentSize",:new."IpAddress");
        END IF;
        IF (:old."AcceptableAttachmentTypes" != :new."AcceptableAttachmentTypes") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','AcceptableAttachmentTypes', :old."AcceptableAttachmentTypes", :new."AcceptableAttachmentTypes",:new."IpAddress");
        END IF;
        IF (:old."AcceptableLogoTypes" != :new."AcceptableLogoTypes") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','AcceptableLogoTypes', :old."AcceptableLogoTypes", :new."AcceptableLogoTypes",:new."IpAddress");
        END IF;
        IF (:old."SystemVersion" != :new."SystemVersion") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','SystemVersion', :old."SystemVersion", :new."SystemVersion",:new."IpAddress");
        END IF;
        IF (:old."CopyrightInformation" != :new."CopyrightInformation") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','CopyrightInformation', :old."CopyrightInformation", :new."CopyrightInformation",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageOrders" != :new."NoContentMessageOrders") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageOrders', :old."NoContentMessageOrders", :new."NoContentMessageOrders",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageLeads" != :new."NoContentMessageLeads") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageLeads', :old."NoContentMessageLeads", :new."NoContentMessageLeads",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageContacts" != :new."NoContentMessageContacts") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageContacts', :old."NoContentMessageContacts", :new."NoContentMessageContacts",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageUpcomingEvents" != :new."NoContentMessageUpcomingEvents") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageUpcomingEvents', :old."NoContentMessageUpcomingEvents", :new."NoContentMessageUpcomingEvents",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageFeatureAnnouncements" != :new."NoContentMessageFeatureAnnouncements") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageFeatureAnnouncements', :old."NoContentMessageFeatureAnnouncements", :new."NoContentMessageFeatureAnnouncements",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageBuilderNews" != :new."NoContentMessageBuilderNews") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageBuilderNews', :old."NoContentMessageBuilderNews", :new."NoContentMessageBuilderNews",:new."IpAddress");
        END IF;
        IF (:old."NoContentMessageJobBoard" != :new."NoContentMessageJobBoard") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NoContentMessageJobBoard', :old."NoContentMessageJobBoard", :new."NoContentMessageJobBoard",:new."IpAddress");
        END IF;
        IF (:old."DailyNotificationTimeUtc" != :new."DailyNotificationTimeUtc") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DailyNotificationTimeUtc', :old."DailyNotificationTimeUtc", :new."DailyNotificationTimeUtc",:new."IpAddress");
        END IF;
        IF (:old."WeeklyNotificationTimeUtc" != :new."WeeklyNotificationTimeUtc") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','WeeklyNotificationTimeUtc', :old."WeeklyNotificationTimeUtc", :new."WeeklyNotificationTimeUtc",:new."IpAddress");
        END IF;
        IF (:old."NotificationDayOfTheWeek" != :new."NotificationDayOfTheWeek") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NotificationDayOfTheWeek', :old."NotificationDayOfTheWeek", :new."NotificationDayOfTheWeek",:new."IpAddress");
        END IF;
        IF (:old."NotificationSliderSpeed" != :new."NotificationSliderSpeed") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NotificationSliderSpeed', :old."NotificationSliderSpeed", :new."NotificationSliderSpeed",:new."IpAddress");
        END IF;
        IF (:old."FurthestShippingDays" != :new."FurthestShippingDays") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FurthestShippingDays', :old."FurthestShippingDays", :new."FurthestShippingDays",:new."IpAddress");
        END IF;
        IF (:old."BuildingPricingVersionNumber" != :new."BuildingPricingVersionNumber") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','BuildingPricingVersionNumber', :old."BuildingPricingVersionNumber", :new."BuildingPricingVersionNumber",:new."IpAddress");
        END IF;
        IF (:old."ThrottlingThreshold" != :new."ThrottlingThreshold") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','ThrottlingThreshold', :old."ThrottlingThreshold", :new."ThrottlingThreshold",:new."IpAddress");
        END IF;
        IF (:old."ThrottlingDelay" != :new."ThrottlingDelay") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','ThrottlingDelay', :old."ThrottlingDelay", :new."ThrottlingDelay",:new."IpAddress");
        END IF; 
        IF (:old."FramedOpeningClearanceTop" != :new."FramedOpeningClearanceTop") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FramedOpeningClearanceTop', :old."FramedOpeningClearanceTop", :new."FramedOpeningClearanceTop",:new."IpAddress");
        END IF;
        IF (:old."FramedOpeningClearanceBottom" != :new."FramedOpeningClearanceBottom") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FramedOpeningClearanceBottom', :old."FramedOpeningClearanceBottom", :new."FramedOpeningClearanceBottom",:new."IpAddress");
        END IF;
        IF (:old."FramedOpeningClearanceSides" != :new."FramedOpeningClearanceSides") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FramedOpeningClearanceSides', :old."FramedOpeningClearanceSides", :new."FramedOpeningClearanceSides",:new."IpAddress");
        END IF; 
        IF (:old."TopClearenceForMainFrameEndwallsForFramedOpening" != :new."TopClearenceForMainFrameEndwallsForFramedOpening") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','TopClearenceForMainFrameEndwallsForFramedOpening', :old."TopClearenceForMainFrameEndwallsForFramedOpening", :new."TopClearenceForMainFrameEndwallsForFramedOpening",:new."IpAddress");
        END IF;
        IF (:old."FramedOpeningSideClearenceForMainFrameEndwalls" != :new."FramedOpeningSideClearenceForMainFrameEndwalls") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FramedOpeningSideClearenceForMainFrameEndwalls', :old."FramedOpeningSideClearenceForMainFrameEndwalls", :new."FramedOpeningSideClearenceForMainFrameEndwalls",:new."IpAddress");
        END IF;
        IF (:old."TopClearenceForMainFrameEndwallsForDbciDoor" != :new."TopClearenceForMainFrameEndwallsForDbciDoor") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','TopClearenceForMainFrameEndwallsForDbciDoor', :old."TopClearenceForMainFrameEndwallsForDbciDoor", :new."TopClearenceForMainFrameEndwallsForDbciDoor",:new."IpAddress");
        END IF; 
        IF (:old."DbciDoorClearanceTop" != :new."DbciDoorClearanceTop") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DbciDoorClearanceTop', :old."DbciDoorClearanceTop", :new."DbciDoorClearanceTop",:new."IpAddress");
        END IF;
        IF (:old."DbciDoorClearanceBottom" != :new."DbciDoorClearanceBottom") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DbciDoorClearanceBottom', :old."DbciDoorClearanceBottom", :new."DbciDoorClearanceBottom",:new."IpAddress");
        END IF;
        IF (:old."FramedOpeningTopClearanceForBearingFrameEndwalls" != :new."FramedOpeningTopClearanceForBearingFrameEndwalls") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FramedOpeningTopClearanceForBearingFrameEndwalls', :old."FramedOpeningTopClearanceForBearingFrameEndwalls", :new."FramedOpeningTopClearanceForBearingFrameEndwalls",:new."IpAddress");
        END IF; 
        IF (:old."DbciDoorClearanceSides" != :new."DbciDoorClearanceSides") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DbciDoorClearanceSides', :old."DbciDoorClearanceSides", :new."DbciDoorClearanceSides",:new."IpAddress");
        END IF;  
        IF (:old."PortalFrameColumnDepth" != :new."PortalFrameColumnDepth") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','PortalFrameColumnDepth', :old."PortalFrameColumnDepth", :new."PortalFrameColumnDepth",:new."IpAddress");
        END IF;
        IF (:old."PortalFrameBeamDepth" != :new."PortalFrameBeamDepth") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','PortalFrameBeamDepth', :old."PortalFrameBeamDepth", :new."PortalFrameBeamDepth",:new."IpAddress");
        END IF; 
        IF (:old."DbciDoorTopClearanceForBearingFrameEndwalls" != :new."DbciDoorTopClearanceForBearingFrameEndwalls") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DbciDoorTopClearanceForBearingFrameEndwalls', :old."DbciDoorTopClearanceForBearingFrameEndwalls", :new."DbciDoorTopClearanceForBearingFrameEndwalls",:new."IpAddress");
        END IF;
        IF (:old."FramedOpeningSideClearanceForBearingFrameEndwalls" != :new."FramedOpeningSideClearanceForBearingFrameEndwalls") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FramedOpeningSideClearanceForBearingFrameEndwalls', :old."FramedOpeningSideClearanceForBearingFrameEndwalls", :new."FramedOpeningSideClearanceForBearingFrameEndwalls",:new."IpAddress");
        END IF;
        IF (:old."MinValueForEndwallBSpecialSetback" != :new."MinValueForEndwallBSpecialSetback") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MinValueForEndwallBSpecialSetback', :old."MinValueForEndwallBSpecialSetback", :new."MinValueForEndwallBSpecialSetback",:new."IpAddress");
        END IF;
        IF (:old."MaxValueForEndwallBSpecialSetback" != :new."MaxValueForEndwallBSpecialSetback") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MaxValueForEndwallBSpecialSetback', :old."MaxValueForEndwallBSpecialSetback", :new."MaxValueForEndwallBSpecialSetback",:new."IpAddress");
        END IF;
        IF (:old."MinValueForEndwallDSpecialSetback" != :new."MinValueForEndwallDSpecialSetback") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MinValueForEndwallDSpecialSetback', :old."MinValueForEndwallDSpecialSetback", :new."MinValueForEndwallDSpecialSetback",:new."IpAddress");
        END IF;
        IF (:old."MinimumCanopySoffitElevation" != :new."MinimumCanopySoffitElevation") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MinimumCanopySoffitElevation', :old."MinimumCanopySoffitElevation", :new."MinimumCanopySoffitElevation",:new."IpAddress");
        END IF;
        IF (:old."ParapetMinimumDistanceAboveRoofLine" != :new."ParapetMinimumDistanceAboveRoofLine") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','ParapetMinimumDistanceAboveRoofLine', :old."ParapetMinimumDistanceAboveRoofLine", :new."ParapetMinimumDistanceAboveRoofLine",:new."IpAddress");
        END IF;
        IF (:old."MaximumVerticalClearanceRequirement" != :new."MaximumVerticalClearanceRequirement") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','MaximumVerticalClearanceRequirement', :old."MaximumVerticalClearanceRequirement", :new."MaximumVerticalClearanceRequirement",:new."IpAddress");
        END IF;  
        IF (:old."ThreeWeekFee" != :new."ThreeWeekFee") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','ThreeWeekFee', :old."ThreeWeekFee", :new."ThreeWeekFee",:new."IpAddress");
        END IF; 
        IF (:old."FerryFee" != :new."FerryFee") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FerryFee', :old."FerryFee", :new."FerryFee",:new."IpAddress");
        END IF; 
        IF (:old."DefaultMainFrameSetback" != :new."DefaultMainFrameSetback") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DefaultMainFrameSetback', :old."DefaultMainFrameSetback", :new."DefaultMainFrameSetback",:new."IpAddress");
        END IF; 
        IF (:old."NumberOfItemsPerPage" != :new."NumberOfItemsPerPage") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','NumberOfItemsPerPage', :old."NumberOfItemsPerPage", :new."NumberOfItemsPerPage",:new."IpAddress");
        END IF;  
        IF (:old."FurthestShippingDaysForComponent" != :new."FurthestShippingDaysForComponent") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FurthestShippingDaysForComponent', :old."FurthestShippingDaysForComponent", :new."FurthestShippingDaysForComponent",:new."IpAddress");
        END IF; 
        IF (:old."AgoraPurchaseOrderVersion" != :new."AgoraPurchaseOrderVersion") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','AgoraPurchaseOrderVersion', :old."AgoraPurchaseOrderVersion", :new."AgoraPurchaseOrderVersion",:new."IpAddress");
        END IF; 
        IF (:old."ComponentPurchaseOrderVersion" != :new."ComponentPurchaseOrderVersion") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','ComponentPurchaseOrderVersion', :old."ComponentPurchaseOrderVersion", :new."ComponentPurchaseOrderVersion",:new."IpAddress");
        END IF; 
        IF (:old."ComponentPricingVersion" != :new."ComponentPricingVersion") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','ComponentPricingVersion', :old."ComponentPricingVersion", :new."ComponentPricingVersion",:new."IpAddress");
        END IF;
        IF (:old."FurthestShippingDaysBuilding" != :new."FurthestShippingDaysBuilding") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','FurthestShippingDaysBuilding', :old."FurthestShippingDaysBuilding", :new."FurthestShippingDaysBuilding",:new."IpAddress");
        END IF;
        IF (:old."DBCIDoorSideClearanceMainFrame" != :new."DBCIDoorSideClearanceMainFrame") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DBCIDoorSideClearanceMainFrame', :old."DBCIDoorSideClearanceMainFrame", :new."DBCIDoorSideClearanceMainFrame",:new."IpAddress");
        END IF; 
        IF (:old."DBCIDoorSideClearanceBearingFrame" != :new."DBCIDoorSideClearanceBearingFrame") 
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'SystemVariable','DBCIDoorSideClearanceBearingFrame', :old."DBCIDoorSideClearanceBearingFrame", :new."DBCIDoorSideClearanceBearingFrame",:new."IpAddress");
        END IF;        
    END IF;    
END;



/