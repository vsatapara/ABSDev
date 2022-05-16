CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYNOTIFICATION_CREATE" 
(
    CompanyNotificationName IN VARCHAR2,
    IsActive IN CHAR,
    Content IN CLOB,
    StartDate IN VARCHAR2,
    EndDate IN VARCHAR2,
    CompanyId IN NUMBER,
    SortOrder IN NUMBER,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "CompanyNotification"
     (
        "CompanyNotificationName",
        "IsActive",
        "Content",
        "StartDate",
        "EndDate",
        "CompanyId",
        "SortOrder",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDelete"
     )
     VALUES
     (
        CompanyNotificationName,
        IsActive,
        Content,
        TO_DATE(StartDate,'MM/DD/YYYY HH24:MI:SS'),
        TO_DATE(EndDate,'MM/DD/YYYY HH24:MI:SS'),
        CompanyId,
        SortOrder,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N'
     )
      RETURNING "CompanyNotificationId" into OutputId;
END CompanyNotification_Create;
/