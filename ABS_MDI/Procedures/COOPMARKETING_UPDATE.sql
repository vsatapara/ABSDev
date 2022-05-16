CREATE OR REPLACE PROCEDURE abs_mdi."COOPMARKETING_UPDATE" 
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
    IpAddress IN VARCHAR2
)    
AS 
BEGIN
 UPDATE "CoOpMarketing" SET
        "BrandAssetsTitle"=BrandAssetsTitle,
        "BrandAssetsContent"=BrandAssetsContent,
        "ProgramGuideLinesTitle"=ProgramGuideLinesTitle,
        "ProgramGuideLinesContent"=ProgramGuideLinesContent,
        "RequestForApprovalTitle"=RequestForApprovalTitle,
        "RequestForApprovalContent"=RequestForApprovalContent,        
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress,
        "CompanyID"=CompanyID
    WHERE "CoOpMarketingId"=CoOpMarketingId;
END COOPMARKETING_UPDATE;
/