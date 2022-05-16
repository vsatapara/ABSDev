CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGGROUP_SELECT" 
(
    ShippingGroupId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
         "ShippingGroupId",
        "Name",
        "IsForComponents",
        "IsActive"
      FROM "ShippingGroup"
      WHERE "ShippingGroupId"=ShippingGroupId;
END SHIPPINGGROUP_SELECT;
/