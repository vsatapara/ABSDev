CREATE TABLE abs_mdi."Occupancies" (
  "OccupancyId" NUMBER(10) NOT NULL,
  "SortOrder" NUMBER(10) NOT NULL,
  "IsActive" NUMBER(1) NOT NULL,
  "IsDefault" NUMBER(1) NOT NULL,
  "Name" VARCHAR2(50 BYTE) NOT NULL,
  "HurricaneImportanceFactor" NUMBER(10,4) NOT NULL,
  "NonHurricaneImportanceFactor" NUMBER(10,4) NOT NULL,
  "IsAvailableForCanada" NUMBER(1) NOT NULL,
  "WindLoadImportanceFactorForCanada" NUMBER(10,4) NOT NULL,
  "SeismicLoadImportanceFactorForCanada" NUMBER(10,4) NOT NULL,
  "SnowLoadImportanceFactorForCanada" NUMBER(10,4) NOT NULL,
  "SnowLoadImportanceFactor" NUMBER(10,4) NOT NULL,
  "WindLoadImportanceFactorForIbc2012Based" NUMBER(1) NOT NULL,
  "SeismicImportanceLoadFactorForIbc2012Based" NUMBER(10,4) NOT NULL,
  "WindLoadImportanceFactorForNonIbc2012Based" NUMBER(10,4) NOT NULL,
  "SeismicImportanceLoadFactorForNonIbc2012Based" NUMBER(10,4) NOT NULL,
  CONSTRAINT "Occupancies_PK" PRIMARY KEY ("OccupancyId")
);