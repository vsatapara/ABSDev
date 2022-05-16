CREATE OR REPLACE PROCEDURE abs_mdi."CATEGORYMARGINS_LIST" 
(OUTPUT_CATEGORYMARGINS OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN OUTPUT_CATEGORYMARGINS FOR 
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
FROM "CategoryMargins"
RIGHT OUTER JOIN "TableOfTables" on "CategoryMargins"."CategoryId"="TableOfTables"."Id" 
WHERE "TableOfTables"."Category"='Category';
END Categorymargins_List;
/