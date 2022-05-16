CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERNEWS_CREATE" 
(
    Title IN Varchar2,
    FilterTag IN NUMBER,
    PublishDate IN Varchar2,
    UnpublishDate IN VARCHAR2,
    Content IN NCLOB,
    IsActive IN CHAR,
    UserId IN NUMBER,
    BuilderNewImageName IN NVARCHAR2 DEFAULT NULL,
    BuilderNewImagePath IN NCLOB DEFAULT NULL,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER,
    OutputId OUT NUMBER
)
AS 
BuilderNewsImageId NUMBER;
BEGIN
    
    IF BuilderNewImageName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',BuilderNewImageName,BuilderNewImagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into BuilderNewsImageId;
    END IF;
    
  INSERT INTO "BuilderNews"
     (
        "CompanyId",
        "Title",
        "FilterTag",
        "PublishDate",
        "UnpublishDate",
        "IsActive",
        "Content",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "BuilderNewsImageId",
        "IpAddress"
     )
     VALUES
     (
        CompanyId,
        Title,
        FilterTag,
        TO_DATE(PublishDate,'MM/DD/YYYY'),
        TO_DATE(UnpublishDate,'MM/DD/YYYY'),
        IsActive,
        Content,
        'N',
        UserId,
        CURRENT_TIMESTAMP,
        BuilderNewsImageId,
        IpAddress
     )
     RETURNING "BuilderNewsId" into OutputId;
     
END BuilderNews_Create;
/