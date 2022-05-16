CREATE TABLE abs_mdi."CLM_RiskCategory" (
  "RiskCategoryId" NUMBER(2) GENERATED AS IDENTITY,
  "Name" VARCHAR2(128 BYTE) NOT NULL,
  "SortOrder" NUMBER(2) NOT NULL,
  "IsActive" CHAR NOT NULL,
  "IsDefault" CHAR NOT NULL,
  "IsAvailableForCanada" CHAR NOT NULL,
  CONSTRAINT "CLM_RiskCategory_PK" PRIMARY KEY ("RiskCategoryId")
);