CREATE TABLE abs_mdi."Input_GirtsBaySpacing_Girt" (
  "GirtBaySpaceId" NUMBER(10) NOT NULL,
  "GirtSpacingId" NUMBER(10),
  "SW1Type" VARCHAR2(20 BYTE),
  "SW2Type" VARCHAR2(20 BYTE),
  "EW1Type" VARCHAR2(20 BYTE),
  "EW2Type" VARCHAR2(20 BYTE),
  CONSTRAINT "Input_GirtsBaySpacing_Girt_PK" PRIMARY KEY ("GirtBaySpaceId"),
  CONSTRAINT "FK_Girt_GirtSpacingId" FOREIGN KEY ("GirtSpacingId") REFERENCES abs_mdi."Input_GirtsBaySpacing" ("GirtSpacingId")
);