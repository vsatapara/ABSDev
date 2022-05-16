CREATE TABLE abs_mdi."ShippingGroup" (
  "Name" VARCHAR2(50 BYTE) NOT NULL,
  "IsForComponents" CHAR NOT NULL,
  "IsActive" CHAR NOT NULL,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR DEFAULT 'N',
  "ShippingGroupId" NUMBER(10) NOT NULL,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "ShippingGroup_PK" PRIMARY KEY ("ShippingGroupId")
);