CREATE TABLE abs_mdi."ColorCodes" (
  "ColorCodeId" NUMBER(5) NOT NULL,
  "ColorText" VARCHAR2(50 BYTE),
  "ColorCode" VARCHAR2(50 BYTE),
  "CompanyId" NUMBER(5),
  "OpenArea" VARCHAR2(20 BYTE),
  "Roof" VARCHAR2(20 BYTE),
  "Wall" VARCHAR2(20 BYTE),
  "Trim" VARCHAR2(20 BYTE),
  CONSTRAINT "ColorCodes_PK" PRIMARY KEY ("ColorCodeId")
);