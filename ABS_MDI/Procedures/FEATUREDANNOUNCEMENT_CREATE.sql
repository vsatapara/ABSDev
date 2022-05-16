CREATE OR REPLACE PROCEDURE abs_mdi."FEATUREDANNOUNCEMENT_CREATE" 
(
    CompanyId IN NUMBER,
    Title IN NVARCHAR2,
    StartDate IN VARCHAR2,
    EndDate IN VARCHAR2,
    IsActive IN CHAR,
    Description IN CLOB,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    AnnouncementImageVideoName IN NVARCHAR2 DEFAULT NULL,
    AnnouncementImageVideoPath IN NVARCHAR2 DEFAULT NULL,
    CreatedBy IN NUMBER,
    SortOrder IN NUMBER,
    OutputId OUT NUMBER
)
AS 
AnnouncementImageVideoId NUMBER;
BEGIN
    /* Attachment Insert start*/
     IF AnnouncementImageVideoName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',AnnouncementImageVideoName,AnnouncementImageVideoPath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into AnnouncementImageVideoId;
    END IF;
     INSERT INTO "FeaturedAnnouncements"
     (
        "CompanyId",
        "Title",
        "StartDate",
        "EndDate",
        "IsActive",
        "Description",
        "AnnouncementImageVideoId",
        "IpAddress",
        "CreatedBy",
        "CreatedDate",
        "SortOrder"
     )
     VALUES
     (
        CompanyId,
        Title,
        TO_DATE(StartDate,'MM/DD/YYYY HH24:MI:SS'),
        TO_DATE(EndDate,'MM/DD/YYYY HH24:MI:SS'),
        IsActive,
        Description,
        AnnouncementImageVideoId,
        IpAddress,
        CreatedBy,
        CURRENT_TIMESTAMP,
        SortOrder
     )
     RETURNING "FAnnouncementId" into OutputId;
END FeaturedAnnouncement_Create;
/