CREATE OR REPLACE PROCEDURE abs_mdi."PRESIDENTSADVISORYCOUNCIL_LIST" 
( 
CompanyId IN NUMBER,
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
      where "CompanyId"=CompanyId AND ( P."IsDelete"='N' OR  P."IsDelete" IS NULL) order by "Sort" asc;
END PRESIDENTSADVISORYCOUNCIL_LIST;
/