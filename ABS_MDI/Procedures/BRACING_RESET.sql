CREATE OR REPLACE PROCEDURE abs_mdi."BRACING_RESET" 
(
    BracingId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
--Update Bracing
    UPDATE "Bracing"
    SET
        "SW1BracingType"=null,
        "SW1Tiers"=null,
        "SW1BracingLocations"=null,
        "SW1UnbraceableLocations"=null,
        "SW1ExcludeDiaphragm"=null,
        "SW2BracingType"=null,
        "SW2Tiers"=null,
        "SW2BracingLocations"=null,
        "SW2UnbraceableLocations"=null,
        "SW2ExcludeDiaphragm"=null,
        "EW3BracingType"=null,
        "EW3Tiers"=null,
        "EW3BracingLocations"=null,
        "EW3UnbraceableLocations"=null,
        "EW3ExcludeDiaphragm"=null,
        "EW4BracingType"=null,
        "EW4Tiers"=null,
        "EW4BracingLocations"=null,
        "EW4UnbraceableLocations"=null,
        "EW4ExcludeDiaphragm"=null,
        "RoofBracingType"=null,
        "RoofBracingLocations"=null,
        "RoofUnbraceableLocations"=null,
        "RoofExcludeDiaphragm"=null,
        "Purlins"=null,
        "Girts"=null,
        "ErectionRods"=null,
        "AllowTorsion"=null,
        "ErectionBayWidth"=null,
        "RafterFlangeBrace"=null,
        "ColumnFlangeBrace"=null,
        "SW1PFrameType"=null,
        "SW1PFrameHeight"=null,
        "SW2PFrameType"=null,
        "SW2PFrameHeight"=null,
        "SW1FBBCRight"=null,
        "SW2FBBCRight"=null,
        "SW1Girts"=null,
        "SW2Girts"=null,
        "EW3Girts"=null,
        "EW4Girts"=null,
        "EW3PFrameType"=null,
        "EW3PFrameHeight"=null,
        "EW4PFrameType"=null,
        "EW4PFrameHeight"=null,
        "OverrideFlangeBraceRoof"=null,
        "OverrideFlangeBraceWall"=null,
        "CreatedBy"=null,
        "CreatedDate"=null,
        "ModifiedBy"=UserId,
        "IsDelete"=null,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "LBPBracingLocation"=null,
        "IsReset" = 'Y'
    WHERE "BracingId" = BracingId;
--Update Sidewall Portalframe
    UPDATE "SideWallPortalFrame"
    SET
        "SW1Height"=null,
        "SW1HeightValue"=null,
        "SW1RodTiers"=null,
        "SW1WebDepthMaxColumn"=null,
        "SW1WebDepthMaxRafter"=null,
        "SW2Height"=null,
        "SW2HeightValue"=null,
        "SW2RodTiers"=null,
        "SW2WebDepthMaxColumn"=null,
        "SW2WebDepthMaxRafter"=null
    WHERE "BracingId" = BracingId;
--Update Endwall Portalframe
    UPDATE "EndWallPotalFrame"
    SET
        "EW3Height"=null,
        "EW3HeightValue"=null,
        "EW3RodTiers"=null,
        "EW3WebDepthMaxColumn"=null,
        "EW3WebDepthMaxRafter"=null,
        "EW4Height"=null,
        "EW4HeightValue"=null,
        "EW4RodTiers"=null,
        "EW4WebDepthMaxColumn"=null,
        "EW4WebDepthMaxRafter"=null
    WHERE "BracingId" = BracingId;
--Delete X Brace Anchor Locations    
    DELETE FROM "Bracing_XBraceAnchor" 
    WHERE  "BracingId" = BracingId;
END Bracing_Reset;
/