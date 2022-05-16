CREATE OR REPLACE PROCEDURE abs_mdi."BFM_FRAMELINES_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "FrameLineId",
    "BuildingNumber",
    "GroupNumber",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted",
    "ProjectId",
    "FrameLineNumber"
FROM
    "BFM_FrameLines"
     WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                 )
                 AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/