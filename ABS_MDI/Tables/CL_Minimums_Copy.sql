CREATE TABLE abs_mdi."CL_Minimums_Copy" (
  "BuildingCode" NVARCHAR2(50),
  "JobsiteState" NVARCHAR2(50),
  "JobsiteCounty" NVARCHAR2(50),
  "JobsiteCity" NVARCHAR2(50),
  "LiveLoad" NUMBER DEFAULT 0,
  "WindLoad1" BINARY_DOUBLE DEFAULT 0,
  "WindLoad2" BINARY_DOUBLE DEFAULT 0,
  "WindLoad3" BINARY_DOUBLE DEFAULT 0,
  "WindLoad4" BINARY_DOUBLE DEFAULT 0,
  "Wind10" BINARY_DOUBLE,
  "Elevation" BINARY_DOUBLE DEFAULT 0,
  "GroundSnowLoad" BINARY_DOUBLE DEFAULT 0,
  "MinRoofSnowLoad" BINARY_DOUBLE DEFAULT 0,
  "RainIntensity" BINARY_DOUBLE DEFAULT 0,
  "SpectralResponseSS" BINARY_DOUBLE DEFAULT 0,
  "SpectralResponseS1" BINARY_DOUBLE DEFAULT 0,
  "AcceleratedCoefficientAA" BINARY_DOUBLE DEFAULT 0,
  "VelocityCoefficientAV" BINARY_DOUBLE DEFAULT 0,
  "SeismicZone" NVARCHAR2(50),
  "ValidLiveLoad" NUMBER DEFAULT 0,
  "ValidWindLoad" NUMBER DEFAULT 0,
  "ValidGroundSnowLoad" NUMBER DEFAULT 0,
  "ValidRainIntensity" NUMBER DEFAULT 0,
  "ValidSpectralResponseSS" NUMBER DEFAULT 0,
  "ValidSpectralResponseS1" NUMBER DEFAULT 0,
  "ValidAcceleratedCoefficientAA" NUMBER DEFAULT 0,
  "ValidVelocityCoefficientAV" NUMBER DEFAULT 0,
  "ValidSeismicZone" NUMBER DEFAULT 0
);
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."BuildingCode" IS 'Building code name';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."JobsiteState" IS 'State that job is located in';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."JobsiteCounty" IS 'County that job is located in';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."JobsiteCity" IS 'City that job is located in';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."LiveLoad" IS 'Minimum live load for this code/county LBS/SQFT';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."WindLoad1" IS 'Minimum wind load for this code/county MPH';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."WindLoad2" IS 'Minimum wind load for this code/county MPH';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."WindLoad3" IS 'Minimum wind load for this code/county MPH';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."WindLoad4" IS 'Minimum wind load for this code/county MPH';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."Wind10" IS 'Minimum deflection wind speed based on 10 Year wind for this code/county MPH';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."GroundSnowLoad" IS 'Minimum snow load for this code/county LBS/SQFT';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."MinRoofSnowLoad" IS 'Minimum roof snow load for this code/county LBS/SQFT';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."RainIntensity" IS 'Minimum rain intensity for this code/county INCH/HOUR';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."SpectralResponseSS" IS 'Minimum Seismic SS for this code/county %';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."SpectralResponseS1" IS 'Minimum Seismic S1 for this code/county %';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."AcceleratedCoefficientAA" IS 'Minimum Accerlerated CoefficientAA';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."VelocityCoefficientAV" IS 'Minimum Velocity CoefficientAV';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."SeismicZone" IS 'Seismic Zone this code/county falls under';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidLiveLoad" IS 'bool - Is Live load a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidWindLoad" IS 'bool - Is Wind Load a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidGroundSnowLoad" IS 'bool - Is Ground Snow Load a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidRainIntensity" IS 'bool - Is Rain Intensity  a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidSpectralResponseSS" IS 'bool - Is Spectral Response SS a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidSpectralResponseS1" IS 'bool - Is Spectral Response S1 a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidAcceleratedCoefficientAA" IS 'bool - IsAccelerated CoefficientAA a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidVelocityCoefficientAV" IS 'bool - IsVelocity CoefficientAV a valid requirement for this city/county';
COMMENT ON COLUMN abs_mdi."CL_Minimums_Copy"."ValidSeismicZone" IS 'bool - Is Seismic Zone a valid requirement for this city/county';