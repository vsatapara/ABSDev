CREATE TABLE abs_mdi.temp_company_sm_field (
  companyid NUMBER NOT NULL,
  companyname VARCHAR2(128 BYTE) NOT NULL,
  administratoremail VARCHAR2(150 BYTE) NOT NULL,
  isactive VARCHAR2(1 BYTE),
  shippingplantgroupfromparentid NUMBER,
  pricingsegmentfromparentid NUMBER,
  shippingzonegroupfromparentid NUMBER,
  permissiongroupfromparentid NUMBER,
  isbasedinusa VARCHAR2(1 BYTE),
  phonenumber VARCHAR2(128 BYTE),
  created VARCHAR2(50 BYTE),
  created_dt DATE
);