CREATE TABLE abs_mdi."Accesories_Wainscot" (
  "FromColumn" NUMBER(2),
  "WainscotId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingInformationId" NUMBER(10),
  "Qty" NUMBER(1),
  "Hieght" VARCHAR2(50 BYTE),
  "ToColumn" NUMBER(2),
  "TransitionStyleId" NUMBER(10),
  "PanelTypeId" NUMBER(10),
  "PanelThicknessId" NUMBER(10),
  "PanelColorId" VARCHAR2(100 BYTE),
  "TransitionTrimColorId" VARCHAR2(100 BYTE),
  "Elevation" VARCHAR2(10 BYTE),
  "IpAddress" VARCHAR2(50 BYTE),
  "IsDelete" CHAR,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  CONSTRAINT "Accesories_Wainscot_PK" PRIMARY KEY ("WainscotId")
);