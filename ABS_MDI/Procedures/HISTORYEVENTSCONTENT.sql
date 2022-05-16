CREATE OR REPLACE PROCEDURE abs_mdi."HISTORYEVENTSCONTENT" 
(
  "I_UserId" IN NUMBER, 
  "I_TableName" IN NVARCHAR2,
  "I_ColumnName" IN VARCHAR2,
  "I_OriginalValue" IN NCLOB,
  "I_NewValue" IN NCLOB,
  "I_IpAddress" IN NVARCHAR2
) AS 
BEGIN
    INSERT INTO "HistoryEvents"
    (
        "UserId", 
        "EventDate", 
        "TableName", 
        "ColumnName", 
        "OriginalValue", 
        "NewValue", 
        "IpAddress", 
        "Comments"
    )
    VALUES
    (
        "I_UserId",
        CURRENT_TIMESTAMP,
        "I_TableName",
        "I_ColumnName",
        "I_OriginalValue",
        "I_NewValue",
        "I_IpAddress",
        ''
    );
END HISTORYEVENTSCONTENT;
/