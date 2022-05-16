CREATE OR REPLACE PROCEDURE abs_mdi."INFORMATIONPAGEADMINISTRATION_CREATE" 
(
    Title IN VARCHAR2,
    Content IN NCLOB,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    CompanyId IN NUMBER,
    FeaturedName IN VARCHAR2 DEFAULT NULL,
    FeaturedPath IN VARCHAR2 DEFAULT NULL,
    OutputId OUT NUMBER
)
AS 
FeaturedId NUMBER;
BEGIN
 /* Attachment Insert start*/
     IF FeaturedName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedName,FeaturedPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedId;
    END IF;
    
     INSERT INTO "InformationPageAdministrations"
     (
        "CompanyId",
        "Title",
        "Content",
        "FeaturedId",
        "IpAddress",
        "CreatedBy",
        "CreatedDate"
    )
     VALUES
     (
        CompanyId,
        Title,
        Content,
        FeaturedId,
        IpAddress,
        CreatedBy,
        CURRENT_TIMESTAMP
     )
       RETURNING "InformationPageId" into OutputId;
END INFORMATIONPAGEADMINISTRATION_CREATE;
/