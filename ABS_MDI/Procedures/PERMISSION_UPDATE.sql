CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSION_UPDATE" 
(
    PermissionId IN NUMBER,
    PermissionGrpName IN VARCHAR2,
    IsActive IN CHAR,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL
) AS 
BEGIN
 UPDATE "Permission" SET        
	"PermissionGrpName" = PermissionGrpName,
	"IsActive" = IsActive,
    "ModifiedBy"=ModifiedBy,
    "ModifiedDate"= CURRENT_TIMESTAMP,
    "IpAddress"=IpAddress
    WHERE 
        "PermissionId"=PermissionId; 
END PERMISSION_UPDATE;
/