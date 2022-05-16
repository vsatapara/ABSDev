CREATE OR REPLACE PROCEDURE abs_mdi."INFORMATIONPAGEADMINISTRATION_UPDATE" 
(
    InformationPageId IN NUMBER,
    Title IN VARCHAR2,
    Content IN NCLOB,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    CompanyId IN NUMBER,
    FeaturedName IN VARCHAR2 DEFAULT NULL,
    FeaturedPath IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN NUMBER
)
AS 
FeaturedId number;
BEGIN
    IF FeaturedName IS NOT NULL THEN
         SELECT "FeaturedId" 
         INTO FeaturedId 
         FROM "InformationPageAdministrations" 
         WHERE "InformationPageId"=InformationPageId;
        
        UPDATE "Attachment" SET
            "IsDelete"='Y',
            "AttachedDate"=CURRENT_TIMESTAMP
        WHERE "AttachmentId"=FeaturedId;
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedName,FeaturedPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedId;
    END IF;
    
     UPDATE "InformationPageAdministrations" SET
        "CompanyId" = CompanyId,
        "Title" = Title,
        "Content" = Content,
        "ModifiedBy" = ModifiedBy,
        "FeaturedId" = FeaturedId,
        "IpAddress" = IpAddress,
        "ModifiedDate" = CURRENT_TIMESTAMP
    
     WHERE "InformationPageId" = InformationPageId;
END INFORMATIONPAGEADMINISTRATION_UPDATE;
/