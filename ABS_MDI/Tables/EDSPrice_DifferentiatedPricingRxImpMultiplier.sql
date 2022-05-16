CREATE TABLE abs_mdi."EDSPrice_DifferentiatedPricingRxImpMultiplier" (
  "DifferentiatedPricingRxImpMultiplierId" NUMBER(10) NOT NULL,
  "TransactionGuid" VARCHAR2(200 BYTE) NOT NULL,
  "TimeStamp" TIMESTAMP,
  "BuildingEndUse" VARCHAR2(40 BYTE),
  "BuildingNumber" NUMBER(10) NOT NULL,
  "BuildingName" VARCHAR2(150 BYTE),
  "PanelType" VARCHAR2(20 BYTE),
  "PanelName" VARCHAR2(20 BYTE),
  "PanelWidth" NUMBER(10),
  "PanelThickness" NUMBER(10),
  "PanelApplication" VARCHAR2(20 BYTE),
  "StateProvince" VARCHAR2(4 BYTE),
  "MarketDescription" VARCHAR2(150 BYTE),
  "TotalPanelSquareFeet" NUMBER(10),
  "MultiplierCeiling" NUMBER(10),
  "MultiplierTarget" NUMBER(10),
  "MultiplierFloor" NUMBER(10),
  "MultiplierBoundTarget" NUMBER(10),
  "MultiplierSuggested" NUMBER(10),
  "DatasetLabel" VARCHAR2(100 BYTE),
  "TransactionStatus" NUMBER(10),
  "ErrorText" VARCHAR2(255 BYTE),
  "IsInternalUser" NUMBER(10),
  "JobSizeBin" VARCHAR2(100 BYTE),
  "IndustryBin" VARCHAR2(100 BYTE),
  "RegionBin" VARCHAR2(100 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_DifferentiatedPricingRxImpMultiplier_ProjectId" PRIMARY KEY ("DifferentiatedPricingRxImpMultiplierId","TransactionGuid"),
  CONSTRAINT eds_price_differentiatedpricingrximpmultiplier_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId") DISABLE NOVALIDATE
);