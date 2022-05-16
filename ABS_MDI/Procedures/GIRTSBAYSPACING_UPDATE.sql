CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_UPDATE" 
(
    GirtSpacingId IN NUMBER,
    BuildingInformationId IN NUMBER,
    SW1Style IN NUMBER,
    SW2Style IN NUMBER,
    EW1Style IN NUMBER,
    EW2Style IN NUMBER,
    RoofPurlinStyle IN NUMBER,
    SW1Depth IN NUMBER,
    SW2Depth IN NUMBER,
    EW1Depth IN NUMBER,
    EW2Depth IN NUMBER,
    RoofPurlinDepth IN NUMBER,
    SW1Optimize IN CHAR DEFAULT 'N',
    SW2Optimize IN CHAR DEFAULT 'N',
    EW1Optimize IN CHAR DEFAULT 'N',
    EW2Optimize IN CHAR DEFAULT 'N',
    RoofPurlinOptimize IN CHAR DEFAULT 'N',
    RoofBaySpacing IN NUMBER,
    WallBaySpacing IN VARCHAR2 DEFAULT NULL,
    GirtSpacing IN VARCHAR2 DEFAULT NULL,
    PurlinSpacing IN VARCHAR2 DEFAULT NULL,
    LBPMinDepth IN FLOAT,
    LBPMaxDepth IN FLOAT,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    OptimizePurlin IN NUMBER DEFAULT 0
)
AS 
BEGIN
    UPDATE "Input_GirtsBaySpacing"
    SET
        "BuildingInformationId"=BuildingInformationId,
        "SW1Style"=SW1Style,
        "SW2Style"=SW2Style,
        "EW1Style"=EW1Style,
        "EW2Style"=EW2Style,
        "RoofPurlinStyle"=RoofPurlinStyle,
        "SW1Depth"=SW1Depth,
        "SW2Depth"=SW2Depth,
        "EW1Depth"=EW1Depth,
        "EW2Depth"=EW2Depth,
        "RoofPurlinDepth"=RoofPurlinDepth,
        "SW1Optimize"=SW1Optimize,
        "SW2Optimize"=SW2Optimize,
        "EW1Optimize"=EW1Optimize,
        "EW2Optimize"=EW2Optimize,
        "RoofPurlinOptimize"=RoofPurlinOptimize,
        "RoofBaySpacing"=RoofBaySpacing,
        "WallBaySpacing"=WallBaySpacing,
        "GirtSpacing"=GirtSpacing,
        "PurlinSpacing"=PurlinSpacing,
        "LBPMinDepth"=LBPMinDepth,
        "LBPMaxDepth"=LBPMaxDepth,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress,
        "OptimizePurlin" = OptimizePurlin
    WHERE "GirtSpacingId" = GirtSpacingId;
END GirtsBaySpacing_Update;
/