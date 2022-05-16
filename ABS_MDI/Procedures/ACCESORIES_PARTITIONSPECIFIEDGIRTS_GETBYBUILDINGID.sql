CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_PARTITIONSPECIFIEDGIRTS_GETBYBUILDINGID" 
(
    BuildingNumber IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "PartitionsSpecifiedGirtsId",
    "ProjectId",
    "BuildingNumber",
    "PartitionNumber",
    "SpacingNumber",
    "Spacing"
FROM
    "EDSPrice_I_PartitionsSpecifiedGirts"
     WHERE 
     "BuildingNumber" in
    (
            SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
            connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
    )
    AND NVL("IsDeleted",'N') != 'Y';
END ACCESORIES_PARTITIONSPECIFIEDGIRTS_GETBYBUILDINGID;
/