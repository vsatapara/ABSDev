CREATE OR REPLACE PROCEDURE abs_mdi."ATTACHMENT_UPDATE" 
(
    AttachmentName IN VARCHAR2,
    AttachmentPath IN VARCHAR2,
    ModifiedBy IN NUMBER,
    AttachmentId IN NUMBER,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER,
    OutputId OUT NUMBER
)
AS
BEGIN
    IF AttachmentName IS NOT NULL THEN        
        IF AttachmentId IS NOT NULL THEN
            UPDATE  "Attachment" SET
                    "IsDelete" = 'Y',
                    "AttachedDate" = CURRENT_TIMESTAMP
            WHERE "AttachmentId" = AttachmentId;
        END IF;    
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',AttachmentName,AttachmentPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into OutputId;
    END IF;
END Attachment_Update;
/