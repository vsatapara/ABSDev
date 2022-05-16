CREATE TABLE abs_mdi.ddp_designpackagechecklistdetails (
  "ID" NUMBER DEFAULT abs_mdi."DDP_DESIGNPACKAGECHECKLISTDETAILS_SEQ"."NEXTVAL" NOT NULL,
  checklistid NUMBER NOT NULL,
  "NAME" VARCHAR2(255 BYTE),
  projectengineer CHAR DEFAULT 'N',
  checkingengineer CHAR DEFAULT 'N',
  na CHAR DEFAULT 'N',
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  CONSTRAINT ddp_designpackagechecklistdetails_pk PRIMARY KEY ("ID"),
  CONSTRAINT ddp_designpackagechecklistdetails_fk1 FOREIGN KEY (checklistid) REFERENCES abs_mdi.ddp_designpackagechecklist ("ID")
);