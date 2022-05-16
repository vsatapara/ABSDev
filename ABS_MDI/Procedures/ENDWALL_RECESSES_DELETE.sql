CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_RECESSES_DELETE" 
(
BuildingNo IN NUMBER,
EndWallID IN VARCHAR,
UserId IN NUMBER,
IpAddress IN VARCHAR
)
AS 
BEGIN
    UPDATE "Input_Endwalls_Recesses" SET 
     "IsDeleted" = 'Y',
     "ModifiedBy" = UserId,
     "ModifiedDate" = CURRENT_TIMESTAMP,
     "IpAddress" = IpAddress
    WHERE "BuildingNo" = BuildingNo AND "EndWallID" = EndWallID;
END ENDWALL_RECESSES_DELETE;
/