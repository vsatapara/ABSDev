CREATE OR REPLACE PROCEDURE abs_mdi."FEATUREDANNOUNCEMENT_UPDATE" 
(
    FAnnouncementId IN NUMBER,
    CompanyId IN NUMBER,
    Title IN NVARCHAR2,
    StartDate IN VARCHAR2,
    EndDate IN VARCHAR2,
    IsActive IN CHAR,
    Description IN CLOB,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    AnnouncementImageVideoName IN NVARCHAR2 DEFAULT NULL,
    AnnouncementImageVideoPath IN NVARCHAR2 DEFAULT NULL,
    ModifiedBy IN NUMBER,
    SortOrder IN NUMBER
)
AS 
AnnouncementImageVideoId number;
BEGIN
    IF AnnouncementImageVideoName IS NOT NULL THEN
         SELECT "AnnouncementImageVideoId" 
         INTO AnnouncementImageVideoId 
         FROM "FeaturedAnnouncements" 
         WHERE "FAnnouncementId"=FAnnouncementId;
        
        UPDATE "Attachment" SET
            "IsDelete"='Y',
            "AttachedDate"=CURRENT_TIMESTAMP
        WHERE "AttachmentId"=AnnouncementImageVideoId;
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',AnnouncementImageVideoName,AnnouncementImageVideoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into AnnouncementImageVideoId;
        
        UPDATE "FeaturedAnnouncements" SET
            "AnnouncementImageVideoId" = AnnouncementImageVideoId
         WHERE "FAnnouncementId" = FAnnouncementId;            
    END IF;
    
     UPDATE "FeaturedAnnouncements" SET
        "CompanyId" = CompanyId,
        "Title" = Title, 
        "StartDate" = TO_DATE(StartDate,'MM/DD/YYYY HH24:MI:SS'),
        "EndDate" =  TO_DATE(EndDate,'MM/DD/YYYY HH24:MI:SS'),
        "IsActive" = IsActive,
        "Description" = Description,
        --"AnnouncementImageVideoId" = AnnouncementImageVideoId,
        "IpAddress" = IpAddress,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "SortOrder" = SortOrder
     WHERE "FAnnouncementId" = FAnnouncementId;
END FeaturedAnnouncement_Update;
/