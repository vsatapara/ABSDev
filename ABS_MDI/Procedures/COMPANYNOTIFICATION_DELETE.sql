CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYNOTIFICATION_DELETE" 
(
    CompanyNotificationId IN NUMBER,
    ModifiedBy IN NUMBER
)
AS 
BEGIN
   UPDATE "CompanyNotification" SET
        "IsDelete"='Y',
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "CompanyNotificationId"=CompanyNotificationId;
END CompanyNotification_Delete;
/