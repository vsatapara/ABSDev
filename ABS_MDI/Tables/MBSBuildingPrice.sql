CREATE TABLE abs_mdi."MBSBuildingPrice" (
  "Id" NUMBER NOT NULL,
  "BuildingId" NUMBER NOT NULL,
  "BuildingGuid" VARCHAR2(40 BYTE) NOT NULL,
  "ProjectId" NUMBER(*,0) NOT NULL,
  "ProjectGuid" VARCHAR2(40 BYTE) NOT NULL,
  "UserId" VARCHAR2(40 BYTE) NOT NULL,
  "BuildingWeight" NUMBER(20,8) DEFAULT 0 NOT NULL,
  "NetItemWeight" NUMBER(20,8) DEFAULT 0 NOT NULL,
  CONSTRAINT "MBSBuildingPrice_PK" PRIMARY KEY ("Id"),
  CONSTRAINT buildinginformation_buildingid FOREIGN KEY ("BuildingId") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);