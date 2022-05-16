CREATE TABLE abs_mdi."AccessoryType" (
  "AccessoryTypeId" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(100 BYTE) NOT NULL,
  "ParentId" NUMBER(*,0),
  "DisplayOrder" NUMBER(10),
  CONSTRAINT "AccessoryType_PK" PRIMARY KEY ("AccessoryTypeId")
);