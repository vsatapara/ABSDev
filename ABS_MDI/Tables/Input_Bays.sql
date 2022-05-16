CREATE TABLE abs_mdi."Input_Bays" (
  "RoofBaySpaceId" NUMBER(10) NOT NULL,
  "BuildingInformationId" NUMBER(10),
  "Elevation" CHAR,
  "BayNumber" NUMBER(10),
  "Width" NUMBER(20,8),
  CONSTRAINT table1_pk PRIMARY KEY ("RoofBaySpaceId"),
  CONSTRAINT "FK_BaysBuildingId" FOREIGN KEY ("BuildingInformationId") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);