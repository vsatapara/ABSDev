CREATE OR REPLACE PROCEDURE abs_mdi."CRANES_GETBYBUILDINGID" 
(
    BuildingId IN NUMBER,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
   "CraneId" as "Id",
    "ProjectId",
    "BuildingId",
    "StartFrameline",
    "StopFrameLine",
    "SType",
    "Control",
    "Quantity",
    "Tonnage1",
    "Tonnage2",
    "CraneClass",
    "Brackets",
    "RunwayBeam",
    "Rail",
    "RoofSupportBeams",
    "SeperateSupportCol",
    "Stops",
    "Bracing",
    "NameBrand",
    "GirderType",
    "BridgeWeight1",
    "BridgeWeight2",
    "WheelSpacing1",
    "WheelSpacing2",
    "HoistWeight1",
    "HoistWeight2",
    "BracketLength",
    "RunwayBeamSize",
    "DistanceBetweenCranes",
    "CenterlineOfRunwayBeamToSteelline",
    "CenterlineToCenterlineOfRails",
    "ColBaseToTopOfRail",
    "ClearanceFromTopRailToBottomRafter",
    "ClearanceFromRailToInsideFlangeCol",
    "ManufacturerRailSize",
    "TruckWheelDiameter",
    "VerticalDeflection",
    "HorizontalDeflection",
    "FutureLineStart1",
    "FutureLinestart2",
    "DistanceToBack",
    "SteelYield",
    "RailWeight",
    "CecoStandard",
    "ModuleNumber",
    "UsingMfgCraneData",
    "AuxiliaryHoist1",
    "AuxiliaryHoist2",
    "TrolleyType",
    "HoistType",
    "UserAccept",
    "MinimumHookDistance",
    "LeftOverhang1",
    "LeftOverhang2",
    "RightOverhang1",
    "RightOverhang2",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete",
    "CraneNumber1",
    "CraneNumber2"
FROM
    "Accessories_Cranes"
    WHERE "BuildingId"=BuildingId AND "IsDelete" != 'Y';
END;
/