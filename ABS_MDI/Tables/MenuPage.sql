CREATE TABLE abs_mdi."MenuPage" (
  "MenuPageId" NUMBER(10) NOT NULL,
  "MenuPageName" VARCHAR2(50 BYTE),
  "IsView" CHAR DEFAULT 'N',
  "IsAdd" CHAR DEFAULT 'N',
  "IsEdit" CHAR DEFAULT 'N',
  "IsDelete" CHAR DEFAULT 'N',
  "IsHistory" CHAR DEFAULT 'N',
  "IsEnable" CHAR DEFAULT 'N',
  CONSTRAINT "MenuPage_PK" PRIMARY KEY ("MenuPageId")
);