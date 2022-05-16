CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYPURLINEXTENSION_CREATE" 
(
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
    UserId IN NUMBER,
    OutputId OUT NUMBER
)
AS 
IsPurlinExtentionExist NUMBER DEFAULT 0;
ExtensionId NUMBER DEFAULT 0;
BEGIN
     -- SELECT count(*) INTO IsPurlinExtentionExist from "Accesories_PurlinExtensions" WHERE "ProjectId" = ProjectId and "BuildingNumber" = BuildingNumber and "IsDelete" != 'Y';
     --IF IsPurlinExtentionExist = 0 THEN
         INSERT INTO "Accesories_PurlinExtensions" (
                "ProjectId",
                "BuildingNumber",
                "Elevation",
                "DistanceFromLeftCorner",
                "StartCol",
                "StopCol",
                "Projection",
                "BuildingWidth",
                "SoffitPanelType",
                "SoffitPanelGauge",
                "SoffitPanelColor",
                "SoffitPanelColorSpecialName",
                "SoffitPanelColorValsparCode",
                "SoffitTrimColor",
                "SoffitTrimColorSpecialName",
                "SoffitTrimColorSpecialCode",
                "IsInsulated",
                "SoffixFacingSpecial",
                "ReverseRollSoffit",
                "SoffitFacingWeight",
                "SoffitFacingDeflection",
                "IsDelete",
                "CreatedBy",
                "IpAddress"
            ) VALUES (
                ProjectId,
                BuildingNumber,
                Elevation,
                DistanceFromLeftCorner,
                StartCol,
                StopCol,
                Projection,
                BuildingWidth,
                SoffitPanelType,
                SoffitPanelGauge,
                SoffitPanelColor,
                SoffitPanelColorSpecialName,
                SoffitPanelColorValsparCode,
                SoffitTrimColor,
                SoffitTrimColorSpecialName,
                SoffitTrimColorSpecialCode,
                IsInsulated,
                SoffixFacingSpecial,
                ReverseRollSoffit,
                SoffitFacingWeight,
                SoffitFacingDeflection,
                'N',
                UserId,
                IpAddress
            )
         RETURNING "PurlinExtensionId" into OutputId;
  --  ELSE
    --    select "PurlinExtensionId" INTO ExtensionId from "Accesories_PurlinExtensions" WHERE "ProjectId" = ProjectId and "BuildingNumber" = BuildingNumber and "IsDelete" != 'Y';
    --    OutputId := ExtensionId;
       
    -- END IF;
END ACCESSORYPURLINEXTENSION_CREATE;
/