CREATE OR REPLACE PROCEDURE abs_mdi."GETSHIPPINGTOCOUNTRY_SELECT" 
(
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN Output_Data FOR 
SELECT
    spts."CountriesToShipId",
    spts."ShippingPlantId",
    tot."Id" As CountryId,
    tot."ItemText" AS CountryName
FROM
    "ShipPlantCountriesToShip"  spts
Left join 
    "TableOfTables"  tot
    On spts."CountryId" = tot."Id"
Where tot."Category" = 'Country';
    END GETSHIPPINGTOCOUNTRY_SELECT;
/