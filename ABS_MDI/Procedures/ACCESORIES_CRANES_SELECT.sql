CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_CRANES_SELECT" 
(
/*   Created By    Meet Kaneriya    
     Created Date  08-11-2021
     Description   This stored Procedure used to Select Accesories_Cranes.
*/
     CraneId IN NUMBER,
     Cranes_Data  OUT  SYS_REFCURSOR
)AS 
BEGIN
   OPEN Cranes_Data FOR SELECT
                           "CraneId",
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
                           "CraneNumber1",
                           "CraneNumber2",
                           "CreatedBy",
                           "CreatedDate",
                           "ModifiedBy",
                           "ModifiedDate",
                           "IpAddress",
                           "IsDelete"
                           
                         FROM
                            "Accessories_Cranes"
                         WHERE
                                "CraneId" = CraneId ;
END ACCESORIES_CRANES_SELECT;
/