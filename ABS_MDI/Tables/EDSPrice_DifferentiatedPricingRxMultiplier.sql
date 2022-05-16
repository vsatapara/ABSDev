CREATE TABLE abs_mdi."EDSPrice_DifferentiatedPricingRxMultiplier" (
  "DifferentiatedPricingRxMultiplierId" NUMBER(10) NOT NULL,
  "TransactionGuid" VARCHAR2(200 BYTE) NOT NULL,
  "TimeStamp" VARCHAR2(50 BYTE),
  "Complexity" NUMBER(10),
  "CustomerNumber" VARCHAR2(25 BYTE),
  "BrandName" VARCHAR2(50 BYTE),
  "IsExpress" NUMBER(10),
  "StateProvince" VARCHAR2(10 BYTE),
  "BuildingEndUse" VARCHAR2(40 BYTE),
  "TonsTotal" NUMBER(10),
  "IsPrivateLabel" NUMBER(10),
  "MultiplierCeiling" NUMBER(10),
  "MultiplierTarget" NUMBER(10),
  "MultiplierFloor" NUMBER(10),
  "MultiplierFromBwx" NUMBER(10),
  "MultiplierRequested" NUMBER(10),
  "MultiplierFinal" NUMBER(10),
  "MultiplierSuggested" NUMBER(10),
  "DatasetLabel" VARCHAR2(100 BYTE),
  "TransactionStatus" NUMBER(10),
  "LastUpdated" VARCHAR2(50 BYTE),
  "ErrorText" VARCHAR2(255 BYTE),
  "IsInternalUser" NUMBER(10),
  "OrderSizeBin" VARCHAR2(100 BYTE),
  "CustomerSizeBin" VARCHAR2(100 BYTE),
  "CompetitiveStateGroup" VARCHAR2(100 BYTE),
  "IndustryBin" VARCHAR2(100 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "EDSPrice_DifferentiatedPricingRxMultiplier_PK" PRIMARY KEY ("DifferentiatedPricingRxMultiplierId","TransactionGuid")
);