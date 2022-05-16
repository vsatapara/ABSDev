CREATE TABLE abs_mdi."PortalFeatures" (
  "FeatureId" NUMBER(10) NOT NULL,
  "FeatureName" NVARCHAR2(20) NOT NULL,
  "FeatureDescription" NVARCHAR2(20) NOT NULL,
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  CONSTRAINT portalfeatures_pk PRIMARY KEY ("FeatureId")
);