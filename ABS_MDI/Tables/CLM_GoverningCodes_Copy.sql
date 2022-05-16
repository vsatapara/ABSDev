CREATE TABLE abs_mdi."CLM_GoverningCodes_Copy" (
  "GoverningCodeGUID" CHAR(255 BYTE) NOT NULL,
  "DesignCodeID" NUMBER NOT NULL,
  "GeoRegionGUID" CHAR(255 BYTE) NOT NULL,
  "IsForReference" VARCHAR2(40 BYTE) DEFAULT 0 NOT NULL,
  "IsForDesignCodeSelection" VARCHAR2(40 BYTE) DEFAULT 0 NOT NULL,
  PRIMARY KEY ("GoverningCodeGUID")
);