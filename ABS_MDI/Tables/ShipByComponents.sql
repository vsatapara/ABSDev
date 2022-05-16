CREATE TABLE abs_mdi."ShipByComponents" (
  "ShipById" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(200 BYTE) NOT NULL,
  "IsActive" CHAR NOT NULL,
  "DisplayOrder" NUMBER(10) DEFAULT 0 NOT NULL,
  "MetaName" VARCHAR2(200 BYTE) NOT NULL,
  "Default" CHAR NOT NULL,
  "CreatedBy" NUMBER(10) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  CONSTRAINT "ShipByComponents_PK" PRIMARY KEY ("ShipById")
);