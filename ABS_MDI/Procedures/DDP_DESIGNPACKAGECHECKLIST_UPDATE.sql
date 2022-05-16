CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DESIGNPACKAGECHECKLIST_UPDATE" 
/*   Created By Dnyaneshwar Kuchekar  
      Created Date   2-3-2021
      Description   This stored Procedure used to update data to DDP_DESIGNPACKAGECHECKLIST table  */
(
    V_JobNumber IN VARCHAR2,
    V_ProjectEngineerInitial IN VARCHAR2,
    V_CheckingEngineerInitial IN VARCHAR2,
    V_ProjectEngineerDate IN VARCHAR2,
    V_CheckingEngineerDate IN VARCHAR2,
    V_RTODWithNoChanges IN CHAR,
    V_ChangesAndRToD IN CHAR,
    V_ChangesAndResubmitForRecheck IN CHAR,
    V_ContactMeForFurtherDiscussion IN CHAR, 
    V_ModifiedBy IN NUMBER,
    V_IpAddress IN VARCHAR2,
    V_DDPSSERVERID IN NUMBER
)
 AS    
BEGIN
    UPDATE DDP_DESIGNPACKAGECHECKLIST
        SET PROJECTENGINEERINITIAL = V_ProjectEngineerInitial,
        CHECKINGENGINEERINITIAL = V_CheckingEngineerInitial,
        PROJECTENGINEERDATE = V_ProjectEngineerDate,
        CHECKINGENGINEERDATE = V_CheckingEngineerDate,
        RTODWITHNOCHANGES = V_RTODWithNoChanges,
        CHANGESANDRTOD = V_ChangesAndRToD,
        CHANGESANDRESUBMITFORRECHECK = V_ChangesAndResubmitForRecheck,
        CONTACTMEFORFURTHERDISCUSSION = V_ContactMeForFurtherDiscussion,
        MODIFIEDBY = V_ModifiedBy,
        MODIFIEDDATE = CURRENT_TIMESTAMP,
        IPADDRESS = V_IpAddress,
        DDPSSERVERID = V_DDPSSERVERID
    WHERE LOWER(JOBNUMBER) = LOWER(V_JobNumber) and DDPSSERVERID = V_DDPSSERVERID;   
END DDP_DESIGNPACKAGECHECKLIST_UPDATE;
/