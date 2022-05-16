CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PARTITIONSPACING_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    Part."ProjectId",
    Part."BuildingNumber",
    Spacing."ModuleId",
    Spacing."PartitionId",
    Spacing."Width",
    Spacing."BayNumber"
FROM
    "Accesories_PartitionModuleSpacing" Spacing JOIN "Accesories_Partition" Part
    ON Spacing."PartitionId"=Part."PartitionId"
WHERE
                Part."BuildingNumber" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND ("IsDelete" IS NULL OR "IsDelete" != 'Y');
END;
/