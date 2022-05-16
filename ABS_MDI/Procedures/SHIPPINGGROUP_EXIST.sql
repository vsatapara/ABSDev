CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGGROUP_EXIST" 
(
    ShippingGroupId IN NUMBER,
    Name IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF ShippingGroupId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "ShippingGroup" WHERE LOWER("Name") = LOWER(Name) and ("IsDelete"='N' or "IsDelete" is null);
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "ShippingGroup" WHERE LOWER("Name") = LOWER(Name) and "ShippingGroupId" != ShippingGroupId and ("IsDelete"='N' or "IsDelete" is null);
END IF;
END SHIPPINGGROUP_EXIST;
/