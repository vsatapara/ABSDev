CREATE OR REPLACE PROCEDURE abs_mdi."SBSADMIN_CREATE" 
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
        IpAddress IN VARCHAR2,
        OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "SBSAdmin"
    (
        "SBSAdminId",
        "CompanyId",
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
		"Notes",
		"CreatedBy",
		"CreatedDate",
        "IpAddress"
    ) 
    VALUES 
    (
        SBSAdminId,
        CompanyId,
		Title,
		Content,
		BuilderWorxFileLink,
		BuilderWorxFileLinkText,
		ReleaseNotesFileLink,
		ReleaseNotesFileLinkText,
		Link1,
		Link1Text,
		Link2,
		Link2Text,
		Link3,
		Link3Text,
		Notes,
		UserId,
		CURRENT_TIMESTAMP,
        IpAddress
    )
    RETURNING "SBSAdminId" into OutputId;
    
END SBSAdmin_Create;
/