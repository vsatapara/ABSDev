CREATE TABLE abs_mdi.onc (
  "SkinningID" NUMBER(10) NOT NULL,
  "CompanyID" NUMBER NOT NULL,
  "ShowWelcomeText" CHAR,
  "ShowCompanyLogo" CHAR,
  "PrimaryColor" VARCHAR2(10 BYTE),
  "SecondaryColor" VARCHAR2(10 BYTE),
  "TertiaryColor" VARCHAR2(10 BYTE),
  "Accent1" VARCHAR2(10 BYTE),
  "Accent2" VARCHAR2(10 BYTE),
  "Accent3" VARCHAR2(10 BYTE),
  "Accent4" VARCHAR2(10 BYTE),
  "ActiveApproval" VARCHAR2(10 BYTE),
  "Cancelled" VARCHAR2(10 BYTE),
  "OnHold" VARCHAR2(10 BYTE),
  "Completed" VARCHAR2(10 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IPAddress" VARCHAR2(20 BYTE),
  CONSTRAINT skinning_pk PRIMARY KEY ("SkinningID")
);