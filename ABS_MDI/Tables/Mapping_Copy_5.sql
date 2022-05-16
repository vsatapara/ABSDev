CREATE TABLE abs_mdi."Mapping_Copy_5" (
  access_table_name VARCHAR2(150 BYTE),
  access_column_name VARCHAR2(150 BYTE),
  access_value VARCHAR2(500 BYTE),
  abs_table_name VARCHAR2(150 BYTE),
  abs_column_name VARCHAR2(150 BYTE),
  abs_value VARCHAR2(100 BYTE),
  read_seq NUMBER,
  default_value VARCHAR2(150 BYTE),
  "REQUIRED" CHAR,
  tran_type CHAR,
  id_field_name VARCHAR2(150 BYTE),
  dependent_id_field_name VARCHAR2(150 BYTE),
  abs_column_id NUMBER,
  abs_column_data_type VARCHAR2(100 BYTE)
);