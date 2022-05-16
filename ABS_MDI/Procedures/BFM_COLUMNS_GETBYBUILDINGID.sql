CREATE OR REPLACE PROCEDURE abs_mdi."BFM_COLUMNS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
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