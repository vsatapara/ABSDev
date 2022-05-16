CREATE OR REPLACE PROCEDURE abs_mdi."DDP_LOCTEMPLATE_SAVE" 
/*   Created By Ashlesha Diwate
      Created Date   27-4-2021
      Description   This stored Procedure used to insert into  DDP_LOCTEMPLATES table  */
(
    V_LOCTemplateId IN NUMBER,
    V_CategoryID IN NUMBER,
    V_DescriptionOFLOC IN NCLOB,
    V_UserId IN NUMBER,
    V_IPAddress IN VARCHAR2,
    OutputId OUT NUMBER
) AS 
BEGIN
   
    INSERT INTO DDP_LOCTEMPLATES(
    CATEGORYID,
    DESCRIPTION,
    CREATEDBY,
    CREATEDDATE,
    IPADDRESS
   
    )
    VALUES(
    V_CategoryID,
    V_DescriptionOFLOC,
    V_UserId,
    CURRENT_TIMESTAMP,
    V_IPAddress
    
    )
    RETURNING LOCTEMPLATEID into OutputId;
  
END DDP_LOCTEMPLATE_SAVE;
/