CREATE OR REPLACE PROCEDURE abs_mdi."BRANDASSETS_CREATE" 
(
    CompanyID IN NUMBER,
    BrandAssetsId IN NUMBER,
    BrandAssetsDisplayName IN NVARCHAR2,
    UserId IN NUMBER,
    BrandAssetsFileName IN VARCHAR2,
    BrandAssetsFilePath IN VARCHAR2,
    IpAddress IN VARCHAR2
)
AS 
BrandAssetsFileId NUMBER;
BEGIN
 IF BrandAssetsFileName IS NOT NULL THEN
         INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',BrandAssetsFileName,BrandAssetsFilePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into BrandAssetsFileId;
    END IF;
    
  INSERT INTO "BrandAssets"
     (
        "BrandAssetsDisplayName",
        "CreatedBy",
        "CreatedDate",
        "IsDelete",
        "BrandAssetsFile",
        "IpAddress",
        "CompanyID"
     )
     VALUES
     (
        BrandAssetsDisplayName,
        UserId,
        CURRENT_TIMESTAMP,
        'N',
         BrandAssetsFileId,
         IpAddress,
         CompanyID
     );
END BRANDASSETS_CREATE;
/