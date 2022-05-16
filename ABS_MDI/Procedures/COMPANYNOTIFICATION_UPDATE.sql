CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYNOTIFICATION_UPDATE" 
(
    CompanyNotificationId IN NUMBER,
    CompanyNotificationName IN VARCHAR2,
    IsActive IN CHAR,
    Content IN CLOB,
    StartDate IN VARCHAR2,
    EndDate IN VARCHAR2,
    CompanyId IN NUMBER,
    SortOrder IN NUMBER,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
   UPDATE "CompanyNotification" SET 
        "CompanyNotificationName"=CompanyNotificationName,
        "IsActive"=IsActive,
        "Content"=Content,
        "StartDate"=TO_DATE(StartDate,'MM/DD/YYYY HH24:MI:SS'),
        "EndDate"=TO_DATE(EndDate,'MM/DD/YYYY HH24:MI:SS'),
        "CompanyId" = CompanyId,
        "SortOrder"=SortOrder,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "CompanyNotificationId"=CompanyNotificationId
    AND "IsDelete" != 'Y';
END CompanyNotification_Update;
/