CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERADMINISTRATOR_SELECT" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
      "BuilderAdministratorId",
        "Email",
        "BuilderInformationInstruction",
        "BuilderContactInstruction",
        "SubmissionConfirmationInstruction"
        FROM "BuilderAdministrator"
    WHERE "CompanyId"=CompanyId;
END BuilderAdministrator_Select;
/