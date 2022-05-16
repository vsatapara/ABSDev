CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_LOUVERS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "LouverId",
    "ProjectId",
    "BuildingId",
    "Quantity",
    "Elevation",
    "BayNumber",
    "SillHeight",
    "HeaderHeight",
    "Width",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "TrimColor",
    "LouverColor",
    "SubFraming",
    "Type",
    "LouverSize",
    "LocatedInLiner",
    "IncludeFramedOpening",
    "RunOfLouvers",
    "PartitionNumber",
    "BracedBay",
    "LouverColorValsparCode",
    "LouverColorSpecialName",
    "IpAddress",
    "IsDelete",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "TrimColorValsparCode",
    "TrimColorSpecialName",
    "Quality",
    "WallExhausterPowerSource",
    "LouverWeight",
    "LouverPrice",
    "WallExhausterWeight",
    "WallExhausterPrice",
    "LouverIsPriced",
    "LouverErrorCode",
    "WallExhausterIsPriced",
    "WallExhausterErrorCode"
FROM
    "Accessories_Louvers"
     WHERE
                "BuildingId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';
END;
/