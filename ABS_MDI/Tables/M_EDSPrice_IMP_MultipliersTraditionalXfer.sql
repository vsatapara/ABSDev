CREATE TABLE abs_mdi."M_EDSPrice_IMP_MultipliersTraditionalXfer" (
  "State" NVARCHAR2(50) NOT NULL,
  "Upto5000" BINARY_DOUBLE,
  "Upto10000" BINARY_DOUBLE,
  "Upto20000" BINARY_DOUBLE,
  "Upto50000" BINARY_DOUBLE,
  "Upto100000" BINARY_DOUBLE,
  ">100000" BINARY_DOUBLE,
  PRIMARY KEY ("State")
);