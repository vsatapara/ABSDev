CREATE TABLE abs_mdi."Groups" (
  "GroupId" NVARCHAR2(50) NOT NULL,
  "GroupName" VARCHAR2(50 BYTE) NOT NULL,
  "IsActive" CHAR NOT NULL,
  CONSTRAINT "Groups_PK" PRIMARY KEY ("GroupId")
);