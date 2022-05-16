CREATE OR REPLACE PROCEDURE abs_mdi."HISTORYEVENTSLIST" 
(
  tblName IN VARCHAR2,
  Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
    OPEN Output_Data FOR 
    SELECT
        ' ' "User",
        NVL("IpAddress",' ') "IP",
        TO_CHAR("EventDate", 'MM/DD/YYYY HH24:MI:SS') "Date",
        ("ColumnName" || ' changed from ' || "OriginalValue" || ' to ' || "NewValue")  "Text"
    FROM "HistoryEvents" 
    WHERE "TableName"=tblName ORDER BY "EventDate" DESC;
END HistoryEventsList;
/