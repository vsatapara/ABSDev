CREATE OR REPLACE PROCEDURE abs_mdi."TOOLS_PROJECTNOTES_CREATE" (
/*
Created By: Yasin Mangroliya
Created Date: 23-08-2021
Description: This procedure is  used to insert  ProjectNotes Data
*/
    ProjectId             IN   NUMBER,
    NotesContent          IN   NCLOB,
    UserId                IN   VARCHAR2,
    IpAddress             IN   VARCHAR2,
    OutputId              OUT  NUMBER) AS 
BEGIN
   INSERT INTO "Tools_ProjectNotes" (
    "ProjectId",
    "NotesContent",
    "CreatedBy",
    "CreatedDate",
    "IpAddress"
   ) 
    VALUES (  
      ProjectId,
      NotesContent,
      UserId,
      CURRENT_TIMESTAMP,
      IpAddress
     ) RETURNING "ProjectNotesId" INTO OutputId;
END TOOLS_PROJECTNOTES_CREATE;
/