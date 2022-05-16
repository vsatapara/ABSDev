CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_RUBBERPIPEFLASH_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "RubberPipeFlashId",
    "BuildingId",
    "ProjectId",
    "Quantity",
    "OutsideDiameter",
    "Type",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "Elevation",
    "BayNumber",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "DistFromWall"
FROM
    "Accessories_RubberPipeFlash"
WHERE
                "BuildingId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';
END;
/