CREATE OR REPLACE PROCEDURE abs_mdi."PHOTOS_CREATE" (
    CompanyID IN NUMBER,
    PhotosId IN NUMBER,
    PhotosDisplayName IN NVARCHAR2,
    UserId IN NUMBER,
    PhotosFileName IN VARCHAR2,
    PhotosFilePath IN VARCHAR2,
    IpAddress IN VARCHAR2
)
AS 
PhotosFileId NUMBER;
BEGIN
IF PhotosFileName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',PhotosFileName,PhotosFilePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into PhotosFileId;
    END IF;
INSERT INTO "Photos"
     (
        "PhotosDisplayName",
        "CreatedBy",
        "CreatedDate",
        "IsDelete",
        "PhotosFile",
        "IpAddress",
        "CompanyID"
     )
     VALUES
     (
        PhotosDisplayName,
        UserId,
        CURRENT_TIMESTAMP,
        'N',
        PhotosFileId,
        IpAddress,
        CompanyID
     );
END PHOTOS_CREATE;
/