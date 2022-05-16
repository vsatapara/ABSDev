CREATE TABLE abs_mdi.ddp_edsdb_geninfo (
  geninfoid NUMBER DEFAULT abs_mdi."DDP_EDSDB_GENINFO_SEQ"."NEXTVAL" NOT NULL,
  job_type VARCHAR2(100 BYTE),
  job_prefix VARCHAR2(100 BYTE),
  job_number VARCHAR2(100 BYTE),
  nci_job_number VARCHAR2(100 BYTE),
  design_office_location VARCHAR2(100 BYTE),
  a_builder_number VARCHAR2(100 BYTE),
  a_purchase_order VARCHAR2(100 BYTE),
  a_quote_number VARCHAR2(100 BYTE),
  a_revision VARCHAR2(100 BYTE),
  ab_work_order_number VARCHAR2(100 BYTE),
  anchor_bolts VARCHAR2(100 BYTE),
  bp_address1 VARCHAR2(300 BYTE),
  bp_address2 VARCHAR2(300 BYTE),
  bp_address3 VARCHAR2(300 BYTE),
  bp_address4 VARCHAR2(300 BYTE),
  bp_city VARCHAR2(100 BYTE),
  bp_contact VARCHAR2(100 BYTE),
  bp_name VARCHAR2(100 BYTE),
  bp_state VARCHAR2(100 BYTE),
  bp_telephone VARCHAR2(100 BYTE),
  bp_zip_code VARCHAR2(100 BYTE),
  ceco_erection VARCHAR2(100 BYTE),
  ceco_freight VARCHAR2(100 BYTE),
  ceco_material VARCHAR2(100 BYTE),
  ceco_union VARCHAR2(100 BYTE),
  jobsite_county VARCHAR2(100 BYTE),
  jobsite_state VARCHAR2(100 BYTE),
  ship_date VARCHAR2(100 BYTE),
  ship_to_city VARCHAR2(100 BYTE),
  ship_to_county VARCHAR2(100 BYTE),
  ship_to_io_city_limits VARCHAR2(100 BYTE),
  ship_to_name VARCHAR2(100 BYTE),
  ship_to_state VARCHAR2(100 BYTE),
  ship_to_street1 VARCHAR2(100 BYTE),
  ship_to_street2 VARCHAR2(100 BYTE),
  ship_to_street3 VARCHAR2(100 BYTE),
  ship_to_street4 VARCHAR2(100 BYTE),
  ship_to_zip_code VARCHAR2(100 BYTE),
  "ID" NUMBER,
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  isdelete CHAR DEFAULT 'N',
  ipaddress VARCHAR2(20 BYTE),
  edsdbbldgverid NUMBER,
  CONSTRAINT ddp_edsdb_geninfo_pk PRIMARY KEY (geninfoid),
  CONSTRAINT ddp_edsdb_geninfo_fk1 FOREIGN KEY (edsdbbldgverid) REFERENCES abs_mdi.ddp_edsdb_building_version (edsdbbldgverid)
);