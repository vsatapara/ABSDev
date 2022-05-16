CREATE OR REPLACE PROCEDURE abs_mdi."SUPPORTBEAMS_UPDATE" 
( 
/*   Created By    Hiren Prajapati    
     Created Date  03-09-2021
     Description   This stored Procedure used to Update SupportBeams.
*/     
    SupportBeamsId IN NUMBER,
    BuildingNumber IN NUMBER,
    Elevation IN VARCHAR2,
    BeamStartCol IN NUMBER,
    BeamStopCol IN NUMBER,
    BeamHeight IN NUMBER,
    BeamFlanges IN NUMBER,
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
    ModifiedBy IN NUMBER 
)
AS 
BEGIN
UPDATE "SupportBeams" SET     
    "BuildingNumber" = BuildingNumber,
    "Elevation" = Elevation,
    "BeamStartCol" = BeamStartCol,
    "BeamStopCol" = BeamStopCol,
    "BeamHeight" = BeamHeight,
    "BeamFlanges" = BeamFlanges,
    "BeamWebThick" = BeamWebThick,
    "BeamWebDepth" = BeamWebDepth,
    "BeamFlangeThick" = BeamFlangeThick,
    "BeamFlangeWidth" = BeamFlangeWidth,
    "MaterialWeight" = MaterialWeight,
    "MaterialThickness" = MaterialThickness,
    "BeamDeflection" = BeamDeflection,
    "BeamAttachmentSpacing" =BeamAttachmentSpacing,
    "BeamSteelline" = BeamSteelline,
    "BeamSection" = BeamSection,
    "BeamWeight" = BeamWeight,
    "BeamPrice" = BeamPrice,
    "BeamIsPriced" = BeamIsPriced,
    "BeamErrorCode" = BeamErrorCode,
    "IpAddress" = IpAddress,
    "ModifiedBy" = ModifiedBy,
    "ModifiedDate" = CURRENT_TIMESTAMP
 WHERE "SupportBeamsId" = SupportBeamsId;    
END SUPPORTBEAMS_UPDATE;
/