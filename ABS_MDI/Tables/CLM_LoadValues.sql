CREATE TABLE abs_mdi."CLM_LoadValues" (
  "LoadValueId" VARCHAR2(50 BYTE) NOT NULL,
  "GoverningCodeId" VARCHAR2(50 BYTE) NOT NULL,
  "LoadTypeId" NUMBER(10) NOT NULL,
  "IsValueUnknown" CHAR NOT NULL,
  "IsImperial" CHAR NOT NULL,
  "Value_01" NUMBER(18,4) NOT NULL,
  "Value_02" NUMBER(18,4) NOT NULL,
  "Value_03" NUMBER(18,4) NOT NULL,
  "Value_04" NUMBER(18,4) NOT NULL,
  "Elevation_01" NUMBER(18,4) NOT NULL,
  "Elevation_02" NUMBER(18,4) NOT NULL,
  "Elevation_03" NUMBER(18,4) NOT NULL,
  "Elevation_04" NUMBER(18,4) NOT NULL,
  "RefDesignCodeID" NUMBER(10) NOT NULL,
  CONSTRAINT "CLM_LoadValues_PK" PRIMARY KEY ("LoadValueId")
);