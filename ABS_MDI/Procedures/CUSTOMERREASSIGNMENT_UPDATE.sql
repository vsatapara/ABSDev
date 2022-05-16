CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERREASSIGNMENT_UPDATE" 
(
      ID IN NUMBER,
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
    UPDATE "CustomerReassignment" SET
        "CustomerNumber"=CustomerNumber,
        "CustomerName"=CustomerName,
        "SourceCompanyId"=SourceCompanyId,
        "SourceCompanyName"=SourceCompanyName,
        "TargetCompanyId"=TargetCompanyId,
        "TargetCompanyName"=TargetCompanyName,
        "IsMigrated"=IsMigrated,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
  WHERE "ID"=ID;
  
END CUSTOMERREASSIGNMENT_UPDATE;
/