CREATE OR REPLACE PROCEDURE abs_mdi."FEATUREDANNOUNCEMENT_EXIST" (
    FAnnouncementId IN NUMBER,
    Title IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF FAnnouncementId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "FeaturedAnnouncements" WHERE LOWER("Title") = LOWER(Title) AND "IsDelete" != 'Y';
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "FeaturedAnnouncements" WHERE LOWER("Title") = LOWER(Title) and "FAnnouncementId" != FAnnouncementId AND "IsDelete" != 'Y';
END IF;
END FEATUREDANNOUNCEMENT_EXIST;
/