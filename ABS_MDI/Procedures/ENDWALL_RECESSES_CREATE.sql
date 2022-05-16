CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_RECESSES_CREATE" 
(
BuildingNo IN NUMBER,
EWRType IN VARCHAR,
RecessNo IN NUMBER,
Recesses IN VARCHAR,
UserId IN NUMBER,
IpAddress IN VARCHAR,
OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "Input_Endwalls_Recesses"
    (
     "BuildingNo",
     "EWRType",
     "RecessNo",
     "Recesses",
     "CreatedBy",
     "CreatedDate",
     "IpAddress"
     ) 
    VALUES 
    (
    BuildingNo,
    EWRType,
    RecessNo,
    case when Recesses = '' then '0' else NVL(Recesses,'0') end,
    UserId,
    CURRENT_TIMESTAMP,
    IpAddress
     )
    RETURNING "EWRID" into OutputId;
END ENDWALL_RECESSES_CREATE;
/