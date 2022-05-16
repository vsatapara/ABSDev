CREATE OR REPLACE PROCEDURE abs_mdi."MAINTENANCE_CREATE" 
(
    FromDate IN VARCHAR2,
    ToDate IN VARCHAR2,
    IsActive IN CHAR,
    Content IN NCLOB,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Maintenance"
     (
        "FromDate",
        "ToDate",
        "IsActive",
        "Content",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        TO_DATE(FromDate,'MM/DD/YYYY HH24:MI:SS'),
        TO_DATE(ToDate,'MM/DD/YYYY HH24:MI:SS'),
        IsActive,
        Content,
        'N',
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "MaintenanceId" into OutputId;
     
END Maintenance_Create;
/