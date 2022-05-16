CREATE OR REPLACE PROCEDURE abs_mdi."DDP_LOCTEMPLATE_UPDATE" 
/*   Created By Ashlesha Diwate
      Created Date   27-4-2021
      Description   This stored Procedure used to update data  DDP_LOCTEMPLATES table  */
(
    V_LOCTemplateId IN NUMBER,
    V_DescriptionOFLOC IN NCLOB,
    V_UserId IN NUMBER,
    V_IPAddress IN VARCHAR2
)
AS
BEGIN
        UPDATE  DDP_LOCTEMPLATES SET
                DESCRIPTION = V_DescriptionOFLOC,
                MODIFIEDBY = V_UserId,
                MODIFIEDDATE = CURRENT_TIMESTAMP,
                IPADDRESS = V_IPAddress
        WHERE LOCTEMPLATEID = V_LOCTemplateId;
  
END DDP_LOCTEMPLATE_UPDATE;
/