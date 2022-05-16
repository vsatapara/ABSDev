CREATE OR REPLACE PROCEDURE abs_mdi."NOTIFICATION_UPDATE" 
(
    NotificationId IN NUMBER,
    NotificationName IN VARCHAR2,
    IsActive IN CHAR,
    Content IN CLOB,
    StartDate IN VARCHAR2,
    EndDate IN VARCHAR2,
    CompanyId IN NUMBER,
    SortOrder IN NUMBER,
    IsSystemNotification CHAR,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    FeaturedImageName IN NVARCHAR2 DEFAULT NULL,
    FeaturedImagePath IN NVARCHAR2 DEFAULT NULL
)
AS 
FeaturedImageId NUMBER;
BEGIN
    IF FeaturedImageName IS NOT NULL THEN
         SELECT "FeaturedImageId" 
         INTO FeaturedImageId 
         FROM "Notification" 
         WHERE "NotificationId"=NotificationId;
        
        IF FeaturedImageId IS NOT NULL THEN
            UPDATE "Attachment" SET
                "IsDelete"='Y',
                "AttachedDate"=CURRENT_TIMESTAMP
            WHERE "AttachmentId"=FeaturedImageId;
        END IF;
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedImageName,FeaturedImagePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedImageId;
        
        --UPDATE "Notification" SET 
        --    "FeaturedImageId"=FeaturedImageID
        --WHERE "NotificationId"=NotificationId;    
    END IF;
   UPDATE "Notification" SET 
        "NotificationName"=NotificationName,
        "IsActive"=IsActive,
        "Content"=Content,
        "StartDate"=TO_DATE(StartDate,'MM/DD/YYYY HH24:MI:SS'),
        "EndDate"=TO_DATE(EndDate,'MM/DD/YYYY HH24:MI:SS'),
        "CompanyId" = CompanyId,
        "SortOrder"=SortOrder,
        "IsSystemNotification"=IsSystemNotification,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress,
        "FeaturedImageId"=FeaturedImageID
    WHERE "NotificationId"=NotificationId;    
END Notification_Update;
/