CREATE OR REPLACE PROCEDURE abs_mdi."DDP_DESIGNPACKAGECHECKLIST_SAVE" 
/*   Created By Dnyaneshwar Kuchekar  
      Created Date   2-3-2021
      Description   This stored Procedure used to insert data to DDP_DESIGNPACKAGECHECKLIST table  */
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
    V_CreatedBy IN NUMBER,
    --V_CreatedDate IN TIMESTAMP, 
    --V_ModifiedBy IN NUMBER,
    --V_ModifiedDate IN TIMESTAMP, 
    V_IpAddress IN VARCHAR2,
    V_DDPSSERVERID IN NUMBER,
    OutputId OUT NUMBER
)
 AS    
BEGIN
    INSERT INTO DDP_DESIGNPACKAGECHECKLIST(
        JOBNUMBER,
        PROJECTENGINEERINITIAL,
        CHECKINGENGINEERINITIAL,
        PROJECTENGINEERDATE,
        CHECKINGENGINEERDATE,
        RTODWITHNOCHANGES,
        CHANGESANDRTOD,
        CHANGESANDRESUBMITFORRECHECK,
        CONTACTMEFORFURTHERDISCUSSION,
        CREATEDBY,
        CREATEDDATE,
        --MODIFIEDBY,
        --MODIFIEDDATE,
        IPADDRESS,
        DDPSSERVERID
   )    
    VALUES(
        V_JobNumber,
        V_ProjectEngineerInitial,
        V_CheckingEngineerInitial,
        --TO_DATE(ProjectEngineerDate,'MM/DD/YYYY'),
        --TO_DATE(CheckingEngineerDate,'MM/DD/YYYY'), 
        V_ProjectEngineerDate,
        V_CheckingEngineerDate,
        V_RTODWithNoChanges,
        V_ChangesAndRToD,
        V_ChangesAndResubmitForRecheck,
        V_ContactMeForFurtherDiscussion,
        V_CreatedBy,
        CURRENT_TIMESTAMP,
        --V_ModifiedBy,
        --V_ModifiedDate,
        V_IpAddress,
        V_DDPSSERVERID
   )
    RETURNING ID into OutputId;      
END DDP_DESIGNPACKAGECHECKLIST_SAVE;
/