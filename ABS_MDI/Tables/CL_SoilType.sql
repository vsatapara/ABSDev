CREATE TABLE abs_mdi."CL_SoilType" (
  "Id" NUMBER(10,2) NOT NULL,
  "SoilTypeList" NUMBER(10),
  "SoilTypeValue" VARCHAR2(50 BYTE),
  "DisplayOrder" NUMBER(10),
  CONSTRAINT "CL_SoilType_PK" PRIMARY KEY ("Id")
);