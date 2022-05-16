CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGQUOTEVARIBALE_TRANS" 
(
    BuildingQuoteVariableId IN NUMBER,
    DefaultPurlinPeakSpace IN NUMBER,
    DefaultPurlinMaxSpace IN NUMBER,
    DefaultPurlinGirtLocation IN NUMBER,
    DefaultPurlinLowGirtLocation IN NUMBER,
    DefaultBearingFrameSetback IN NUMBER,
    DefaultMainFrameSetback IN NUMBER,
    IsActive IN CHAR,
    FramedOpeningClearanceTop IN NUMBER,
    FramedOpeningClearanceBottom IN NUMBER,
    FramedOpeningClearanceSides IN NUMBER,
    FramedOpeningSideClearenceForMainFrameEndwalls IN NUMBER,
    TopClearenceForMainFrameEndwallsForFramedOpening IN NUMBER,
    FramedOpeningSideClearanceForBearingFrameEndwalls IN NUMBER,
    FramedOpeningTopClearanceForBearingFrameEndwalls IN NUMBER,
    MinValueForEndwallBSpecialSetback IN NUMBER,
    MaxValueForEndwallBSpecialSetback IN NUMBER,
    MinValueForEndwallDSpecialSetback IN NUMBER,
    MaxValueForEndwallDSpecialSetback IN NUMBER,
    TopClearenceForMainFrameEndwallsForDbciDoor IN NUMBER,
    DbciDoorClearanceTop IN NUMBER,
    DbciDoorClearanceBottom IN NUMBER,
    DbciDoorClearanceSides IN NUMBER,
    DbciDoorTopClearanceForBearingFrameEndwalls IN NUMBER,
    DBCIDoorSideClearanceMainFrame IN NUMBER,
    DBCIDoorSideClearanceBearingFrame IN NUMBER,
    PortalFrameColumnDepth IN NUMBER,
    PortalFrameBeamDepth IN NUMBER,
    FerryFee IN NUMBER,
    ThreeWeekFee IN NUMBER,
    NumberOfItemsPerPage IN NUMBER,
    AgoraPurchaseOrderVersion IN VARCHAR2,
    ComponentPurchaseOrderVersion IN VARCHAR2,
    ComponentPricingVersion IN VARCHAR2,
    BuildingPricingVersionNumber IN VARCHAR2,
    FurthestShippingDaysForComponent IN NUMBER,
    FurthestShippingDaysBuilding IN NUMBER,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
varTmp NUMBER:=0;
BEGIN
 SELECT (SELECT count(*) FROM "BuildingQuoteVariable") INTO varTmp FROM dual;
  IF (varTmp = 0) 
  THEN
        INSERT INTO "BuildingQuoteVariable" 
        (
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
            "FurthestShippingDaysBuilding",
            "IsDelete",
            "CreatedBy",
            "CreatedDate",
            "IpAddress"
        ) VALUES 
        (
            DefaultPurlinPeakSpace,
            DefaultPurlinMaxSpace,
            DefaultPurlinGirtLocation,
            DefaultPurlinLowGirtLocation,
            DefaultBearingFrameSetback,
            DefaultMainFrameSetback,
            IsActive,
            FramedOpeningClearanceTop,
            FramedOpeningClearanceBottom,
            FramedOpeningClearanceSides,
            FramedOpeningSideClearenceForMainFrameEndwalls,
            TopClearenceForMainFrameEndwallsForFramedOpening,
            FramedOpeningSideClearanceForBearingFrameEndwalls,
            FramedOpeningTopClearanceForBearingFrameEndwalls,
            MinValueForEndwallBSpecialSetback,
            MaxValueForEndwallBSpecialSetback,
            MinValueForEndwallDSpecialSetback,
            MaxValueForEndwallDSpecialSetback,
            TopClearenceForMainFrameEndwallsForDbciDoor,
            DbciDoorClearanceTop,
            DbciDoorClearanceBottom,
            DbciDoorClearanceSides,
            DbciDoorTopClearanceForBearingFrameEndwalls,
            DBCIDoorSideClearanceMainFrame,
            DBCIDoorSideClearanceBearingFrame,
            PortalFrameColumnDepth,
            PortalFrameBeamDepth,
            FerryFee,
            ThreeWeekFee,
            NumberOfItemsPerPage,
            AgoraPurchaseOrderVersion,
            ComponentPurchaseOrderVersion,
            ComponentPricingVersion,
            BuildingPricingVersionNumber,
            FurthestShippingDaysForComponent,
            FurthestShippingDaysBuilding,
            'N',
            CreatedBy,
            CURRENT_TIMESTAMP,
            IpAddress 
        )
        RETURNING "BuildingQuoteVariableId" into OutputId;
  ELSE
        UPDATE "BuildingQuoteVariable" SET
            "DefaultPurlinPeakSpace" = DefaultPurlinPeakSpace,
            "DefaultPurlinMaxSpace" = DefaultPurlinMaxSpace,
            "DefaultPurlinGirtLocation" = DefaultPurlinGirtLocation,
            "DefaultPurlinLowGirtLocation" = DefaultPurlinLowGirtLocation,
            "DefaultBearingFrameSetback" = DefaultBearingFrameSetback,
            "DefaultMainFrameSetback" = DefaultMainFrameSetback,
            "FramedOpeningClearanceTop" = FramedOpeningClearanceTop,
            "FramedOpeningClearanceBottom" = FramedOpeningClearanceBottom,
            "FramedOpeningClearanceSides" = FramedOpeningClearanceSides,
            "FramedOpeningSideClearenceForMainFrameEndwalls" = FramedOpeningSideClearenceForMainFrameEndwalls,
            "TopClearenceForMainFrameEndwallsForFramedOpening" = TopClearenceForMainFrameEndwallsForFramedOpening,
            "FramedOpeningSideClearanceForBearingFrameEndwalls" = FramedOpeningSideClearanceForBearingFrameEndwalls,
            "FramedOpeningTopClearanceForBearingFrameEndwalls" = FramedOpeningTopClearanceForBearingFrameEndwalls,
            "MinValueForEndwallBSpecialSetback" = MinValueForEndwallBSpecialSetback,
            "MaxValueForEndwallBSpecialSetback" = MaxValueForEndwallBSpecialSetback,
            "MinValueForEndwallDSpecialSetback" = MinValueForEndwallDSpecialSetback,
            "MaxValueForEndwallDSpecialSetback" = MaxValueForEndwallDSpecialSetback,
            "TopClearenceForMainFrameEndwallsForDbciDoor" = TopClearenceForMainFrameEndwallsForDbciDoor,
            "DbciDoorClearanceTop" = DbciDoorClearanceTop,
            "DbciDoorClearanceBottom" = DbciDoorClearanceBottom,
            "DbciDoorClearanceSides" = DbciDoorClearanceSides,
            "DbciDoorTopClearanceForBearingFrameEndwalls" = DbciDoorTopClearanceForBearingFrameEndwalls,
            "DBCIDoorSideClearanceMainFrame" = DBCIDoorSideClearanceMainFrame,
            "DBCIDoorSideClearanceBearingFrame" = DBCIDoorSideClearanceBearingFrame,
            "PortalFrameColumnDepth" = PortalFrameColumnDepth,
            "PortalFrameBeamDepth" = PortalFrameBeamDepth,
            "FerryFee" = FerryFee,
            "ThreeWeekFee" = ThreeWeekFee,
            "NumberOfItemsPerPage" = NumberOfItemsPerPage,
            "AgoraPurchaseOrderVersion" = AgoraPurchaseOrderVersion,
            "ComponentPurchaseOrderVersion" = ComponentPurchaseOrderVersion,
            "ComponentPricingVersion" = ComponentPricingVersion,
            "BuildingPricingVersionNumber" = BuildingPricingVersionNumber,
            "FurthestShippingDaysForComponent" = FurthestShippingDaysForComponent,
            "FurthestShippingDaysBuilding" = FurthestShippingDaysBuilding,
            "ModifiedBy" = CreatedBy,
            "IsActive" = IsActive,
            "ModifiedDate"=CURRENT_TIMESTAMP,
            "IpAddress"=IpAddress
            
         RETURNING "BuildingQuoteVariableId" into OutputId;
  END IF;
  
END BUILDINGQUOTEVARIBALE_TRANS;
/