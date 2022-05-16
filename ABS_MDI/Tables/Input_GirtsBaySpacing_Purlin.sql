CREATE TABLE abs_mdi."Input_GirtsBaySpacing_Purlin" (
  "PurlinBaySpaceId" NUMBER(10) NOT NULL,
  "GirtSpacingId" NUMBER(10),
  "NominalSpacing" NUMBER(10,2),
  "OnSlope" NUMBER(10,2),
  CONSTRAINT "Input_GirtsBaySpacing_Purlin_PK" PRIMARY KEY ("PurlinBaySpaceId"),
  CONSTRAINT "FK_Purlin_GirtSpacingId" FOREIGN KEY ("GirtSpacingId") REFERENCES abs_mdi."Input_GirtsBaySpacing" ("GirtSpacingId")
);