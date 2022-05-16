CREATE OR REPLACE PROCEDURE abs_mdi."POINTLOADS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "PointLoadId",
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
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted"
FROM
    "PointLoads"
     WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/