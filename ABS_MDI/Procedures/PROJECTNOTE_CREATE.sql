CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTNOTE_CREATE" 
/*   Created By Ashlesha Diwate
      Created Date  18 -3-2021
      Description   This stored Procedure used to insert  data into ProjectNotes  */
(
 CustomerId IN NUMBER, 
Proj_Year IN NUMBER, 
Proj_Type IN VARCHAR2,
Proj_Key IN NUMBER,
Note IN CLOB,
IPADDRESS IN VARCHAR2,
CREATEDBY IN NUMBER,
OutputId OUT NUMBER
)
AS
BEGIN
 INSERT INTO "ProjectNotes"
     (    
    "CustomerId",
     "Year",
     "Type",
      "Key",
     "Note", 
   "IPADDRESS" ,
     "CREATEDBY",
    "CREATEDDATE",
    "MODIFIEDBY",
    "MODIFIEDDATE"
    
       )
         VALUES
     (
        CustomerId,  
        Proj_Year,
        Proj_Type,
        Proj_Key,
        Note,
        IPADDRESS,
        CREATEDBY,
        CURRENT_TIMESTAMP,
        null,
        null
        
        )
    RETURNING "ProjectNoteId" into OutputId;
END PROJECTNOTE_CREATE;
/