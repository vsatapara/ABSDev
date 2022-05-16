CREATE OR REPLACE PROCEDURE abs_mdi."BFM_COLUMNS_CREATE" 
(
    BuildingNumber IN NUMBER,
    GroupNumber IN VARCHAR2,
    IntColType IN Float,
    IntColRecess IN VARCHAR2,
    IntColHeaderType IN VARCHAR2,
    IntColMaxWebDepth IN Float,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "BFM_Columns"
     (
        "BuildingNumber",
        "GroupNumber",
        "IntColType",
        "IntColRecess",
        "IntColHeaderType",
        "IntColMaxWebDepth",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        BuildingNumber,
        GroupNumber,
        IntColType,
        IntColRecess,
        IntColHeaderType,
        IntColMaxWebDepth,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "ColumnNumber" into OutputId;
     
END BFM_COLUMNS_CREATE;
/