CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUP_UPDATE" 
(
    PermissionGroupId IN NUMBER,
    PermissionGroupName IN VARCHAR2,
    IsActive IN CHAR,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
    UPDATE "PermissionGroup" SET
		"PermissionGroupName" = PermissionGroupName,
        "IsActive" = IsActive,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE "PermissionGroupId" = PermissionGroupId;   
END PERMISSIONGROUP_UPDATE;
/