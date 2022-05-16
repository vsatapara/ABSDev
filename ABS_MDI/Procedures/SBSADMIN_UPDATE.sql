CREATE OR REPLACE PROCEDURE abs_mdi."SBSADMIN_UPDATE" 
(       
        SBSAdminId IN NUMBER,
        CompanyId IN NUMBER,
		Title IN VARCHAR2,
		Content IN CLOB,
		BuilderWorxFileLink IN VARCHAR2,
		BuilderWorxFileLinkText IN VARCHAR2,
		ReleaseNotesFileLink IN VARCHAR2,
		ReleaseNotesFileLinkText IN VARCHAR2,
		Link1 IN VARCHAR2,
		Link1Text IN VARCHAR2,
		Link2 IN VARCHAR2,
		Link2Text IN VARCHAR2,
		Link3 IN VARCHAR2,
		Link3Text IN VARCHAR2,
		Notes IN CLOB,
		UserId IN NUMBER,
        IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "SBSAdmin" SET        		
		"Title" = Title,
		"Content" = Content,
		"BuilderWorxFileLink" = BuilderWorxFileLink,
		"BuilderWorxFileLinkText" = BuilderWorxFileLinkText,
		"ReleaseNotesFileLink" = ReleaseNotesFileLink,
		"ReleaseNotesFileLinkText" = ReleaseNotesFileLinkText,
		"Link1" = Link1,
		"Link1Text" = Link1Text,
		"Link2" = Link2,
		"Link2Text" = Link2Text,
		"Link3" = Link3,
		"Link3Text" = Link3Text,
		"Notes" = Notes,
		"ModifiedBy" = UserId,
		"ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "CompanyId" = CompanyId
 WHERE 
        "SBSAdminId"=SBSAdminId; 
END SBSAdmin_Update;
/