CREATE TABLE abs_mdi."EDSPrice_I_ErectionInformation" (
  "ErectionInformationId" NUMBER(10),
  "Erected" NUMBER(10),
  "Erector" VARCHAR2(50 BYTE),
  "EUnion" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10) NOT NULL
);