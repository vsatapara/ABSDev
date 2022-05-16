CREATE TABLE abs_mdi."EDSPrice_DifferentiatedPricingRxRunSuccess" (
  "DifferentiatedPricingRxRunSuccessId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10) NOT NULL,
  "TransactionGuid" VARCHAR2(200 BYTE) NOT NULL,
  "ProjectGuid" VARCHAR2(200 BYTE),
  "TimeStamp" TIMESTAMP,
  "RunDirectory" VARCHAR2(255 BYTE),
  "FileName" VARCHAR2(255 BYTE),
  "ErrorText" VARCHAR2(255 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "EDSPrice_DifferentiatedPricingRxRunSuccess_PK" PRIMARY KEY ("TransactionGuid","DifferentiatedPricingRxRunSuccessId")
);