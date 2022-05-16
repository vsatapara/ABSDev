CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_CRANES_UPDATE" (
/*   Created By    Meet Kaneriya    
     Created Date  08-11-2021
     Description   This stored Procedure used to Update Accesories_Cranes.
*/
    CraneId                                         IN NUMBER,
    ProjectId	                                    IN NUMBER,
    BuildingId	                                    IN NUMBER,
    StartFrameline	                                IN VARCHAR2,
    StopFrameLine	                                IN NUMBER,
    SType	                                        IN VARCHAR2,
    Control	                                        IN VARCHAR2,
    Quantity	                                    IN NUMBER,
    Tonnage1	                                    IN NUMBER,
    Tonnage2	                                    IN NUMBER,
    CraneClass	                                    IN VARCHAR2,
    Brackets	                                    IN CHAR,
    RunwayBeam	                                    IN CHAR,
    Rail	                                        IN CHAR,
    RoofSupportBeams	                            IN CHAR,
    SeperateSupportCol	                            IN CHAR,
    Stops	                                        IN CHAR,
    Bracing	                                        IN CHAR,
    NameBrand	                                    IN VARCHAR2,
    GirderType	                                    IN VARCHAR2,
    BridgeWeight1	                                IN NUMBER,
    BridgeWeight2	                                IN NUMBER,
    WheelSpacing1	                                IN NUMBER,
    WheelSpacing2	                                IN NUMBER,
    HoistWeight1	                                IN NUMBER,
    HoistWeight2	                                IN NUMBER,
    BracketLength	                                IN NUMBER,
    RunwayBeamSize	                                IN NUMBER,
    DistanceBetweenCranes	                        IN NUMBER,
    CenterlineOfRunwayBeamToSteelline	            IN NUMBER,
    CenterlineToCenterlineOfRails	                IN NUMBER,
    ColBaseToTopOfRail	                            IN NUMBER,
    ClearanceFromTopRailToBottomRafter	            IN NUMBER,
    ClearanceFromRailToInsideFlangeCol	            IN NUMBER,
    ManufacturerRailSize	                        IN NUMBER,
    TruckWheelDiameter	                            IN NUMBER,
    VerticalDeflection	                            IN NUMBER,
    HorizontalDeflection	                        IN NUMBER,
    FutureLineStart1	                            IN NUMBER,
    FutureLinestart2	                            IN NUMBER,
    DistanceToBack	                                IN NUMBER,
    SteelYield	                                    IN NUMBER,
    RailWeight	                                    IN NUMBER,
    CecoStandard	                                IN NUMBER,
    ModuleNumber	                                IN NUMBER,
    UsingMfgCraneData	                            IN NUMBER,
    AuxiliaryHoist1                                 IN NUMBER,
    AuxiliaryHoist2                                 IN NUMBER,
    TrolleyType                                     IN VARCHAR2,
    HoistType                                       IN VARCHAR2,
    UserAccept                                      IN NUMBER,
    MinimumHookDistance                             IN NUMBER,
    LeftOverhang1                                   IN NUMBER,
    LeftOverhang2                                   IN NUMBER,
    RightOverhang1                                  IN NUMBER,
    RightOverhang2                                  IN NUMBER,
    CraneNumber1                                    IN NUMBER,
    CraneNumber2                                    IN NUMBER,
    UserId                                          IN NUMBER DEFAULT NULL,
    IpAddress                                       IN VARCHAR2
) AS 
BEGIN
  UPDATE "Accessories_Cranes"
    SET
        "ProjectId" = ProjectId,
        "BuildingId" = BuildingId,
        "StartFrameline" = StartFrameline,
        "StopFrameLine" = StopFrameLine,
        "SType" = SType,
        "Control" = Control,
        "Quantity" = Quantity,
        "Tonnage1" = Tonnage1,
        "Tonnage2" = Tonnage2,
        "CraneClass" = CraneClass,
        "Brackets" = Brackets,
        "RunwayBeam" = RunwayBeam,
        "Rail" = Rail,
        "RoofSupportBeams" = RoofSupportBeams,
        "SeperateSupportCol" = SeperateSupportCol,
        "Stops" = Stops,
        "Bracing" = Bracing,
        "NameBrand" = NameBrand,
        "GirderType" = GirderType,
        "BridgeWeight1" = BridgeWeight1,
        "BridgeWeight2" = BridgeWeight2,
        "WheelSpacing1" = WheelSpacing1,
        "WheelSpacing2" = WheelSpacing2,
        "HoistWeight1" = HoistWeight1,
        "HoistWeight2" = HoistWeight2,
        "BracketLength" = BracketLength,
        "RunwayBeamSize" = RunwayBeamSize,
        "DistanceBetweenCranes" = DistanceBetweenCranes,
        "CenterlineOfRunwayBeamToSteelline" = CenterlineOfRunwayBeamToSteelline,
        "CenterlineToCenterlineOfRails" = CenterlineToCenterlineOfRails,
        "ColBaseToTopOfRail" = ColBaseToTopOfRail,
        "ClearanceFromTopRailToBottomRafter" = ClearanceFromTopRailToBottomRafter,
        "ClearanceFromRailToInsideFlangeCol" = ClearanceFromRailToInsideFlangeCol,
        "ManufacturerRailSize" = ManufacturerRailSize,
        "TruckWheelDiameter" = ManufacturerRailSize,
        "VerticalDeflection" = VerticalDeflection,
        "HorizontalDeflection" = HorizontalDeflection,
        "FutureLineStart1" = FutureLineStart1,
        "FutureLinestart2" = FutureLinestart2,
        "DistanceToBack" = DistanceToBack,
        "SteelYield" = SteelYield,
        "RailWeight" = RailWeight,
        "CecoStandard" = CecoStandard,
        "ModuleNumber" = ModuleNumber,
        "UsingMfgCraneData" = UsingMfgCraneData,
        "AuxiliaryHoist1" =  AuxiliaryHoist1,
        "AuxiliaryHoist2" = AuxiliaryHoist2,
        "TrolleyType" = TrolleyType,
        "HoistType" = HoistType,
        "UserAccept" = UserAccept,
        "MinimumHookDistance" = MinimumHookDistance,
        "LeftOverhang1" = LeftOverhang1,
        "LeftOverhang2" = LeftOverhang2,
        "RightOverhang1" = RightOverhang1,
        "RightOverhang2" = RightOverhang2,
        "CraneNumber1" = CraneNumber1,
        "CraneNumber2" = CraneNumber2,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "CraneId" = CraneId;
END ACCESORIES_CRANES_UPDATE;
/