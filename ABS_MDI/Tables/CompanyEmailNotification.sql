CREATE TABLE abs_mdi."CompanyEmailNotification" (
  "CompanyEmailNotificationId" NUMBER(5) NOT NULL,
  "CompanyId" NUMBER(5) NOT NULL,
  "PurchaseQueueEmailBuildings" VARCHAR2(50 BYTE),
  "PurchaseQueueEmailComponent" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "CompanyEmailNotification_PK" PRIMARY KEY ("CompanyEmailNotificationId"),
  CONSTRAINT emailnotification FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);