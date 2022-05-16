CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTNOTE_UPDATE" 
/*   Created By Ashlesha Diwate
      Created Date  18 -3-2021
      Description   This stored Procedure used to update  data into ProjectNotes  */
(
ProjectNoteId IN NUMBER,
CustomerId IN NUMBER, 
Proj_Year IN NUMBER, 
Proj_Type IN VARCHAR2,
Proj_Key IN NUMBER,
Note IN CLOB,
IPADDRESS in VARCHAR2,
MODIFIEDBY IN NUMBER
)
AS 
BEGIN
  UPDATE "ProjectNotes" SET
        "CustomerId"=CustomerId,    
        "Year"=Proj_Year,
        "Type"=Proj_Type,
        "Key"=Proj_Key,
        "Note"=Note,
        "IPADDRESS"=IPADDRESS,        
        "MODIFIEDBY"=MODIFIEDBY,
        "MODIFIEDDATE"=CURRENT_TIMESTAMP
    WHERE "ProjectNoteId"=ProjectNoteId;
END PROJECTNOTE_UPDATE;
/