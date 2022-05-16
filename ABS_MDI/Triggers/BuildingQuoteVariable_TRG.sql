CREATE OR REPLACE TRIGGER abs_mdi."BuildingQuoteVariable_TRG" 
BEFORE INSERT OR UPDATE ON abs_mdi."BuildingQuoteVariable" 
FOR EACH ROW 
BEGIN
    IF INSERTING THEN
     <<COLUMN_SEQUENCES>>
          BEGIN
            IF INSERTING AND :NEW."BuildingQuoteVariableId" IS NULL THEN
              SELECT "BuildingQuoteVariable_SEQ".NEXTVAL INTO :NEW."BuildingQuoteVariableId" FROM SYS.DUAL;
            END IF;
          END COLUMN_SEQUENCES;
    END IF;
    IF UPDATING THEN
        IF(:old."DefaultPurlinPeakSpace" != :new."DefaultPurlinPeakSpace")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DefaultPurlinPeakSpace', :old."DefaultPurlinPeakSpace", :new."DefaultPurlinPeakSpace",:new."IpAddress");
        END IF;
        IF(:old."DefaultPurlinMaxSpace" != :new."DefaultPurlinMaxSpace")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DefaultPurlinMaxSpace', :old."DefaultPurlinMaxSpace", :new."DefaultPurlinMaxSpace",:new."IpAddress");
        END IF;
        IF(:old."DefaultPurlinGirtLocation" != :new."DefaultPurlinGirtLocation")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DefaultPurlinGirtLocation', :old."DefaultPurlinGirtLocation", :new."DefaultPurlinGirtLocation",:new."IpAddress");
        END IF;
        IF(:old."DefaultPurlinLowGirtLocation" != :new."DefaultPurlinLowGirtLocation")
        THEN 
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DefaultPurlinLowGirtLocation', :old."DefaultPurlinLowGirtLocation", :new."DefaultPurlinLowGirtLocation",:new."IpAddress");
        END IF;
        IF(:old."DefaultBearingFrameSetback" != :new."DefaultBearingFrameSetback")
        THEN
            "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DefaultBearingFrameSetback', :old."DefaultBearingFrameSetback", :new."DefaultBearingFrameSetback",:new."IpAddress"); END IF;
        IF(:old."DefaultMainFrameSetback" != :new."DefaultMainFrameSetback")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DefaultMainFrameSetback', :old."DefaultMainFrameSetback", :new."DefaultMainFrameSetback",:new."IpAddress");
        END IF;
        IF(:old."IsActive" != :new."IsActive")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','IsActive', :old."IsActive", :new."IsActive",:new."IpAddress");
        END IF;
        IF(:old."FramedOpeningClearanceTop" != :new."FramedOpeningClearanceTop")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FramedOpeningClearanceTop', :old."FramedOpeningClearanceTop", :new."FramedOpeningClearanceTop",:new."IpAddress");
        END IF;
        IF(:old."FramedOpeningClearanceBottom" != :new."FramedOpeningClearanceBottom")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FramedOpeningClearanceBottom', :old."FramedOpeningClearanceBottom", :new."FramedOpeningClearanceBottom",:new."IpAddress");
        END IF;
        IF(:old."FramedOpeningClearanceSides" != :new."FramedOpeningClearanceSides")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FramedOpeningClearanceSides', :old."FramedOpeningClearanceSides", :new."FramedOpeningClearanceSides",:new."IpAddress");
        END IF;
        IF(:old."FramedOpeningSideClearenceForMainFrameEndwalls" != :new."FramedOpeningSideClearenceForMainFrameEndwalls")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FramedOpeningSideClearenceForMainFrameEndwalls', :old."FramedOpeningSideClearenceForMainFrameEndwalls", :new."FramedOpeningSideClearenceForMainFrameEndwalls",:new."IpAddress");
        END IF;
        IF(:old."TopClearenceForMainFrameEndwallsForFramedOpening" != :new."TopClearenceForMainFrameEndwallsForFramedOpening")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','TopClearenceForMainFrameEndwallsForFramedOpening', :old."TopClearenceForMainFrameEndwallsForFramedOpening", :new."TopClearenceForMainFrameEndwallsForFramedOpening",:new."IpAddress");
        END IF;
        IF(:old."FramedOpeningSideClearanceForBearingFrameEndwalls" != :new."FramedOpeningSideClearanceForBearingFrameEndwalls")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FramedOpeningSideClearanceForBearingFrameEndwalls', :old."FramedOpeningSideClearanceForBearingFrameEndwalls", :new."FramedOpeningSideClearanceForBearingFrameEndwalls",:new."IpAddress");
        END IF;
        IF(:old."FramedOpeningTopClearanceForBearingFrameEndwalls" != :new."FramedOpeningTopClearanceForBearingFrameEndwalls")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FramedOpeningTopClearanceForBearingFrameEndwalls', :old."FramedOpeningTopClearanceForBearingFrameEndwalls", :new."FramedOpeningTopClearanceForBearingFrameEndwalls",:new."IpAddress");
        END IF;
        IF(:old."MinValueForEndwallBSpecialSetback" != :new."MinValueForEndwallBSpecialSetback")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','MinValueForEndwallBSpecialSetback', :old."MinValueForEndwallBSpecialSetback", :new."MinValueForEndwallBSpecialSetback",:new."IpAddress");
        END IF;
        IF(:old."MaxValueForEndwallBSpecialSetback" != :new."MaxValueForEndwallBSpecialSetback")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','MaxValueForEndwallBSpecialSetback', :old."MaxValueForEndwallBSpecialSetback", :new."MaxValueForEndwallBSpecialSetback",:new."IpAddress");
        END IF;
        IF(:old."MinValueForEndwallDSpecialSetback" != :new."MinValueForEndwallDSpecialSetback")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','MinValueForEndwallDSpecialSetback', :old."MinValueForEndwallDSpecialSetback", :new."MinValueForEndwallDSpecialSetback",:new."IpAddress");
        END IF;
        IF(:old."MaxValueForEndwallDSpecialSetback" != :new."MaxValueForEndwallDSpecialSetback")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','MaxValueForEndwallDSpecialSetback', :old."MaxValueForEndwallDSpecialSetback", :new."MaxValueForEndwallDSpecialSetback",:new."IpAddress");
        END IF;
        IF(:old."TopClearenceForMainFrameEndwallsForDbciDoor" != :new."TopClearenceForMainFrameEndwallsForDbciDoor")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','TopClearenceForMainFrameEndwallsForDbciDoor', :old."TopClearenceForMainFrameEndwallsForDbciDoor", :new."TopClearenceForMainFrameEndwallsForDbciDoor",:new."IpAddress");
        END IF;
        IF(:old."DbciDoorClearanceTop" != :new."DbciDoorClearanceTop")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DbciDoorClearanceTop', :old."DbciDoorClearanceTop", :new."DbciDoorClearanceTop",:new."IpAddress");
        END IF;
        IF(:old."DbciDoorClearanceBottom" != :new."DbciDoorClearanceBottom")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DbciDoorClearanceBottom', :old."DbciDoorClearanceBottom", :new."DbciDoorClearanceBottom",:new."IpAddress");
        END IF;
        IF(:old."DbciDoorClearanceSides" != :new."DbciDoorClearanceSides")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DbciDoorClearanceSides', :old."DbciDoorClearanceSides", :new."DbciDoorClearanceSides",:new."IpAddress");
        END IF;
        IF(:old."DbciDoorTopClearanceForBearingFrameEndwalls" != :new."DbciDoorTopClearanceForBearingFrameEndwalls")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DbciDoorTopClearanceForBearingFrameEndwalls', :old."DbciDoorTopClearanceForBearingFrameEndwalls", :new."DbciDoorTopClearanceForBearingFrameEndwalls",:new."IpAddress");
        END IF;
        IF(:old."DBCIDoorSideClearanceMainFrame" != :new."DBCIDoorSideClearanceMainFrame")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DBCIDoorSideClearanceMainFrame', :old."DBCIDoorSideClearanceMainFrame", :new."DBCIDoorSideClearanceMainFrame",:new."IpAddress");
        END IF;
        IF(:old."DBCIDoorSideClearanceBearingFrame" != :new."DBCIDoorSideClearanceBearingFrame")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','DBCIDoorSideClearanceBearingFrame', :old."DBCIDoorSideClearanceBearingFrame", :new."DBCIDoorSideClearanceBearingFrame",:new."IpAddress");
        END IF;
        IF(:old."PortalFrameColumnDepth" != :new."PortalFrameColumnDepth")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','PortalFrameColumnDepth', :old."PortalFrameColumnDepth", :new."PortalFrameColumnDepth",:new."IpAddress");
        END IF;
        IF(:old."PortalFrameBeamDepth" != :new."PortalFrameBeamDepth")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','PortalFrameBeamDepth', :old."PortalFrameBeamDepth", :new."PortalFrameBeamDepth",:new."IpAddress");
        END IF;
        IF(:old."FerryFee" != :new."FerryFee")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FerryFee', :old."FerryFee", :new."FerryFee",:new."IpAddress");
        END IF;
        IF(:old."ThreeWeekFee" != :new."ThreeWeekFee")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','ThreeWeekFee', :old."ThreeWeekFee", :new."ThreeWeekFee",:new."IpAddress");
        END IF;
        IF(:old."NumberOfItemsPerPage" != :new."NumberOfItemsPerPage")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','NumberOfItemsPerPage', :old."NumberOfItemsPerPage", :new."NumberOfItemsPerPage",:new."IpAddress");
        END IF;
        IF(:old."AgoraPurchaseOrderVersion" != :new."AgoraPurchaseOrderVersion")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','AgoraPurchaseOrderVersion', :old."AgoraPurchaseOrderVersion", :new."AgoraPurchaseOrderVersion",:new."IpAddress");
        END IF;
        IF(:old."ComponentPurchaseOrderVersion" != :new."ComponentPurchaseOrderVersion")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','ComponentPurchaseOrderVersion', :old."ComponentPurchaseOrderVersion", :new."ComponentPurchaseOrderVersion",:new."IpAddress");
        END IF;
        IF(:old."ComponentPricingVersion" != :new."ComponentPricingVersion")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','ComponentPricingVersion', :old."ComponentPricingVersion", :new."ComponentPricingVersion",:new."IpAddress");
        END IF;
        IF(:old."BuildingPricingVersionNumber" != :new."BuildingPricingVersionNumber")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','BuildingPricingVersionNumber', :old."BuildingPricingVersionNumber", :new."BuildingPricingVersionNumber",:new."IpAddress");
        END IF;
        IF(:old."FurthestShippingDaysForComponent" != :new."FurthestShippingDaysForComponent")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FurthestShippingDaysForComponent', :old."FurthestShippingDaysForComponent", :new."FurthestShippingDaysForComponent",:new."IpAddress");
        END IF;
        IF(:old."FurthestShippingDaysBuilding" != :new."FurthestShippingDaysBuilding")
        THEN "HistoryEventsOP"(:new."ModifiedBy",'BuildingQuoteVariable','FurthestShippingDaysBuilding', :old."FurthestShippingDaysBuilding", :new."FurthestShippingDaysBuilding",:new."IpAddress");
        END IF;
    END IF;
END;

/