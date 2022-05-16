CREATE TABLE abs_mdi."ProjectUser" (
  "ProjectUserId" NUMBER(10) NOT NULL,
  "FromUserId" VARCHAR2(50 BYTE) NOT NULL,
  "ProjectId" NUMBER(10) NOT NULL,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsActive" VARCHAR2(1 BYTE) NOT NULL,
  CONSTRAINT "ProjectUser_PK" PRIMARY KEY ("ProjectUserId")
);