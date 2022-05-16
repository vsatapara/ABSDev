CREATE OR REPLACE PROCEDURE abs_mdi."ATTACHMENT_CREATE" 
(
    AttachmentName IN VARCHAR2,
    AttachmentPath IN VARCHAR2,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER,
    OutputId OUT NUMBER
)
AS 
BEGIN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',AttachmentName,AttachmentPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into OutputId;   
END Attachment_Create;
/