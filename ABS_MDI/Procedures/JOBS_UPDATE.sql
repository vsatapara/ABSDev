CREATE OR REPLACE PROCEDURE abs_mdi."JOBS_UPDATE" (
    JobId  IN   NUMBER,
    ProjectName  IN   VARCHAR2,
    IsActive  IN   VARCHAR2,
    Builder  IN   VARCHAR2,
    JobLocation  IN   VARCHAR2,
    SquareFootage  IN   NUMBER,
    ServiceNeeded  IN   VARCHAR2,
    ContactPhone IN   NUMBER,
    ContactEmail IN   VARCHAR2,
    ContactName  IN   VARCHAR2,
    DateNeeded  IN   VARCHAR2,
    IpAddress  IN   VARCHAR2,
    UserId  IN   NUMBER
) AS
BEGIN
Update "Jobs" set 
    "ProjectName" = ProjectName,
    "Builder" = Builder,
    "IsActive" = IsActive,
    "JobLocation" = JobLocation,
    "SquareFootage" = SquareFootage,
    "ServiceNeeded" = ServiceNeeded,
    "ContactPhone" = ContactPhone,
    "ContactEmail" = ContactEmail,
    "ContactName" = ContactName,
    "DateNeeded" = TO_DATE(DateNeeded,'MM/DD/YYYY'),
    "ModifiedBy" = UserId,
    "ModifiedDate" = CURRENT_TIMESTAMP,
    "IpAddress" = IpAddress
    where "JobId" = JobId;
END JOBS_UPDATE;
/