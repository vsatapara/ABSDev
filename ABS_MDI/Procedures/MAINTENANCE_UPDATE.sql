CREATE OR REPLACE PROCEDURE abs_mdi."MAINTENANCE_UPDATE" 
(
    MaintenanceId IN NUMBER,
    FromDate IN VARCHAR2,
    ToDate IN VARCHAR2,
    IsActive IN CHAR,
    Content IN NCLOB,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "Maintenance" SET
        "FromDate"=TO_DATE(FromDate,'MM/DD/YYYY HH24:MI:SS'),
        "ToDate"=TO_DATE(ToDate,'MM/DD/YYYY HH24:MI:SS'),
        "IsActive"=IsActive,
        "Content"=Content,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "MaintenanceId"=MaintenanceId;
    
END Maintenance_Update;
/