CREATE TABLE abs_mdi."EDSPrice_CodesLoads" (
  "CodesLoadsId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "BaseGroundSnowElevation" NUMBER(10,2),
  "AirInfiltrationTesting" NUMBER(10),
  "WindLoadType" VARCHAR2(50 BYTE),
  "YearWindLoad1" NUMBER(10,2),
  "YearWindLoad2" NUMBER(10,2),
  "YearWindLoad3" NUMBER(10,2),
  "YearWindLoad4" NUMBER(10,2),
  "MilesFromCoastline" NUMBER(10),
  "SnowDrift" NUMBER(10),
  "SeismicZone" VARCHAR2(50 BYTE),
  "AcceleratedZone" VARCHAR2(50 BYTE),
  "VelocityZone" VARCHAR2(50 BYTE),
  "NearSourceFactor" NUMBER(10,2),
  "Projectid" NUMBER(10),
  "WindCategory" VARCHAR2(20 BYTE),
  "ForSchoolDesign" NUMBER(10),
  "RainOnSnow" NUMBER(10,2),
  "SpectralResponseSH" NUMBER(10,2),
  "SpectralResponseS2" NUMBER(10,2),
  "CalcCustServHours" NUMBER(10,2),
  "AcceleratedCoefficient" NUMBER(10,2),
  "VelocityCoefficient" NUMBER(10,2),
  "CheckGroundSnowLoad" NUMBER(10),
  "ParapetGirtFailure" NUMBER(10),
  "CustServHours" NUMBER(10,2),
  "EngineeringHours" NUMBER(10,2),
  "DraftingHours" NUMBER(10,2),
  "UpwindExtentXR" NUMBER(10,2),
  "CalcEngineeringHours" NUMBER(10,2),
  "CalcDraftingHours" NUMBER(10,2),
  CONSTRAINT "EDSPrice_CodesLoads_PK" PRIMARY KEY ("CodesLoadsId")
);