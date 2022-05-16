CREATE TABLE abs_mdi."CLM_LoadTypes" (
  "LoadTypeId" NUMBER(10) NOT NULL,
  "Code" NVARCHAR2(50) NOT NULL,
  "Description" NVARCHAR2(50) NOT NULL,
  CONSTRAINT "CLM_LoadTypes_PK" PRIMARY KEY ("LoadTypeId")
);