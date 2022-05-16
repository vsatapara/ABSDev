CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_EXIST" 
(
CompanyId IN NUMBER,
ProjectId IN NUMBER,
ProjectName IN VARCHAR2,
Output_Data OUT SYS_REFCURSOR
)
as
begin
if ProjectId = 0 then
open Output_Data for 
select count(1) from "Project" where LOWER("ProjectName") = LOWER(ProjectName) and "IsDelete" = 'N' and "CompanyId" = CompanyId;
else
open Output_Data for 
select count(1) from "Project" where LOWER("ProjectName") = LOWER(ProjectName) and "IsDelete" = 'N' and "CompanyId" = CompanyId and "ProjectId" <> ProjectId;
end if;
end PROJECT_EXIST;
/