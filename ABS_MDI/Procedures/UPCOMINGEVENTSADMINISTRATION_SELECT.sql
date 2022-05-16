CREATE OR REPLACE PROCEDURE abs_mdi."UPCOMINGEVENTSADMINISTRATION_SELECT" 
(
    UpcomingEventId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "UpcomingEventId",
            "Title",
            to_char("StartDate",'MM/DD/YYYY') "STARTDATE",
            to_char("EndDate",'MM/DD/YYYY') "ENDDATE",
            "Time",
            "Location",
            "Content",
            "ActionButtonTitle",
            "ActionButtonURL",
            "FeaturedFile",
            "EventCategoryId",
            AT."AttachmentName" as FeaturedFileName,
            AT."AttachmentPath" as FeaturedFilePath            
          FROM "UpcomingEventsAdministration" U
          LEFT OUTER JOIN "Attachment" AT ON U."FeaturedFile" = AT."AttachmentId"
          WHERE    "UpcomingEventId" = UpcomingEventId and U."IsDelete" = 'N';
END UPCOMINGEVENTSADMINISTRATION_SELECT;
/