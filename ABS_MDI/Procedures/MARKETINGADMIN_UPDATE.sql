CREATE OR REPLACE PROCEDURE abs_mdi."MARKETINGADMIN_UPDATE" 
(       
        MarketingAdminId IN NUMBER,
        CompanyId IN NUMBER,
		Title IN VARCHAR2,
		SortOrder IN NUMBER,
		Content IN CLOB,
		ActionButtonTitle IN VARCHAR2,
		ActionButtonUrl IN VARCHAR2,
		IsActive IN CHAR,	
		UserId IN NUMBER,
        IpAddress IN VARCHAR2,
        FileName IN VARCHAR2 DEFAULT NULL,
        FilePath IN VARCHAR2 DEFAULT NULL        
)
AS 
FileId NUMBER;
BEGIN
    IF FileName IS NOT NULL THEN
        SELECT "FileId" 
        INTO FileId 
        FROM "MarketingAdmin" 
        WHERE "MarketingAdminId"=MarketingAdminId;
        
        IF FileId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=FileId;
        END IF;
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FileName,FilePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FileId;
    END IF;
    UPDATE "MarketingAdmin" SET     
        "CompanyId" = CompanyId,
		"Title" = Title,
		"SortOrder" = SortOrder,
		"Content" = Content,
		"ActionButtonTitle" = ActionButtonTitle,
		"ActionButtonUrl" = ActionButtonUrl,
		"IsActive" = IsActive,
		"ModifiedBy" = UserId,
		"ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "FileId"=FileId
    WHERE 
        "MarketingAdminId"=MarketingAdminId; 
END MarketingAdmin_Update;
/