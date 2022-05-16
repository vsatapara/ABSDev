CREATE OR REPLACE PROCEDURE abs_mdi."GLASSFRONT_GETBYBUILDINGID" (
    buildingid    IN   VARCHAR2,
    output_table  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN output_table FOR SELECT
                              "GlassFrontId" AS id,
                              "Quantity",
                              "Elevation",
                              "BayNumber",
                              "HeaderHeight",
                              "Width",
                              "DistFromLeftCorner",
                              "DistFromLeftCol",
                              "GlassType",
                              "FrameColor",
                              "LeftSidelite",
                              "RightSidelite",
                              "BottomRail",
                              "PanicDevice",
                              "TintedGlass",
                              "IsBuyout",
                              "Weight",
                              "Price",
                              "IsPriced",
                              "ErrorCode",
                              "LeftSteelLine",
                              "PartitionNumber",
                              "LocateRightSideBay",
                              "DistanceFromFloor",
                              "DoorType",
                              "Closer",
                              "SwingDirection",
                              "LockType",
                              "SideliteGlass",
                              "MasonryApp",
                              "ProjectId",
                              "BuildingNumber",
                              "ProjectId"
                          FROM
                              "EDSPrice_IO_GlassFront"
                          WHERE
                              "BuildingNumber" IN (
                                  SELECT
                                      regexp_substr(buildingid, '[^,]+', 1, level)
                                  FROM
                                      dual
                                  CONNECT BY
                                      regexp_substr(buildingid, '[^,]+', 1, level) IS NOT NULL
                              )
                              AND "IsDeleted" != 'Y';
END;
/