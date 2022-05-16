CREATE OR REPLACE PROCEDURE abs_mdi."UPCOMINGEVENTSADMINISTRATION_UPDATE" 
(
    UpcomingEventId IN NUMBER,
	Title IN NVARCHAR2,
    EventCategoryId  IN NUMBER,
    StartDate  IN VARCHAR2,
    EndDate IN VARCHAR2,
    Time IN VARCHAR2,
    Location IN VARCHAR2,
    Content IN NCLOB,
    ActionButtonTitle IN NVARCHAR2,
    ActionButtonURL IN VARCHAR2,
    FeaturedFileName IN VARCHAR2,
    FeaturedFilePath IN VARCHAR2,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER
)
AS
FeaturedFileId NUMBER;
BEGIN
    IF FeaturedFileName IS NOT NULL THEN
         SELECT "FeaturedFile" 
            INTO FeaturedFileId 
         FROM "UpcomingEventsAdministration" 
         WHERE "UpcomingEventId" = UpcomingEventId;
        
        IF FeaturedFileId IS NOT NULL THEN
            UPDATE  "Attachment" SET
                    "IsDelete" = 'Y',
                    "AttachedDate" = CURRENT_TIMESTAMP
            WHERE "AttachmentId" = FeaturedFileId;
        END IF;    
            
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedFileName,FeaturedFilePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedFileId;
    END IF;
UPDATE "UpcomingEventsAdministration"
SET
    "CompanyId"= CompanyId,
    "Title" = Title,
    "EventCategoryId" = case when EventCategoryId=0 then null else EventCategoryId end,
    "StartDate"=TO_DATE(StartDate,'MM/DD/YYYY'),
    "EndDate"=TO_DATE(EndDate,'MM/DD/YYYY'),    
    "Time" = Time,
    "Location" = Location,
    "Content" = Content,
    "ActionButtonTitle" = ActionButtonTitle,
    "ActionButtonURL" = ActionButtonURL,
    "FeaturedFile" = FeaturedFileId,
    "ModifiedBy" = ModifiedBy,
    "ModifiedDate" = CURRENT_TIMESTAMP,
    "IpAddress" = IpAddress
WHERE "UpcomingEventId" = UpcomingEventId;
END UPCOMINGEVENTSADMINISTRATION_UPDATE;
/