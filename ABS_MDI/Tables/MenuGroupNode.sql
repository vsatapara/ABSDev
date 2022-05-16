CREATE TABLE abs_mdi."MenuGroupNode" (
  "MenuGroupNodeId" NUMBER(10) NOT NULL,
  "MenuName" VARCHAR2(50 BYTE),
  "IsActive" CHAR,
  "IsDelete" CHAR DEFAULT 'N',
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "MenuGroupNode_PK" PRIMARY KEY ("MenuGroupNodeId")
);