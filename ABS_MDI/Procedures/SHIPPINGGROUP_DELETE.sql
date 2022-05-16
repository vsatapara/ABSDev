CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGGROUP_DELETE" 
(
    ShippingGroupId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
  UPDATE "ShippingGroup" SET
    "IsDelete"='Y', 
    "ModifiedBy"=UserId, 
    "ModifiedDate"=CURRENT_TIMESTAMP
  WHERE "ShippingGroupId"=ShippingGroupId;
END SHIPPINGGROUP_DELETE;
/