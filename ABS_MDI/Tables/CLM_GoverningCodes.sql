CREATE TABLE abs_mdi."CLM_GoverningCodes" (
  "GoverningCodeId" VARCHAR2(50 BYTE) NOT NULL,
  "DesignCodeId" NUMBER(10) NOT NULL,
  "GeoRegionId" VARCHAR2(50 BYTE) NOT NULL,
  "IsForReference" CHAR NOT NULL,
  "IsForDesignCodeSelection" CHAR NOT NULL,
  CONSTRAINT "CLM_GoverningCodes_PK" PRIMARY KEY ("GoverningCodeId")
);