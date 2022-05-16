CREATE OR REPLACE PROCEDURE abs_mdi."REPORT_PROJECT_UPDATE" (
    ProjectId IN NUMBER,
    ReportPath IN   VARCHAR2,
    UserId       IN   VARCHAR2,
    IpAddress    IN  VARCHAR2
)
AS 
BEGIN
  UPDATE "Project"
    SET
        "ReportPath"=ReportPath,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
  
    WHERE
        "ProjectId" = ProjectId;
END Report_Project_Update;
/