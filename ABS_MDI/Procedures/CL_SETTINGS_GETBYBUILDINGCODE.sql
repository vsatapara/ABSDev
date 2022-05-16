CREATE OR REPLACE PROCEDURE abs_mdi."CL_SETTINGS_GETBYBUILDINGCODE" 
(
    BuildingCode IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "BuildingCode",
    "LiveLoad",
    "LiveLoadReduction",
    "WindLoad1",
    "WindLoad2",
    "WindLoad3",
    "WindLoad4",
    "Wind10",
    "WindExposure",
    "WindExposureList",
    "WindCategory",
    "MilesFromCoastline",
    "GroundSnowLoad",
    "MinRoofSnowLoad",
    "RainIntensity",
    "SnowExposure",
    "SnowExposureList",
    "SeaLevelElevation",
    "SpectralResponseSS",
    "SpectralResponseS1",
    "AcceleratedCoefficientAA" as AcceleratedCoefficientA,
    "VelocityCoefficientAV",
    "SeismicZone",
    "SeismicZoneList",
    "NearSourceFactor",
    "SoilType",
    "SoilTypeList",
    "SnowLoadSeismic",
    "YearWind10",
    "YearWind50",
    "YearWind100",
    "RainLoad",
    "AcceleratedZoneZA",
    "AcceleratedZoneZAList",
    "VelocityZoneZV",
    "VelocityZoneZVList",
    "PeakGrndAccelPGA",
    "SeismicForSchools",
    "Occupancy",
    "OccupancyList",
    "ThermalFactor",
    "ThermalFactorList",
    "SlipperyRoof",
    "Figure6-6Frame",
    "BaseWindElevation",
    "UpwindExtent",
    "SpectralResponseSh",
    "SpectralResponseS2",
    "SiteDataAvailable"
FROM
    "CL_Settings"
    WHERE
                "BuildingCode" in
                ( 
                        SELECT regexp_substr(BuildingCode,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingCode, '[^,]+', 1, level) is not null
                );
END;
/