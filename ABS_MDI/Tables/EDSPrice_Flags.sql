CREATE TABLE abs_mdi."EDSPrice_Flags" (
  "FlagId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10) NOT NULL,
  "ShortFileName" VARCHAR2(50 BYTE),
  CONSTRAINT "EDSPrice_Flags_PK" PRIMARY KEY ("FlagId","ProjectId","BuildingNumber")
);