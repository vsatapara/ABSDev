CREATE TABLE abs_mdi."HistoryEvents" (
  "HistoryEventId" NUMBER(18) GENERATED BY DEFAULT ON NULL AS IDENTITY,
  "UserId" NUMBER(10),
  "EventDate" TIMESTAMP,
  "TableName" NVARCHAR2(128),
  "ColumnName" NVARCHAR2(128),
  "IpAddress" NVARCHAR2(128),
  "OriginalValue" NCLOB,
  "NewValue" NCLOB,
  "Comments" NCLOB,
  CONSTRAINT "HistoryEvents_PK" PRIMARY KEY ("HistoryEventId")
);