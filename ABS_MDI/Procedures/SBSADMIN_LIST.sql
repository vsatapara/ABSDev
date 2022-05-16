CREATE OR REPLACE PROCEDURE abs_mdi."SBSADMIN_LIST" 
(
    CompanyId IN NUMBER,
    Out_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Out_Data FOR 
      SELECT 
		"SBSAdminId",
		"Title",
		"Content",
		"BuilderWorxFileLink",
		"BuilderWorxFileLinkText",
		"ReleaseNotesFileLink",
		"ReleaseNotesFileLinkText",
		"Link1",
		"Link1Text",
		"Link2",
		"Link2Text",
		"Link3",
		"Link3Text",
		"Notes"
      FROM "SBSAdmin" where "CompanyId" = CompanyId;
END SBSAdmin_List;
/