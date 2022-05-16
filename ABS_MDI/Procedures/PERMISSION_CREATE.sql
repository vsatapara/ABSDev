CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSION_CREATE" 
(
    PermissionGrpName IN VARCHAR2,
    IsActive IN CHAR,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    OutputId OUT NUMBER
) AS 
BEGIN
 INSERT INTO "Permission"
     (
        "PermissionGrpName",
        "IsActive",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        PermissionGrpName,
        IsActive,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "PermissionId" into OutputId;
END PERMISSION_CREATE;
/