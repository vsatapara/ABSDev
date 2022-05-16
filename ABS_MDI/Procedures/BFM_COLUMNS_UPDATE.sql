CREATE OR REPLACE PROCEDURE abs_mdi."BFM_COLUMNS_UPDATE" 
(
    ColumnNumber IN NUMBER,
    BuildingNumber IN NUMBER,
    GroupNumber IN VARCHAR2,
    IntColType IN Float,
    IntColRecess IN VARCHAR2,
    IntColHeaderType IN VARCHAR2,
    IntColMaxWebDepth IN Float,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "BFM_Columns" SET
        "ColumnNumber"=ColumnNumber,
        "BuildingNumber"=BuildingNumber,
        "GroupNumber"=GroupNumber,
        "IntColType"=IntColType,
        "IntColRecess"=IntColRecess,
        "IntColHeaderType"=IntColHeaderType,
        "IntColMaxWebDepth"=IntColMaxWebDepth,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "ColumnNumber"=ColumnNumber;
    
END BFM_COLUMNS_UPDATE;
/