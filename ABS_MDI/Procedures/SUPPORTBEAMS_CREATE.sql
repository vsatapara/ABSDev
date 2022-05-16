CREATE OR REPLACE PROCEDURE abs_mdi."SUPPORTBEAMS_CREATE" 
(       
/*   Created By    Hiren Prajapati    
     Created Date  01-09-2021
     Description   This stored Procedure used to Insert SupportBeams.
*/
    BuildingNumber IN NUMBER,
    Elevation IN VARCHAR2,
    BeamStartCol IN NUMBER,
    BeamStopCol IN NUMBER,
    BeamHeight IN NUMBER,
    BeamFlanges IN  NUMBER,
    BeamWebThick IN NUMBER,
    BeamWebDepth IN NUMBER,
    BeamFlangeThick IN NUMBER,
    BeamFlangeWidth IN NUMBER,
    MaterialWeight IN NUMBER,
    MaterialThickness IN NUMBER,
    BeamDeflection IN NUMBER,
    BeamAttachmentSpacing IN NUMBER,
    BeamSteelline IN NUMBER,
    BeamSection IN VARCHAR2,
    BeamWeight IN NUMBER,
    BeamPrice IN NUMBER,
    BeamIsPriced IN NUMBER,
    BeamErrorCode IN NUMBER,
    IpAddress IN VARCHAR2,
    CreatedBy IN NUMBER
)
AS 
BEGIN          
INSERT INTO "SupportBeams" (
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
    "BeamErrorCode",
    "IsDelete",
    "IpAddress",
    "CreatedBy",
    "CreatedDate"
) VALUES (
    BuildingNumber,
    Elevation,
    BeamStartCol,
    BeamStopCol,
    BeamHeight,
    BeamFlanges,
    BeamWebThick,
    BeamWebDepth,
    BeamFlangeThick,
    BeamFlangeWidth,
    MaterialWeight,
    MaterialThickness,
    BeamDeflection,
    BeamAttachmentSpacing,
    BeamSteelline,
    BeamSection,
    BeamWeight,
    BeamPrice,
    BeamIsPriced,
    BeamErrorCode,
    'N',
    IpAddress,
    CreatedBy,
    CURRENT_TIMESTAMP
);
END SUPPORTBEAMS_CREATE;
/