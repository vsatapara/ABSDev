CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUP_CREATE" 
(
    PermissionGroupName IN VARCHAR2,
    IsActive IN CHAR,
    CreatedBy IN NUMBER,
	OutputId OUT NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
     INSERT INTO "PermissionGroup"
     (
        "PermissionGroupName",
        "IsActive",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        PermissionGroupName,
        IsActive,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
    )
    RETURNING "PermissionGroupId" into OutputId;
END PERMISSIONGROUP_CREATE;
/