CREATE TABLE abs_mdi.xx_notification (
  "NotificationId" NUMBER(10),
  "IsActive" CHAR,
  "StartDate" DATE,
  "EndDate" DATE,
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
  "Content" CLOB
);