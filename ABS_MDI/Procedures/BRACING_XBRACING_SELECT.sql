CREATE OR REPLACE PROCEDURE abs_mdi."BRACING_XBRACING_SELECT" 
(
    BracingId IN NUMBER,
    Output_BracingData OUT SYS_REFCURSOR,
    Output_SideWallPortalData OUT SYS_REFCURSOR,
    Output_EndWallPortalData OUT SYS_REFCURSOR,
    Output_XBraceAnchorData OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_BracingData FOR 
    SELECT
        BC."BracingId",
        BC."BuildingNumber",
        BC."SW1BracingType",
        BC."SW1Tiers",
        BC."SW1BracingLocations",
        BC."SW1UnbraceableLocations",
        BC."SW1ExcludeDiaphragm",
        BC."SW2BracingType",
        BC."SW2Tiers",
        BC."SW2BracingLocations",
        BC."SW2UnbraceableLocations",
        BC."SW2ExcludeDiaphragm",
        BC."EW3BracingType",
        BC."EW3Tiers",
        BC."EW3BracingLocations",
        BC."EW3UnbraceableLocations",
        BC."EW3ExcludeDiaphragm",
        BC."EW4BracingType",
        BC."EW4Tiers",
        BC."EW4BracingLocations",
        BC."EW4UnbraceableLocations",
        BC."EW4ExcludeDiaphragm",
        BC."RoofBracingType",
        BC."RoofBracingLocations",
        BC."RoofUnbraceableLocations",
        BC."RoofExcludeDiaphragm",
        BC."Purlins",
        BC."Girts",
        BC."ErectionRods",
        BC."AllowTorsion",
        BC."ErectionBayWidth",
        BC."RafterFlangeBrace",
        BC."ColumnFlangeBrace",
        BC."SW1PFrameType",
        BC."SW1PFrameHeight",
        BC."SW2PFrameType",
        BC."SW2PFrameHeight",
        BC."SW1FBBCRight",
        BC."SW2FBBCRight",
        BC."SW1Girts",
        BC."SW2Girts",
        BC."EW3Girts",
        BC."EW4Girts",
        BC."EW3PFrameType",
        BC."EW3PFrameHeight",
        BC."EW4PFrameType",
        BC."EW4PFrameHeight",
        BC."OverrideFlangeBraceRoof",
        BC."OverrideFlangeBraceWall",
        BC."BuildingInformationId"
        FROM
        "Bracing" BC
        Where BC."BracingId" = BracingId;                
        
        OPEN Output_SideWallPortalData FOR 
    SELECT
        SP."PortalFrameId",
        SP."SW1Height",
        SP."SW1HeightValue",
        SP."SW1RodTiers",
        SP."SW1WebDepthMaxColumn",
        SP."SW1WebDepthMaxRafter",
        SP."SW2Height",
        SP."SW2HeightValue",
        SP."SW2RodTiers",
        SP."SW2WebDepthMaxColumn",
        SP."SW2WebDepthMaxRafter"
        FROM 
        "SideWallPortalFrame" SP
        where SP."BracingId" = BracingId;
    
    
        OPEN Output_EndWallPortalData FOR 
        SELECT
        EP."EndWallProtalFrameId",
        EP."EW3Height", 
        EP."EW3HeightValue", 
        EP."EW3RodTiers", 
        EP."EW3WebDepthMaxColumn", 
        EP."EW3WebDepthMaxRafter", 
        EP."EW4Height", 
        EP."EW4HeightValue", 
        EP."EW4RodTiers", 
        EP."EW4WebDepthMaxColumn", 
        EP."EW4WebDepthMaxRafter"
        FROM
        "EndWallPotalFrame" EP 
        where EP."BracingId" = BracingId;
        
        
        OPEN Output_XBraceAnchorData FOR 
        SELECT
        XB."XBraceAnchorId",
        XB."BayNumber",
        XB."DistFromLeftCornerLeft", 
        XB."DistFromLeftColumnLeft", 
        XB."DistFromLeftCornerRight", 
        XB."DistFromLeftColumnRight", 
        XB."LeftSteelLine",
        XB."Elevation"
        FROM
        "Bracing_XBraceAnchor" XB 
        where XB."BracingId" = BracingId;
END BRACING_XBRACING_SELECT;
/