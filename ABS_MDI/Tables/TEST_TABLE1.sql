CREATE TABLE abs_mdi.test_table1 (
  "UserId" NUMBER(5) NOT NULL,
  "Firstname" VARCHAR2(50 BYTE) NOT NULL,
  "Lastname" VARCHAR2(50 BYTE),
  "Age" NUMBER(3),
  "Salary" NUMBER(5),
  "CompanyLogo" NUMBER(10),
  "UserImage" NUMBER(10),
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT test_table1_pk PRIMARY KEY ("UserId")
);