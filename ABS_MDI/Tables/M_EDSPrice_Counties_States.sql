CREATE TABLE abs_mdi."M_EDSPrice_Counties_States" (
  "State" NVARCHAR2(50) NOT NULL,
  "County" NVARCHAR2(50) NOT NULL,
  "CrmGuid" NVARCHAR2(255),
  "CecoASCrmGuid" NVARCHAR2(255),
  PRIMARY KEY ("State","County")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Counties_States"."State" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Counties_States"."County" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Counties_States"."CrmGuid" IS 'Obsolete as of BW-7760: Implement Consolidated version of CRM [all brands use CecoAsCrmGuid]';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Counties_States"."CecoASCrmGuid" IS '-String-';