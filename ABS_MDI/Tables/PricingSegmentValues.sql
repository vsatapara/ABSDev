CREATE TABLE abs_mdi."PricingSegmentValues" (
  "PricingSegmentValueId" NUMBER(10) NOT NULL,
  "PricingSegmentId" NUMBER(10),
  "Description" NVARCHAR2(50),
  "SortOrder" NUMBER(5),
  "IsActive" CHAR DEFAULT 'F',
  "Multiplier" FLOAT(5),
  "ConditionalMinimum" FLOAT(5),
  "ConditionalMaximum" FLOAT(5),
  "BasedOn" NUMBER(5),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  PRIMARY KEY ("PricingSegmentValueId"),
  CONSTRAINT "PricingSegment_FK" FOREIGN KEY ("PricingSegmentId") REFERENCES abs_mdi."PricingSegments" ("PricingSegmentId")
);