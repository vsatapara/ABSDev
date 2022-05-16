CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_CREATE" 
(
ElevationType IN VARCHAR,
EndWallNo IN Number,
ProjectId IN Number,
BuildingNo IN NUMBER,
FrameType IN VARCHAR,
ColumnSpacingType IN VARCHAR,
InsulationTrim IN VARCHAR,
NonStandardSetback IN VARCHAR,
DesignedSetback IN NUMBER,
SpecifiedSetback IN VARCHAR,
GableFlash IN NUMBER,
UserId IN NUMBER,
IpAddress IN VARCHAR,
BayCount IN NUMBER,
OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "Input_Endwall"
    (
     "ElevationType",
     "EndWallNo",
     "ProjectId",
     "BuildingNo",
     "FrameType",
     "CreatedBy",
     "CreatedDate",
     "IpAddress","ColumnSpacingType","NonStandardSetback","DesignedSetback","SpecifiedSetback","BayCount","InsulationTrim","IsDeleted",
     "GableFlash") 
    VALUES 
    (
     ElevationType,
     EndWallNo,
     ProjectId,
     BuildingNo,
     FrameType,
     UserId,
     CURRENT_TIMESTAMP,
     IpAddress,ColumnSpacingType,NonStandardSetback,DesignedSetback,SpecifiedSetback,BayCount,InsulationTrim,'N',
     GableFlash)
    RETURNING "EndWallID" into OutputId;
END ENDWALL_CREATE;
/