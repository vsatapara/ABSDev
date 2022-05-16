CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORY_DBCIDOOR_SELECT" 
(
    DbciDoorId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
    SELECT
        AD."DbciDoorId",
        AD."ProjectId",
        AD."BuildingId",
        AD."Quantity",
        AD."Elevation",
        AD."BayNumber",
        AD."DistFromLeftCorner",
        AD."DistFromLeftCol",
        AD."DoorSeries",
        AD."DoorSize",
        AD."DoorColor",
         AD."TrimColor",
        AD."Width",
        AD."Heigth",
        AD."ResistWind",
        AD."Insulated",
        AD."LockType",
        AD."Type",
        AD."LocateInLiner",
        AD."Seal",
        AD."OperatorType",
        AD."RemoteTransmitter",
        AD."Hood",
        AD."Weigth",
        AD."Price",
        AD."IsPriced",
        AD."LeftSteelLine",
        AD."PartitionNumber",
        AD."DistFromFloor",
		AD."CoverTrim",
		AD."ColorValsparCode",
		AD."ColorSpecialName",
        AD."TrimColorValsparCode",
        AD."TrimColorSpecialName",
		AD."PreGalvanizedFraming",
		AD."ClipAttachment",
        AD."SillHeight"
        FROM
        "Accessories_DBCIDoor" AD
        Where AD."DbciDoorId" = DbciDoorId;                
END ACCESSORY_DBCIDOOR_SELECT;
/