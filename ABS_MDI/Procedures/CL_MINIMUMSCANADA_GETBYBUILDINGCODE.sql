CREATE OR REPLACE PROCEDURE abs_mdi."CL_MINIMUMSCANADA_GETBYBUILDINGCODE" 
(
    BuildingCode IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "MinimumsCanadaId",
    "BuildingCode",
    "JobsiteProvince",
    "JobsiteCity",
    "LiveLoad",
    "GroundSnowLoad",
    "YearWind10",
    "YearWind50",
    "YearWind100",
    "UpwindExtentXr",
    "RainLoad",
    "AcceleratedZoneZA",
    "VelocityZoneZV",
    "PeakGrndAccelPGA",
    "SpectralResponseSs",
    "SpectralResponseSh",
    "SpectralResponseS1",
    "SpectralResponseS2",
    "ValidLiveLoad",
    "ValidGroundSnowLoad",
    "ValidYearWind10",
    "ValidYearWind50",
    "ValidYearWind100",
    "ValidUpwindExtentXr",
    "ValidRainLoad",
    "ValidAcceleratedZoneZA",
    "ValidVelocityZoneZV",
    "ValidPeakGrndAccelPGA",
    "ValidSpectralResponseSs",
    "ValidSpectralResponseSh",
    "ValidSpectralResponseS1",
    "ValidSpectralResponseS2",
    "RainIntensity",
    "IsDeleted"
FROM
    "CL_MinimumsCanada"
                WHERE
                "BuildingCode" in
                ( 
                        SELECT regexp_substr(BuildingCode,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingCode, '[^,]+', 1, level) is not null
                )
                AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END;
/