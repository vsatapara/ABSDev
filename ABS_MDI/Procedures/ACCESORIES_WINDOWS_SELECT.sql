CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WINDOWS_SELECT" 
(
     WindowId IN NUMBER,
     Windows_Data  OUT  SYS_REFCURSOR
) AS 
BEGIN
   OPEN Windows_Data FOR SELECT
                            "WindowId",
                            "BuildingNumber",
                            "Quantity",
                            "Elevation",
                            "BayNumber",
                            "Type",
                            "SillHeight",
                            "HeaderHeight",
                            "Width",
                            "DistFromLeftCorner",
                            "DistFromLeftCol",
                            "TrimColor",
                            "WindowColor",
                            "SubFraming",
                            "GlassType",
                            "Quality",
                            "IsBuyout",
                            "Weight",
                            "Price",
                            "IsPriced",
                            "ErrorCode",
                            "InsulatedGlass",
                            "FrameFinish",
                            "LocatedInLiner",
                            "LeftSteelLine",
                            "PartitionNumber",
                            "WindowCategory",
                            "InsulationRetainerKit",
                            "CWindowRating",
                            "WindowSize",
                            "BracedBay",
                            "IpAddress",
                            "ProjectId",
                            "IncludeFramedOpening",
                            "IsLocate",
                            "TrimColorValsparCode",
                            "TrimColorSpecialName"
                         FROM
                            "Accesories_Windows"
                         WHERE
                                 "WindowId" = WindowId;
END ACCESORIES_WINDOWS_SELECT;
/