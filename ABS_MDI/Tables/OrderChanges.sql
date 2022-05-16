CREATE TABLE abs_mdi."OrderChanges" (
  "Id" RAW(16) DEFAULT SYS_GUID(),
  "Year" NUMBER(10),
  "Type" VARCHAR2(1 BYTE),
  "Key" NUMBER(10),
  "Revision" NUMBER(10),
  "CustomerNumber" NVARCHAR2(20),
  "ChangeDateTime" TIMESTAMP WITH TIME ZONE,
  "TableName" VARCHAR2(255 BYTE),
  "FieldName" VARCHAR2(255 BYTE),
  "PreviousValue" VARCHAR2(4000 BYTE),
  "NewValue" VARCHAR2(4000 BYTE),
  "Processed" NUMBER(1) DEFAULT 0,
  "OrderName" NVARCHAR2(250)
);