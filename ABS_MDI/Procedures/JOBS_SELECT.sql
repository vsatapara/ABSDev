CREATE OR REPLACE PROCEDURE abs_mdi."JOBS_SELECT" 
(
    CompanyId IN Number,
    JobId IN Number Default 0,
    Output_Data OUT  SYS_REFCURSOR
)
AS
BEGIN
if(JobId = 0)
Then
OPEN Output_Data FOR SELECT
   "ProjectName",
    "Builder",
    "JobLocation",
    "SquareFootage",
    "ServiceNeeded",
    "ContactPhone",
    "ContactEmail",
    "ContactName",
    to_char("DateNeeded",'MM/DD/YYYY') DateNeeded,
    "JobId",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IsDelete",
    "IpAddress",
    "IsActive",
    "CompanyId"
FROM
    "Jobs"
     WHERE "CompanyId" = CompanyId  AND "IsDelete" = 'N'
     Order by "CreatedDate" desc;
else
OPEN Output_Data FOR SELECT
   "ProjectName",
    "Builder",
    "JobLocation",
    "SquareFootage",
    "ServiceNeeded",
    "ContactPhone",
    "ContactEmail",
    "ContactName",
    to_char("DateNeeded",'MM/DD/YYYY') DateNeeded,
    "JobId",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IsDelete",
    "IpAddress",
    "IsActive",
    "CompanyId"
FROM
    "Jobs"
     WHERE "CompanyId" = CompanyId AND "JobId" = JobId AND "IsDelete" = 'N'
     Order by "CreatedDate" desc;
End if;
END;
/