CREATE OR REPLACE PROCEDURE abs_mdi."PRESIDENTSADVISORYCOUNCIL_CREATE" 
(
    PresidentsAdvisoryCouncilId IN NUMBER,
    CompanyId IN NUMBER,
    TabName IN NVARCHAR2,
    MembersOnly IN CHAR,
    Sort IN NUMBER,
    Title IN NVARCHAR2,
    Content IN NCLOB,
    CommitteesContent IN NCLOB,
    MembersContent IN NCLOB,
    UserId IN NUMBER,
    FeaturedImageVideoName IN VARCHAR2,
    FeaturedImageVideoPath IN VARCHAR2,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
FeaturedImageVideoId NUMBER;
BEGIN
 IF FeaturedImageVideoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedImageVideoName,FeaturedImageVideoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedImageVideoId;
    END IF;
    
 INSERT INTO "PresidentsAdvisoryCouncil"
     (
        "CompanyId",
        "TabName",
        "MembersOnly",
        "Sort",
        "Title",
        "Content",
        "MembersContent",
        "CreatedBy",
        "CreatedDate",
        "FeaturedImageVideo",
        "CommitteesContent",
        "IpAddress"
     )
     VALUES
     (
        CompanyId,
        TabName,
        MembersOnly,
        Sort,
        Title,
        Content,
        MembersContent,
        UserId,
        CURRENT_TIMESTAMP,
        FeaturedImageVideoId,
        CommitteesContent,
        IpAddress       
     )
     RETURNING "PresidentsAdvisoryCouncilId" into OutputId;
     
END PRESIDENTSADVISORYCOUNCIL_CREATE;
/