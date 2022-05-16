CREATE TABLE abs_mdi."Photos" (
  "PhotosId" NUMBER(10) NOT NULL,
  "PhotosDisplayName" NVARCHAR2(30),
  "IsDelete" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "PhotosFile" NUMBER(10),
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyID" NUMBER(10),
  CONSTRAINT photos_pk PRIMARY KEY ("PhotosId"),
  CONSTRAINT "PhotoCompany_FK" FOREIGN KEY ("CompanyID") REFERENCES abs_mdi."Company" ("CompanyId")
);