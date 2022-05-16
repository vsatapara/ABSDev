CREATE TABLE abs_mdi."M_EDSPrice_MMA_Complexity" (
  "Complexity" NUMBER DEFAULT 0,
  "SimpleItems" NUMBER DEFAULT 0 NOT NULL,
  "ComplexItems" NUMBER DEFAULT 0 NOT NULL,
  "SpecialtyItems" NUMBER DEFAULT 0 NOT NULL,
  PRIMARY KEY ("SimpleItems","ComplexItems","SpecialtyItems")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MMA_Complexity"."Complexity" IS '-int-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MMA_Complexity"."SimpleItems" IS '-int-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MMA_Complexity"."ComplexItems" IS '-int-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MMA_Complexity"."SpecialtyItems" IS '-int-';