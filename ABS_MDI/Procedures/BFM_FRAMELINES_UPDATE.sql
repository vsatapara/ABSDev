CREATE OR REPLACE PROCEDURE abs_mdi."BFM_FRAMELINES_UPDATE" 
(
    FrameLineNumber IN NUMBER,
    BuildingNumber IN NUMBER,
    GroupNumber IN NUMBER,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "BFM_FrameLines" SET
        "FrameLineNumber"=FrameLineNumber,
        "BuildingNumber"=BuildingNumber,
        "GroupNumber"=GroupNumber,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "FrameLineNumber" = FrameLineNumber;
END BFM_FRAMELINES_UPDATE;
/