CREATE TABLE abs_mdi."GirtsAndPurlinDepth" (
  "DepthId" NUMBER(10) GENERATED BY DEFAULT AS IDENTITY,
  "DepthName" VARCHAR2(20 BYTE),
  "IsForGirts" CHAR,
  "DepthValue" NUMBER(5),
  CONSTRAINT "GirtsAndPurlinDepth_PK" PRIMARY KEY ("DepthId")
);