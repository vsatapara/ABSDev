CREATE TABLE abs_mdi."EDSPrice_O_ErectionData" (
  "ErectionDataId" NUMBER(10),
  "Process" VARCHAR2(50 BYTE),
  "ProcessId" NUMBER(10),
  "Quantity" NUMBER(10),
  "Unit" VARCHAR2(50 BYTE),
  "Rate" NUMBER(10),
  "ManHours" NUMBER(10),
  "LaborDivision" NUMBER(10),
  "ProjectNumber" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10) NOT NULL,
  CONSTRAINT "Pk_EDSPrice_O_ErectionData_ProjectId" PRIMARY KEY ("ProjectId")
);