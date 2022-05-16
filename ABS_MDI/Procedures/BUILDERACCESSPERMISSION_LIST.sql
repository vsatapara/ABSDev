CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSPERMISSION_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
        SELECT 
           "BuilderAccessPermissionId",
           "GroupName",
           "IsActive",
           "PredefineTemplateId",
           "IsInternal",
           "IsExternal",
           "ProjectBuildingType",
           "IpAddress"            
        FROM
           "BuilderAccessPermission"
        WHERE  "IsDelete"='N';
END BUILDERACCESSPERMISSION_LIST;
/