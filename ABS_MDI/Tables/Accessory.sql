CREATE TABLE abs_mdi."Accessory" (
  "AccessoryId" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(50 BYTE) NOT NULL,
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT accessory_pk PRIMARY KEY ("AccessoryId")
);