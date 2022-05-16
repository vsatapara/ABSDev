CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_RECESSES_UPDATE" 
(
BuildingNo IN NUMBER,
EWRType IN VARCHAR,
RecessNo IN NUMBER,
Recesses IN VARCHAR,
UserId IN NUMBER,
IpAddress IN VARCHAR,
EWRID IN NUMBER
)
AS 
BEGIN
    UPDATE "Input_Endwalls_Recesses" SET 
     "BuildingNo" = BuildingNo,
     "EWRType" = EWRType,
     "RecessNo" = RecessNo,
     "Recesses" = case when Recesses = '' then '0' else NVL(Recesses,'0') end,
     "ModifiedBy" = UserId,
     "ModifiedDate" = CURRENT_TIMESTAMP,
     "IpAddress" = IpAddress
    WHERE "EWRID" = EWRID;
END ENDWALL_RECESSES_UPDATE;
/