CREATE TABLE abs_mdi."TermsAndCondition" (
  "TermsAndConditionsId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(10) NOT NULL,
  "Content" NCLOB,
  "IsForSignatureOrders" CHAR NOT NULL,
  "Name" VARCHAR2(50 BYTE),
  "ShippingToCountryId" NUMBER(5) NOT NULL,
  "CultureId" NUMBER(5) NOT NULL,
  "CampaignId" NUMBER(5) NOT NULL,
  "IsDefault" CHAR,
  "IsForComponents" CHAR NOT NULL,
  "IsForBuildings" CHAR NOT NULL,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  "IsDelete" CHAR DEFAULT 'N',
  CONSTRAINT "ShipingToCountry_FK" FOREIGN KEY ("ShippingToCountryId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "TableofTable_Campaign_FK" FOREIGN KEY ("CampaignId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "TableofTable_Culture_FK" FOREIGN KEY ("CultureId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "TermsAndConditionCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);