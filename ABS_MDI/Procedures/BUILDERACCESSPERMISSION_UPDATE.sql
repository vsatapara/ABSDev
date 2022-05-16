CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSPERMISSION_UPDATE" 
(
    BuilderAccessPermissionId IN NUMBER,
    GroupName IN VARCHAR2,
    IsActive IN CHAR,
    PredefineTemplateId IN NUMBER,
    IpAddress IN VARCHAR2,
    UserId IN NUMBER,
    IsInternal IN	CHAR,
    IsExternal IN	CHAR,
    ProjectBuildingType IN NUMBER DEFAULT 2
)
AS 
BEGIN
    UPDATE "BuilderAccessPermission" SET
    
        "GroupName" = GroupName,
        "IsActive" = IsActive,
        "PredefineTemplateId" = PredefineTemplateId,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "IsInternal" = IsInternal,
        "IsExternal" = IsExternal,
        "ProjectBuildingType"=ProjectBuildingType
    WHERE "BuilderAccessPermissionId"=BuilderAccessPermissionId;
END BUILDERACCESSPERMISSION_UPDATE;
/