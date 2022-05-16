CREATE TABLE abs_mdi.xx_stores (
  store_id NUMBER,
  description VARCHAR2(100 BYTE),
  street_address VARCHAR2(40 BYTE),
  city VARCHAR2(30 BYTE),
  state_province_code VARCHAR2(2 BYTE),
  postal_code VARCHAR2(9 BYTE),
  store_geo_location sdo_geometry
);