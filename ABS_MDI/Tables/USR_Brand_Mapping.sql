CREATE TABLE abs_mdi."USR_Brand_Mapping" (
  "UserBrandMappingId" NUMBER(10) NOT NULL,
  "BrandId" NUMBER(10),
  "BrandName" VARCHAR2(200 BYTE),
  "MappingBrandId" NUMBER(10),
  CONSTRAINT "UserBrandMapping_PK" PRIMARY KEY ("UserBrandMappingId")
);