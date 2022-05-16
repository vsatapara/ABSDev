CREATE OR REPLACE PROCEDURE abs_mdi."CL_MINIMUMS_GETBYBUILDINGCODE" 
(
    BuildingCode IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "BuildingCode",
    "JobsiteState",
    "JobsiteCounty",
    "JobsiteCity",
    "LiveLoad",
    "WindLoad1",
    "WindLoad2",
    "WindLoad3",
    "WindLoad4",
    "Wind10",
    "Elevation",
    "GroundSnowLoad",
    "MinRoofSnowLoad",
    "RainIntensity",
    "SpectralResponseSS",
    "SpectralResponseS1",
    "AcceleratedCoefficientAA",
    "VelocityCoefficientAV",
    "SeismicZone",
    "ValidLiveLoad",
    "ValidWindLoad",
    "ValidGroundSnowLoad",
    "ValidRainIntensity",
    "ValidSpectralResponseSS",
    "ValidSpectralResponseS1",
    "ValidAcceleratedCoefficientAA",
    "ValidVelocityCoefficientAV",
    "ValidSeismicZone",
    "IsDeleted"
FROM
    "CL_Minimums"
                WHERE
                "BuildingCode" in
                ( 
                        SELECT regexp_substr(BuildingCode,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingCode, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END CL_MINIMUMS_GETBYBUILDINGCODE;
/