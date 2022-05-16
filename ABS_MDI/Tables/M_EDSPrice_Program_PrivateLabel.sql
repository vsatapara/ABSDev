CREATE TABLE abs_mdi."M_EDSPrice_Program_PrivateLabel" (
  "BuilderNumber" NUMBER DEFAULT 0 NOT NULL,
  "Company" NVARCHAR2(50),
  "ApprovalDrawingCost" BINARY_DOUBLE DEFAULT 0,
  PRIMARY KEY ("BuilderNumber")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_PrivateLabel"."BuilderNumber" IS '-integer-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_PrivateLabel"."Company" IS '-string-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_PrivateLabel"."ApprovalDrawingCost" IS '-double-';