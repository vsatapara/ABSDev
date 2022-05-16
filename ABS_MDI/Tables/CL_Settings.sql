CREATE TABLE abs_mdi."CL_Settings" (
  "BuildingCode" NVARCHAR2(50),
  "LiveLoad" NUMBER DEFAULT 0,
  "LiveLoadReduction" NUMBER DEFAULT 0,
  "WindLoad1" NUMBER DEFAULT 0,
  "WindLoad2" NUMBER DEFAULT 0,
  "WindLoad3" NUMBER DEFAULT 0,
  "WindLoad4" NUMBER DEFAULT 0,
  "Wind10" NUMBER,
  "WindExposure" NUMBER DEFAULT 0,
  "WindExposureList" NUMBER DEFAULT 0,
  "WindCategory" NUMBER DEFAULT 0,
  "MilesFromCoastline" NUMBER DEFAULT 0,
  "GroundSnowLoad" NUMBER DEFAULT 0,
  "MinRoofSnowLoad" NUMBER DEFAULT 0,
  "RainIntensity" NUMBER DEFAULT 0,
  "SnowExposure" NUMBER DEFAULT 0,
  "SnowExposureList" NUMBER DEFAULT 0,
  "SeaLevelElevation" NUMBER DEFAULT 0,
  "SpectralResponseSS" NUMBER DEFAULT 0,
  "SpectralResponseS1" NUMBER DEFAULT 0,
  "AcceleratedCoefficientAA" NUMBER DEFAULT 0,
  "VelocityCoefficientAV" NUMBER DEFAULT 0,
  "SeismicZone" NUMBER DEFAULT 0,
  "SeismicZoneList" NUMBER DEFAULT 0,
  "NearSourceFactor" NUMBER DEFAULT 0,
  "SoilType" NUMBER DEFAULT 0,
  "SoilTypeList" NUMBER DEFAULT 0,
  "SnowLoadSeismic" NUMBER DEFAULT 0,
  "YearWind10" NUMBER DEFAULT 0,
  "YearWind50" NUMBER DEFAULT 0,
  "YearWind100" NUMBER DEFAULT 0,
  "RainLoad" NUMBER DEFAULT 0,
  "AcceleratedZoneZA" NUMBER DEFAULT 0,
  "AcceleratedZoneZAList" NUMBER DEFAULT 0,
  "VelocityZoneZV" NUMBER DEFAULT 0,
  "VelocityZoneZVList" NUMBER DEFAULT 0,
  "PeakGrndAccelPGA" NUMBER DEFAULT 0,
  "SeismicForSchools" NUMBER DEFAULT 0,
  "Occupancy" NUMBER DEFAULT 0,
  "OccupancyList" NUMBER DEFAULT 0,
  "ThermalFactor" NUMBER DEFAULT 0,
  "ThermalFactorList" NUMBER DEFAULT 0,
  "SlipperyRoof" NUMBER DEFAULT 0,
  "Figure6-6Frame" NUMBER DEFAULT 0,
  "BaseWindElevation" NUMBER DEFAULT 0,
  "UpwindExtent" NUMBER DEFAULT 0,
  "SpectralResponseSh" NUMBER DEFAULT 0,
  "SpectralResponseS2" NUMBER DEFAULT 0,
  "SiteDataAvailable" NUMBER DEFAULT 0,
  "BuildingCodeDesc" NVARCHAR2(50),
  "IsSupport" CHAR,
  isseismicnewcal CHAR
);
COMMENT ON COLUMN abs_mdi."CL_Settings"."BuildingCode" IS 'Building code name';
COMMENT ON COLUMN abs_mdi."CL_Settings"."LiveLoad" IS 'bool - Is live load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."LiveLoadReduction" IS 'bool - Is live load reduction a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindLoad1" IS 'bool - Is wind load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindLoad2" IS 'bool - Is wind load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindLoad3" IS 'bool - Is wind load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindLoad4" IS 'bool - Is wind load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."Wind10" IS 'bool - Is wind 10 a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindExposure" IS 'bool - Is wind exposure a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindExposureList" IS 'which wind exposure list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."WindCategory" IS 'bool - Is wind category a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."MilesFromCoastline" IS 'bool - Is miles from coastline a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."GroundSnowLoad" IS 'bool - Is Ground snow load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."MinRoofSnowLoad" IS 'bool - Is minimum roof snow load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."RainIntensity" IS 'bool - Is rain intensity a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SnowExposure" IS 'bool - Is snow exposure a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SnowExposureList" IS 'which snow exposure list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SeaLevelElevation" IS 'bool - Is sea level elevation a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SpectralResponseSS" IS 'bool - Is spectral response SS a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SpectralResponseS1" IS 'bool - Is spectral response S1  a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."AcceleratedCoefficientAA" IS 'bool - Is accelerated coefficientAA a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."VelocityCoefficientAV" IS 'bool - Is velocity coefficient a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SeismicZone" IS 'bool - Is seismic zone a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SeismicZoneList" IS 'which seismic zone list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."NearSourceFactor" IS 'bool - Is near source factor a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SoilType" IS 'bool - Is soil type a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SoilTypeList" IS 'which soil type list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SnowLoadSeismic" IS 'bool - Is snow load seismic a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."YearWind10" IS 'bool - Is 10 year wind a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."YearWind50" IS 'bool - Is 50 year wind a requirement for this code //BW-6575: Add NBCC 2015 to the BWX Supported Building Codes: YearWind30 to YearWind50';
COMMENT ON COLUMN abs_mdi."CL_Settings"."YearWind100" IS 'bool - Is 100 year wind a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."RainLoad" IS 'bool - Is rain load a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."AcceleratedZoneZA" IS 'bool - Is accelerated zoneZA a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."AcceleratedZoneZAList" IS 'which accelerated zoneZa list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."VelocityZoneZV" IS 'bool - Is velocity zoneZV a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."VelocityZoneZVList" IS 'which velocity zoneZV list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."PeakGrndAccelPGA" IS 'bool - Is peak ground acceleration a requirement for this code //BW-6575: Add NBCC 2015 to the BWX Supported Building Codes: Rename ZonalVelocityRatioV to PeakGrndAccelPGA';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SeismicForSchools" IS 'bool - Is seismic for schools a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."Occupancy" IS 'bool - Is occupancy a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."OccupancyList" IS 'which occupancy list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."ThermalFactor" IS 'bool - Is thermal factor a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."ThermalFactorList" IS 'which thermal factor list to display';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SlipperyRoof" IS 'bool - Is slippery roof a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."Figure6-6Frame" IS 'bool - Is 6frame a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."BaseWindElevation" IS 'bool - Is base wind elevation a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."UpwindExtent" IS 'bool - Is Upwind Extent a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SpectralResponseSh" IS 'bool - Is spectral response Sh a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SpectralResponseS2" IS 'bool - Is spectral response S2 a requirement for this code';
COMMENT ON COLUMN abs_mdi."CL_Settings"."SiteDataAvailable" IS 'bool - Is Site Specific Study Data options available for this code';