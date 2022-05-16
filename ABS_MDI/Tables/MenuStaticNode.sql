CREATE TABLE abs_mdi."MenuStaticNode" (
  "MenuStaticNodeId" NUMBER(10) NOT NULL,
  "IsActive" CHAR,
  "IsUrlLink" CHAR,
  "Content" NCLOB,
  "FeaturedId" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR DEFAULT 'N',
  "MenuName" VARCHAR2(20 BYTE),
  "UrlLink" VARCHAR2(500 BYTE),
  CONSTRAINT "MenuStaticNode_PK" PRIMARY KEY ("MenuStaticNodeId")
);