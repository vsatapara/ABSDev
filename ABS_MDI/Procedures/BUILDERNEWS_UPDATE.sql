CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERNEWS_UPDATE" 
(
    BuilderNewsId IN Number,
    Title IN Varchar2,
    FilterTag IN Varchar2,
    PublishDate IN Varchar2,
    UnpublishDate IN VARCHAR2,
    Content IN NCLOB,
    IsActive IN CHAR,
    UserId IN NUMBER,
    BuilderNewImageName IN NVARCHAR2 DEFAULT NULL,
    BuilderNewImagePath IN NCLOB DEFAULT NULL,
    IpAddress IN VARCHAR2,
    CompanyId IN Number
)
AS 
BuilderNewsImageId NUMBER;
BEGIN
      IF BuilderNewImageName IS NOT NULL THEN
         SELECT "BuilderNewsImageId" 
         INTO BuilderNewsImageId 
         FROM "BuilderNews" 
         WHERE "BuilderNewsId"=BuilderNewsId;
        
        IF BuilderNewsID IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=BuilderNewsImageId;
        END IF;
        
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',BuilderNewImageName,BuilderNewImagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into BuilderNewsImageId;
    END IF;

    UPDATE "BuilderNews" SET
        "CompanyId" = CompanyId,
        "Title" = Title,
        "FilterTag" = FilterTag,
        "PublishDate"=TO_DATE(PublishDate,'MM/DD/YYYY'),
        "UnpublishDate"=TO_DATE(UnpublishDate,'MM/DD/YYYY'),
        "IsActive"=IsActive,
        "Content"=Content,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "BuilderNewsImageId"=BuilderNewsImageId,
        "IpAddress"=IpAddress
    WHERE "BuilderNewsId"=BuilderNewsId;
END BuilderNews_Update;
/