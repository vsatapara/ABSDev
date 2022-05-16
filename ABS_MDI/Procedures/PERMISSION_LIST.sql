CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSION_LIST" 
(
Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN Output_Data FOR 
  SELECT
    "PermissionId",
    "PermissionGrpName",
    "IsActive",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress"
FROM
    "Permission" 
    WHERE "Permission"."IsDelete"='N';
END PERMISSION_LIST;
/