CREATE OR REPLACE PROCEDURE abs_mdi."PRESIDENTSADVISORYCOUNCIL_SELECT" 
(
        PresidentsAdvisoryCouncilId IN NUMBER,
        Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN Output_Data FOR 
      SELECT 
        "PresidentsAdvisoryCouncilId",
        "TabName",
        "MembersOnly",
        "Sort",
        "Title",
        "Content",
    	"FeaturedImageVideo",
        "CommitteesContent",
        "MembersContent",
        A."AttachmentName" AS FeaturedImageVideoName,
        A."AttachmentPath" AS FeaturedImageVideoPath        
      FROM "PresidentsAdvisoryCouncil" P
      LEFT JOIN "Attachment" A ON A."AttachmentId" = P."FeaturedImageVideo"
      WHERE "PresidentsAdvisoryCouncilId"=PresidentsAdvisoryCouncilId;
END PRESIDENTSADVISORYCOUNCIL_SELECT;
/