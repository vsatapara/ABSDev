CREATE TABLE abs_mdi."M_EDSPrice_MBMA_Complexity" (
  "Sort" NUMBER DEFAULT 0 NOT NULL,
  "WorkOrder" NVARCHAR2(50),
  "Category" NVARCHAR2(50),
  "Items" NVARCHAR2(50),
  "TotalPoints" BINARY_DOUBLE DEFAULT 0,
  "NCITotalPoints" BINARY_DOUBLE DEFAULT 0,
  "EngTotalPoints" BINARY_DOUBLE DEFAULT 0,
  "ADD" NUMBER DEFAULT 0,
  "DraftingLevel" NUMBER DEFAULT 0,
  mbma BINARY_DOUBLE DEFAULT 0,
  "MBMACategory" NVARCHAR2(50),
  PRIMARY KEY ("Sort")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."Sort" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."WorkOrder" IS 'String';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."Category" IS 'String';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."Items" IS 'String';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."TotalPoints" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."NCITotalPoints" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."EngTotalPoints" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."ADD" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."DraftingLevel" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity".mbma IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_MBMA_Complexity"."MBMACategory" IS 'String';