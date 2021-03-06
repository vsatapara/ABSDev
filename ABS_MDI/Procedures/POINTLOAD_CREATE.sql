CREATE OR REPLACE PROCEDURE abs_mdi."POINTLOAD_CREATE" 
(
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
    UserId           IN      NUMBER,
    IpAddress           IN      VARCHAR2,
    OutputId            OUT     NUMBER
)
AS 
BEGIN
      INSERT INTO "PointLoads" (
        "ProjectId",
        "BuildingNumber",
        "BayNumber",
        "DistFromWall",
        "DistFromFrame",
        "Type",
        "Load",
        "Description",
        "UnitLocation",
        "InsideLength",
        "InsideWidth",
        "UnitDimension",
        "CutPurlins",
        "UnitLength",
        "UnitWidth",
        "UnitHeight",
        "NumBeams",
        "BeamByManufacturer",
        "Number",
        "IsCopy",
        "OverlapOverride",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDeleted"
     ) VALUES (
        ProjectId,
        BuildingNumber,
        BayNumber,
        DistFromWall,
        DistFromFrame,
        AppliedType,
        Loads,
        Descriptions,
        UnitLocation,
        InsideLength,
        InsideWidth,
        UnitDimension,
        CutPurlins,
        UnitLength,
        UnitWidth,
        UnitHeight,
        NumBeams,
        BeamByManufacturer,
        Numbers,
        IsCopy,
        OverlapOverride,
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N'
    ) RETURNING "PointLoadId" INTO OutputId;
END POINTLOAD_CREATE;
/