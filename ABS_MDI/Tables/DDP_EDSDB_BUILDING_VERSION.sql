CREATE TABLE abs_mdi.ddp_edsdb_building_version (
  edsdbbldgverid NUMBER DEFAULT abs_mdi."DDP_EDSDB_BUILDING_VERSION_SEQ"."NEXTVAL" NOT NULL,
  jobnumber VARCHAR2(50 BYTE),
  bldgver VARCHAR2(50 BYTE),
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  isdelete CHAR DEFAULT 'N',
  ipaddress VARCHAR2(20 BYTE),
  ddpsserverid NUMBER,
  edslastmodifieddate VARCHAR2(50 BYTE),
  CONSTRAINT ddp_edsdb_building_version_pk PRIMARY KEY (edsdbbldgverid),
  CONSTRAINT ddp_edsdb_building_version_fk1 FOREIGN KEY (ddpsserverid) REFERENCES abs_mdi.ddp_tsservers (serverid)
);