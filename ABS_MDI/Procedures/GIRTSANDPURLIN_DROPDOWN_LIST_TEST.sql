CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSANDPURLIN_DROPDOWN_LIST_TEST" 
(
    GirtsAndPurlinStyle_Data OUT SYS_REFCURSOR,
    GirtsDepth_Data OUT SYS_REFCURSOR,
    PurlinDepth_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN GirtsAndPurlinStyle_Data FOR SELECT 
        "StyleId" AS Id,
        "StyleName" AS Name
        FROM "GirtsAndPurlinStyle"
        ORDER BY Id;
OPEN GirtsDepth_Data FOR SELECT 
        "DepthId" AS Id,
        "DepthName" AS Name
        FROM "GirtsAndPurlinDepth"
        WHERE "IsForGirts" =1
        ORDER BY Id;
OPEN PurlinDepth_Data FOR SELECT 
        "DepthId" AS Id,
        "DepthName" AS Name
        FROM "GirtsAndPurlinDepth"
        ORDER BY Id;
    
    
END GirtsAndPurlin_DROPDOWN_LIST_Test;
/