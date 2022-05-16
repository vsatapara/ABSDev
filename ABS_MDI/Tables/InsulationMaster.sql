CREATE TABLE abs_mdi."InsulationMaster" (
  "Id" NUMBER(5) NOT NULL,
  "Facing" VARCHAR2(50 BYTE),
  "Thickness" NUMBER(10,2),
  "RValue" NUMBER(10,2),
  "Weight" NUMBER(10,2),
  "ForRoof" NUMBER(5),
  "ForWall" NUMBER(5),
  "MaxSF1" NUMBER(10,2),
  "MaxSF2" NUMBER(10,2),
  "MaxSF3" NUMBER(10,2),
  "MaxSF4" NUMBER(10,2),
  "MaxSF5" NUMBER(10,2),
  "MaxSF6" NUMBER(10,2),
  "MaxSF7" NUMBER(10,2),
  "BaseCost1" NUMBER(10,2),
  "BaseCost2" NUMBER(10,2),
  "Sell1" NUMBER(10,2),
  "Sell2" NUMBER(10,2),
  "Sell3" NUMBER(10,2),
  "Sell4" NUMBER(10,2),
  "Sell5" NUMBER(10,2),
  "Sell6" NUMBER(10,2),
  "Sell7" NUMBER(10,2),
  "GroupID" NUMBER(5),
  "IsCanada" CHAR,
  "IsDelete" CHAR,
  CONSTRAINT "InsulationMaster_PK" PRIMARY KEY ("Id")
);