CREATE TABLE abs_mdi."CartingType" (
  "CartingTypeId" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(50 BYTE),
  "MetaName" VARCHAR2(50 BYTE),
  "IsDefault" CHAR DEFAULT 'N',
  "DisplayOrder" NUMBER,
  "IsActive" CHAR DEFAULT 'Y',
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  PRIMARY KEY ("CartingTypeId")
);