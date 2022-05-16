CREATE TABLE abs_mdi."PermissionTransaction" (
  "PermissionTransactionId" NUMBER(10) NOT NULL,
  "PermissionId" NUMBER(10) NOT NULL,
  "RoleId" NUMBER(10),
  "IsAdd" CHAR,
  "IsEdit" CHAR,
  "IsDelete" CHAR,
  "IsView" CHAR,
  "IsHistory" CHAR,
  "IsActive" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  CONSTRAINT "PermissionTransaction_PK" PRIMARY KEY ("PermissionTransactionId")
);