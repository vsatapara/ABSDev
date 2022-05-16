CREATE TABLE abs_mdi."EDSPrice_IO_MezzanineSpacing" (
  "MezzanineSpacingId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "MezzanineNumber" NUMBER(10),
  "FramelineNumber" NUMBER(10),
  "AlltheSame" NUMBER(10),
  "Spacing1" NUMBER(10,2),
  "Spacing2" NUMBER(10,2),
  "Spacing3" NUMBER(10,2),
  "Spacing4" NUMBER(10,2),
  "Spacing5" NUMBER(10,2),
  "Spacing6" NUMBER(10,2),
  "Spacing7" NUMBER(10,2),
  "Spacing8" NUMBER(10,2),
  "Spacing9" NUMBER(10,2),
  "Spacing10" NUMBER(10,2),
  "Spacing11" NUMBER(10,2),
  "Spacing12" NUMBER(10,2),
  "Spacing13" NUMBER(10,2),
  "Spacing14" NUMBER(10,2),
  "Spacing15" NUMBER(10,2),
  "Spacing16" NUMBER(10,2),
  "Spacing17" NUMBER(10,2),
  "Spacing18" NUMBER(10,2),
  "Spacing19" NUMBER(10,2),
  "Spacing20" NUMBER(10,2),
  "Spacing21" NUMBER(10,2),
  "Spacing22" NUMBER(10,2),
  "Spacing23" NUMBER(10,2),
  "Spacing24" NUMBER(10,2),
  "Spacing25" NUMBER(10,2),
  "Spacing26" NUMBER(10,2),
  "Spacing27" NUMBER(10,2),
  "Spacing28" NUMBER(10,2),
  "Spacing29" NUMBER(10,2),
  "Spacing30" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  "MezzaninesId" NUMBER(10),
  "ForLongitudinal" CHAR DEFAULT 'N' NOT NULL,
  CONSTRAINT "Pk_EDSPrice_IO_MezzanineSpacing_ProjectId" PRIMARY KEY ("MezzanineSpacingId")
);