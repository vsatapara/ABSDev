CREATE TABLE abs_mdi."PresidentsAdvisoryCouncil" (
  "PresidentsAdvisoryCouncilId" NUMBER(10) NOT NULL,
  "TabName" VARCHAR2(200 BYTE),
  "MembersOnly" CHAR,
  "Sort" NUMBER(10),
  "Title" VARCHAR2(200 BYTE),
  "Content" NCLOB,
  "CommitteesContent" NCLOB,
  "MembersContent" NCLOB,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "FeaturedImageVideo" NUMBER(10),
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyId" NUMBER(10),
  "IsDelete" CHAR,
  CONSTRAINT presidentsadvisorycouncil_pk PRIMARY KEY ("PresidentsAdvisoryCouncilId"),
  CONSTRAINT "PresidentsAdvisoryCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);