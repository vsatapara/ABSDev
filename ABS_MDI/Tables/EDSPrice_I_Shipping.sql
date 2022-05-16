CREATE TABLE abs_mdi."EDSPrice_I_Shipping" (
  "ShippingId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10) NOT NULL,
  "ShippingTerms" VARCHAR2(50 BYTE),
  "NotifyContact" VARCHAR2(50 BYTE),
  "Notification" VARCHAR2(50 BYTE),
  "DayPhone" VARCHAR2(50 BYTE),
  "NightPhone" VARCHAR2(50 BYTE),
  "FreightTerms" VARCHAR2(50 BYTE),
  "FreightExpense" NUMBER(10),
  "Carrier" VARCHAR2(50 BYTE),
  "Country" VARCHAR2(50 BYTE),
  "State" VARCHAR2(50 BYTE),
  "County" VARCHAR2(50 BYTE),
  "City" VARCHAR2(50 BYTE),
  "Address1" VARCHAR2(50 BYTE),
  "Address2" VARCHAR2(50 BYTE),
  "ZipCode" VARCHAR2(50 BYTE),
  "RequestedDeliveryDate" VARCHAR2(50 BYTE),
  "Miles1" VARCHAR2(50 BYTE),
  "Miles2" VARCHAR2(50 BYTE),
  "Miles3" VARCHAR2(50 BYTE),
  "Rate1" VARCHAR2(50 BYTE),
  "Rate2" VARCHAR2(50 BYTE),
  "Rate3" VARCHAR2(50 BYTE),
  "NumberLoads1" VARCHAR2(50 BYTE),
  "NumberLoads2" VARCHAR2(50 BYTE),
  "NumberLoads3" VARCHAR2(50 BYTE),
  "TruckTarps" NUMBER(10),
  "InternationalSite" VARCHAR2(50 BYTE),
  "CopyFlag" NUMBER(10),
  "ProjectNumber" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "Pk_EDSPrice_I_Shipping_ProjectId" PRIMARY KEY ("ProjectId")
);