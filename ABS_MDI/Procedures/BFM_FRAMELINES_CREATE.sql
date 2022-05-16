CREATE OR REPLACE PROCEDURE abs_mdi."BFM_FRAMELINES_CREATE" 
(
    BuildingNumber IN VARCHAR2,
    GroupNumber IN NUMBER,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "BFM_FrameLines"
     (
        "BuildingNumber",
        "GroupNumber",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     ) 
     VALUES
     (
        BuildingNumber,
        GroupNumber,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
)
  RETURNING "FrameLineNumber" into OutputId;
END BFM_FRAMELINES_CREATE;
/