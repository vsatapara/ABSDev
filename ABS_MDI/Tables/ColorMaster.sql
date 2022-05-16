CREATE TABLE abs_mdi."ColorMaster" (
  "ColorId" NUMBER(5) NOT NULL,
  "CategoryId" NUMBER(5),
  "ColorText" VARCHAR2(50 BYTE),
  "ColorName" VARCHAR2(50 BYTE),
  "MinRequired" CHAR,
  CONSTRAINT "ColorMaster_PK" PRIMARY KEY ("ColorId")
);