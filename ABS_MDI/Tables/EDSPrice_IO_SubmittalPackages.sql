CREATE TABLE abs_mdi."EDSPrice_IO_SubmittalPackages" (
  "SubmittalPackagesId" NUMBER(10),
  "SubmittalPackageID" NUMBER(10) NOT NULL,
  "Description" VARCHAR2(225 BYTE),
  "Quantity" NUMBER(10),
  "Price" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "EDSPrice_IO_SubmittalPackages_PK" PRIMARY KEY ("SubmittalPackageID")
);