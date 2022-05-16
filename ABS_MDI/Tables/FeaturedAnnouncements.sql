CREATE TABLE abs_mdi."FeaturedAnnouncements" (
  "IsActive" CHAR DEFAULT 'N' NOT NULL,
  "Title" NVARCHAR2(200) NOT NULL,
  "StartDate" TIMESTAMP,
  "EndDate" TIMESTAMP,
  "AnnouncementImageVideoId" NUMBER(10),
  "SortOrder" NUMBER(5),
  "CreatedBy" NUMBER(10) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "FAnnouncementId" NUMBER(10) NOT NULL,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR(1 CHAR) DEFAULT 'N',
  "Description" CLOB NOT NULL,
  "CompanyId" NUMBER(10),
  CONSTRAINT featuredannouncements_pk PRIMARY KEY ("FAnnouncementId"),
  CONSTRAINT "FeaturedAnnounceCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);