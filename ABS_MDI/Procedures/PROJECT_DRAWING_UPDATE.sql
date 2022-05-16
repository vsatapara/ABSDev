CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_DRAWING_UPDATE" 
(
    ProjectId                   IN  NUMBER,
    FinalAnchorRodDate          IN  VARCHAR2,
    ApprovalDate                IN  VARCHAR2,  
    PermitDate                  IN  VARCHAR2,  
    FinalDate                   IN  VARCHAR2,     
    IsCorpEngineers             IN  CHAR,     
    IsUFCAntiTerrorism          IN  CHAR,  
    UFCAntiTerrorismListWeight  IN  VARCHAR2, 
    UFCAntiTerrorismListPrice   IN  VARCHAR2,   
    Mailed                      IN  VARCHAR2,    
    Carrier                     IN  VARCHAR2,  
    AccountDtl                  IN  VARCHAR2,
    ExpiresOn                   IN  VARCHAR2 
) AS
BEGIN
    UPDATE "Project"
    SET
        "FinalAnchorRodDate" = TO_DATE(FinalAnchorRodDate, 'MM/DD/YYYY'),
        "ApprovalDate" = TO_DATE(ApprovalDate, 'MM/DD/YYYY'), 
        "PermitDate" = TO_DATE(PermitDate, 'MM/DD/YYYY'), 
        "FinalDate" = TO_DATE(FinalDate, 'MM/DD/YYYY'),
        "IsCorpEngineers" = IsCorpEngineers,
        "IsUFCAntiTerrorism" = IsUFCAntiTerrorism,   
        "UFCAntiTerrorismListWeight" = UFCAntiTerrorismListWeight,
        "UFCAntiTerrorismListPrice" = UFCAntiTerrorismListPrice,
        "Mailed" = Mailed,
        "Carrier" = Carrier,
        "Account" = AccountDtl,
        "ExpiresOn" = TO_DATE(ExpiresOn, 'MM/DD/YYYY')
    WHERE
        "ProjectId" = ProjectId;
END PROJECT_DRAWING_UPDATE;
/