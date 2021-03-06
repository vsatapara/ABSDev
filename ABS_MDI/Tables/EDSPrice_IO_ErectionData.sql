CREATE TABLE abs_mdi."EDSPrice_IO_ErectionData" (
  "ErectionDataId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10) NOT NULL,
  "ProjectNumber" NUMBER(10),
  "LaborDivision1PayScale" NUMBER(10,2),
  "LaborDivision2PayScale" NUMBER(10,2),
  "LaborDivision3PayScale" NUMBER(10,2),
  "LaborDivision4PayScale" NUMBER(10,2),
  "LaborDivision5PayScale" NUMBER(10,2),
  "LaborDivision1Hours" NUMBER(10,2),
  "LaborDivision2Hours" NUMBER(10,2),
  "LaborDivision3Hours" NUMBER(10,2),
  "LaborDivision4Hours" NUMBER(10,2),
  "LaborDivision5Hours" NUMBER(10,2),
  "LaborDivision1Total" NUMBER(10,2),
  "LaborDivision2Total" NUMBER(10,2),
  "LaborDivision3Total" NUMBER(10,2),
  "LaborDivision4Total" NUMBER(10,2),
  "LaborDivision5Total" NUMBER(10,2),
  "TravelExpenses" NUMBER(10,2),
  "Subsistence" NUMBER(10,2),
  "EquipmentRental" NUMBER(10,2),
  "OtherExpenses" NUMBER(10,2),
  "TotalManHours" NUMBER(10,2),
  "TotalExpense" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "Pk_EDSPrice_IO_ErectionData_ProjectId" PRIMARY KEY ("ProjectId")
);