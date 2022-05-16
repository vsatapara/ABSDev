CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPLANT_EXIST" 
(
    ShippingPlantId IN NUMBER,
    PlantCode IN VARCHAR2,
    Name IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF ShippingPlantId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "ShippingPlants" WHERE (LOWER("Name") = LOWER(Name) or LOWER("PlantCode") = LOWER(PlantCode));
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "ShippingPlants" WHERE (LOWER("Name") = LOWER(Name) or LOWER("PlantCode") = LOWER(PlantCode)) and "ShippingPlantId" != ShippingPlantId;
      
END IF;
END SHIPPINGPLANT_EXIST;
/