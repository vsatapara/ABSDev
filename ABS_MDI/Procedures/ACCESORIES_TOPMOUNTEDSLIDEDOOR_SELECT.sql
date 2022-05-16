CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_TOPMOUNTEDSLIDEDOOR_SELECT" (
    TopMountedSlideDoorId     IN   NUMBER,
    TopMountedSlideDoor_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN TopMountedSlideDoor_Data FOR SELECT
                                          "TopMountedSlideDoorId",
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
                                          "HeaderHeight",
                                          "TrimColor",
                                          "JambType",
                                          "CeeDepth",
                                          "InsideFlangeWidth",
                                          "InsideFlangeThick",
                                          "OutsideFlangeWidth",
                                          "OutsideFlangeThick",
                                          "WebDepth",
                                          "WebThick",
                                          "DoubleJambs",
                                          "TrimOnly",
                                          "PanelCredit",
                                          "Clearance",
                                          "Slide",
                                          "Direction",
                                          "HoodFlash",
                                          "Weight",
                                          "Price",
                                          "IsPriced",
                                          "ErrorCode",
                                          "Quantity",
                                          "LeftSteelLine",
                                          "PartitionNumber",
                                          "LocateRightSideBay",
                                          "TrimColorValsparCode",
                                          "TrimColorSpecialName",
                                          "IsBuyout",
                                          "CreatedBy",
                                          "CreatedDate",
                                          "ModifiedBy",
                                          "ModifiedDate",
                                          "IpAddress",
                                          "IsDelete",
                                          "DoorSizeId"
                                      FROM
                                          "Accesories_TopMountedSlideDoor"
                                      WHERE
                                          "TopMountedSlideDoorId" = TopMountedSlideDoorId;
END ACCESORIES_TOPMOUNTEDSLIDEDOOR_SELECT;
/