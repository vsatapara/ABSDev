CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYFRAMEOPENING_SELECT_BYBUILDINGID" 
(
    BuildingNumber IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
   SELECT
    "FramedOpeningId",
    "BuildingNumber",
    "ProjectId",
    "Elevation",
    "BayNumber",
    "Material",
    "Type",
    "Width",
    "Height",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "SillHeight",
    "HeaderHeight",
    "HeaderType",
    "JambType",
    "CeeDepth",
    "InsideFlangeWidth",
    "InsideFlangeThick",
    "OutsideFlangeWidth",
    "OutsideFlangeThick",
    "WebDepth",
    "WebThick",
    "DoubleJambs",
    "FourSided",
    "TrimOnly",
    "PanelCredit",
    "Clearance",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "ClosureTrim",
    "ClosureTrimSize",
    "ClosureTrimColor",
    "ClosureTrimColorValsparCode",
    "ClosureTrimColorSpecialName",
    "DoNotCutGirts",
    "OverheadDoor",
    "Quantity",
    "PreGalvanizedFraming",
    "FullCoverHeadTrim",
    "DoubleHeader",
    "DoNotCutPanel",
    "LocatedInLiner",
    "LeftSteelLine",
    "PartitionNumber",
    "ClipAttachment",
    "BracingBay"
FROM
    "Accessories_FramedOpening"
        Where  "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';           
END ACCESSORYFRAMEOPENING_SELECT_BYBUILDINGID;
/