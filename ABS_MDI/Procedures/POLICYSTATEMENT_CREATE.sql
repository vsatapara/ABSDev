CREATE OR REPLACE PROCEDURE abs_mdi."POLICYSTATEMENT_CREATE" 
(
    Title IN NVARCHAR2,
    Content IN NCLOB,
    CreatedBy IN NUMBER,
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
    
     INSERT INTO "PolicyStatement"
     (
        "Title",
        "Content",
        "FileId",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        Title,
        Content,
        FileId,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "PolicyStatementId" into OutputId;
END PolicyStatement_Create;
/