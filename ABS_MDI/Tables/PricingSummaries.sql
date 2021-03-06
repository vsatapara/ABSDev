CREATE TABLE abs_mdi."PricingSummaries" (
  "Name" VARCHAR2(256 BYTE) NOT NULL,
  "CampaignId" NUMBER NOT NULL,
  "ShippingToCountryId" NUMBER NOT NULL,
  "CultureId" NUMBER NOT NULL,
  "IsForSignatureOrders" CHAR NOT NULL,
  "IsForComponents" CHAR NOT NULL,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "PricingSummaryId" NUMBER(10) NOT NULL,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  "IsDefault" CHAR,
  "CompanyId" NUMBER(10),
  "IsLoadFromComponent" CHAR,
  "LoadContent" NCLOB,
  CONSTRAINT pricingsummaries_pk PRIMARY KEY ("PricingSummaryId"),
  CONSTRAINT "PricingSummariesCampaing_FK" FOREIGN KEY ("CampaignId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "PricingSummariesCampany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId"),
  CONSTRAINT "PricingSummariesCountry_FK" FOREIGN KEY ("ShippingToCountryId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "PricingSummariesCulture_FK" FOREIGN KEY ("CultureId") REFERENCES abs_mdi."TableOfTables" ("Id")
);