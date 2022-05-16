CREATE TABLE abs_mdi."Accesories_RoofLTP_Common" (
  "Id" NUMBER GENERATED AS IDENTITY,
  "Type" VARCHAR2(30 BYTE) NOT NULL,
  "LengthId" NUMBER NOT NULL,
  "IsLocationEnable" CHAR NOT NULL,
  "DefaultLocation" VARCHAR2(30 BYTE),
  "Size" NUMBER(10,4),
  CONSTRAINT "Accesories_RoofLTP_Common_PK" PRIMARY KEY ("Id")
);