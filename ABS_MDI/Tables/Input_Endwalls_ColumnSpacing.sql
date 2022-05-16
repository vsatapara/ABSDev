CREATE TABLE abs_mdi."Input_Endwalls_ColumnSpacing" (
  csid NUMBER(10) NOT NULL,
  "BuildingNo" NUMBER(10),
  "CSType" VARCHAR2(10 BYTE),
  "BayNo" NUMBER(10),
  "BaySpacing" VARCHAR2(20 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "EndWallID" NUMBER,
  "IsDeleted" CHAR,
  CONSTRAINT input_endwalls_columnspcing_pk PRIMARY KEY (csid)
);