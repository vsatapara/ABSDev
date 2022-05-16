CREATE OR REPLACE PROCEDURE abs_mdi."UPCOMINGEVENTS_EXIST" (
    UpcomingEventId IN NUMBER,
    Title IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF UpcomingEventId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "UpcomingEventsAdministration" WHERE LOWER("Title") = LOWER(Title) AND "IsDelete" != 'Y';
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "UpcomingEventsAdministration" WHERE LOWER("Title") = LOWER(Title) and "UpcomingEventId" != UpcomingEventId AND "IsDelete" != 'Y';
END IF;
END UPCOMINGEVENTS_EXIST;
/