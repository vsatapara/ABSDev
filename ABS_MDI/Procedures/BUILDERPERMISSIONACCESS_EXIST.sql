CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERPERMISSIONACCESS_EXIST" 
(
BuilderAccessPermissionId IN NUMBER,
GroupName IN VARCHAR2,
output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 IF BuilderAccessPermissionId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "BuilderAccessPermission" WHERE  LOWER("GroupName") = LOWER(GroupName) and ("IsDelete"='N' or "IsDelete" is null);
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "BuilderAccessPermission" WHERE LOWER("GroupName") = LOWER(GroupName) and "BuilderAccessPermissionId" != BuilderAccessPermissionId and ("IsDelete"='N' or "IsDelete" is null);
END IF;
END BUILDERPERMISSIONACCESS_EXIST;
/