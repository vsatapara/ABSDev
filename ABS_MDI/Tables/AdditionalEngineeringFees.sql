CREATE TABLE abs_mdi."AdditionalEngineeringFees" (
  "EngineeringFeesId" NUMBER NOT NULL,
  "Country" VARCHAR2(20 BYTE) NOT NULL,
  "State" VARCHAR2(20 BYTE) NOT NULL,
  "EngineeringFees" NUMBER(20,5) NOT NULL,
  "Description" VARCHAR2(20 BYTE) NOT NULL,
  CONSTRAINT "AdditionalEngineeringFees_PK" PRIMARY KEY ("EngineeringFeesId")
);