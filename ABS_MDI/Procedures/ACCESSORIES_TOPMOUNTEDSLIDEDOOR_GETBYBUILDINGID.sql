CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_TOPMOUNTEDSLIDEDOOR_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
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
	"IsBuyout"
FROM
    "Accesories_TopMountedSlideDoor"
     WHERE
                "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';
END;
/