CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERADMINISTRATOR_CREATE" 
(
    Email IN NVARCHAR2,
    BuilderInformationInstruction IN NCLOB,
    BuilderContactInstruction IN NCLOB,
    SubmissionConfirmationInstruction IN NCLOB,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER,
    OutputId OUT NUMBER
)
AS 
BEGIN    
     INSERT INTO "BuilderAdministrator"
     (
        "Email",
        "BuilderInformationInstruction",
        "BuilderContactInstruction",
        "SubmissionConfirmationInstruction",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "CompanyId"
     )
     VALUES
     (
        Email,
        BuilderInformationInstruction,
        BuilderContactInstruction,
        SubmissionConfirmationInstruction,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        CompanyId
     )
     RETURNING "BuilderAdministratorId" into OutputId;
     
END BuilderAdministrator_Create;
/