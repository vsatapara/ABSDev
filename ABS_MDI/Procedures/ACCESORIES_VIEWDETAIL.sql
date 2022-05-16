CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_VIEWDETAIL" (
    Accesories_Id    IN   NUMBER,
    Accesories_Type  IN   VARCHAR2,
    Output_Data      OUT  SYS_REFCURSOR
) AS
BEGIN
    IF ( Accesories_Type = 'Roof LTPs' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"             AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )         AS "Building Name",
                                 TO_CHAR(ARLTP."Qty")        AS "Qty",
                                 AL."Value"                  AS "Length",
                                 CASE
                                     WHEN ARLTP."IsInsulated" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                    END                         AS "Insulated",
                                 CASE
                                     WHEN ARLTP."IsUL90Framing" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                         AS "UL90 Framing",
                                 ARLTP."Location"            AS "Location",
                                 TO_CHAR(ARLTP."Size")       AS "Size",
                                 1                           AS "IsConvertSize"
                             FROM
                                      "Accesories_RoofLTP" ARLTP
                                 INNER JOIN "BuildingInformation"        B ON B."BuildingInformationId" = ARLTP."BuildingNumber"
                                 INNER JOIN "Project"                    P ON P."ProjectId" = B."ProjectId"
                                 INNER JOIN "Accesories_RoofLTP_Length"  AL ON ARLTP."Length" = AL."Id"
                             WHERE
                                     "RoofLTPId" = Accesories_Id
                                 AND ARLTP."IsDelete" = 'N';
                                 
                                 
     ELSIF ( Accesories_Type = 'DBCI Doors' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                          AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                      AS "Building Name",
                                 AD."PartitionNumber"                                                                                     AS "Partition Number",
                                 AD."BayNumber"                                                                                           AS "Bay",
                                 AD."DistFromLeftCol"                                                                                  AS "From Left Column",
                                 1                                                                                                        AS "IsConvertFrom Left Column",
                                 AD."SillHeight"                                                                                          AS "From Floor",
                                 1                                                                                                        AS "IsConvertFrom Floor",
                                                                                                                              
                                 AD."DoorSize"                                                                                          AS "Size",
                                 AD."DoorSeries"                                                                                             AS "Series",
                                
                                 CASE
                                     WHEN AD."ResistWind" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                      AS "Resist Wind"
                                                                                                                             
                             FROM
                                      "Accessories_DBCIDoor" AD
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AD."BuildingId"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AD."DbciDoorId" = Accesories_Id
                                 AND AD."IsDelete" = 'N';
    ELSIF ( Accesories_Type = 'Louvers' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                          AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                      AS "Building Name",
                                 AL."PartitionNumber"                                                                                     AS "Partition Number",
                                 AL."BayNumber"                                                                                           AS "Bay",
                                 AL."DistFromLeftCol"                                                                                  AS "From Left Column",
                                 1                                                                                                        AS "IsConvertFrom Left Column",
                                 AL."SillHeight"                                                                                          AS "From Floor",
                                 1                                                                                                        AS "IsConvertFrom Floor",
                                 AL."Type"                                                                                                AS "Type",
                                 AL."LouverSize"                                                                                          AS "Size",
                                 FN_GET_COLORNAME(AL."LouverColor", AL."LouverColorValsparCode", AL."LouverColorSpecialName")             AS "Color",
                                 CASE
                                     WHEN AL."LocatedInLiner" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                      AS "Located in Liner",
                                 CASE
                                     WHEN AL."IncludeFramedOpening" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                      AS "Include Framed Openings"
                             FROM
                                      "Accessories_Louvers" AL
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AL."BuildingId"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AL."LouverId" = Accesories_Id
                                 AND AL."IsDelete" = 'N';
    ELSIF ( Accesories_Type = 'Purlin Extension' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                                            AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                                        AS "Building Name",
                                 APE."Projection"                                                                                                           AS "Projection",
                                 1                                                                                                                          AS "IsConvertProjection",
                                 APE."Elevation"                                                                                                            AS "Elevation",
                                 APE."SoffitPanelType"                                                                                                      AS "Soffit Panel",
                                 APE."SoffitPanelGauge"                                                                                                     AS "Soffit Gauge",
                                 FN_GET_COLORNAME(APE."SoffitPanelColor", APE."SoffitPanelColorValsparCode", APE."SoffitPanelColorSpecialName")             AS
                                 "Soffit Color",
                                 FN_GET_COLORNAME(APE."SoffitTrimColor", APE."SoffitTrimColorSpecialCode", APE."SoffitTrimColorSpecialName")                AS
                                 "Soffit Trim",
                                 CASE
                                     WHEN APE."ReverseRollSoffit" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                        AS "Reverse Roll",
                                 APE."SoffitFacingWeight"                                                                                                   AS "Weight",
                                 APE."SoffitFacingDeflection"                                                                                               AS "Deflection"
                             FROM
                                      "Accesories_PurlinExtensions" APE
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = APE."BuildingNumber"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     APE."PurlinExtensionId" = Accesories_Id
                                 AND APE."IsDelete" = 'N';
                                 
   ELSIF ( Accesories_Type = 'Rubber Pipe Flash' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                                            AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                                       AS "Building Name",                                                                                                                                                                                                                            
                                 ARPF."Quantity"                                                                                                             AS "Quantity",
                                 ARPF."OutsideDiameter"                                                                                                      AS "Outside Diameter"
                             FROM
                                      "Accessories_RubberPipeFlash" ARPF
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = ARPF."BuildingId"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     ARPF."RubberPipeFlashId" = Accesories_Id
                                 AND ARPF."IsDelete" = 'N';
                                 
     ELSIF ( Accesories_Type = 'Vents' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                                          AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                                   AS "Building Name",
                                 AV."Quantity"                                                                                                           AS "Quantity",
                                 AV."RoofVent"                                                                                                           AS "Roof Vent",
                                 AV."Elevation"                                                                                                          AS "Elevation",
                                 AV."BayNumber"                                                                                                          AS "Bay Number",
                                 AV."Color"                                                                                                              AS "Color",
                                 AV."Size"                                                                                                               AS "Size",
                                 AV."Operator"                                                                                                           AS "Operator",
                                 AV."OperatorWithCable"                                                                                                  AS "Operator With Cable",
                                 AV."Surface"                                                                                                            AS "Surface",
                                 AV."DistFromLeftCorner"                                                                                                  AS "Dist From Left Corner",
                                 AV."DistFromLeftCol"                                                                                                    AS "Dist From Left Col",
                                 CASE
                                     WHEN AV."ExtensionPackage" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Extension Package",
                                   CASE
                                     WHEN AV."TrimCollar" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Trim Collar"
                             FROM
                                      "Accessories_Vents" AV
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AV."BuildingId"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AV."VentsId" = Accesories_Id
                                 AND AV."IsDelete" = 'N';                             
    ELSIF ( Accesories_Type = 'Canopy' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                                                        AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                                                    AS "Building Name",
                                 AC."StartColumn"                                                                                                                       AS "Start Column",
                                 AC."StopColumn"                                                                                                                        AS "Stop Column",
                                 AC."CanopyType"                                                                                                                        AS "Type",
                                 AC."Projection"                                                                                                                        AS "Projection",
                                 1                                                                                                                                      AS "IsConvertProjection",
                                 AC."HeightLocation"                                                                                                                    AS "Attachment Elevation",
                                 1                                                                                                                                      AS "IsConvertAttachement Elevation",
                                 AC."Slope"                                                                                                                             AS "Canopy Slope",
                                 AC."Panel"                                                                                                                             AS "Canopy Panel",
                                 AC."CanopyPanelGauge"                                                                                                                  AS "Canopy Gauge",
                                 FN_GET_COLORNAME(AC."CanopyPanelColor", AC."PanelColorValsparCode", AC."PanelColorSpecialName")                                        AS
                                 "Canopy Color",
                                 AC."SoffitPanelType"                                                                                                                   AS "Soffit Panel",
                                 AC."SoffitGaudge"                                                                                                                      AS "Soffit Gauge",
                                 FN_GET_COLORNAME(AC."SoffitPanelColor", AC."SoffitPanelColorValsparCode", AC."SoffitPanelColorSpecialName")                            AS
                                 "Soffit Color",
                                 FN_GET_COLORNAME(AC."SoffitTrimColor", AC."SoffitTrimColorValsparCode", AC."SoffitTrimColorSpecialName")                               AS
                                 "Soffit Trim",
                                 FN_GET_COLORNAME(AC."RoofTieTrimColor", AC."RoofTieTrimColorValsparCode", AC."RoofTieTrimColorSpecialName")                            AS
                                 "Roof Tie In Trim",
                                 FN_GET_COLORNAME(AC."CanopyCornerTrimColor", AC."CanopyCornerTrimColorValsparCode", AC."CanopyCornerTrimColorSpecialName")             AS
                                 "Corner Trim",
                                 FN_GET_COLORNAME(AC."CanopySillCapTrimColor", AC."CanopySillTrimColorValsparCode", AC."CanopySillTrimColorSpecialName")                AS
                                 "Sill/Cap Trim",
                                 CASE
                                     WHEN AC."Gutter" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                                    AS "Gutter",
                                 CASE
                                     WHEN AC."ReturnDownspouts" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                                    AS "Return Downspouts"
                             FROM
                                      "Accessories_Canopy" AC
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AC."BuildingNumber"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AC."AccessoriesCanopyId" = Accesories_Id
                                 AND AC."IsDelete" = 'N';
                                 
   ELSIF ( Accesories_Type = 'Framed Openings' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                                          AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                                   AS "Building Name",
                                 AFO."Quantity"                                                                                                           AS "Quantity",
                                 NVL(AFO."Elevation",'N/A')                                                                                                          AS "Elevation",
                                 AFO."PartitionNumber"                                                                                                    AS "Partition Number",
                                     AFO."BayNumber"                                                                                                          AS "Bay",
                                 AFO."DistFromLeftCol"                                                                                                    AS "From Left Column",
                                 1                                                                                                                        AS "IsConvertFrom Left Column",
                                 --AFO."DistFromLeftCorner"                                                                                                 AS "From Floor",
                                 AFO."SillHeight"                                                                                                         AS "From Floor",
                                 1                                                                                                                        AS "IsConvertFrom Floor",
                                 AFO."Width"                                                                                                              AS "Width",
                                 1                                                                                                                        AS "IsConvertWidth",
                                 AFO."Height"                                                                                                             AS "Height",
                                 1                                                                                                                        AS "IsConvertHeight",                                 
                                 FN_GET_COLORNAME(AFO."ClosureTrimColor", AFO."ClosureTrimColorValsparCode", AFO."ClosureTrimColorSpecialName")             AS "Trim",
                                 CASE
                                     WHEN AFO."PreGalvanizedFraming" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Pre-galvanized Framing",
                                 AFO."ClipAttachment"                                                                                                      AS "Clip Attachment",
                                   CASE
                                     WHEN AFO."DoNotCutPanel" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Do Not Cut Panels/Girts",
                                  
                                 CASE
                                     WHEN AFO."FourSided" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Four Sided",
                                   CASE
                                     WHEN AFO."FullCoverHeadTrim" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Full Cover Trim",
                                   CASE
                                     WHEN AFO."DoubleHeader" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Double Header",
                                   CASE
                                     WHEN AFO."LocatedInLiner" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Located in Liner",
                                  CASE
                                     WHEN AFO."TrimOnly" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                                      AS "Trim Only"
                             FROM
                                      "Accessories_FramedOpening" AFO
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AFO."BuildingNumber"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AFO."FramedOpeningId" = Accesories_Id
                                 AND AFO."IsDelete" = 'N';   
                                 
   ELSIF ( Accesories_Type = 'Valley Gutters' ) THEN
        OPEN Output_Data FOR SELECT
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                      AS "Building Information",
                                 AV."Quantity"                                                                                            AS "Quantity",
                                 AV."Length"                                                                                              AS "Length",
                                 1                                                                                                        AS "IsConvertLength",
                                 AV."ConductorHeadLocation"                                                                               AS "Conductor Head Location"
                             FROM
                                      "Accessories_Valleygutters" AV
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AV."BuildingInformationId"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AV."ValleyguttersId" = Accesories_Id
                                 AND AV."IsDelete" = 'N';
  ELSIF ( Accesories_Type = 'Wall Partition LTP' ) THEN
    OPEN Output_Data FOR SELECT
                             P."ProjectName"                    AS "Project Name",
                             ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )              AS "Building",
                                AV."Quantity"                   AS "Quantity",
                                NVL(AV."Elevation",'N/A')       AS "Elevation",
                                AV."PartitionNumber"            AS "Partition Number",
                                AV."PatternPerBay"              AS "Bay",
                                AV."DistFromLeftCol"            AS "From Left Column",
                                1                               AS "IsConvertFrom Left Column",
                                AV."LTPSize"                    AS "Size",
                                CASE WHEN AV."Continuous" = 'Y' THEN 'Yes' ELSE 'No' END AS "Continuous",
                                AV."Length"                     AS "Length",   
                                1                               AS "IsConvertLength",
                                AV."EaveCondition"              AS "Eave Condition",
                                AV."TopElevation"               AS "Top Elevation",      
                                1                               AS "IsConvertTop Elevation",
                                CASE WHEN AV."InsulationTrim" = 'Y' THEN 'Yes' ELSE 'No' END AS "Insulation Trim"
                         FROM
                                  "Accesories_WallLTP" AV
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AV."BuildingInformationId"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 AV."WallLTPId" = Accesories_Id
                             AND AV."IsDelete" = 'N';  
                             
ELSIF(Accesories_Type = 'Top-Mounted Slide Doors') THEN
OPEN Output_Data FOR SELECT
                         P."ProjectName"                  AS "Project Name",
                         ( "BuildingLabel"
                           || '-'
                              || "BuildingName" )         AS "Building",
                         T."Quantity"                     AS "Quantity",
                         NVL(T."Elevation", 'N/A')        AS "Elevation",
                         T."PartitionNumber"              AS "Partition Number",
                         T."BayNumber"                    AS "Bay",
                         T."DistFromLeftCol"              AS "From Left Column",
                         T."Width"                        AS "Width",
                         1                                AS "IsConvertWidth",
                         T."Height"                       AS "Height",
                         1                                AS "IsConvertHeight",
                         T."Slide"                        AS "Slide",
                         T."Direction"                    AS "Slide Direction",
                         T."TrimColor"                    AS "Trim"
                     FROM
                              "Accesories_TopMountedSlideDoor" T
                         INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = T."BuildingNumber"
                         INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                     WHERE
                             T."TopMountedSlideDoorId" = Accesories_Id
                         AND T."IsDelete" = 'N'; 
    
  ELSIF ( Accesories_Type = 'Full Height' OR Accesories_Type = 'Partial Height' OR Accesories_Type = 'Attachment Height') THEN
    OPEN Output_Data FOR SELECT
                            P."ProjectName"                                                                                                          AS "Project Name",
                             ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )                                                                                                   AS "Building",
                            "OA"."Elevation"                                                                                                         AS "Elevation",
                            CASE WHEN Accesories_Type != 'Attachment Height' THEN "OA"."PartitionNumber" END                                         AS "Partition Number",
                            "OA"."BayNumber"                                                                                                         AS "Bay",
                            "OA"."DistFromLeftColumn"                                                                                                AS "From Left Column",
                            1                                                                                                                        AS "IsConvertFrom Left Column",
                            "OA"."OpeningWidth"                                                                                                      AS "Opening Width",
                            1                                                                                                                        AS "IsConvertOpening Width",
                            "OA"."OpeningHeight"                                                                                                     AS "Opening Height",
                            1                                                                                                                        AS "IsConvertOpening Height",
                            "OA"."MaterialType"                                                                                                      AS "Open For",
                            "OA"."MaterialThickness"                                                                                                 AS "Material Thickness",
                            1                                                                                                                        AS "AddZeroMaterial Thickness",
                            "OA"."MaterialWeight"                                                                                                    AS "Material Weight",
                            1                                                                                                                        AS "AddZeroMaterial Weight",
                            "OA"."DistSteelLinetoMaterial"                                                                                           AS "Steel Line To Outside Material",
                            1                                                                                                                        AS "AddZeroSteel Line To Outside Material",
                            "OA"."DistSteelLinetoBeam"                                                                                               AS "Steel Line To Support Beam",
                            1                                                                                                                        AS "AddZeroSteel Line To Support Beam",
                            "OA"."PercentOpenforWind"                                                                                                AS "Percent Open For Wind",
                            1                                                                                                                        AS "AddZeroPercent Open For Wind",
                            CASE WHEN "OA"."MasonryType" is null THEN 'N/A' ELSE "OA"."MasonryType" END                                              AS "Masonry Type",
                            CASE WHEN "OA"."MaterialDirection" is null THEN 'N/A' ELSE "OA"."MaterialDirection" END                                  AS "Material Direction",
                            CASE WHEN OA."HeaderFlash" = '1' THEN 'Yes' ELSE 'No' END                                                                AS "Header Flash",
                            CASE WHEN OA."LeftJamb" = '1' THEN 'Yes' ELSE 'No' END                                                                   AS "Jamb",
                            CASE WHEN OA."LeftJambFlash" = '1' THEN 'Yes' ELSE 'No' END                                                              AS "Jamb Flash",
                            CASE WHEN "OA"."HeaderFlashType" is null THEN 'N/A' ELSE "OA"."HeaderFlashType" END                                      AS "Base",
                            CASE 
                                WHEN FN_GET_COLORNAME("OA"."HeaderFlashColor", "OA"."HeaderFlashColorValsparCode", "OA"."HeaderFlashColorSpecialName")  is null THEN 
                                    'N/A' 
                                ELSE 
                                    FN_GET_COLORNAME("OA"."HeaderFlashColor", "OA"."HeaderFlashColorValsparCode", "OA"."HeaderFlashColorSpecialName")    
                            END                                                                                                                      AS "Flash Color",
                            CASE WHEN OA."BeamSelected" = '1' THEN 'Yes' ELSE 'No' END                                                               AS "Support Beam By Manufacturer",
                            "OA"."BeamDeflection"                                                                                                    AS "Beam Deflection",
                            CASE WHEN OA."BeamFlanges" = '1' THEN 'Yes' ELSE 'No' END                                                                AS "Use Flange Bracing",
                            "OA"."BeamAttachmentSpacing"                                                                                             AS "Beam Connection",
                            1                                                                                                                        AS "IsConvertBeam Connection"
                                
                         FROM
                                  "OpenAreas" OA
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = OA."BuildingNumber"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 OA."Id" = Accesories_Id
                             AND OA."IsDeleted" = 'N';   
                             
 ELSIF ( Accesories_Type = 'Partitions') THEN
   OPEN Output_Data FOR SELECT
             P."ProjectName"       AS ProjectName,
             ( "BuildingLabel"
               || '-'
               || "BuildingName" ) AS BuildingName,
             AP."BuildingNumber"   AS BuildingNumber,
             AP."Height"           AS FromFloor,
             1                     AS IsConvertFromFloor,
             AP."Type"             AS Type,
             AP."DistFromEndWall"  AS FromEndWall,
             1                     AS IsConvertFromEndWall,
             AP."DistFromSideWall" AS FromSideWall,
             1					   AS IsConvertFromSideWall,
            CASE
                 WHEN AP."FullHeight" = 'Y' THEN
                     'Yes'
                 ELSE
                     'No'
             END                   AS FullHeight,
             AP."PanelType"		   AS PanelType,
             AP."Length"           AS Length,
             1					   AS IsConvertFromLength,
             AP."Width"			   AS Width,
             1					   AS IsConvertFromWidth,
             AP."Thickness"		   AS Thickness,
             1					   AS IsConvertFromThickness,
             CASE
                 WHEN AP."ReverseRoll" = 'Y' THEN
                     'Yes'
                 ELSE
                     'No'
             END													 AS ReverseRoll,
             AP."ExteriorProfile"									 AS ExteriorProfile,
             AP."ExteriorGuage"										 AS ExteriorGuage,
             AP."ExteriorTexture"									 AS ExteriorTexture,
             FN_GET_COLORNAME(AP."ExteriorColor",AP."ExteriorColorSpecialName",AP."ExteriorColorValsparCode")         AS EXCOLOR,
             AP."InteriorProfile"									 AS InteriorProfile,
             AP."InteriorGuage"										 AS InteriorGuage,
             AP."InteriorTexture"									 AS InteriorTexture,
             FN_GET_COLORNAME(AP."InteriorColor", AP."InteriorColorSpecialName", AP."InteriorColorValsparCode")       AS InteriorColor,
             AP."FactoryAppliedSealant"								 AS FactoryAppliedSealant,
             AP."SheeterSide"										 AS SheeterSide,
             AP."ExteriorWall"										 AS ExteriorWall,
             CASE
                 WHEN AP."RecessFoundation" = 'Y' THEN
                     'Yes'
                 ELSE
                     'No'
             END													AS RecessFoundation,
             CASE
                 WHEN AP."BaseClosureStrips" = 'Y' THEN
                     'Yes'
                 ELSE
                     'No'
             END													                                                    AS BaseClosureStrips,
             FN_GET_COLORNAME(AP."PurlinTrimColor", AP."PurlinTrimColorSpecialName", AP."PurlinTrimColorValsparCode")   AS PurlinTrimColor,
             FN_GET_COLORNAME(AP."CornerTrimColor", AP."CornerTrimColorSpecialName", AP."CornerTrimColorValsparCode")   AS CornerTrimColor,
             CASE
                 WHEN AP."FramingByOthers" = 'Y' THEN
                     'Yes'
                 ELSE
                     'No'
             END			             AS FramingByOthers,
             AP."BaseCondition"	         AS BaseCondition,
             AP."FastenerHeadFinish"	 AS FastenerHeadFinish,
             AP."FastenerLength"		 AS FastenerLength,
             MPT."Type"                  AS PanelTypeValue,
             MPDEG."Value"               AS ExteriorGaugeValue,
             MPDPE."Value"               AS ProfileExteriorValue,
             MPDTE."Value"               AS TextureExteriorValue,
             MPDIG."Value"               AS GaugeInteriorValue,
             MPDPI."Value"               AS ProfileInteriorValue,
             MPDTI."Value"               AS TextureInteriorValue,
             MPDW."Value"                AS WidthValue,
             MPDT."Value"                AS ThicknessValue,
             MPDFH."Value"               AS FastenerHeadValue,
             MPDFL."Value"               AS FastenerLengthValue,
             MPDFA."Value"               AS FactoryAppliedValue,
             PM."CategoryValue"          AS PartitionCategoryValue       
            FROM
                  "Accesories_Partition" AP  
             left outer JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AP."BuildingNumber"
             left outer JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
             left outer JOIN "M_PanelType"          MPT ON MPT."Id" = AP."PanelType" 
             left outer JOIN "M_Panel_Dropdown"     MPDEG ON MPDEG."Id" = AP."ExteriorGuage"
             left outer JOIN "M_Panel_Dropdown"     MPDPE ON MPDPE."Id" = AP."ExteriorProfile"
             left outer JOIN "M_Panel_Dropdown"     MPDTE ON MPDTE."Id" = AP."ExteriorTexture"
             left outer JOIN "M_Panel_Dropdown"     MPDIG ON MPDIG."Id" = AP."InteriorGuage"
             left outer JOIN "M_Panel_Dropdown"     MPDPI ON MPDPI."Id" = AP."InteriorProfile"
             left outer JOIN "M_Panel_Dropdown"     MPDTI ON MPDTI."Id" = AP."InteriorTexture"
             left outer JOIN "M_Panel_Dropdown"     MPDW ON MPDW."Id" = AP."Width"
             left outer JOIN "M_Panel_Dropdown"     MPDT ON MPDT."Id" = AP."Thickness"
             left outer JOIN "M_Panel_Dropdown"     MPDFH ON MPDFH."Id" = AP."FastenerHeadFinish"
             left outer JOIN "M_Panel_Dropdown"     MPDFL ON MPDFL."Id" = AP."FastenerLength"
             left outer JOIN "M_Panel_Dropdown"     MPDFA ON MPDFA."Id" = AP."FactoryAppliedSealant"
             left outer JOIN "Accesories_PartitionMaster"     PM ON PM."OptionId" = AP."PartitionId"
         WHERE
             AP."PartitionId" = Accesories_Id and AP."IsDelete" = 'N';
             
   ELSIF ( Accesories_Type = 'Support Beams') THEN
    OPEN Output_Data FOR SELECT
                            P."ProjectName"                   AS "Project Name",
                             ( "BuildingLabel"               
                               || '-'                        
                               || "BuildingName" )            AS "Building Information",
                            B."Elevation"                     AS "Building Elevation",                           
                            SB."BeamStartCol"                 AS "Start Column",
                            SB."BeamStopCol"                  AS "Stop Column",
                            SB."BeamHeight"                   AS "Beam Height",
                            1                                 AS "IsConvertBeam Height",
                           SB."MaterialThickness"             AS "Material Thickness",
                            1                                 AS "AddZeroMaterial Thickness",
                            SB."MaterialWeight"               AS "Material Weight",
                            1                                 AS "AddZeroMaterial Weight",
                            ('L/' || SB."BeamDeflection")     AS "Beam Deflection",
                            SB."BeamAttachmentSpacing"        AS "Beam Connection spacing",   
                            1                                 AS "IsConvertBeam Connection spacing",         
                 CASE WHEN SB."BeamFlanges" = '1' THEN 'Yes' ELSE 'No' END           AS "Use Flange Bracing",
                 CASE WHEN SB."BeamSteelline" = '1' THEN 'Yes' ELSE 'No' END         AS "Mat. Located IN Steel line"
                          
                         FROM
                                  "SupportBeams" SB
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = SB."BuildingNumber"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 SB."SupportBeamsId" = Accesories_Id
                             AND SB."IsDelete" = 'N'; 
 ELSIF ( Accesories_Type = 'Parapet Walls' ) THEN
    OPEN Output_Data FOR SELECT
                             P."ProjectName"                    AS "Project Name",
                             ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )              AS "Building",
                                NVL(AV."Elevation",'N/A')       AS "Elevation",
                                AV."StartColumn"                AS "Start Column",
                                AV."StopColumn"                 AS "Stop Column",
                                AV."Height"                     AS "Top Parapet"
                                
                         FROM
                                  "Accessories_Parapet" AV
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AV."BuildingInformationId"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 AV."ParapetId" = Accesories_Id
                             AND AV."IsDelete" = 'N';
  ELSIF ( LOWER(Accesories_Type) = 'wainscot' ) THEN
        OPEN Output_Data FOR 
        SELECT
                                   WNCT."Elevation" AS "Elevation",
                                   ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )         AS "Building Name",
                                     TO_CHAR(WNCT."Qty")        AS "Quantity",
                                    TO_CHAR(WNCT."FromColumn") AS "From Column",
                                    TO_CHAR(WNCT."ToColumn") AS "To Column",
                                    TO_CHAR(WNCT."Hieght") AS "Height",
                                ( PT."Type"
                                   || ','
                                   || PD."Value"
                                   || ','
                                   || WNCT."PanelColorId") AS "Panel",
                                    CASE
                                     WHEN  WNCT."TransitionStyleId" = 2 THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END              AS "Transition Trim",
                                 WNCT."TransitionTrimColorId" AS "Transition Trim Color"
                             FROM
                                      "Accesories_Wainscot" WNCT
                                 INNER JOIN "BuildingInformation" B  ON B."BuildingInformationId" = WNCT."BuildingInformationId"
                                 LEFT JOIN "M_PanelType"          PT ON WNCT."PanelTypeId"=PT."Id"
                                 LEFT JOIN "M_Panel_Dropdown"     PD ON WNCT."PanelThicknessId"=PD."Id"
                             WHERE
                                     WNCT."WainscotId" = Accesories_Id
                                 AND WNCT."IsDelete" = 'N'; 
  ELSIF ( Accesories_Type = 'Facade' ) THEN
    OPEN Output_Data FOR SELECT
                             P."ProjectName"                    AS "Project Name",
                             ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )              AS "Building",
                                NVL(AV."Elevation",'N/A')       AS "Elevation",
                                AV."StartCol"                   AS "Start Column",
                                AV."StopCol"                    AS "Stop Column",
                                AV."Height"                     AS "Height",
                                AV."Projection"                 AS "Projection",
                                AV."Type"                       AS "Type",
                                AV."SoffitElevation"            AS "Soffit Elevation",
                                AV."PanelType"                  AS "Panel Type",
                                AV."PanelGauge"                 AS "Panel Gauge",
                                AV."PanelFinish"                AS "Panel Color",
                                AV."SoffitPanelType"            AS "Soffit Cover",
                                AV."SoffitPanelGauge"           AS "Soffit Gauge",
                                AV."SoffitPanelFinish"          AS "Soffit Color",
                                AV."BackPanelType"              AS "Back-Up Cover",
                                AV."BackPanelGauge"             AS "Back-Up Gauge",
                                AV."BackPanelColor"             AS "Back-Up Color",
                                AV."SillCapTrim"                AS "Sill/Cap Trim",
                                AV."SoffitTrim"                 AS "Soffit Trim",
                                AV."CornerTrim"                 AS "Corner Trim",
                                CASE WHEN AV."Gutter" = 'Y' THEN 'Yes' ELSE 'No' END AS "With Return"
                         FROM
                                  "Accessories_Facade" AV
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AV."BuildingInformationId"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 AV."FacadeId" = Accesories_Id
                             AND AV."IsDelete" = 'N';  
  ELSIF ( Accesories_Type = 'Windows' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                                                                                          AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                    AS "Building Name",
                                 AW."Elevation"                                                                                           AS "Elevation",  
                                 AW."PartitionNumber"                                                                                     AS "Partition Number",
                                 AW."BayNumber"                                                                                           AS "Bay",
                                 AW."DistFromLeftCol"                                                                                     AS "From Left Column",
                                 1                                                                                                        AS "IsConvertFrom Left Column",
                                 AW."SillHeight"                                                                                          AS "From Floor",
                                 1                                                                                                        AS "IsConvertFrom Floor",
                                 AW."WindowSize"                                                                                          AS "Size",
                                 AW."FrameFinish"                                                                                         AS "Color",
                                 AW."GlassType"                                                                                           AS "Glass",
                                 AW."SubFraming"                                                                                          AS "Sub-Frame",
                                 CASE
                                     WHEN AW."InsulatedGlass" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                      AS "Insulated",
                                 CASE
                                     WHEN AW."LocatedInLiner" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                                                                                      AS "Located In Liner"
                             FROM
                                      "Accesories_Windows" AW
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AW."BuildingNumber"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AW."WindowId" = Accesories_Id
                                 AND AW."IsDelete" = 'N';
                                 
     ELSIF ( Accesories_Type = 'Roof Liner' ) THEN
      OPEN Output_Data FOR SELECT
                                P."ProjectName"                                                                                          AS "Project Name",
                                  ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                                                                                    AS "Building Name",
                                'R' as "Elevation",
                                ALR."StartColumn" As "Start Column",
                                ALR."StopColumn" As "Stop Column",
                                ALR."XFrom" As "Along Wall A From",
                                ALR."XTo" As "Along Wall A To",
                                ALR."YFrom" As "Along Wall B From",
                                ALR."YTo" As "Along Wall B To",
                                       1                                AS "IsConvertAlong Wall A From",
                                       1                                AS "IsConvertAlong Wall A To",
                                       1                                AS "IsConvertAlong Wall B From",
                                       1                                AS "IsConvertAlong Wall B To",
                 
                                LC."ItemText" As "Type",
                                MPT."Type"  As "Panel Type",
                                ALR."PanelGauge" As "Panel Gauge",
                                ALR."PanelColor" As "Panel Color",
                                ALR."RidgeTrimGauge" As "Ridge Trim Gauge",
                                ALR."RidgeTrimColor" As "Ridge Trim Color",
                                ALR."RafterTieTrimGauge" As "Rafter Tie Trim Gauge",
                                ALR."RafterTieTrimColor" As "Rafter Tie Trim Color",
                                ALR."EaveToWallTrimGauge" As "Eave To Wall Trim Gauge",
                                ALR."EaveToWallTrimColor" As "Eave To Wall Trim Color",
                                CASE
                                     WHEN ALR."ReverseRoll" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END  AS "Reverse Roll"
                                   
      
       FROM
                                      "Accessories_Liners" ALR
                                 INNER JOIN "BuildingInformation"       B ON B."BuildingInformationId" = ALR."BuildingNumber"
                                 INNER JOIN "Project"                   P ON P."ProjectId" = B."ProjectId"
                                 LEFT JOIN "TableOfTables"              LC ON LC."Id" = ALR."LinerCoverage"
                                 LEFT OUTER JOIN "M_PanelType"          MPT ON MPT."Id" = ALR."PanelType" 
                             WHERE
                                     ALR."LinerId" = Accesories_Id
                                 AND ALR."IsDelete" = 'N';
 ELSIF ( Accesories_Type = 'Walk Doors' ) THEN
        OPEN Output_Data FOR SELECT
                                 P."ProjectName"                      AS "Project Name",
                                 ( "BuildingLabel"
                                   || '-'
                                   || "BuildingName" )                AS "Building Name",
                                 AWD."Elevation"                      AS "Elevation",  
                                 AWD."Quantity"                       As "Quantity",
                                 AWD."PartitionNumber"                AS "Partition Number",
                                 AWD."BayNumber"                      AS "Bay",
                                 AWD."DistFromLeftCol"                AS "From Left Column",
                                 1                                    AS "IsConvertFrom Left Column",
                                 AWD."DistanceFromFloor"              AS "From Floor",
                                 1                                    AS "IsConvertFrom Floor",
                                 AWD."Size"                           AS "Size",
                                 AWD."Type"                           AS "Type",
                                 AWD."DoorColor"                      AS "Painted",
                                FN_GET_COLORNAME(AWD."TrimColor",AWD."TrimColorSpecialName",AWD."TrimColorValsparCode")         AS "Trim",
                                 AWD."Style"                          AS "Style",
                                 AWD."Locktype"                       AS "Lockset",
                                 AWD."SwingDirection"                 AS "Swing",
                                 CASE
                                     WHEN AWD."KeyedAlike" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                  AS "KeyedAlike",
                                 AWD."Closer"                         AS "Closer",
                                 CASE
                                     WHEN AWD."LatchGuard" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                  AS "LatchGuard",
                                  CASE
                                     WHEN AWD."ChainStop" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                  AS "ChainStop",
                                  CASE
                                     WHEN AWD."Insulated" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                  AS "Insulated",
                                  CASE
                                     WHEN AWD."AdaCompliant" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                  AS "AdaCompliant",
                                   CASE
                                     WHEN AWD."LocatedInLiner" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                         'No'
                                 END                                  AS "LocatedInLiner"
                                 
                             FROM
                                      "Accessories_WalkDoors" AWD
                                 INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AWD."BuildingId"
                                 INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                             WHERE
                                     AWD."WalkDoorId" = Accesories_Id
                                 AND AWD."IsDelete" = 'N';
                                 
     ELSIF ( Accesories_Type = 'Wall Partition Liner' ) THEN
        OPEN Output_Data FOR SELECT
                  P."ProjectName"                   AS "Project Name",
                             ( "BuildingLabel"               
                               || '-'                        
                               || "BuildingName" )            AS "Building Information",
                             NVL(AL."Elevation", 'N/A')       AS "Building Elevation",
                               'N/A'                          AS "Partition Number",
                                  1                           AS "Bay",
                                  0                           AS "From Left Column",
                                  1                           AS "IsConvertFrom Left Column",   
                                      CASE
                                     WHEN AL."FullLength" = 1 THEN
                                         'Full Length'
                                     ELSE
                                         to_char(AL."Length")
                                 END                          AS "Length",
                           
                                 CASE
                                     WHEN AL."FullLength" = 0 THEN
                                         1
                                     ELSE
                                         0
                                 END                          AS "IsConvertLength",
                               
                                CASE
                                     WHEN AL."FullHeight" = 1 THEN
                                         'Full Height'
                                     ELSE
                                         to_char(AL."Height")
                                 END                          AS "Height",
                           
                                 CASE
                                     WHEN AL."FullHeight" = 0 THEN
                                         1
                                     ELSE
                                         0
                                 END                         AS "IsConvertHeight",
                               AL."BaseType"                 AS "Base Type",
                               MP."Type"                     AS "Panel Type",
                               AL."PanelGauge"               AS "Panel Gauge",
                                CASE
                                     WHEN AL."PanelColor" = 'Select Color' THEN
                                         'N/A'
                                     ELSE
                                          AL."PanelColor"
                                 END                          AS "Panel Color",
                                CASE
                                     WHEN AL."FullHeight" = 1 THEN
                                         'N/A'
                                     ELSE
                                          AL."ColumnTieTrimColor"
                                 END                          AS "Cap Trim Color",
                               CASE
                                     WHEN AL."FullHeight" = 0 THEN
                                         'N/A'
                                     ELSE
                                          AL."PurlinTrimColor"
                                 END                         AS "Purlin Trim Color",
                               AL."InsideCornerTrimColor"    AS "Inside Corner Trim Color",
                               AL."ColumnTieTrimColor"       AS "Column Tie Trim Color",
                              CASE
                                WHEN AL."ReverseRoll" = 'Y' THEN
                                         'Yes'
                                     ELSE
                                          'No'
                                 END                         AS "Reverse Roll"
                             FROM
                                  "Accessories_Liners" AL
                             INNER JOIN "M_PanelType"         MP ON MP."Id" = AL."PanelType" 
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AL."BuildingNumber"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 AL."LinerId"  = Accesories_Id
                                 AND AL."IsDelete" = 'N';
                                 
 ELSIF ( Accesories_Type = 'Cranes' ) THEN
    OPEN Output_Data FOR SELECT
                             P."ProjectName"                    AS "Project Name",
                             ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )              AS "Building",
                                AC."StartFrameline"             AS "Start Frameline",
                                AC."StopFrameLine"              AS "Stop Frameline",
                                AC."ModuleNumber"               AS "Module",
                                AC."SType"                      AS "System Type",
                                AC."CraneClass"                 AS "Class",
                                AC."Control"                    AS "Control",
                                CASE WHEN AC."Brackets" = 'Y' THEN 
                                            'Yes'
                                     ELSE
                                            'No' 
                                END AS "Brackets",
                                CASE WHEN AC."RunwayBeam" = 'Y' THEN 
                                            'Yes'
                                     ELSE
                                            'No' 
                                END AS "Runway Beams",
                                AC."RunwayBeamSize"             AS "Runway Beam Size",
                                AC."CraneNumber1"               AS "Crane Number",
                                AC."Tonnage1"                   AS "Tonnage",
                                AC."BridgeWeight1"              AS "Bridge Weight",
                                AC."HoistWeight1"               AS "Hoist Weight",
                                AC."WheelSpacing1"              AS "Wheel Spacing",
                                AC."DistanceBetweenCranes"      AS "Distance Between Cranes",
                                AC."CraneNumber2"               AS "Crane Number",
                                AC."Tonnage2"                   AS "Tonnage",
                                AC."BridgeWeight2"              AS "Bridge Weight",
                                AC."HoistWeight2"               AS "Hoist Weight",
                                AC."WheelSpacing2"              AS "Wheel Spacing"
                         FROM
                                  "Accessories_Cranes" AC
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = AC."BuildingId"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 AC."CraneId" = Accesories_Id
                             AND AC."IsDelete" = 'N';  
 
    --mezzanine
 ELSIF ( Accesories_Type = 'Mezzanines' ) THEN
            OPEN Output_Data FOR SELECT
                             P."ProjectName"                    AS "Project Name",
                             ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )              AS "Building",
                                EM."StartFrameline"             AS "Start Frameline",
                                EM."StopFrameline"              AS "Stop Frameline",
                                EM."DistFromSW"               AS "Dist From SW",
                                EM."Width"                      AS "Width",
                                EM."JoistParallelToPurlins"     AS "Joist Parallel To Purlins",
                                EM."Design"                    AS "Design",
                                
                                EM."Beams"                      AS "Beams",
                                EM."Joists"                      AS "Joists",
                                EM."Deck"                       AS "Deck",
                                EM."SupportColumns"             AS "Support Columns",
                                EM."EdgeAngle"                  AS "Edge Angle",
                                EM."LiveLoad"                   AS "Live Load",
                                EM."DeadLoad"                   AS "Dead Load",
                                EM."CollateralLoad"             AS "Collateral Load",
                                EM."PartitionLoad"              AS "Partition Load",
                                EM."Vibration"                  AS "Vibration",
                             
                                  CASE WHEN   EM."HumanActivity"   = '1' THEN 
                                            'Yes'
                                     ELSE
                                            'No' 
                                END AS "Human Activity",
                                
                             
                                EM."MezzUse"                    AS "Mezz Use",
                                EM."StairwellWeight"            AS "Stairwell Weight",
                                EM."FloorThickness"             AS "FloorThickness" ,
                                EM."FloorHeight"                AS "FloorHeight",
                                EM."FloorMaterial"              AS "Floor Material",
                                EM."InsideClearJoists"          AS "InsideClear Joists",
                                EM."InsideClearBeams"           AS "InsideClear Beams",
                                EM."ClearToRafter"              AS "ClearTo Rafter",
                                EM."JoistShopcoat"              AS "Joist Shop coat",
                                EM."DeckType"                   AS "Deck Type",
                                EM."DeckFinish"                 AS "Deck Finish",
                                EM."DeckIcboApproval"           AS "ICBO Approval",
                                EM."DeckFastened"               AS "Deck Fastened",
                                  CASE WHEN    EM."DeckFastened"     = '1' THEN 
                                            'Fastened'
                                     ELSE
                                            'Welded' 
                                END AS  "Fastened Or Welded",
                                EM."QuoteNumber"                AS "Quote Number",
                               EM."EstimatorInitials"           AS"Estimator Initials",
                                EM."ExpiresOn"                  AS "Expires On"
                         FROM
                                  "EDSPrice_IO_Mezzanines" EM
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = EM."BuildingNumber"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 EM."MezzaninesId" = Accesories_Id
                             AND EM."IsDelete" = 'N';  
 ELSIF ( Accesories_Type = 'Miscellaneous Adds' ) THEN
    OPEN Output_Data FOR SELECT
                            
                               ( "BuildingLabel"
                               || '-'
                               || "BuildingName" )              AS "Building Information",
                                'N/A'                           AS "Elevation",
                                MA."Description"                AS "Desciption",
                                MA."ListOrNet"                  AS "List/Net",
                                MA."Quantity"                   AS "Quantity",
                                MA."UnitWeight"                 AS "UnitWeight",
                                '$'||MA."UnitPrice"             AS "UnitPrice",
                                MA."UnitWeight"*MA."Quantity"   AS "TotalWeight",
                                '$'||MA."UnitPrice"*MA."Quantity"AS "TotalPrice",
                                'Yes'                           AS "By Manufacturer",
                                MA."ExpiresOn"                  AS "ExpiresOn",
                                MA."QuoteNumber"                AS "Quote Number",
                                MA."EstInitials"                AS "Estimator Initials"                        
                         FROM
                             "Input_AddLines" MA
                             INNER JOIN "BuildingInformation"  B ON B."BuildingInformationId" = MA."BuildingInformationId"
                             INNER JOIN "Project"              P ON P."ProjectId" = B."ProjectId"
                         WHERE
                                 MA."AddLinesId" = Accesories_Id
                             AND MA."IsDelete" = 'N';  
 
    END IF;
    
END ACCESORIES_VIEWDETAIL;
/