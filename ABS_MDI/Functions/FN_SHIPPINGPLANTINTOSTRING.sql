CREATE OR REPLACE FUNCTION abs_mdi."FN_SHIPPINGPLANTINTOSTRING" 
(
    ShippingGroupID number
)
RETURN VARCHAR2
IS 
    TotalShippingPlant VARCHAR2(5000);
BEGIN
    SELECT SUBSTR (SYS_CONNECT_BY_PATH ("Name", '  '), 2) INTO TotalShippingPlant
          FROM (SELECT "Name" , ROW_NUMBER () OVER (ORDER BY "Name" ) rn,
                       COUNT (*) OVER () cnt
                  FROM "ShippingPlants","ShippingPlantGrouping"
                  where "ShippingGroupID" = ShippingGroupID and "ShippingPlantID"="ShippingPlantId")
         WHERE rn = cnt
    START WITH rn = 1
    CONNECT BY rn = PRIOR rn + 1;

    return TotalShippingPlant;
END FN_SHIPPINGPLANTINTOSTRING;
/