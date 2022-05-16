CREATE TABLE abs_mdi."ColorPanel" (
  "ColorPanelId" NUMBER(5) NOT NULL,
  "Type" VARCHAR2(50 BYTE),
  "Gauge" NUMBER(5),
  "GroupingID" NUMBER(5),
  "SortOrder" NUMBER(5),
  "ExteriorKSI" NUMBER(5),
  "InteriorKSI" NUMBER(5),
  "CategotyId" NUMBER(5),
  "IsRoof" CHAR,
  "IsWall" CHAR,
  CONSTRAINT "ColorPanel_PK" PRIMARY KEY ("ColorPanelId")
);