CREATE OR REPLACE PROCEDURE abs_mdi."UPCOMINGEVENTSADMINISTRATION_CREATE" 
(
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
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    CompanyId IN NUMBER,
    OutputId OUT NUMBER
)
AS
FeaturedFileId NUMBER;
BEGIN
    IF FeaturedFileName IS NOT NULL THEN
        INSERT INTO "Attachment"("AttachmentType","AttachmentName","AttachmentPath","IsDelete","AttachedDate")
        VALUES('Image',FeaturedFileName,FeaturedFilePath,'N',CURRENT_TIMESTAMP)
        RETURNING "AttachmentId" into FeaturedFileId;
    END IF;
     INSERT INTO "UpcomingEventsAdministration" (
        "Title",
        "EventCategoryId",
        "StartDate",
        "EndDate",
        "Time",
        "Location",
        "Content",
        "ActionButtonTitle",
        "ActionButtonURL",
        "FeaturedFile",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "CompanyId",
        "IsDelete"
    ) VALUES (
        Title,
       case when EventCategoryId=0 then null else EventCategoryId end,
        TO_DATE(StartDate,'MM/DD/YYYY'),
        TO_DATE(EndDate,'MM/DD/YYYY'),     
        Time,
        Location,
        Content,
        ActionButtonTitle,
        ActionButtonURL,
        FeaturedFileId,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        CompanyId,
        'N'
    )
    RETURNING "UpcomingEventId" into OutputId;
    
END UPCOMINGEVENTSADMINISTRATION_CREATE;
/