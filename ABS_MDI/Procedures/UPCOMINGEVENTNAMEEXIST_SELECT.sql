CREATE OR REPLACE PROCEDURE abs_mdi."UPCOMINGEVENTNAMEEXIST_SELECT" 
(
    In_Title IN NVARCHAR2,
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
        "CreatedBy",
        "CreatedDate",
        "ModifiedBy",
        "ModifiedDate"
    FROM "UpcomingEventsAdministration"
    WHERE "Title" = In_Title;
END UPCOMINGEVENTNAMEEXIST_SELECT;
/