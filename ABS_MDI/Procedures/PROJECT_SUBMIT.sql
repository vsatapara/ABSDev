CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_SUBMIT" (
    ProjectId IN NUMBER,
    ProjectStage IN  VARCHAR2,
    SubmitDate IN  VARCHAR2,
    RequestShipDate IN VARCHAR2,
    AnchorRodDate IN VARCHAR2,
    ConstructionDate IN VARCHAR2
) AS
Quote NUMBER;
CompanyId NUMBER;
BEGIN
    SELECT "CompanyId" INTO CompanyId FROM "Project" where "ProjectId"=ProjectId;
    SELECT "QuoteExpirationDays" INTO Quote FROM "CompanyInformation" where "CompanyId"=CompanyId;
    UPDATE "Project"
    SET
        "ProjectStage" = ProjectStage,
        "ExpiryDate" =  TO_DATE(SubmitDate, 'MM/DD/YYYY') + Quote,
        "RequestShipDate"=TO_DATE(RequestShipDate, 'MM/DD/YYYY'),
        "ConstructionDate"=TO_DATE(ConstructionDate, 'MM/DD/YYYY'),
        "AnchorRodDate"=TO_DATE(AnchorRodDate, 'MM/DD/YYYY'),
        "SubmittedDate"=TO_DATE(SubmitDate, 'MM/DD/YYYY')
    WHERE
        "ProjectId" = ProjectId;
END Project_Submit;
/