CREATE OR REPLACE PROCEDURE abs_mdi."JOBS_CREATE" (
   ProjectName  IN   VARCHAR2,
    Builder  IN   VARCHAR2,
    IsActive  IN   VARCHAR2,
    CompanyId  IN   NUMBER,
    JobLocation  IN   VARCHAR2,
    SquareFootage  IN   NUMBER,
    ServiceNeeded  IN   VARCHAR2,
    ContactPhone IN   NUMBER,
    ContactEmail IN   VARCHAR2,
    ContactName  IN   VARCHAR2,
    DateNeeded  IN   VARCHAR2,
    IpAddress  IN   VARCHAR2,
    UserId  IN   VARCHAR2,
    OutputId        OUT  NUMBER
) AS
BEGIN
INSERT INTO "Jobs" (
    "ProjectName",
    "Builder",
    "JobLocation",
    "SquareFootage",
    "ServiceNeeded",
    "ContactPhone",
    "ContactEmail",
    "ContactName",
    "DateNeeded",
    "CreatedBy",
    "IpAddress",
    "IsActive",
    "CompanyId",
    "IsDelete",
    "CreatedDate"
) VALUES (
    ProjectName,
    Builder,
    JobLocation,
    SquareFootage,
    ServiceNeeded,
    ContactPhone,
    ContactEmail,
    ContactName,
    TO_DATE(DateNeeded,'MM/DD/YYYY'),
    UserId,
    IpAddress,
    IsActive,
    CompanyId,
    'N',
    CURRENT_TIMESTAMP
    )
    RETURNING "JobId" INTO OutputId;
END JOBS_CREATE;
/