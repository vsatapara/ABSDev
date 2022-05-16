CREATE TABLE abs_mdi.xx_customers (
  customer_id NUMBER,
  last_name VARCHAR2(30 BYTE),
  first_name VARCHAR2(30 BYTE),
  street_address VARCHAR2(40 BYTE),
  city VARCHAR2(30 BYTE),
  state_province_code VARCHAR2(2 BYTE),
  postal_code VARCHAR2(9 BYTE),
  cust_geo_location sdo_geometry
);