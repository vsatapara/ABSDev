CREATE TABLE abs_mdi."EDSPrice_I_DrawingsCeco" (
  "DrawingsCecoId" NUMBER(10) NOT NULL,
  "OrderType" VARCHAR2(50 BYTE),
  "ABoltSets" VARCHAR2(50 BYTE),
  "ABoltSealed" NUMBER(10),
  "ABoltDate" VARCHAR2(50 BYTE),
  "ErectionSets" VARCHAR2(50 BYTE),
  "ErectionSealed" NUMBER(10),
  "ErectionDate" VARCHAR2(50 BYTE),
  "ApprovalSets" VARCHAR2(50 BYTE),
  "ApprovalSealed" NUMBER(10),
  "ApprovalDate" VARCHAR2(50 BYTE),
  "PermitSets" VARCHAR2(50 BYTE),
  "PermitSealed" NUMBER(10),
  "PermitDate" VARCHAR2(50 BYTE),
  "Other" VARCHAR2(50 BYTE),
  "OtherDescription" VARCHAR2(255 BYTE),
  "SpecialMailing" VARCHAR2(50 BYTE),
  "EstimateWorksheet" NUMBER(10),
  "FinancialInformation" NUMBER(10),
  "JobsiteMap" NUMBER(10),
  "BuildingSketch" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_I_DrawingsCeco_ProjectId" PRIMARY KEY ("DrawingsCecoId")
);