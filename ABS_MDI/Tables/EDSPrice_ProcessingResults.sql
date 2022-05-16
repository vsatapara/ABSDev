CREATE TABLE abs_mdi."EDSPrice_ProcessingResults" (
  "ProcessingResultsId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "FigureClearances" CLOB,
  "FigureErrors" CLOB,
  "FigurePurlins" CLOB,
  "Incomplete" NUMBER(10),
  "UserName" VARCHAR2(20 BYTE),
  "AuthorizedBy" VARCHAR2(20 BYTE),
  "SpecialNumber" VARCHAR2(20 BYTE),
  "DateAuthorized" VARCHAR2(20 BYTE),
  "ValidUntil" VARCHAR2(20 BYTE),
  "PriceTime" NVARCHAR2(30),
  CONSTRAINT "EDSPrice_ProcessingResults_PK" PRIMARY KEY ("ProcessingResultsId")
);