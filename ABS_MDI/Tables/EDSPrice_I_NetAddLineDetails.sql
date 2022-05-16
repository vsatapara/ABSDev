CREATE TABLE abs_mdi."EDSPrice_I_NetAddLineDetails" (
  "NetAddLineDetailsId" NUMBER(10) NOT NULL,
  "Guid" RAW(16) NOT NULL,
  "Description" VARCHAR2(255 BYTE),
  "Weight" NUMBER(10,2),
  "SellPrice" NUMBER(10,2),
  "Cost" NUMBER(10,2),
  "Margin" NUMBER(10,2),
  "Markup" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_I_NetAddLineDetails_ProjectId" PRIMARY KEY ("NetAddLineDetailsId","Guid")
);