CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WALKDOOR_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
	"WalkDoorId",
    "ProjectId",
    "BuildingId",
    "Quantity",
    "Elevation",
    "BayNumber",
    "Type",
    "HeaderHeight",
    "Width",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "TrimColor",
    "DoorColor",
    "SwingDirection",
    "LatchGuard",
    "SubFraming",
    "Skin",
    "Lite",
    "Closer",
    "Locktype",
    "Quality",
    "LeafType",
    "StyleSet",
    "IsBuyout",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "KnockDown",
    "Style",
    "WindRated",
    "Size",
    "KeyedAlike",
    "PanicHardware",
    "ChainStop",
    "Insulated",
    "FloridaApproval",
    "LocatedInLiner",
    "Glazing",
    "KickPlate",
    "LeftSteelLine",
    "PartitionNumber",
    "LocateRightSideBay",
    "DistanceFromFloor",
    "DadeBrowardApproved",
    "SsbHinges",
    "AddAnchors",
    "LeafInsulated",
    "LeafsBothActive",
    "Alabel3hour",
    "AdaCompliant",
    "AdditionalAnchorsQty",
    "TrimColorValsparCode",
    "TrimColorSpecialName",
    "Gauge"
FROM
    "Accessories_WalkDoors"
     WHERE
                "BuildingId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END;
/