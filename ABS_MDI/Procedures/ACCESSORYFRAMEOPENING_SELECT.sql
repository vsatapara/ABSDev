CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYFRAMEOPENING_SELECT" 
(
    FrameOpeningId IN NUMBER,
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
    "BracingBay",
    "IsDelete",
    "ForVerticalLiftDoor"
        FROM
        "Accessories_FramedOpening" 
        Where "FramedOpeningId" = FrameOpeningId;                
END ACCESSORYFRAMEOPENING_SELECT;
/