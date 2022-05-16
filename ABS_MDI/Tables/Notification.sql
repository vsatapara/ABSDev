CREATE TABLE abs_mdi."Notification" (
  "NotificationId" NUMBER(10) NOT NULL,
  "IsActive" CHAR,
  "StartDate" TIMESTAMP,
  "EndDate" TIMESTAMP,
  "CompanyId" NUMBER,
  "SortOrder" NUMBER(5),
  "IsSystemNotification" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "NotificationName" VARCHAR2(50 BYTE),
  "FeaturedImageId" VARCHAR2(200 BYTE),
  "IpAddress" VARCHAR2(20 BYTE),
  "Content" CLOB NOT NULL,
  CONSTRAINT notificationadministration_pk PRIMARY KEY ("NotificationId")
);