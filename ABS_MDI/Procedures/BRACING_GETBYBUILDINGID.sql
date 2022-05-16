CREATE OR REPLACE PROCEDURE abs_mdi."BRACING_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "BracingId",
    "BuildingNumber",
    "SW1BracingType",
    "SW1Tiers",
    "SW1BracingLocations",
    "SW1UnbraceableLocations",
    "SW1ExcludeDiaphragm",
    "SW2BracingType",
    "SW2Tiers",
    "SW2BracingLocations",
    "SW2UnbraceableLocations",
    "SW2ExcludeDiaphragm",
    "EW3BracingType",
    "EW3Tiers",
    "EW3BracingLocations",
    "EW3UnbraceableLocations",
    "EW3ExcludeDiaphragm",
    "EW4BracingType",
    "EW4Tiers",
    "EW4BracingLocations",
    "EW4UnbraceableLocations",
    "EW4ExcludeDiaphragm",
    "RoofBracingType",
    "RoofBracingLocations",
    "RoofUnbraceableLocations",
    "RoofExcludeDiaphragm",
    "Purlins",
    "Girts",
    "ErectionRods",
    "AllowTorsion",
    "ErectionBayWidth",
    "RafterFlangeBrace",
    "ColumnFlangeBrace",
    "SW1PFrameType",
    "SW1PFrameHeight",
    "SW2PFrameType",
    "SW2PFrameHeight",
    "SW1FBBCRight",
    "SW2FBBCRight",
    "SW1Girts",
    "SW2Girts",
    "EW3Girts",
    "EW4Girts",
    "EW3PFrameType",
    "EW3PFrameHeight",
    "EW4PFrameType",
    "EW4PFrameHeight",
    "OverrideFlangeBraceRoof",
    "OverrideFlangeBraceWall",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "IsDelete",
    "IpAddress",
    "ModifiedDate",
    "BuildingInformationId",
    "LBPBracingLocation",
    "IsReset"
FROM
    "Bracing"
                WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END;
/