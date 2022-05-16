CREATE TABLE abs_mdi.ddp_designpackagechecklist (
  "ID" NUMBER DEFAULT abs_mdi."DDP_DESIGNPACKAGECHECKLIST_SEQ"."NEXTVAL" NOT NULL,
  jobnumber VARCHAR2(20 BYTE),
  projectengineerdate VARCHAR2(20 BYTE),
  checkingengineerdate VARCHAR2(20 BYTE),
  rtodwithnochanges CHAR DEFAULT 'N',
  changesandrtod CHAR DEFAULT 'N',
  changesandresubmitforrecheck CHAR DEFAULT 'N',
  contactmeforfurtherdiscussion CHAR DEFAULT 'N',
  createdby NUMBER,
  createddate DATE,
  modifiedby NUMBER,
  modifieddate DATE,
  ipaddress VARCHAR2(20 BYTE),
  projectengineerinitial VARCHAR2(20 BYTE),
  checkingengineerinitial VARCHAR2(20 BYTE),
  ddpsserverid NUMBER(5),
  CONSTRAINT ddp_designpackagechecklist_pk PRIMARY KEY ("ID")
);