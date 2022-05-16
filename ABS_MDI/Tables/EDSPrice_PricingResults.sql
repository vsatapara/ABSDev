CREATE TABLE abs_mdi."EDSPrice_PricingResults" (
  "ImpHasSpc" NUMBER(10),
  "EstMultiplier" NUMBER(10,2),
  "Complexity" NUMBER(10),
  "EstComplexity" NUMBER(10),
  "JobsiteSignQty" NUMBER(10),
  "ImpAdjustmentPercent" NUMBER(10,2),
  "ProjectID" NUMBER(10) NOT NULL,
  "TotalWeight" NUMBER(10,2),
  "GrandTotalPrice" NUMBER(10,2),
  "WeatherTightness" NUMBER(10,2),
  "NetTotalPrice" NUMBER(10,2),
  "SeismicUseCategory" VARCHAR2(100 BYTE),
  "PricingResultsId" NUMBER(10) NOT NULL,
  CONSTRAINT "EDSPrice_PricingResults_PK" PRIMARY KEY ("ProjectID","PricingResultsId")
);