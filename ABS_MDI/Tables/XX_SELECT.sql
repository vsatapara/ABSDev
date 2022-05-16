CREATE TABLE abs_mdi.xx_select (
  "ProjectUserId" NUMBER(5) NOT NULL,
  "FromUserId" VARCHAR2(50 BYTE),
  "ProjectId" NUMBER(5),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsActive" NUMBER(2),
  "TEST" VARCHAR2(10 BYTE) DEFAULT 'Y'
);