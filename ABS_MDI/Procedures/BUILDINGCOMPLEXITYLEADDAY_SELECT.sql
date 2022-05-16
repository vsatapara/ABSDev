CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGCOMPLEXITYLEADDAY_SELECT" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT
        B."BuildingComplexityLeadDaysId",
        B."BuildingQuoteTypeId",
        B."ClassInput",
        B."ClassMasterId",
        C1."ItemText" as "BuildingQuoteTypeName",
        C2."ItemText" as "ClassName"
        FROM "BuildingComplexityLeadDay" B
        LEFT JOIN "TableOfTables" C1
        ON B."BuildingQuoteTypeId"=C1."Id"
        LEFT JOIN "TableOfTables" C2
        ON B."ClassMasterId"=C2."Id";
END BUILDINGCOMPLEXITYLEADDAY_SELECT;
/