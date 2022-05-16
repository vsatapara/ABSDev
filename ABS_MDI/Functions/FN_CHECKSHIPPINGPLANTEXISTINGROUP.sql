CREATE OR REPLACE FUNCTION abs_mdi."FN_CHECKSHIPPINGPLANTEXISTINGROUP" 
(
ShippingPlantId number,
ShippingGroupID number
--Function_Data OUT SYS_REFCURSOR
) 
RETURN NUMBER 
IS 
    TotalCount number;
BEGIN

    --OPEN Function_Data FOR
    SELECT count(*) into TotalCount FROM  "ShippingPlantGrouping" 
    where "ShippingGroupID" = ShippingGroupID and "ShippingPlantID"=ShippingPlantId; 

return TotalCount;    

END FN_CHECKSHIPPINGPLANTEXISTINGROUP;
/