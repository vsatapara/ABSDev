CREATE TABLE abs_mdi."Mapping" (
  "Access_Table_Name" VARCHAR2(150 BYTE),
  "Access_Column_Name" VARCHAR2(150 BYTE),
  "Access_Value" VARCHAR2(1500 BYTE),
  "ABS_Table_Name" VARCHAR2(150 BYTE),
  "ABS_Column_Name" VARCHAR2(150 BYTE),
  "ABS_Value" VARCHAR2(500 BYTE),
  "Read_seq" NUMBER,
  "Default_Value" VARCHAR2(150 BYTE),
  "Required" CHAR,
  "Tran_Type" CHAR,
  "ID_Field_Name" VARCHAR2(150 BYTE),
  "Dependent_ID_Field_Name" VARCHAR2(150 BYTE),
  "ABS_Column_ID" NUMBER,
  "ABS_Column_Data_Type" VARCHAR2(100 BYTE),
  "Is_Project_Table" CHAR,
  "Notes" VARCHAR2(500 BYTE)
);