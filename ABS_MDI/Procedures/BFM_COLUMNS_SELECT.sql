CREATE OR REPLACE PROCEDURE abs_mdi."BFM_COLUMNS_SELECT" 
(
    ColumnNumber IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "ColumnNumber",
            "BuildingNumber",
            "GroupNumber",
            "IntColType",
            "IntColRecess",
            "IntColHeaderType",
            "IntColMaxWebDepth"
         FROM "BFM_Columns"
         WHERE "ColumnNumber"=ColumnNumber;
END BFM_COLUMNS_SELECT;
/