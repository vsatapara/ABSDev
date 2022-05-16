CREATE OR REPLACE PROCEDURE abs_mdi."PRESIDENTSADVISORYCOUNCIL_UPDATE" 
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
    IpAddress IN VARCHAR2
)
AS 
FeaturedImageVideoId NUMBER;
BEGIN
 IF FeaturedImageVideoName IS NOT NULL THEN
         SELECT "FeaturedImageVideo" 
         INTO FeaturedImageVideoId 
         FROM "PresidentsAdvisoryCouncil" 
         WHERE "PresidentsAdvisoryCouncilId"=PresidentsAdvisoryCouncilId;
        
        IF FeaturedImageVideoId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=FeaturedImageVideoId;
        END IF;
        
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedImageVideoName,FeaturedImageVideoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedImageVideoId;
    END IF;
    
    
      UPDATE "PresidentsAdvisoryCouncil" SET
        --"CompanyId" = CompanyId,
        "TabName"=TabName,
        "MembersOnly"= MembersOnly,
        "Sort"=Sort,
        "Title"=Title,
        "Content"=Content,
        "FeaturedImageVideo"=FeaturedImageVideoId,
         "CommitteesContent"=CommitteesContent,
        "MembersContent"=MembersContent,        
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "PresidentsAdvisoryCouncilId"=PresidentsAdvisoryCouncilId;
END PRESIDENTSADVISORYCOUNCIL_UPDATE;
/