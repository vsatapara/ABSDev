CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUPNAMEEXIST_SELECT" 
(
    PermissionGroupName IN NVARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT "PermissionGroupName"
	FROM "PermissionGroup"
    WHERE "PermissionGroupName" = PermissionGroupName;
END PERMISSIONGROUPNAMEEXIST_SELECT;
/