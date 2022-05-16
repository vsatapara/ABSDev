CREATE TABLE abs_mdi."EDSPrice_O_EWIndividualLoads" (
  "EWIndividualLoadsId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "ColumnNumber" NUMBER(10),
  "IndividualLoad" VARCHAR2(50 BYTE),
  "VerticalKips" NUMBER(10,2),
  "HorizontalKips" NUMBER(10,2),
  "LogitudinalKips" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "EDSPrice_O_EWIndividualLoads_PK" PRIMARY KEY ("EWIndividualLoadsId"),
  CONSTRAINT eds_price_o_ewindividualloads_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);