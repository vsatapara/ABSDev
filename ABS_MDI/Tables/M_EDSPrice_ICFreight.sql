CREATE TABLE abs_mdi."M_EDSPrice_ICFreight" (
  "ShippingPoint" NVARCHAR2(50) NOT NULL,
  "Builtup" BINARY_DOUBLE,
  "HotRolled" BINARY_DOUBLE,
  "Rods" BINARY_DOUBLE,
  "Angles" BINARY_DOUBLE,
  "ColdformRed" BINARY_DOUBLE,
  "ColdformGalv" BINARY_DOUBLE,
  pbr BINARY_DOUBLE,
  pba BINARY_DOUBLE,
  pbu BINARY_DOUBLE,
  avp BINARY_DOUBLE,
  "Vistashadow" BINARY_DOUBLE,
  "ShadowRib" BINARY_DOUBLE,
  "Artisan" BINARY_DOUBLE,
  "BattenLok HS" BINARY_DOUBLE,
  "Double-Lok" BINARY_DOUBLE,
  "SuperLok" BINARY_DOUBLE,
  "Ultra-Dek" BINARY_DOUBLE,
  "Trim" BINARY_DOUBLE,
  "Downspouts" BINARY_DOUBLE,
  "SnowRetention" BINARY_DOUBLE,
  PRIMARY KEY ("ShippingPoint")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."ShippingPoint" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Builtup" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."HotRolled" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Rods" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Angles" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."ColdformRed" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."ColdformGalv" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight".pbr IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight".pba IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight".pbu IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight".avp IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Vistashadow" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."ShadowRib" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Artisan" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."BattenLok HS" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Double-Lok" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."SuperLok" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Ultra-Dek" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Trim" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."Downspouts" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ICFreight"."SnowRetention" IS '-Double-';