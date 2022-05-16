CREATE OR REPLACE PROCEDURE abs_mdi."POLICYSTATEMENT_UPDATE" 
(
    PolicyStatementId IN NUMBER,
    Title IN NVARCHAR2,
    Content IN NCLOB,
    ModifiedBy IN NUMBER,
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
         FROM "PolicyStatement" 
         WHERE "PolicyStatementId"=PolicyStatementId;
        
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
    UPDATE "PolicyStatement" SET
        "Title"=Title,
        "Content"=Content,
        "FileId"=FileId,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "PolicyStatementId"=PolicyStatementId;
END PolicyStatement_Update;
/