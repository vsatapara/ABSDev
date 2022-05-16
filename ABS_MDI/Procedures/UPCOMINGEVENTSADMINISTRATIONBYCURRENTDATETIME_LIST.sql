CREATE OR REPLACE PROCEDURE abs_mdi."UPCOMINGEVENTSADMINISTRATIONBYCURRENTDATETIME_LIST" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
        "UpcomingEventId",
        "Title",
        "EventCategoryId",
        to_char("StartDate",'MM/DD/YYYY') "StartDate",
        to_char("EndDate",'MM/DD/YYYY') "EndDate",        
        "Time",
        "Location",
        "Content",
        "ActionButtonTitle",
        "ActionButtonURL",
        "FeaturedFile",
        A."AttachmentName" AS FeaturedFileName,
        A."AttachmentPath" AS FeaturedFilePath,
        "CreatedBy",
        "CreatedDate",
        "ModifiedBy",
        "ModifiedDate"
    FROM "UpcomingEventsAdministration" U
    LEFT JOIN "Attachment" A ON A."AttachmentId" = U."FeaturedFile"
	WHERE U."IsActive" = 'Y' and U."CompanyId" = CompanyId and (U."IsDelete" is null or U."IsDelete"='N') and TO_DATE(U."EndDate",'DD-MM-YY') >= TO_DATE(CURRENT_DATE,'DD-MM-YY') and U."Time" >= to_char(CURRENT_TIMESTAMP,'HH24:MI');
END UPCOMINGEVENTSADMINISTRATIONBYCURRENTDATETIME_LIST;
/