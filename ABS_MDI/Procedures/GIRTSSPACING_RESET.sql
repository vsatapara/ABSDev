CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSSPACING_RESET" 
(
    GirtSpacingId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
--Update GirtSpacing
    UPDATE "Input_GirtsBaySpacing"
    SET
        "SW1Style"=2,
        "SW2Style"=2,
        "EW1Style"=2,
        "EW2Style"=2,
        "RoofPurlinStyle"=2,
        "SW1Depth"=1,
        "SW2Depth"=1,
        "EW1Depth"=1,
        "EW2Depth"=1,
        "RoofPurlinDepth"=1,
        "SW1Optimize"='',
        "SW2Optimize"='',
        "EW1Optimize"='',
        "EW2Optimize"='',
        "RoofPurlinOptimize"='',
        "RoofBaySpacing"=0,
        "WallBaySpacing"='System Standard',
        "GirtSpacing"='System Standard',
        "PurlinSpacing"='System Standard',
        "LBPMinDepth"=0,
        "LBPMaxDepth"=0,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP
    WHERE "GirtSpacingId" = GirtSpacingId;
--Delete Roof
    DELETE FROM "Input_Bays" 
    WHERE "BuildingInformationId"= (SELECT "BuildingInformationId" FROM "Input_GirtsBaySpacing" WHERE "GirtSpacingId"=GirtSpacingId);
--Update Girt/Delete GirtSpecified
    UPDATE "Input_GirtsBaySpacing_Girt"
    SET
        "SW1Type"='System Standard',
        "SW2Type"='System Standard',
        "EW1Type"='System Standard',
        "EW2Type"='System Standard'
    WHERE "GirtSpacingId"=GirtSpacingId;
    DELETE FROM "Input_GirtsBaySpacing_GirtSpecified" 
    WHERE "GirtBaySpaceId"= (SELECT "GirtBaySpaceId" FROM "Input_GirtsBaySpacing_Girt" WHERE "GirtSpacingId"=GirtSpacingId);
--Delete Wall    
    DELETE FROM "Input_GirtsBaySpacing_Wall" 
    WHERE  "GirtSpacingId" = GirtSpacingId;
--Delete Purlin    
    DELETE FROM "Input_GirtsBaySpacing_Purlin" 
    WHERE  "GirtSpacingId" = GirtSpacingId;
END GirtsSpacing_Reset;
/