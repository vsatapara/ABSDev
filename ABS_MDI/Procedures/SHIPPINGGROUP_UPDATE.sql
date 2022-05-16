CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGGROUP_UPDATE" 
(
    ShippingGroupId IN NUMBER,
    Name IN VARCHAR2,
    IsForComponents IN CHAR,
    IsActive IN CHAR,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
  UPDATE "ShippingGroup" SET
    "Name"=Name, 
    "IsForComponents"=IsForComponents, 
    "IsActive"=IsActive, 
    "ModifiedBy"=UserId, 
    "ModifiedDate"=CURRENT_TIMESTAMP,
    "IpAddress"=IpAddress
  WHERE "ShippingGroupId"=ShippingGroupId;
END SHIPPINGGROUP_UPDATE;
/