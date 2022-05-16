CREATE TABLE abs_mdi."Shipping" (
  "ShippingId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(5) NOT NULL,
  "ShippingPointId" NUMBER(10),
  "ShippingTerms" VARCHAR2(50 BYTE),
  "ShippingContact" VARCHAR2(50 BYTE),
  "Notification" VARCHAR2(50 BYTE),
  "DayPhone" VARCHAR2(50 BYTE),
  "NightPhone" VARCHAR2(50 BYTE),
  "FreightTerms" VARCHAR2(50 BYTE),
  "FreightExpense" NUMBER(10,4),
  "Carrier" VARCHAR2(20 BYTE),
  "Country" VARCHAR2(50 BYTE),
  "State" VARCHAR2(50 BYTE),
  "County" VARCHAR2(50 BYTE),
  "City" VARCHAR2(50 BYTE),
  "Address1" VARCHAR2(500 BYTE),
  "Address2" VARCHAR2(500 BYTE),
  "ZipCode" VARCHAR2(20 BYTE),
  "Latitude" VARCHAR2(50 BYTE),
  "Longitude" VARCHAR2(50 BYTE),
  "RequestedDeliveryDate" DATE,
  "Miles1" VARCHAR2(50 BYTE),
  "Miles2" VARCHAR2(50 BYTE),
  "Miles3" VARCHAR2(50 BYTE),
  "Rate1" VARCHAR2(50 BYTE),
  "Rate2" VARCHAR2(50 BYTE),
  "Rate3" VARCHAR2(50 BYTE),
  "NumberLoads1" VARCHAR2(50 BYTE),
  "NumberLoads2" VARCHAR2(50 BYTE),
  "NumberLoads3" VARCHAR2(50 BYTE),
  "TruckTarps" CHAR,
  "CopyFlag" CHAR,
  "AddIMPOverages" CHAR,
  "AddExportOverages" CHAR,
  "CreatedBy" NVARCHAR2(50),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NVARCHAR2(50),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" CHAR,
  "InternationalSite" VARCHAR2(20 BYTE),
  CONSTRAINT "Shipping_PK" PRIMARY KEY ("ShippingId")
);
COMMENT ON COLUMN abs_mdi."Shipping"."ShippingTerms" IS 'FOB, Customer pick up?';
COMMENT ON COLUMN abs_mdi."Shipping"."ShippingContact" IS 'Shipping contact ';
COMMENT ON COLUMN abs_mdi."Shipping"."DayPhone" IS 'Contact day phone';
COMMENT ON COLUMN abs_mdi."Shipping"."NightPhone" IS 'Contact night phone';
COMMENT ON COLUMN abs_mdi."Shipping"."Carrier" IS 'Name of carrier';
COMMENT ON COLUMN abs_mdi."Shipping"."Country" IS 'Shipping location country';
COMMENT ON COLUMN abs_mdi."Shipping"."State" IS 'Shipping location state';
COMMENT ON COLUMN abs_mdi."Shipping"."County" IS 'Shipping location county';
COMMENT ON COLUMN abs_mdi."Shipping"."City" IS 'Shipping location city';
COMMENT ON COLUMN abs_mdi."Shipping"."Address1" IS 'Shipping location address';
COMMENT ON COLUMN abs_mdi."Shipping"."Address2" IS 'Shipping location address';
COMMENT ON COLUMN abs_mdi."Shipping"."ZipCode" IS 'Shipping location zip/postal code';
COMMENT ON COLUMN abs_mdi."Shipping"."RequestedDeliveryDate" IS 'Requested delivery date';
COMMENT ON COLUMN abs_mdi."Shipping"."TruckTarps" IS '-bool- Truck tarps needed';
COMMENT ON COLUMN abs_mdi."Shipping"."CopyFlag" IS '-bool-  Same as jobsite location?';