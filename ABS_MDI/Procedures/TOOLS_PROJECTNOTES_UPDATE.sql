CREATE OR REPLACE PROCEDURE abs_mdi."TOOLS_PROJECTNOTES_UPDATE" (
/*
Created By: Yasin Mangroliya
Created Date: 23-08-2021
Description: This procedure is  used to Update  ProjectNotes Data
*/
    ProjectNotesId        IN   NUMBER,
    ProjectId             IN   NUMBER,
    NotesContent          IN   NCLOB,
    UserId                IN   VARCHAR2,
    IpAddress             IN   VARCHAR2
   ) AS
BEGIN
    UPDATE "Tools_ProjectNotes" 
    SET
    "NotesContent"=NotesContent,
    "ModifiedBy"=UserId,
    "ModifiedDate"=CURRENT_TIMESTAMP,
    "IpAddress"=IpAddress
    WHERE
        "ProjectNotesId" = ProjectNotesId AND "ProjectId"=ProjectId;
END TOOLS_PROJECTNOTES_UPDATE;
/