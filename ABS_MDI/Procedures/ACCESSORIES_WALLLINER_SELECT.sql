CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WALLLINER_SELECT" 
(
/*   Created By    Hiren Prajapati    
     Created Date  23-09-2021
     Description   This stored Procedure used to Select Wallliner.
*/
    LinerId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
 SELECT
    "LinerId",
    "BuildingNumber",
    "Elevation",
    "FullHeight",
    "Height",
    "Length",
    "PanelType",
    "PanelGauge",
    "PanelColor",
    "BaseType",
    "CapTrimColor",
    "PurlinTrimColor",
    "InsideCornerTrimColor",
    "ColumnTieTrimColor",
    "ReverseRoll",
    "FullLength",
    "FastenerHeadFinish",
    "FastenerLength",
    "PanelColorValsparCode",
    "PanelColorSpecialName",
    "CapTrimColorValsparCode",
    "CapTrimColorSpecialName",
    "PurlinTrimColorValsparCode",
    "PurlinTrimColorSpecialName",
    "InsideCornerTrimColorValsparCode",
    "InsideCornerTrimColorSpecialName",
    "ColumnTieTrimColorValsparCode",
    "ColumnTieTrimColorSpecialName",
    "BayNumber",
    "DistFromLeftCol",
    "DistFromLeftCorner"
FROM
    "Accessories_Liners"
WHERE
    "LinerId" = LinerId ;
END ACCESSORIES_WALLLINER_SELECT;
/