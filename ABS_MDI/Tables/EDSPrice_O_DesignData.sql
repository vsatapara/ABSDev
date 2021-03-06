CREATE TABLE abs_mdi."EDSPrice_O_DesignData" (
  "DesignDataId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "FrameLineNumber" NUMBER(10),
  "ColumnNumber" VARCHAR2(50 BYTE),
  "ColumnType" VARCHAR2(50 BYTE),
  "Elevation" NUMBER(10),
  "Bay" NUMBER(10),
  "KneeClearance" NUMBER(10),
  "PeakClearance" NUMBER(10),
  "InsideClearance" NUMBER(10),
  "NominalPurlinSpace" NUMBER(10),
  "BaseColumnDepth" NUMBER(10),
  "KneeColumnDepth" NUMBER(10),
  "KneeRafterDepth" NUMBER(10),
  "PeakRafterDepth" NUMBER(10),
  "BasePlateWidth" NUMBER(10),
  "BasePlateLength" NUMBER(10),
  "BasePlateThick" NUMBER(10),
  "AnchorBoltDiameter" NUMBER(10),
  "AnchorBoltNumber" NUMBER(10),
  "AnchorBoltGauge" NUMBER(10),
  "MaximumVerticalPositive" NUMBER(10),
  "MaximumVerticalNegative" NUMBER(10),
  "MaximumHorizontalPositive" NUMBER(10),
  "MaximumHorizontalNegative" NUMBER(10),
  "MaximumLogitudinalPositive" NUMBER(10),
  "MaximumLogitudinalNegative" NUMBER(10),
  "PipeDiameter" NUMBER(10),
  "PipeThickness" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "EDSPrice_O_DesignData_PK" PRIMARY KEY ("DesignDataId"),
  CONSTRAINT fk_1 FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);