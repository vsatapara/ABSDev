CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "InsulationId",
    "BuildingNumber",
    "ElevationOnSW1",
    "ElevationOnSW2",
    "ElevationOnEW3",
    "ElevationOnEW4",
    "ElevationOnRoof",
    "Facing",
    "Tabs",
    "RoofThick",
    "WallThick",
    "RoofSqft",
    "WallSqft",
    "StarterRoll",
    "RunningRoll",
    "FinishRoll",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "ThickRoofInsulation",
    "InsulationType",
    "IncludeTape",
    "IncludeStaples",
    "ElevationOnPartition",
    "PartitionNumber",
    "ElevationOnEaveStrut",
    "SealedTapeTab",
    "FromWall",
    "DesignedRValue",
    "ByManufacturer",
    "OverPurlinGirt",
    "CavityPurlinBracable",
    "DesignedFacing",
    "Markup",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete"
FROM
    "Insulation"
     WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END;
/