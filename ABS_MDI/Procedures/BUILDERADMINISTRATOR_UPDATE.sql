CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERADMINISTRATOR_UPDATE" 
(
    BuilderAdministratorId IN NUMBER,
    Email IN NVARCHAR2,
    BuilderInformationInstruction IN NCLOB,
    BuilderContactInstruction IN NCLOB,
    SubmissionConfirmationInstruction IN NCLOB,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER
)
AS 
BEGIN
    UPDATE "BuilderAdministrator" SET
    
        "Email"=Email,
        "BuilderInformationInstruction"=BuilderInformationInstruction,
        "BuilderContactInstruction"=BuilderContactInstruction,
        "SubmissionConfirmationInstruction"=SubmissionConfirmationInstruction,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress,
        "BuilderAdministratorId" = BuilderAdministratorId
    WHERE "CompanyId" = CompanyId;
END BuilderAdministrator_Update;
/