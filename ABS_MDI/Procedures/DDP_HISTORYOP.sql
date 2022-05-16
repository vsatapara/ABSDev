CREATE OR REPLACE PROCEDURE abs_mdi."DDP_HISTORYOP" (
  "I_UserId" IN NUMBER, 
  "I_TableName" IN VARCHAR2,
  "I_ColumnName" IN VARCHAR2,
  "I_OriginalValue" IN VARCHAR2,
  "I_NewValue" IN VARCHAR2,
  "I_IpAddress" IN VARCHAR2,
  "I_OldDate" IN TIMESTAMP,
  "I_NewDate" IN TIMESTAMP
 )
  as
BEGIN
    INSERT INTO "DDP_HISTORY"
    (
    "USERDETAILID",
    "EVENTDATE",
    "TABLENAME",
    "COLUMNNAME", 
    "NEWVALUE" , 
    "OLDVALUE",
    "IPADDRESS",  
    "OLDDATE",
    "NEWDATE"      
    )
    values
    (
    "I_UserId",
    CURRENT_TIMESTAMP,
    "I_TableName",
    "I_ColumnName",
    "I_NewValue", 
    "I_OriginalValue",
    "I_IpAddress",
    "I_OldDate",
    "I_NewDate"
    );
END DDP_HISTORYOP;
/