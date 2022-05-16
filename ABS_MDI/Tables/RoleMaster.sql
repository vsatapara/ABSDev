CREATE TABLE abs_mdi."RoleMaster" (
  "RoleId" NUMBER(10) NOT NULL,
  "RoleName" VARCHAR2(200 BYTE) NOT NULL,
  "ParentId" NUMBER(10),
  "IsActive" CHAR,
  "IsView" CHAR DEFAULT 'N',
  "IsAdd" CHAR DEFAULT 'N',
  "IsEdit" CHAR DEFAULT 'N',
  "IsHistory" CHAR DEFAULT 'N',
  "IsDelete" CHAR DEFAULT 'N',
  CONSTRAINT "RoleMaster_PK" PRIMARY KEY ("RoleId")
);