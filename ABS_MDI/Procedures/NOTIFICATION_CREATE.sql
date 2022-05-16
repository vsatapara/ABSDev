CREATE OR REPLACE PROCEDURE abs_mdi."NOTIFICATION_CREATE" 
(
    NotificationName IN VARCHAR2,
    IsActive IN CHAR,
    Content IN CLOB,
    StartDate IN VARCHAR2,
    EndDate IN VARCHAR2,
    CompanyId IN NUMBER,
    SortOrder IN NUMBER,
    IsSystemNotification CHAR,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    FeaturedImageName IN NVARCHAR2 DEFAULT NULL,
    FeaturedImagePath IN NCLOB DEFAULT NULL,
    OutputId OUT NUMBER
)
AS 
 FeaturedImageId NUMBER;
BEGIN
   IF FeaturedImageName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedImageName,FeaturedImagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedImageId;
    END IF;
    
    INSERT INTO "Notification"
     (
        "NotificationName",
        "IsActive",
        "Content",
        "StartDate",
        "EndDate",
        "CompanyId",
        "SortOrder",
        "IsSystemNotification",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDelete",
        "FeaturedImageId"
     )
     VALUES
     (
        NotificationName,
        IsActive,
        Content,
        TO_DATE(StartDate,'MM/DD/YYYY HH24:MI:SS'),
        TO_DATE(EndDate,'MM/DD/YYYY HH24:MI:SS'),
        CompanyId,
        SortOrder,        
        IsSystemNotification,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N',
        FeaturedImageId
     )
      RETURNING "NotificationId" into OutputId;
END Notification_Create;
/