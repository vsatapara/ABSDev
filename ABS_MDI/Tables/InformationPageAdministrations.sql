CREATE TABLE abs_mdi."InformationPageAdministrations" (
  "Title" VARCHAR2(100 BYTE) NOT NULL,
  "FeaturedId" NUMBER(10),
  "InformationPageId" NUMBER(10) NOT NULL,
  "CreatedBy" NUMBER(10) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyId" NUMBER(10),
  "Content" NCLOB,
  CONSTRAINT informationpageadministrations_pk PRIMARY KEY ("InformationPageId")
);