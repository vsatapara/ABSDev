CREATE TABLE abs_mdi."BuilderNews" (
  "BuilderNewsId" NUMBER NOT NULL,
  "Title" VARCHAR2(50 BYTE),
  "FilterTag" NUMBER(5),
  "PublishDate" DATE,
  "UnpublishDate" DATE,
  "IsActive" CHAR,
  "IsDelete" CHAR,
  "CreatedBy" NUMBER(*,0),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(*,0),
  "ModifiedDate" TIMESTAMP,
  "Content" NCLOB,
  "BuilderNewsImageId" NUMBER(5),
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyId" NUMBER(10),
  CONSTRAINT "BuilderNews_PK" PRIMARY KEY ("BuilderNewsId"),
  CONSTRAINT buildernewscompany_fk FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);