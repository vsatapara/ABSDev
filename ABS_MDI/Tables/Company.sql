CREATE TABLE abs_mdi."Company" (
  "CompanyId" NUMBER(10) NOT NULL,
  "CompanyName" VARCHAR2(128 BYTE) NOT NULL,
  "AdministratorEmail" NVARCHAR2(150) NOT NULL,
  "IsActive" CHAR,
  "ShippingPlantGroupFromParentId" NUMBER(5),
  "PricingSegmentFromParentId" NUMBER(5),
  "ShippingZoneGroupFromParentId" NUMBER(5),
  "PermissionGroupFromParentId" NUMBER(5),
  "IsNotStockedMessageForComponents" NVARCHAR2(128),
  "IsNotAvailableMessageForComponents" NVARCHAR2(128),
  "BuildingPhone" NUMBER(13) NOT NULL,
  "ComponentPhone" NUMBER(13),
  "BuildingPriceMultiplier" NUMBER(10,2),
  "ComponentPriceMultiplier" NUMBER(10,2),
  "IsBasedInUsa" CHAR NOT NULL,
  "IsNciBrand" CHAR,
  "IsQuickQuoteAvailable" CHAR,
  "MailServerHost" NVARCHAR2(20),
  "MailServerPort" NUMBER(10),
  "MailServerIsAuthenticationRequired" CHAR,
  "MailServerUserName" VARCHAR2(20 BYTE),
  "MailServerPassword" VARCHAR2(20 BYTE),
  "ReplyToAddress" VARCHAR2(128 BYTE),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "ExpressDeliveryPrice" FLOAT,
  "WetStampFee" FLOAT,
  "IsAllowedChildCompanies" CHAR,
  "IpAddress" VARCHAR2(20 BYTE),
  "ComponentsShippingGroupId" NUMBER(5),
  "ComponentsPricingSegmentId" NUMBER(5),
  "ComponentsIncExcGeoRegionGroupId" NUMBER(5),
  "IsDelete" CHAR DEFAULT 'N',
  "CRMCompanyId" VARCHAR2(20 BYTE),
  "WebLink" VARCHAR2(100 BYTE),
  "Extra_Material_Links" VARCHAR2(200 BYTE),
  companycode VARCHAR2(50 BYTE),
  CONSTRAINT company_pk PRIMARY KEY ("CompanyId")
);