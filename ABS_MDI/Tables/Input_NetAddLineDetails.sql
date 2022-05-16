CREATE TABLE abs_mdi."Input_NetAddLineDetails" (
  "NetAddLineDetailsId" NUMBER(10) NOT NULL,
  "Guid" RAW(16),
  "Description" VARCHAR2(40 BYTE),
  "Weight" NUMBER(10,2),
  "SellPrice" NUMBER(10,2),
  "Cost" NUMBER(10,2),
  "Margin" NUMBER(10,4),
  "Markup" NUMBER(10,4),
  "HeaderId" NUMBER(2),
  CONSTRAINT "Input_ShopCoat_NetAddLineDetails_PK" PRIMARY KEY ("NetAddLineDetailsId"),
  CONSTRAINT "FK_NetAddLine_Guid" FOREIGN KEY ("Guid") REFERENCES abs_mdi."Input_AddLines" ("Guid"),
  CONSTRAINT "FK_NetAddLine_HeaderId" FOREIGN KEY ("HeaderId") REFERENCES abs_mdi."M_NetAddlineHeader" ("Id")
);