CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSPERMISSION_CREATE" 
(
    GroupName IN VARCHAR2,
    IsActive IN CHAR,
    PredefineTemplateId IN NUMBER,
    IpAddress IN VARCHAR2,
    IsInternal IN CHAR,
    IsExternal IN CHAR,
    UserId IN NUMBER,
    ProjectBuildingType IN NUMBER DEFAULT 2,
    OutputId OUT NUMBER
)AS 
BEGIN
  INSERT INTO "BuilderAccessPermission"
     (
        "GroupName",
        "IsActive",
        "PredefineTemplateId",
        "IpAddress",
        "CreatedBy",
        "CreatedDate",
        "IsInternal",
        "IsExternal",        
        "IsDelete",
        "ProjectBuildingType"
     )
     VALUES
     (
        GroupName,
        IsActive,
        PredefineTemplateId,
        IpAddress,
        UserId,
        CURRENT_TIMESTAMP,
        IsInternal,
        IsExternal,        
        'N',
        ProjectBuildingType
     )
     RETURNING "BuilderAccessPermissionId" into OutputId;
END BUILDERACCESSPERMISSION_CREATE;
/