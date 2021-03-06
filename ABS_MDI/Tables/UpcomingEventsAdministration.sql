CREATE TABLE abs_mdi."UpcomingEventsAdministration" (
  "UpcomingEventId" NUMBER(10) NOT NULL,
  "Title" NVARCHAR2(50) NOT NULL,
  "EventCategoryId" NUMBER(10),
  "StartDate" DATE,
  "EndDate" DATE,
  "Time" VARCHAR2(20 BYTE),
  "Location" VARCHAR2(100 BYTE),
  "ActionButtonTitle" NVARCHAR2(50),
  "ActionButtonURL" VARCHAR2(500 BYTE),
  "FeaturedFile" NUMBER(10),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IsActive" CHAR DEFAULT 'Y',
  "IpAddress" VARCHAR2(50 BYTE),
  "CompanyId" NUMBER(10),
  "IsDelete" CHAR DEFAULT 'N',
  "Content" NCLOB,
  CONSTRAINT "UpcomingEventsAdministration_PK" PRIMARY KEY ("UpcomingEventId"),
  CONSTRAINT "EventCategory_FK" FOREIGN KEY ("EventCategoryId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "UpcomingEventsCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);