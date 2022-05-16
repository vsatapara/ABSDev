CREATE OR REPLACE PROCEDURE abs_mdi."COOPMARKETING_CREATE" 
(
    CompanyID IN NUMBER,
    CoOpMarketingId IN NUMBER,   
    BrandAssetsTitle IN VARCHAR2,
    BrandAssetsContent IN NCLOB,
    ProgramGuideLinesTitle IN VARCHAR2,
    ProgramGuideLinesContent IN NCLOB,
    RequestForApprovalTitle IN VARCHAR2,
    RequestForApprovalContent IN NCLOB,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
INSERT INTO "CoOpMarketing"
     (
        "BrandAssetsTitle",
        "BrandAssetsContent",
        "ProgramGuideLinesTitle",
        "ProgramGuideLinesContent",
        "RequestForApprovalTitle",
        "RequestForApprovalContent",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "CompanyID"
     )
     VALUES
     (
        BrandAssetsTitle,
        BrandAssetsContent,
        ProgramGuideLinesTitle,
        ProgramGuideLinesContent,
        RequestForApprovalTitle,
        RequestForApprovalContent,
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress,
        CompanyID
     )
     RETURNING "CoOpMarketingId" into OutputId;
      
END COOPMARKETING_CREATE;
/