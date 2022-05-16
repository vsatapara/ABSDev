CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_FACADE_UPDATE" (
/*   Created By    Dipali Patel    
     Created Date  25-08-2021
     Description   This stored Procedure used to Update Accessories_Facade.
*/
    FacadeId                        IN NUMBER,    
    ProjectId	                    IN NUMBER,
    BuildingInformationId	        IN NUMBER,
    Elevation	                    IN VARCHAR2,
    StartCol	                    IN NUMBER,
    StopCol	                        IN NUMBER,
    DistFromLeftCorner	            IN NUMBER,
    Length	                        IN NUMBER,
    Type	                        IN VARCHAR2,
    Projection	                    IN NUMBER,
    Height	                        IN NUMBER,
    Gutter	                        IN CHAR,
    Slant	                        IN NUMBER,
    PanelType	                    IN VARCHAR2,
    PanelGauge	                    IN NUMBER,
    PanelFinish	                    IN VARCHAR2,
    SoffitPanelType	                IN VARCHAR2,
    SoffitPanelGauge	            IN NUMBER,
    SoffitPanelFinish	            IN VARCHAR2,
    FacadePanel	                    IN CHAR,
    SoffitPanel	                    IN CHAR,
    SoffitElevation	                IN NUMBER,
    BackPanelType	                IN VARCHAR2,
    BackPanelGauge	                IN NUMBER,
    BackPanelColor	                IN VARCHAR2,
    SillCapTrim	                    IN VARCHAR2,
    CornerTrim	                    IN VARCHAR2,
    SoffitTrim	                    IN VARCHAR2,
    FacadeFacingSpecial	            IN NUMBER,
    FacadeFacingWeight	            IN NUMBER,
    FacadeFacingDeflection	        IN NUMBER,
    SoffitFacingSpecial	            IN NUMBER,
    SoffitFacingWeight	            IN NUMBER,
    SoffitFacingDeflection	        IN NUMBER,
    ReverseRollFace	                IN NUMBER,
    ReverseRollBack	                IN NUMBER,
    ReverseRollSoffit	            IN NUMBER,
    PanelFinishValsparCode	        IN VARCHAR2,
    PanelFinishSpecialName	        IN VARCHAR2,
    SoffitPanelFinishValsparCode	IN VARCHAR2,
    SoffitPanelFinishSpecialName	IN VARCHAR2,
    BackPanelColorValsparCode	    IN VARCHAR2,
    BackPanelColorSpecialName	    IN VARCHAR2,
    SillCapTrimValsparCode	        IN VARCHAR2,
    SillCapTrimSpecialName	        IN VARCHAR2,
    CornerTrimValsparCode	        IN VARCHAR2,
    CornerTrimSpecialName	        IN VARCHAR2,
    SoffitTrimValsparCode	        IN VARCHAR2,
    SoffitTrimSpecialName	        IN VARCHAR2,
    UserId                          IN NUMBER DEFAULT NULL,
    IpAddress                       IN VARCHAR2
) AS
BEGIN
    UPDATE "Accessories_Facade"
    SET
        "ProjectId"=ProjectId,
        "BuildingInformationId" =BuildingInformationId,
        "Elevation"=Elevation,
        "StartCol"=StartCol,
        "StopCol"=StopCol,
        "DistFromLeftCorner"=DistFromLeftCorner,
        "Length"=Length,
        "Type"=Type,
        "Projection"=Projection,
        "Height"=Height,
        "Gutter"=Gutter,
        "Slant"=Slant,
        "PanelType"=PanelType,
        "PanelGauge"=PanelGauge,
        "PanelFinish"=PanelFinish,
        "SoffitPanelType"=SoffitPanelType,
        "SoffitPanelGauge"=SoffitPanelGauge,
        "SoffitPanelFinish"=SoffitPanelFinish,
        "FacadePanel"=FacadePanel,
        "SoffitPanel"=SoffitPanel,
        "SoffitElevation"=SoffitElevation,
        "BackPanelType"=BackPanelType,
        "BackPanelGauge"=BackPanelGauge,
        "BackPanelColor"=BackPanelColor,
        "SillCapTrim"=SillCapTrim,
        "CornerTrim"=CornerTrim,
        "SoffitTrim"=SoffitTrim,
        "FacadeFacingSpecial"=FacadeFacingSpecial,
        "FacadeFacingWeight"=FacadeFacingWeight,
        "FacadeFacingDeflection"=FacadeFacingDeflection,
        "SoffitFacingSpecial"=SoffitFacingSpecial,
        "SoffitFacingWeight"=SoffitFacingWeight,
        "SoffitFacingDeflection"=SoffitFacingDeflection,
        "ReverseRollFace"=ReverseRollFace,
        "ReverseRollBack"=ReverseRollBack,
        "ReverseRollSoffit"=ReverseRollSoffit,
        "PanelFinishValsparCode"=PanelFinishValsparCode,
        "PanelFinishSpecialName"=PanelFinishSpecialName,
        "SoffitPanelFinishValsparCode"=SoffitPanelFinishValsparCode,
        "SoffitPanelFinishSpecialName"=SoffitPanelFinishSpecialName,
        "BackPanelColorValsparCode"=BackPanelColorValsparCode,
        "BackPanelColorSpecialName"=BackPanelColorSpecialName,
        "SillCapTrimValsparCode"=SillCapTrimValsparCode,
        "SillCapTrimSpecialName"=SillCapTrimSpecialName,
        "CornerTrimValsparCode"=CornerTrimValsparCode,
        "CornerTrimSpecialName"=CornerTrimSpecialName,
        "SoffitTrimValsparCode"=SoffitTrimValsparCode,
        "SoffitTrimSpecialName"=SoffitTrimSpecialName,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "FacadeId" = FacadeId;
END ACCESSORIES_FACADE_UPDATE;
/