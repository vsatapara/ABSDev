CREATE TABLE abs_mdi."CompanyMailServerDetail" (
  "CompanyMailServerDetailId" NUMBER(5) NOT NULL,
  "CompanyId" NUMBER(5) NOT NULL,
  "IsDefualtSetting" CHAR,
  "SMTPPHost" VARCHAR2(50 BYTE),
  "SMTPPort" VARCHAR2(50 BYTE),
  "IsAuthenticationRequired" CHAR,
  "IsUseSSLConnection" CHAR,
  "UserName" NVARCHAR2(50),
  "Password" NVARCHAR2(50),
  "ReplyToAddress" NVARCHAR2(50),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "CompanyMailServerDetail_PK" PRIMARY KEY ("CompanyMailServerDetailId"),
  CONSTRAINT "CompanyMailServerDetail_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);