CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYPURLINEXTENSION_UPDATE" 
(
    PurlinExtensionId IN NUMBER DEFAULT 0,
    ProjectId IN NUMBER DEFAULT 0,
    BuildingNumber IN NUMBER DEFAULT 0,
    Elevation IN CHAR DEFAULT 'N',
    DistanceFromLeftCorner IN NUMBER DEFAULT 0,
    StartCol IN NUMBER DEFAULT 1,
    StopCol IN NUMBER DEFAULT 0,
    Projection IN NUMBER DEFAULT 1,
    BuildingWidth IN NUMBER,
    SoffitPanelType IN VARCHAR2,
    SoffitPanelGauge IN NUMBER DEFAULT 0,
    SoffitPanelColor IN VARCHAR2,
    SoffitPanelColorSpecialName IN VARCHAR2,
    SoffitPanelColorValsparCode IN VARCHAR2,
    SoffitTrimColor IN VARCHAR2,
    SoffitTrimColorSpecialName IN VARCHAR2,
    SoffitTrimColorSpecialCode IN VARCHAR2,
    IsInsulated IN CHAR DEFAULT 'N',
    SoffixFacingSpecial IN CHAR DEFAULT 'N',
    ReverseRollSoffit IN CHAR DEFAULT 'N',
    SoffitFacingWeight IN NUMBER,
    SoffitFacingDeflection IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    UserId IN NUMBER
)
AS 
IsPurlinExtentionExist NUMBER DEFAULT 0;
BEGIN
  SELECT count(*) INTO IsPurlinExtentionExist from "Accesories_PurlinExtensions" WHERE "PurlinExtensionId" = PurlinExtensionId;
  IF IsPurlinExtentionExist != 0 THEN
  UPDATE "Accesories_PurlinExtensions" SET
                "ProjectId" = ProjectId,
                "BuildingNumber" =BuildingNumber,
                "Elevation" = Elevation,
                "DistanceFromLeftCorner" = DistanceFromLeftCorner,
                "StartCol" = StartCol,
                "StopCol" = StopCol,
                "Projection" = Projection,
                "BuildingWidth" = BuildingWidth,
                "SoffitPanelType" = SoffitPanelType,
                "SoffitPanelGauge" = SoffitPanelGauge,
                "SoffitPanelColor" = SoffitPanelColor,
                "SoffitPanelColorSpecialName" = SoffitPanelColorSpecialName,
                "SoffitPanelColorValsparCode" = SoffitPanelColorValsparCode,
                "SoffitTrimColor" = SoffitTrimColor,
                "SoffitTrimColorSpecialName" = SoffitTrimColorSpecialName,
                "SoffitTrimColorSpecialCode" = SoffitTrimColorSpecialCode,
                "IsInsulated" = IsInsulated,
                "SoffixFacingSpecial" = SoffixFacingSpecial,
                "ReverseRollSoffit" = ReverseRollSoffit,
                "SoffitFacingWeight" = SoffitFacingWeight,
                "SoffitFacingDeflection" = SoffitFacingDeflection,
                "IpAddress" = IpAddress
        WHERE  "PurlinExtensionId" = PurlinExtensionId AND "ProjectId" = ProjectId AND "BuildingNumber" = BuildingNumber;
    END IF;
END ACCESSORYPURLINEXTENSION_UPDATE;
/