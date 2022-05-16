CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONBRAND_LIST" 
(
PermissionId IN NUMBER,
Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN Output_Data FOR 
  SELECT
    "PermissionBrandId",
    "PermissionId",
    "BrandId",
    "UserTypeId",
    "IsActive"
FROM
    "PermissionBrand"
    WHERE "PermissionId" = PermissionId;
END PERMISSIONBRAND_LIST;
/