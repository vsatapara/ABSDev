CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WINDOWS_GETBYBUILDINGID" 
(
     BuildingNumber IN VARCHAR2,
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
                        "ProjectId"
                         FROM
                            "Accesories_Windows"
                         Where  "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingNumber,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingNumber, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';     
END ACCESORIES_WINDOWS_GETBYBUILDINGID;
/