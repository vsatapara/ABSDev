CREATE OR REPLACE PROCEDURE abs_mdi."FEATUREDANNOUNCEMENT_SELECT" 
(
    FAnnouncementId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
    SELECT 
        "FAnnouncementId",
        "Title",
        to_char("StartDate",'MM/DD/YYYY HH24:MI:SS') "STARTDATE",
        to_char("EndDate",'MM/DD/YYYY HH24:MI:SS') "ENDDATE",
        "IsActive",
        "Description",
        "SortOrder",
        "CreatedBy",
        "ModifiedBy",
       A."AttachmentName" AS AnnouncementImageVideoName,
        A."AttachmentPath" AS AnnouncementImageVideoPath
      FROM "FeaturedAnnouncements" F
      LEFT JOIN "Attachment" A ON A."AttachmentId" = "AnnouncementImageVideoId"
	WHERE F."IsDelete" = 'N' and F."FAnnouncementId" =FAnnouncementId ;
END FeaturedAnnouncement_Select;
/