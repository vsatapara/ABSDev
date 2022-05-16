CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PARAPET_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "ParapetId",
    "ProjectId",
    "BuildingInformationId",
    "Elevation",
    "StartColumn",
    "StopColumn",
    "DistFromLeftCorner",
    "Height",
    "IsPriced",
    "Weight",
    "Price",
    "WeightMBCI",
    "PriceMBCI",
    "StructuralWeight",
    "IsInsulated",
    "DesignIndex",
    "FrontSquareFeet",
    "BackSquareFeet",
    "ErrorCode"     
FROM
    "Accessories_Parapet"
WHERE
                "BuildingInformationId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';
END;
/