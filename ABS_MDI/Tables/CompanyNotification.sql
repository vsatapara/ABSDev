CREATE TABLE abs_mdi."CompanyNotification" (
  "CompanyNotificationId" NUMBER(10) NOT NULL,
  "CompanyNotificationName" VARCHAR2(60 BYTE),
  "IsActive" CHAR,
  "StartDate" TIMESTAMP,
  "EndDate" TIMESTAMP,
  "CompanyId" NUMBER,
  "SortOrder" NUMBER(5),
  "Content" CLOB NOT NULL,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "CompanyNotification_PK" PRIMARY KEY ("CompanyNotificationId")
);