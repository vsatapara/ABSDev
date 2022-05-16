CREATE TABLE abs_mdi."MBSAccessoriesGuid" (
  "MBSAccessoriesId" NUMBER NOT NULL,
  "AccessoriesId" NUMBER,
  "AccessoriesGuid" VARCHAR2(40 BYTE),
  "AccessoriesName" VARCHAR2(20 BYTE),
  "BuildingId" NUMBER,
  "ProjectId" NUMBER,
  CONSTRAINT "MBSAccessoriesGuid_PK" PRIMARY KEY ("MBSAccessoriesId")
);