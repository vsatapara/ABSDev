CREATE OR REPLACE PROCEDURE abs_mdi."BFM_FRAMES_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_FRAME_GROUP OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_LINE   OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_MODULE OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_INTERIORCOLUMN OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_FRAME_GROUP FOR SELECT
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
OPEN OUTPUT_FRAME_LINE FOR SELECT
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
    "FrameLineNumber",
    "DesignGroupNumber"
FROM
    "BFM_FrameLines"
     WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                 )
                 AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
OPEN OUTPUT_FRAME_MODULE FOR SELECT
    "ModuleId",
    "BuildingNumber",
    "GroupNumber",
    "Width",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted",
    "ProjectId",
    "ModuleNumber"
FROM
    "BFM_Modules"
    WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
OPEN OUTPUT_FRAME_INTERIORCOLUMN FOR SELECT
    "ColumnId",
    "BuildingNumber",
    "GroupNumber",
    "IntColType",
    "IntColRecess",
    "IntColHeaderType",
    "IntColMaxWebDepth",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted",
    "ProjectId",
    "IntColBaseType",
    "ColumnNumber",
    "BracedBays"
FROM
    "BFM_Columns"
                WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/