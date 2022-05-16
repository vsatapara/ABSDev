CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGPOINTS_GET" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "ShippingPoint",
    "Plant",
    "PlantNumber",
    "Star",
    "Ceco",
    "Robertson",
    "MMA",
    "Mesco",
    "ANS",
    "Garco"
FROM
    "M_EDSPrice_ShippingPoints";
    --WHERE "IsDeleted" != 'Y';
END;
/