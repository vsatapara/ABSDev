CREATE TABLE abs_mdi."M_EDSPrice_Program_Surcharges" (
  "PLBuilder" NUMBER NOT NULL,
  "MaxComplexity" NUMBER NOT NULL,
  "Surcharge" BINARY_DOUBLE,
  PRIMARY KEY ("PLBuilder","MaxComplexity")
);