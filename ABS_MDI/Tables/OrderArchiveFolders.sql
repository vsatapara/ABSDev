CREATE TABLE abs_mdi."OrderArchiveFolders" (
  "OrdrArchvFldrGuid" RAW(16) NOT NULL,
  "Year" NUMBER(2) NOT NULL,
  "Type" NVARCHAR2(2) NOT NULL,
  "Key" NUMBER NOT NULL,
  "CstmrArchvFldrGuid" RAW(16),
  "Date" TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT "OrderArchiveFolders_PK" PRIMARY KEY ("OrdrArchvFldrGuid"),
  CONSTRAINT "OrderArchiveFolders_U01" UNIQUE ("Year","Type","Key")
);