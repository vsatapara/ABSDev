CREATE TABLE abs_mdi."ImagePurpose" (
  "ImagePurposeId" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(50 BYTE) NOT NULL,
  "PreferredPixelsWidth" NUMBER,
  "PreferredPixelHeight" NUMBER,
  "IsActive" CHAR DEFAULT 'Y',
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  PRIMARY KEY ("ImagePurposeId")
);