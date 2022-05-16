CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUPNAME_EXIST" (
    PermissionId IN NUMBER,
    PermissionGroupName IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
) AS BEGIN
IF PermissionId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "Permission" WHERE (LOWER("PermissionGrpName") = LOWER(PermissionGroupName) and "IsDelete"='N');
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "Permission" WHERE (LOWER("PermissionGrpName") = LOWER(PermissionGroupName) and "IsDelete"='N') and "PermissionId" != PermissionId;
      
END IF;
END PERMISSIONGROUPNAME_EXIST;
/