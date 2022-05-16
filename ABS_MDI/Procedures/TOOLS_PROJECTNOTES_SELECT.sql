CREATE OR REPLACE PROCEDURE abs_mdi."TOOLS_PROJECTNOTES_SELECT" (
/*
Created By: Yasin Mangroliya
Created Date: 23-08-2021
Description: This procedure is  used to Get  ProjectNotes Data
*/
    ProjectId IN   NUMBER,
    ProjectNotes_Data  OUT  SYS_REFCURSOR
    )
AS 
BEGIN
    OPEN ProjectNotes_Data  FOR SELECT
                                "ProjectNotesId",
                                "ProjectId",
                                "NotesContent"  
                         FROM
                             "Tools_ProjectNotes" 
                         WHERE
                                 "ProjectId" = ProjectId;
END TOOLS_PROJECTNOTES_SELECT;
/