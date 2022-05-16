CREATE TABLE abs_mdi."Accesories_PurlinExtensions" (
  "PurlinExtensionId" NUMBER(5) NOT NULL,
  "ProjectId" NUMBER(5) NOT NULL,
  "BuildingNumber" NUMBER(5) NOT NULL,
  "Elevation" CHAR NOT NULL,
  "DistanceFromLeftCorner" NUMBER(20,4) DEFAULT 0 NOT NULL,
  "StartCol" NUMBER(20,4) DEFAULT 1 NOT NULL,
  "StopCol" NUMBER(20,4) DEFAULT 0 NOT NULL,
  "Projection" NUMBER(20,4) DEFAULT 1 NOT NULL,
  "BuildingWidth" NUMBER(20,4) NOT NULL,
  "SoffitPanelType" VARCHAR2(100 BYTE) NOT NULL,
  "SoffitPanelGauge" NUMBER(20,4) DEFAULT 0 NOT NULL,
  "SoffitPanelColor" VARCHAR2(100 BYTE),
  "SoffitPanelColorSpecialName" VARCHAR2(100 BYTE),
  "SoffitPanelColorValsparCode" VARCHAR2(100 BYTE),
  "SoffitTrimColor" VARCHAR2(100 BYTE),
  "SoffitTrimColorSpecialName" VARCHAR2(100 BYTE),
  "SoffitTrimColorSpecialCode" VARCHAR2(100 BYTE),
  "IsInsulated" CHAR DEFAULT 'N' NOT NULL,
  "SoffixFacingSpecial" CHAR DEFAULT 'N' NOT NULL,
  "ReverseRollSoffit" CHAR DEFAULT 'N' NOT NULL,
  "SoffitFacingWeight" NUMBER(20,4) DEFAULT 0 NOT NULL,
  "SoffitFacingDeflection" NUMBER(20,4) DEFAULT 0 NOT NULL,
  "IsDelete" CHAR DEFAULT 'N' NOT NULL,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP DEFAULT SYSDATE,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP DEFAULT SYSDATE,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT sys_c0012948 PRIMARY KEY ("PurlinExtensionId","Projection")
);