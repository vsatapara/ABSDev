CREATE TABLE abs_mdi."CpuAddresses" (
  "AddressId" NUMBER(10) NOT NULL,
  "IsActive" CHAR,
  "CanUseForMailing" CHAR,
  "Address1" NVARCHAR2(500) NOT NULL,
  "Address2" NVARCHAR2(500),
  "City" NVARCHAR2(500),
  "CountyRegion" NVARCHAR2(500) NOT NULL,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "IpAddress" VARCHAR2(20 BYTE),
  "Name" NVARCHAR2(500),
  CONSTRAINT "CpuAddresses_PK" PRIMARY KEY ("AddressId")
);