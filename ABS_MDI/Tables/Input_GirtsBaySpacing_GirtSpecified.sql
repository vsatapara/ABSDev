CREATE TABLE abs_mdi."Input_GirtsBaySpacing_GirtSpecified" (
  "GirtSpecifiedId" NUMBER(10) NOT NULL,
  "GirtBaySpaceId" NUMBER(10),
  "Elevation" CHAR,
  "SpacingNumber" NUMBER(10),
  "Spacing" NUMBER(20,8),
  "Type" VARCHAR2(5 BYTE),
  CONSTRAINT "Input_GirtsBaySpacing_GirtSpecified_PK" PRIMARY KEY ("GirtSpecifiedId"),
  CONSTRAINT "FK_GirtSpecified_GirtSpacingId" FOREIGN KEY ("GirtBaySpaceId") REFERENCES abs_mdi."Input_GirtsBaySpacing_Girt" ("GirtBaySpaceId")
);