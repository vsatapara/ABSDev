CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGGROUP_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
        "ShippingGroupId",
        "Name",
        "IsForComponents",
        "IsActive",
        FN_SHIPPINGPLANTINTOSTRING("ShippingGroupId") as Plants
      FROM "ShippingGroup" where "IsDelete"='N';
END SHIPPINGGROUP_LIST;
/