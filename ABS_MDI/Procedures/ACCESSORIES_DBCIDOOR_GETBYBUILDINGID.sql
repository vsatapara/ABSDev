CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_DBCIDOOR_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "DbciDoorId",
    "ProjectId",
    "BuildingId",
    "BayNumber",
    "Quantity",
    "Elevation",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "DoorSeries",
    "DoorSize",
    "DoorColor",
    "Width",
    "Heigth",
    "ResistWind",
    "Insulated",
    "LockType",
    "LocateInLiner",
    "Seal",
    "OperatorType",
    "RemoteTransmitter",
    "Hood",
    "Weigth",
    "Price",
    "IsPriced",
    "LeftSteelLine",
    "PartitionNumber",
    "DistFromFloor",
    "CoverTrim",
    "ColorValsparCode",
    "ColorSpecialName",
    "PreGalvanizedFraming",
    "ClipAttachment",
    "TrimColor",
    "Type",
    "TrimColorValsparCode",
    "TrimColorSpecialName",
    "SillHeight",
    "ErrorCode"
FROM
    "Accessories_DBCIDoor"
     WHERE
                "BuildingId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDeleted" != 'Y';
END;
/