CREATE TABLE abs_mdi.xx_accessory (
  "AccessoryId" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(50 BYTE) NOT NULL,
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE)
);