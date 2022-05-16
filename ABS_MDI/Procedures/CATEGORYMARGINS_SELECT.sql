CREATE OR REPLACE PROCEDURE abs_mdi."CATEGORYMARGINS_SELECT" 
(
    CategoryMarginId IN NUMBER,
    OUTPUT_CATEGORYMARGINS_DATA OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN OUTPUT_CATEGORYMARGINS_DATA FOR
  SELECT 
    "CategoryMarginId",
    "TableOfTables"."Id" as "CategoryId",
    "TableOfTables"."ItemText" as "CategoryName",
    "AmountForBuilding",
    "MultiplierForBuilding",
    "AmountForComponents",
    "MultiplierForComponents",
    "IsBuyout",
    "IsPurchased"
FROM "CategoryMargins","TableOfTables"
where "TableOfTables"."Id"="CategoryMargins"."CategoryId" and "CategoryMargins"."CategoryMarginId"=CategoryMarginId;
END Categorymargins_Select;
/