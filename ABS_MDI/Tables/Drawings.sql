CREATE TABLE abs_mdi."Drawings" (
  "DrawingsId" NUMBER(10),
  "Quantity" NUMBER(10),
  "Type" VARCHAR2(150 BYTE),
  "Purpose" VARCHAR2(50 BYTE),
  "Seal" VARCHAR2(50 BYTE),
  "Enhanced" NUMBER(10),
  "Country" VARCHAR2(50 BYTE),
  "State" VARCHAR2(50 BYTE),
  "InternationalSite" VARCHAR2(50 BYTE),
  "ShipTo" VARCHAR2(50 BYTE),
  "MinQuantity" NUMBER(10),
  "DrawingSize" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE) DEFAULT 'N',
  "ProjectId" NUMBER(10)
);