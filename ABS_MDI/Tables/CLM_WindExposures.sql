CREATE TABLE abs_mdi."CLM_WindExposures" (
  "WindExposureId" NUMBER(10) GENERATED AS IDENTITY,
  "Name" NVARCHAR2(32),
  "SortOrder" NUMBER(*,0) NOT NULL,
  "IsActive" CHAR NOT NULL,
  "IsDefault" CHAR NOT NULL,
  "IsCanadian" CHAR NOT NULL,
  "ExposureFactor" NUMBER(6,3) NOT NULL,
  CONSTRAINT "WindExposures_PK" PRIMARY KEY ("WindExposureId")
);