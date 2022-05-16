CREATE OR REPLACE PROCEDURE abs_mdi."MARKETINGADMIN_CREATE" 
(     
        CompanyId IN NUMBER,
		Title IN VARCHAR2,
		SortOrder IN NUMBER,
		Content IN CLOB,
		ActionButtonTitle IN VARCHAR2,
		ActionButtonUrl IN VARCHAR2,
		IsActive IN CHAR,
		IsDelete IN CHAR,
		UserId IN NUMBER,
        IpAddress IN VARCHAR2,
        FileName IN VARCHAR2 DEFAULT NULL,
        FilePath IN VARCHAR2 DEFAULT NULL,
        OutputId OUT NUMBER
)
AS 
 FileId NUMBER;
BEGIN
   IF FileName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FileName,FilePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FileId;
    END IF;
    INSERT INTO "MarketingAdmin"
    (
        "CompanyId",
		"Title",
		"SortOrder",
		"Content",
		"ActionButtonTitle",
		"ActionButtonUrl",
		"IsActive",
		"IsDelete",
		"CreatedBy",
		"CreatedDate",
        "IpAddress",
        "FileId"
    ) 
    VALUES 
    (
        CompanyId,
		Title,
		SortOrder,
		Content,
		ActionButtonTitle,
		ActionButtonUrl,
		IsActive,
		IsDelete,
		UserId,
		CURRENT_TIMESTAMP,
        IpAddress,
        FileId
    )
     RETURNING "MarketingAdminId" into OutputId;
END MarketingAdmin_Create;
/