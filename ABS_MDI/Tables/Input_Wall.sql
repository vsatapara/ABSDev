CREATE TABLE abs_mdi."Input_Wall" (
  "WallId" NUMBER(10) NOT NULL,
  "BuildingInformationId" NUMBER(10),
  "Type" NUMBER(10),
  "Gauge" NUMBER(10),
  "Thick" NUMBER(10),
  "BaseFraming" NUMBER(10),
  "BaseFlash" NUMBER(10),
  "BaseClosure" NUMBER(10),
  "SealedWall" CHAR,
  "Washers" CHAR,
  "Notch" CHAR,
  "RakeClosure" CHAR,
  "EaveClosureStrip" CHAR,
  "FastenerType" NUMBER(10),
  "FastenerHeadFinish" NUMBER(10),
  "FastenerLength" NUMBER(10),
  "Warranty" CHAR,
  "FactoryAppliedSealant" NUMBER(10),
  "ReverseRolled" CHAR,
  "OutsideMetalClosure" CHAR,
  "SidelapSealant" CHAR,
  "ColdStorageBuilding" CHAR,
  "ExteriorSkinProfile" NUMBER(10),
  "ExteriorSkinTexture" NUMBER(10),
  "InteriorSkinProfile" NUMBER(10),
  "InteriorSkinTexture" NUMBER(10),
  "InteriorSkinGauge" NUMBER(10),
  "Width" NUMBER(10),
  "NotchWidth" NUMBER(10,2),
  "NotchDepth" NUMBER(10,2),
  "NotchType" NUMBER(10),
  "RValue" NUMBER(10,2),
  "UValue" NUMBER(10,4),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  "FoamTape" CHAR,
  CONSTRAINT "Input_Wall_PK" PRIMARY KEY ("WallId"),
  CONSTRAINT fk_buildinginfoid FOREIGN KEY ("BuildingInformationId") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);