CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERREASSIGNMENT_CREATE" (
      CustomerNumber IN VARCHAR2,
      CustomerName IN VARCHAR2,
      SourceCompanyId IN NUMBER,
      SourceCompanyName IN VARCHAR2,
      TargetCompanyId IN NUMBER,
      TargetCompanyName IN VARCHAR2,
      IsMigrated IN CHAR,
      UserId IN NUMBER
)
AS 
BEGIN
   INSERT INTO "CustomerReassignment"
     (
        "CustomerNumber",
        "CustomerName",
        "SourceCompanyId",
        "SourceCompanyName",
        "TargetCompanyId",
        "TargetCompanyName",
        "IsMigrated",
        "UserId",
        "IsDelete",
        "CreatedBy",
        "CreatedDate"
     )
     VALUES
     (
        CustomerNumber,
        CustomerName,
        SourceCompanyId,
        SourceCompanyName,
        TargetCompanyId,
        TargetCompanyName,
        IsMigrated,
        UserId,
        'N',
        1,
        CURRENT_TIMESTAMP
      ); 
END CUSTOMERREASSIGNMENT_CREATE;
/