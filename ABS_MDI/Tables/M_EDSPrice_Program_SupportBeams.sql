CREATE TABLE abs_mdi."M_EDSPrice_Program_SupportBeams" (
  "Description" NVARCHAR2(50) NOT NULL,
  "Weight" BINARY_DOUBLE DEFAULT 0,
  "Price" BINARY_DOUBLE DEFAULT 0,
  "WebDepth" BINARY_DOUBLE DEFAULT 0,
  "WebThick" BINARY_DOUBLE DEFAULT 0,
  "FlangeWidth" BINARY_DOUBLE DEFAULT 0,
  "FlangeThick" BINARY_DOUBLE DEFAULT 0,
  "Ix" BINARY_DOUBLE DEFAULT 0,
  "Sx" BINARY_DOUBLE DEFAULT 0,
  "DepthArea" BINARY_DOUBLE DEFAULT 0,
  "Rt" BINARY_DOUBLE DEFAULT 0,
  "Rts" BINARY_DOUBLE DEFAULT 0,
  h0 BINARY_DOUBLE DEFAULT 0,
  "Zx" BINARY_DOUBLE DEFAULT 0,
  j BINARY_DOUBLE DEFAULT 0,
  "ry" BINARY_DOUBLE DEFAULT 0,
  PRIMARY KEY ("Description")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Description" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Weight" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."WebDepth" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."WebThick" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."FlangeWidth" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."FlangeThick" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Ix" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Sx" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."DepthArea" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Rt" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Rts" IS '-Double- NEW Soldier Column';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams".h0 IS '-Double- NEW Soldier Column';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."Zx" IS '-Double- NEW Soldier Column';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams".j IS '-Double- NEW Soldier Column';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_SupportBeams"."ry" IS '-Double- NEW Soldier Column';