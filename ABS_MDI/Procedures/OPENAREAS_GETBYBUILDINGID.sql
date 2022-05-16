CREATE OR REPLACE PROCEDURE abs_mdi."OPENAREAS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "Id",
    "BuildingNumber",
    "Elevation",
    "BayNumber",
    "DistFromLeftCorner",
    "DistFromLeftColumn",
    "OpeningType",
    "OpenEndwall",
    "OpeningWidth",
    "OpeningHeight",
    "MaterialType",
    "MaterialWeight",
    "MaterialThickness",
    "DistSteelLinetoBeam",
    "DistSteelLinetoMaterial",
    "MasonryType",
    "MaterialDirection",
    "ShearWall",
    "PercentOpenforWind",
    "LeftJamb",
    "LeftJambFlash",
    "LeftJambFlangeWidth",
    "LeftJambFlangeThick",
    "LeftJambWebDepth",
    "LeftJambWebThick",
    "RightJamb",
    "RightJambFlash",
    "RightJambFlangeWidth",
    "RightJambFlangeThick",
    "RightJambWebDepth",
    "RightJambWebThick",
    "HeaderFlash",
    "HeaderFlashType",
    "HeaderFlashColor",
    "AttachmentNumber",
    "AllowableDrift",
    "BeamSelected",
    "BeamStartCol",
    "BeamStopCol",
    "BeamHeight",
    "BeamFlanges",
    "BeamWebThick",
    "BeamWebDepth",
    "BeamFlangeThick",
    "BeamFlangeWidth",
    "BeamDeflection",
    "BeamAttachmentSpacing",
    "BeamSteelline",
    "BeamSection",
    "BeamWeight",
    "BeamPrice",
    "BeamIsPriced",
    "BeamErrorCode",
    "LedgerAngle",
    "AllElevations",
    "ColumnBracing",
    "NoOutsideColumns",
    "PanelsSpan",
    "NoFlangeBelow",
    "AllowableInsulation",
    "PartitionNumber",
    "DeductPanelsTrimOnly",
    "FullWidth",
    "ParapetByOther",
    "HeaderFlashColorValsparCode",
    "HeaderFlashColorSpecialName",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted"
FROM
    "OpenAreas"
    WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/