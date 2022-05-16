CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSPERMISSION_SELECT" 
(
    BuilderAccessPermissionId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "BuilderAccessPermissionId",
            "GroupName",
            "IsActive",
            "PredefineTemplateId",
            "IpAddress",
            "IsInternal",
            "IsExternal"
    FROM
    "BuilderAccessPermission"
    WHERE "BuilderAccessPermissionId"=BuilderAccessPermissionId;
END BUILDERACCESSPERMISSION_SELECT;
/