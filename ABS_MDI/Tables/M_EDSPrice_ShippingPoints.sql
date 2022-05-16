CREATE TABLE abs_mdi."M_EDSPrice_ShippingPoints" (
  "ShippingPoint" NVARCHAR2(50) NOT NULL,
  "Plant" NVARCHAR2(50),
  "PlantNumber" NUMBER,
  "Star" NVARCHAR2(4),
  "Ceco" NVARCHAR2(4),
  "Robertson" NVARCHAR2(4),
  mma NVARCHAR2(4),
  "Mesco" NVARCHAR2(4),
  ans NVARCHAR2(4),
  "Garco" NVARCHAR2(4),
  PRIMARY KEY ("ShippingPoint")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."ShippingPoint" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."Plant" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."PlantNumber" IS '-Integer-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."Star" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."Ceco" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."Robertson" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints".mma IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."Mesco" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints".ans IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_ShippingPoints"."Garco" IS '-String-';