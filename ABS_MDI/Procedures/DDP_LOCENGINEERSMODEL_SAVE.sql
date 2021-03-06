CREATE OR REPLACE PROCEDURE abs_mdi."DDP_LOCENGINEERSMODEL_SAVE" 
/*   Created By Mayuresh Jagtap
      Created Date   30-11-2021
      Description   This stored Procedure used to insert data to DDP_LOCEngineer table  */
(
    V_JOBNUMBER IN VARCHAR2,
    V_DDPSERVERID IN NUMBER,
    V_PROJENG_INITIAL  IN VARCHAR2,
    V_PROJENG_NAME  IN VARCHAR2,
    V_CHECKENG_INITIAL  IN VARCHAR2,
    V_CHECKENG_NAME  IN VARCHAR2,
    V_SEALENG_INITIAL  IN VARCHAR2,
    V_SEALENG_NAME  IN VARCHAR2,
    V_CREATEDBY IN NUMBER,
    V_IPADDRESS IN VARCHAR2,
    OutputId OUT NUMBER
)
 AS    
BEGIN
INSERT INTO DDP_LOC_ENGINEERS (
    DDPSERVERID,
    JOBNUMBER,
    PROJENG_INITIAL,
    PROJENG_NAME,
    CHECKENG_INITIAL,
    CHECKENG_NAME,
    SEALENG_INITIAL,
    SEALENG_NAME,
    CREATEDBY,
    CREATEDDATE,
    IPADDRESS
) VALUES (
    V_DDPSERVERID,
    V_JOBNUMBER,
    V_PROJENG_INITIAL,
    V_PROJENG_NAME,
    V_CHECKENG_INITIAL,
    V_CHECKENG_NAME,
    V_SEALENG_INITIAL,
    V_SEALENG_NAME,
    V_CREATEDBY,
    CURRENT_TIMESTAMP,
    V_IPADDRESS 
)
 RETURNING LOC_ENGINEERS_ID into OutputId; 
END DDP_LOCENGINEERSMODEL_SAVE;
/