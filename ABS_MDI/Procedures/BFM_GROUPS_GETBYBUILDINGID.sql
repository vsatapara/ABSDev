CREATE OR REPLACE PROCEDURE abs_mdi."BFM_GROUPS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "GroupId",
    "BuildingNumber",
    "ColType1",
    "ColType2",
    "WebDepth1",
    "WebDepth2",
    "RafterDepth1",
    "RafterDepth2",
    "Clearspan",
    "IsElevation1",
    "IsElevation2",
    "Elevation1",
    "Elevation2",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted",
    "ProjectId",
    "GroupNumber",
    "HighStrengthWashers",
    "ExtColRecession1",
    "ExtColRecession2",
    "IsAdvanceColumn"
FROM
    "BFM_Groups"
                WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/