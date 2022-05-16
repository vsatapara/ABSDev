CREATE TABLE abs_mdi."Drawing_SubmittalPackage" (
  "DrawingSubmittaleId" NUMBER(10),
  "Description" VARCHAR2(150 BYTE),
  "Quantity" NUMBER(5),
  "Price" NUMBER(10,5),
  "ProjectId" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "CreatedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "IsDelete" CHAR
);