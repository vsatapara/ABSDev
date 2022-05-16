CREATE OR REPLACE PROCEDURE abs_mdi."BFM_MODULES_CREATE" 
(
    BuildingNumber IN VARCHAR2,
    GroupNumber IN VARCHAR2,
    Width IN VARCHAR2,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "BFM_Modules"
     (
        "BuildingNumber",
        "GroupNumber",
        "Width",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        BuildingNumber,
        GroupNumber,
        Width,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "ModuleNumber" into OutputId;
     
END BFM_MODULES_CREATE;
/