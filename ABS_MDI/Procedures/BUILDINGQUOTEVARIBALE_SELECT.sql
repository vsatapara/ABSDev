CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGQUOTEVARIBALE_SELECT" 
(
    OutPut_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN OutPut_Data FOR 
        SELECT
            "BuildingQuoteVariableId",
            "DefaultPurlinPeakSpace",
            "DefaultPurlinMaxSpace",
            "DefaultPurlinGirtLocation",
            "DefaultPurlinLowGirtLocation",
            "DefaultBearingFrameSetback",
            "DefaultMainFrameSetback",
            "IsActive",
            "FramedOpeningClearanceTop",
            "FramedOpeningClearanceBottom",
            "FramedOpeningClearanceSides",
            "FramedOpeningSideClearenceForMainFrameEndwalls",
            "TopClearenceForMainFrameEndwallsForFramedOpening",
            "FramedOpeningSideClearanceForBearingFrameEndwalls",
            "FramedOpeningTopClearanceForBearingFrameEndwalls",
            "MinValueForEndwallBSpecialSetback",
            "MaxValueForEndwallBSpecialSetback",
            "MinValueForEndwallDSpecialSetback",
            "MaxValueForEndwallDSpecialSetback",
            "TopClearenceForMainFrameEndwallsForDbciDoor",
            "DbciDoorClearanceTop",
            "DbciDoorClearanceBottom",
            "DbciDoorClearanceSides",
            "DbciDoorTopClearanceForBearingFrameEndwalls",
            "DBCIDoorSideClearanceMainFrame",
            "DBCIDoorSideClearanceBearingFrame",
            "PortalFrameColumnDepth",
            "PortalFrameBeamDepth",
            "FerryFee",
            "ThreeWeekFee",
            "NumberOfItemsPerPage",
            "AgoraPurchaseOrderVersion",
            "ComponentPurchaseOrderVersion",
            "ComponentPricingVersion",
            "BuildingPricingVersionNumber",
            "FurthestShippingDaysForComponent",
            "FurthestShippingDaysBuilding"
        FROM "BuildingQuoteVariable";
END BUILDINGQUOTEVARIBALE_SELECT;
/