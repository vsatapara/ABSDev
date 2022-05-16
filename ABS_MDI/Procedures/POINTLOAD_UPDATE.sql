CREATE OR REPLACE PROCEDURE abs_mdi."POINTLOAD_UPDATE" (
    PointLoadId         IN      NUMBER,
    ProjectId           IN      NUMBER,
    BuildingNumber      IN      NUMBER,
    BayNumber           IN      NUMBER,
    DistFromWall        IN      NUMBER,
    DistFromFrame       IN      NUMBER,
    AppliedType         IN      VARCHAR2,
    Loads               IN      NUMBER,
    Descriptions        IN      VARCHAR2,
    UnitLocation        IN      VARCHAR2,
    InsideLength        IN      NUMBER,
    InsideWidth         IN      NUMBER,
    UnitDimension       IN      NUMBER,
    CutPurlins          IN      NUMBER,
    UnitLength          IN      NUMBER,
    UnitWidth           IN      NUMBER,
    UnitHeight          IN      NUMBER,
    NumBeams            IN      NUMBER,
    BeamByManufacturer  IN      NUMBER,
    Numbers             IN      NUMBER,
    IsCopy              IN      VARCHAR2,
    OverlapOverride     IN      VARCHAR2,
    UserId              IN      NUMBER,
    IpAddress           IN      VARCHAR2    
)
AS 
BEGIN
      UPDATE "PointLoads" 
      SET
        "ProjectId" = ProjectId,
        "BuildingNumber" = BuildingNumber,
        "BayNumber" = BayNumber,
        "DistFromWall" = DistFromWall,
        "DistFromFrame" = DistFromFrame,
        "Type" = AppliedType,
        "Load" = Loads,
        "Description" = Descriptions,
        "UnitLocation" = UnitLocation,
        "InsideLength" = InsideLength,
        "InsideWidth" = InsideWidth,
        "UnitDimension" = UnitDimension,
        "CutPurlins" = CutPurlins,
        "UnitLength" = UnitLength,
        "UnitWidth" = UnitWidth,
        "UnitHeight" = UnitHeight,
        "NumBeams" = NumBeams,
        "BeamByManufacturer" = BeamByManufacturer,
        "Number" = Numbers,
        "IsCopy" = IsCopy,
        "OverlapOverride" = OverlapOverride,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" =  IpAddress
     WHERE
        "PointLoadId" = PointLoadId
        AND "BuildingNumber" = BuildingNumber
        AND "ProjectId" = ProjectId;
                            
END POINTLOAD_UPDATE;
/