CREATE TABLE abs_mdi."CompanyInformation" (
  "CompanyInformationId" NUMBER(5) NOT NULL,
  "CompanyId" NUMBER(5) NOT NULL,
  "IsTruckTarpAvaileble" CHAR,
  "IsTrucTarpMandatory" CHAR,
  "ItemNotStrocked" VARCHAR2(50 BYTE),
  "ItemNotAvaileble" VARCHAR2(50 BYTE),
  "QuoteExpirationDays" NUMBER(5),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "CompanyInformation_PK" PRIMARY KEY ("CompanyInformationId"),
  CONSTRAINT information_fk FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);