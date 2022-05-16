CREATE TABLE abs_mdi."USR_Brand_Customer" (
  "UsrBrandCustomerId" NUMBER(10) NOT NULL,
  "BrandId" NUMBER(10),
  "CustomerId" NUMBER(10),
  "UserDetailId" NUMBER(10),
  CONSTRAINT usr_brand_customer_pk PRIMARY KEY ("UsrBrandCustomerId")
);