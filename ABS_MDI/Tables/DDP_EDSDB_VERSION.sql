CREATE TABLE abs_mdi.ddp_edsdb_version (
  edsdbversionid NUMBER DEFAULT abs_mdi."DDP_EDSDB_VERSION_SEQ"."NEXTVAL" NOT NULL,
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  isdelete CHAR DEFAULT 'N',
  ipaddress VARCHAR2(20 BYTE),
  edsdbbldgverid NUMBER NOT NULL,
  edsdb_version VARCHAR2(20 BYTE),
  CONSTRAINT ddp_edsdb_version_pk PRIMARY KEY (edsdbversionid),
  CONSTRAINT ddp_edsdb_version_fk1 FOREIGN KEY (edsdbbldgverid) REFERENCES abs_mdi.ddp_edsdb_building_version (edsdbbldgverid)
);