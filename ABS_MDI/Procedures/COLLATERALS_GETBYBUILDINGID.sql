CREATE OR REPLACE PROCEDURE abs_mdi."COLLATERALS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUTPUT_TABLE FOR 
        SELECT
            "CollateralId",
            "ProjectId",
            "BuildingNumber",
            "CeilingLoad",
            "SprinklerLoad",
            "OtherLoad",
            "PlasterSheetrock",
            "RoofLoad",
            "FrameLoad",
            "BuildingCode",
            "Occupancy",
            "ThermalFactor",
            "BurLoad",
            "CalcRoofSnowLoad",
            "ProjectNumber",
            "BuildingCodeDesign",
            "ImportanceWind",
            "ImportanceSnow",
            "ImportanceSeismic",
            "WindEnclosureInput",
            "WindEnclosureDesign",
            "Escarpment",
            "SnowDrift",
            "StorageBuilding",
            "SlipperyRoof",
            "SeismicDesignCategory",
            "Figure6_6Frame",
            "BaseWindElevation",
            "TempString1",
            "TempString2",
            "TempString3",
            "TempDouble1",
            "TempDouble2",
            "TempDouble3",
            "TempInteger1",
            "TempInteger2",
            "TempInteger3",
            "Sw1SnowDrift",
            "Sw2SnowDrift",
            "Ew3SnowDrift",
            "Ew4SnowDrift",
            "HasSwSnowDrift",
            "HasEwSnowDrift",
            "SnowExposure",
            "UnobstructedFlow",
            "WindLoad",
            "BelowWindMin",
            "DeflectionWindSpeed",
            "SdsOverride",
            "Sd1Override",
            "CreatedBy",
            "CreatedDate",
            "ModifiedBy",
            "ModifiedDate",
            "IpAddress",
            "IsDeleted"
        FROM "Collaterals"
        WHERE "BuildingNumber" in
        ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
        )
        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END COLLATERALS_GETBYBUILDINGID;
/