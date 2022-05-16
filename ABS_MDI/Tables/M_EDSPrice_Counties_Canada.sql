CREATE TABLE abs_mdi."M_EDSPrice_Counties_Canada" (
  "Province" NVARCHAR2(50) NOT NULL,
  "County" NVARCHAR2(50) NOT NULL,
  PRIMARY KEY ("Province","County")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Counties_Canada"."Province" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Counties_Canada"."County" IS '-String-';