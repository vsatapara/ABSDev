CREATE OR REPLACE PROCEDURE abs_mdi."SUPPORTBEAMS_GETBYBUILDINGID" 
(
    BuildingNumber IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
   	"SupportBeamsId",
	"BuildingNumber",
	"Elevation",
	"BeamStartCol",
	"BeamStopCol",
	"BeamHeight",
	"BeamFlanges",
	"BeamWebThick",
	"BeamWebDepth",
	"BeamFlangeThick",
	"BeamFlangeWidth",
	"MaterialWeight",
	"MaterialThickness",
	"BeamDeflection",
	"BeamAttachmentSpacing",
	"BeamSteelline",
	"BeamSection",
	"BeamWeight",
	"BeamPrice",
	"BeamIsPriced",
	"BeamErrorCode"
FROM
    "SupportBeams"
     WHERE
                "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';
END;
/