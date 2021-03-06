CREATE TABLE abs_mdi."CompanyPortalDetail" (
  "PortalDetailId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(5) NOT NULL,
  "PortalSoftwareName" NVARCHAR2(100),
  "PortalHeaderDescriptor" NVARCHAR2(200),
  "PortalURL" NVARCHAR2(500),
  "GoogleTagManagerId" NUMBER(5),
  "BuilderWroxSoftwareName" NVARCHAR2(200),
  "FeedBackEmailAddress" NVARCHAR2(200),
  "Favaicon" NUMBER(5),
  "CompanyLogo" NUMBER(5),
  "SignInPage" NUMBER(5),
  "SignInPageLogo" NUMBER(5),
  "PurchaseOrderLogo" NUMBER(5),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "CompanyPortalDetail_PK" PRIMARY KEY ("PortalDetailId"),
  CONSTRAINT "CompanyPortalDetail_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);