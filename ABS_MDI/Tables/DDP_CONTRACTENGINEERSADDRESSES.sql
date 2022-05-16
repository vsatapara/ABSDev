CREATE TABLE abs_mdi.ddp_contractengineersaddresses (
  contractengineerid NUMBER NOT NULL,
  moniker NVARCHAR2(256),
  address NVARCHAR2(256),
  city VARCHAR2(100 BYTE),
  "STATE" VARCHAR2(100 BYTE),
  zipcode NUMBER,
  phone NVARCHAR2(30),
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  CONSTRAINT contractengineersaddresses_pk PRIMARY KEY (contractengineerid)
);