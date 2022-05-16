CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTUSER_CREATE" 
     (
     FromUserId IN NUMBER,
     ProjectId IN NUMBER,
     CreatedBy IN NUMBER,
     IpAddress IN VARCHAR2
     )
AS 
BEGIN
INSERT INTO "ProjectUser" (
    "FromUserId",
    "ProjectId",
    "CreatedBy",
    "CreatedDate",
    "IpAddress"
) VALUES (
    FromUserId,
    ProjectId,
    CreatedBy,
    CURRENT_TIMESTAMP,
    IpAddress
);
END PROJECTUSER_CREATE;
/